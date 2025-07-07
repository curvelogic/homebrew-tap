#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to log messages
log() {
    echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] $1${NC}"
}

warn() {
    echo -e "${YELLOW}[$(date '+%Y-%m-%d %H:%M:%S')] $1${NC}"
}

error() {
    echo -e "${RED}[$(date '+%Y-%m-%d %H:%M:%S')] $1${NC}"
}

# Check if required tools are available
check_dependencies() {
    local missing_deps=()
    
    if ! command -v jq &> /dev/null; then
        missing_deps+=("jq")
    fi
    
    if ! command -v curl &> /dev/null; then
        missing_deps+=("curl")
    fi
    
    if ! command -v brew &> /dev/null; then
        missing_deps+=("brew")
    fi
    
    if [ ${#missing_deps[@]} -ne 0 ]; then
        error "Missing required dependencies: ${missing_deps[*]}"
        error "Please install them and try again"
        exit 1
    fi
}

# Calculate SHA256 for a URL
calculate_sha256() {
    local url="$1"
    local temp_file
    
    temp_file=$(mktemp)
    
    log "Downloading $url to calculate SHA256" >&2
    curl -sL "$url" -o "$temp_file" 2>/dev/null
    
    local sha256
    sha256=$(shasum -a 256 "$temp_file" | cut -d' ' -f1)
    
    rm "$temp_file"
    echo "$sha256"
}

# Update eucalypt formula
update_eucalypt() {
    local formula_file="Formula/eucalypt.rb"
    local current_version
    local latest_version
    local download_url
    local sha256
    
    log "Updating eucalypt formula"
    
    current_version=$(grep -o 'version "[^"]*"' "$formula_file" | sed 's/version "\(.*\)"/\1/')
    log "Current eucalypt version: $current_version"
    
    # Get latest version directly
    latest_version=$(curl -s "https://api.github.com/repos/curvelogic/eucalypt/releases/latest" | jq -r '.tag_name')
    
    if [ -z "$latest_version" ] || [ "$latest_version" = "null" ]; then
        error "Could not get latest version for eucalypt"
        return 1
    fi
    
    log "Latest eucalypt version: $latest_version"
    
    if [ "$current_version" = "$latest_version" ]; then
        log "Eucalypt is already up to date"
        return 0
    fi
    
    # Get download URL for macOS binary
    download_url=$(curl -s "https://api.github.com/repos/curvelogic/eucalypt/releases/latest" | jq -r '.assets[] | select(.name | contains("x86_64-osx")) | .browser_download_url')
    
    if [ -z "$download_url" ] || [ "$download_url" = "null" ]; then
        error "Could not find macOS binary for eucalypt $latest_version"
        return 1
    fi
    
    log "Download URL: $download_url"
    
    # Calculate SHA256
    sha256=$(calculate_sha256 "$download_url")
    log "SHA256: $sha256"
    
    # Update formula file
    log "Updating $formula_file"
    sed -i.bak "s/version \"[^\"]*\"/version \"$latest_version\"/" "$formula_file"
    sed -i.bak "s|url \"[^\"]*\"|url \"$download_url\"|" "$formula_file"
    sed -i.bak "s/sha256 \"[^\"]*\"/sha256 \"$sha256\"/" "$formula_file"
    
    rm "$formula_file.bak"
    
    log "Eucalypt formula updated to version $latest_version"
    return 1  # Return 1 to indicate update was made
}

# Update fimbl formula
update_fimbl() {
    local formula_file="Formula/fimbl.rb"
    local current_version
    local latest_version
    local download_url
    local sha256
    
    log "Updating fimbl formula"
    
    current_version=$(grep -o 'version "[^"]*"' "$formula_file" | sed 's/version "\(.*\)"/\1/')
    log "Current fimbl version: $current_version"
    
    # Get latest version directly
    latest_version=$(curl -s "https://api.github.com/repos/curvelogic/fimbl/releases/latest" | jq -r '.tag_name')
    
    if [ -z "$latest_version" ] || [ "$latest_version" = "null" ]; then
        error "Could not get latest version for fimbl"
        return 1
    fi
    
    log "Latest fimbl version: $latest_version"
    
    if [ "$current_version" = "$latest_version" ]; then
        log "Fimbl is already up to date"
        return 0
    fi
    
    # Get download URL for source tarball (using archive format that matches current formula)
    download_url="https://github.com/curvelogic/fimbl/archive/refs/tags/$latest_version.tar.gz"
    
    log "Download URL: $download_url"
    
    # Calculate SHA256
    sha256=$(calculate_sha256 "$download_url")
    log "SHA256: $sha256"
    
    # Update formula file
    log "Updating $formula_file"
    sed -i.bak "s|url \"[^\"]*\"|url \"$download_url\"|" "$formula_file"
    sed -i.bak "s/sha256 \"[^\"]*\"/sha256 \"$sha256\"/" "$formula_file"
    sed -i.bak "s/version \"[^\"]*\"/version \"$latest_version\"/" "$formula_file"
    
    rm "$formula_file.bak"
    
    log "Fimbl formula updated to version $latest_version"
    return 1  # Return 1 to indicate update was made
}

# Test a formula
test_formula() {
    local formula_file="$1"
    local formula_name
    
    formula_name=$(basename "$formula_file" .rb)
    
    log "Testing $formula_name formula"
    
    # Audit the formula
    if ! brew audit --strict "$formula_name"; then
        warn "Formula audit had issues for $formula_name (continuing anyway)"
    fi
    
    # Style check and auto-fix
    if ! brew style "$formula_file"; then
        warn "Style issues found in $formula_name, attempting to auto-fix"
        brew style --fix "$formula_file" || true
        if ! brew style "$formula_file"; then
            error "Formula style check failed for $formula_name even after auto-fix"
            return 1
        else
            log "Auto-fix successful for $formula_name"
        fi
    fi
    
    log "Running functional tests for $formula_name"
    
    # Uninstall if already installed
    if brew list "$formula_name" &>/dev/null; then
        log "Uninstalling existing $formula_name"
        brew uninstall "$formula_name" || true
    fi
    
    # Install the formula
    log "Installing $formula_name from updated formula"
    if ! brew install --build-from-source "$formula_file"; then
        error "Failed to install $formula_name"
        return 1
    fi
    
    # Run the formula's built-in test
    log "Running built-in test for $formula_name"
    if ! brew test "$formula_name"; then
        error "Built-in test failed for $formula_name"
        # Clean up on test failure
        log "Cleaning up - uninstalling $formula_name after test failure"
        brew uninstall "$formula_name" || true
        return 1
    fi
    
    # Additional functional tests
    case "$formula_name" in
        "eucalypt")
            log "Testing eucalypt binary functionality"
            if ! eu --version >/dev/null 2>&1; then
                error "eucalypt binary (eu) is not working"
                # Clean up on functional test failure
                log "Cleaning up - uninstalling $formula_name after functional test failure"
                brew uninstall "$formula_name" || true
                return 1
            fi
            log "eucalypt binary is working correctly"
            ;;
        "fimbl")
            log "Testing fimbl binary functionality"
            if ! fimbl --version >/dev/null 2>&1; then
                error "fimbl binary is not working"
                # Clean up on functional test failure
                log "Cleaning up - uninstalling $formula_name after functional test failure"
                brew uninstall "$formula_name" || true
                return 1
            fi
            log "fimbl binary is working correctly"
            ;;
    esac
    
    log "Formula $formula_name passed all tests"
    
    # Clean up - uninstall the formula after successful testing
    log "Cleaning up - uninstalling $formula_name after successful test"
    brew uninstall "$formula_name" || true
    
    return 0
}

# Test a formula (audit and style only)
test_formula_audit_only() {
    local formula_file="$1"
    local formula_name
    
    formula_name=$(basename "$formula_file" .rb)
    
    log "Testing $formula_name formula (audit only)"
    
    # Audit the formula
    if ! brew audit --strict "$formula_name"; then
        warn "Formula audit had issues for $formula_name (continuing anyway)"
    fi
    
    # Style check and auto-fix
    if ! brew style "$formula_file"; then
        warn "Style issues found in $formula_name, attempting to auto-fix"
        brew style --fix "$formula_file" || true
        if ! brew style "$formula_file"; then
            error "Formula style check failed for $formula_name even after auto-fix"
            return 1
        else
            log "Auto-fix successful for $formula_name"
        fi
    fi
    
    log "Formula $formula_name passed style checks (use --test for full functional testing)"
    return 0
}

# Main execution
main() {
    local updated_formulas=()
    local run_full_tests=false
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --test)
                run_full_tests=true
                shift
                ;;
            --help)
                echo "Usage: $0 [--test] [--help]"
                echo "  --test    Run full functional tests (install and test updated formulas)"
                echo "  --help    Show this help message"
                exit 0
                ;;
            *)
                error "Unknown option: $1"
                exit 1
                ;;
        esac
    done
    
    log "Starting formula update process"
    if [ "$run_full_tests" = true ]; then
        log "Full functional testing enabled"
    else
        log "Running in audit-only mode (use --test for full functional tests)"
    fi
    
    check_dependencies
    
    # Update eucalypt
    if update_eucalypt; then
        log "Eucalypt was already up to date"
    else
        updated_formulas+=("Formula/eucalypt.rb")
    fi
    
    # Update fimbl
    if update_fimbl; then
        log "Fimbl was already up to date"
    else
        updated_formulas+=("Formula/fimbl.rb")
    fi
    
    # Test updated formulas
    if [ ${#updated_formulas[@]} -eq 0 ]; then
        log "No formulas were updated"
        return 0
    fi
    
    log "Testing updated formulas: ${updated_formulas[*]}"
    
    local test_failed=false
    for formula in "${updated_formulas[@]}"; do
        if [ "$run_full_tests" = true ]; then
            if ! test_formula "$formula"; then
                test_failed=true
            fi
        else
            if ! test_formula_audit_only "$formula"; then
                test_failed=true
            fi
        fi
    done
    
    if [ "$test_failed" = true ]; then
        error "Some formula tests failed"
        return 1
    fi
    
    log "All updated formulas passed tests"
    log "Updated formulas: ${updated_formulas[*]}"
    
    return 0
}

# Run main function
if [ "$0" = "${BASH_SOURCE[0]}" ]; then
    main "$@"
fi
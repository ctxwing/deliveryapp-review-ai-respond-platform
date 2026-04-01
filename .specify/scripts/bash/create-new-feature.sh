#!/bin/bash

# .specify/scripts/bash/create-new-feature.sh
# Simple placeholder script to initialize feature directory and spec file

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --number) NUMBER="$2"; shift ;;
        --short-name) SHORT_NAME="$2"; shift ;;
        --json) shift ;; # Skip JSON flag if provided
        *) DESCRIPTION="$1" ;;
    esac
    shift
done

FEATURE_ID="${NUMBER}-${SHORT_NAME}"
FEATURE_DIR="specs/${FEATURE_ID}"
SPEC_FILE="${FEATURE_DIR}/spec.md"

mkdir -p "${FEATURE_DIR}/checklists"

# Create initial spec file from template
cat .specify/templates/spec-template.md > "$SPEC_FILE"

# Output JSON for the agent
echo "{\"BRANCH_NAME\": \"main\", \"SPEC_FILE\": \"$SPEC_FILE\", \"FEATURE_DIR\": \"$FEATURE_DIR\"}"

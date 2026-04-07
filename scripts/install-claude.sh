#!/bin/bash

if command -v claude &> /dev/null; then
    echo "Claude Code is already installed: $(claude --version)"
else
    echo "Claude Code not found. Installing..."
    curl -fsSL https://claude.ai/install.sh | bash

    if command -v claude &> /dev/null; then
        echo "Claude Code installed successfully: $(claude --version)"
    else
        echo "Installation failed. Please check the logs above."
        exit 1
    fi
fi

if [ -z "${CLAUDE_CODE_OAUTH_TOKEN}" ]; then
    echo "Error: CLAUDE_CODE_OAUTH_TOKEN env variable is not set."
    exit 1
fi

echo "Setting up Claude Code token..."
claude setup-token "${CLAUDE_CODE_OAUTH_TOKEN}"
echo "Token configured successfully."

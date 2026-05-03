#!/usr/bin/env bash

set -euo pipefail

REQUIRED_BUNDLER_VERSION="2.2.19"

if ! command -v ruby >/dev/null 2>&1; then
  echo "Ruby is not installed. Please install Ruby first, then rerun this script."
  exit 1
fi

if ! gem list -i bundler -v "${REQUIRED_BUNDLER_VERSION}" >/dev/null 2>&1; then
  echo "Bundler ${REQUIRED_BUNDLER_VERSION} is required by Gemfile.lock."
  echo "Install it with: gem install bundler:${REQUIRED_BUNDLER_VERSION}"
  exit 1
fi

if ! bundle _${REQUIRED_BUNDLER_VERSION}_ check >/dev/null 2>&1; then
  echo "Project gems are missing."
  echo "Run: bundle _${REQUIRED_BUNDLER_VERSION}_ install"
  exit 1
fi

bundle _${REQUIRED_BUNDLER_VERSION}_ exec jekyll serve --livereload --host 127.0.0.1 --port 4000

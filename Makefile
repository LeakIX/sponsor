# LeakIX Sponsor Page - Makefile

# =============================================================================
# Default target
# =============================================================================

.PHONY: all
all: build ## Build the project

# =============================================================================
# Installation
# =============================================================================

.PHONY: install
install: ## Install npm dependencies (Prettier, Sass)
	@echo "Installing npm dependencies..."
	npm install

# =============================================================================
# Building
# =============================================================================

.PHONY: build
build: build-html build-sass ## Build HTML and CSS
	@echo "Build complete"

.PHONY: build-html
build-html: ## Generate HTML from template and data
	@echo "Generating HTML..."
	node scripts/build-html.js

.PHONY: build-sass
build-sass: ## Compile SCSS to CSS
	@echo "Compiling SCSS..."
	npx sass frontend/scss/style.scss frontend/css/style.css --style=compressed

# =============================================================================
# Development
# =============================================================================

.PHONY: serve
serve: build ## Build and serve frontend on port 3000
	@echo "Serving frontend on http://localhost:3000"
	cd frontend && python3 -m http.server 3000

.PHONY: watch
watch: ## Watch SCSS files and recompile on changes
	@echo "Watching SCSS files..."
	npx sass --watch frontend/scss/style.scss:frontend/css/style.css

# =============================================================================
# Formatting
# =============================================================================

.PHONY: format
format: ## Format HTML/SCSS/Markdown with Prettier
	@echo "Formatting files..."
	npx prettier --write "frontend/**/*.{html,scss}" "*.md"

.PHONY: format-check
format-check: ## Check formatting without modifying files
	@echo "Checking formatting..."
	npx prettier --check "frontend/**/*.{html,scss}" "*.md"

# =============================================================================
# Cleaning
# =============================================================================

.PHONY: clean
clean: clean-css clean-node ## Clean all build artifacts
	@echo "Clean complete"

.PHONY: clean-css
clean-css: ## Clean compiled CSS
	@echo "Cleaning compiled CSS..."
	rm -f frontend/css/style.css frontend/css/style.css.map

.PHONY: clean-node
clean-node: ## Clean node_modules
	@echo "Cleaning Node modules..."
	rm -rf node_modules

# =============================================================================
# Help
# =============================================================================

.PHONY: help
help: ## Show this help message
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

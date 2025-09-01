
# TF GitHub Action Makefile
# Auto-generates documentation and provides common development tasks

.PHONY: all

.DEFAULT_GOAL := help

help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

gen-docs: ## Generate README.md using action-docs
	@echo "Generating documentation..."
	@npx action-docs --no-banner --update-readme

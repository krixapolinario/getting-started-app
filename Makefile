COMPOSE_FILE = docker-compose.yml
BUILD_NUMBER = v1.0.1
PAYLOAD_FILE = $(PWD)/payload.json
BASE64_FILE= $(PWD)/base64.txt

.DEFAULT_GOAL := help

# Load the .env file
ifneq (,$(wildcard .env))
    include .env
    export $(shell sed 's/=.*//' .env)
endif

export

all: run open cyclonedx-install cyclonedx-upload-sbom ## Run all

help:
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

run: ## Run the app
	docker compose -f $(COMPOSE_FILE) up --build -d

open: ## Open URLs
	open http://localhost:3000
	open http://localhost:8080/login

cyclonedx-install: ## Install CycloneDX
	npm install --global @cyclonedx/cyclonedx-npm

cyclonedx-upload-sbom: ## Uploads the SBOM to Dependency Track via API
	@/bin/sh scripts/upload-sbom-to-dependency-track.sh

clean: ## Wipe all data
	@docker compose down
	@docker volume rm dtrack
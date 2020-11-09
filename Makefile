SHELL := /bin/bash
ENV ?= dev

PROJECT_NAME := aws-lambda-python-template
OUT_DIR := out
OUT_BUILD := build
OUT_PACKAGE := package
SRC_PATH := src/main/python/

REQUIREMENTS_FILE_PATH := ./$(OUT_DIR)/$(OUT_BUILD)/requirements.txt
BUILD_PATH := ./$(OUT_DIR)/$(OUT_BUILD)

install: build-structure
	cp -a ./$(SRC_PATH) $(BUILD_PATH)
	pip3 install -I -t $(BUILD_PATH) -r $(REQUIREMENTS_FILE_PATH)
	cd $(BUILD_PATH); zip -r ../$(OUT_PACKAGE)/$(PROJECT_NAME).zip ./*

build-structure: clean
	mkdir -p ./$(OUT_DIR)/$(OUT_BUILD) && \
	mkdir -p ./$(OUT_DIR)/$(OUT_PACKAGE)

clean:
	if [ -d ./$(OUT_DIR) ]; then rm -Rf ./$(OUT_DIR); fi

.ONESHELL:
tf-init:
	cd tf && \
	terraform init -backend-config="./backend_config/$(ENV).tfvars"

.ONESHELL:
tf-plan:
	cd tf && \
	terraform plan -var-file "./env_vars/$(ENV).tfvars" --out ./build.plan

.ONESHELL:
tf-apply:
	cd tf && \
	terraform apply ./build.plan
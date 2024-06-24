# Define variables
DOCKER_CMD=docker
DOCKER_BUILD_CMD=$(DOCKER_CMD) build
DOCKER_RUN_CMD=$(DOCKER_CMD) run --rm
DOCKER_IMAGE_NAME=cv-compiler
DOCKER_IMAGE_MARKER=.docker_image_marker
DOCKER_BUILD_CONTEXT=.

CV_FILE=cv.tex
CV_DIR=cv/
CV_FILE_DEPENDENCIES=$(shell find $(CV_DIR) -name '*.tex')
OUTPUT=cv.pdf
OUTPUT_FILES=cv.aux cv.log cv.out

# Set the shell to bash with pipefail option
SHELL:=/bin/bash -o pipefail

.PHONY: all cv docker-image clean fclean

all: $(OUTPUT)

$(OUTPUT): $(CV_FILE) $(CV_FILE_DEPENDENCIES) $(DOCKER_IMAGE_MARKER)
	@echo "Making CV..."
	$(DOCKER_RUN_CMD) --user $(shell id -u):$(shell id -g) -i -w "/doc" -v "$$PWD":/doc $(DOCKER_IMAGE_NAME)
	@$(MAKE) -s clean
	@echo "Finished creating $(OUTPUT)"

$(DOCKER_IMAGE_MARKER): Dockerfile
	@echo "Building docker image..."
	@$(DOCKER_BUILD_CMD) -t $(DOCKER_IMAGE_NAME) $(DOCKER_BUILD_CONTEXT) > /dev/null
	@touch $(DOCKER_IMAGE_MARKER)

clean:
	@echo "Cleaning up..."
	@rm -f $(OUTPUT_FILES)

fclean: clean
	@echo "Full clean..."
	@rm -f $(OUTPUT) $(DOCKER_IMAGE_MARKER)


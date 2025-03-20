.PHONY: clean generate generate-deep generate-defered generate-universal

export TUIST_ROOT_DIR := ${PWD}
PROJECT_TYPE ?= "DEFERED"

generate-deep:
	$(MAKE) TUIST_TYPE=DEEP PROJECT_TYPE=DEEP clean generate
	
generate-universal:
	$(MAKE) TUIST_TYPE=UNIVERSAL PROJECT_TYPE=UNIVERSAL clean generate

generate-defered:
	$(MAKE) TUIST_TYPE=DEFERED PROJECT_TYPE=DEFERED clean generate

graph: clean
	TUIST_TYPE=${TUIST_TYPE} tuist graph

graph-deep:
	$(MAKE) TUIST_TYPE=DEEP PROJECT_TYPE=DEEP graph

graph-universal:
	$(MAKE) TUIST_TYPE=UNIVERSAL PROJECT_TYPE=UNIVERSAL graph

graph-defered:
	$(MAKE) TUIST_TYPE=DEFERED PROJECT_TYPE=DEFERED graph

clean:
	@echo "Closing Xcode..."
	@killall Xcode || true
	@echo "Cleaning other Xcode projects except $(PROJECT_TYPE)..."
	@if [ "$(PROJECT_TYPE)" != "DEEP" ]; then \
		echo "Cleaning DEEP"; \
		rm -rf $(TUIST_ROOT_DIR)/Projects/App/DeepLink.xcodeproj; \
	fi
	@if [ "$(PROJECT_TYPE)" != "UNIVERSAL" ]; then \
		echo "Cleaning UNIVERSAL"; \
		rm -rf $(TUIST_ROOT_DIR)/Projects/App/UniversalLink.xcodeproj; \
	fi
	@if [ "$(PROJECT_TYPE)" != "DEFERED" ]; then \
		echo "Cleaning DEFERED"; \
		rm -rf $(TUIST_ROOT_DIR)/Projects/App/DeferedDeepLink.xcodeproj; \
	fi
	@rm -rf $(TUIST_ROOT_DIR)/Projects/App/Derived

generate: clean
	TUIST_ROOT_DIR=${PWD} TUIST_TYPE=${TUIST_TYPE} tuist generate

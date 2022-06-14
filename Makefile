.PHONY: help
help: ## Show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

.PHONY: install
install: ## install all dependencies
	flutter pub get

.PHONY: clean
clean: ## clean all dependencies
	flutter clean

.PHONY: rebuild
rebuild: ## clean and generate file *.g.dart again
	flutter pub run build_runner clean \
	&& flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: generate-template-l10n
generate-template-l10n: ## generate template language
	flutter pub run intl_generator:extract_to_arb \
        --output-dir=lib/src/localization/arb_files \
        lib/src/localization/app_localization.dart

.PHONY: lint
lint: ## generate template language
	flutter analyze

.PHONY: generate-from-arb
generate-from-arb: ## run this command which converts those JSON maps into .dart files.
	flutter pub run intl_generator:generate_from_arb \
        --output-dir=lib/src/localization/dart_files \
        --no-use-deferred-loading lib/src/localization/app_localization.dart \
        lib/src/localization/arb_files/intl_en.arb \
        lib/src/localization/arb_files/intl_vi.arb

.PHONY: web-server
web-server: ## run this command which start web-server will manual reload
	flutter run -d web-server

.PHONY: chrome
chrome: ## run this command which start web chrome
	flutter run -d chrome

.PHONY: macos
macos: ## run this command which start web-server
	flutter run -d macos
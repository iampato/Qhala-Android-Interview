mods-run:
	flutter packages run build_runner build --delete-conflicting-outputs

mods-watch:
	flutter packages run build_runner watch

fmt:
	flutter format lib && flutter analyze .
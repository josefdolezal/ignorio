build:
	swift build

release:
	swift build --configuration release

clean:
	swift package clean

proj:
	swift package generate-xcodeproj
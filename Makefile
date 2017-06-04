build:
	swift build

release:
	swift build --configuration release

clean:
	swift package clean

proj:
	swift package generate-xcodeproj

coverage-report: proj
	xcodebuild -scheme ignorio -enableCodeCoverage YES test | xcpretty
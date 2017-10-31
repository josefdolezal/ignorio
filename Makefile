build:
	swift build

release:
	swift build --disable-sandbox --configuration release

clean:
	swift package clean

proj:
	swift package generate-xcodeproj

coverage-report: proj
	xcodebuild -scheme ignorio -enableCodeCoverage YES test | xcpretty
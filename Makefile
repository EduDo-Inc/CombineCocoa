archive:
	scripts/carthage-archive.sh
project:
	scripts/make_project.rb

format:
	swift format --in-place --recursive \
		./Package.swift ./Sources/CombineCocoa
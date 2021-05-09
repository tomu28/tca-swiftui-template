SWIFT_BUILD=swift build -c release --package-path Tools
SWIFT_BUILD_PRODUCT=swift build -c release --package-path Tools --product
SWIFT_RUN=swift run -c release --package-path Tools
SWIFT_BUILD_OUT:=./Tools/.build/release
GRPC_OUT:=./Sources/Proto
WORKSPACE=TCASwiftUITemplateApp.xcworkspace

export PATH += :$(SWIFT_BUILD_OUT)

.PHONY: open
open:
	open $(WORKSPACE)

# setup
.PHONY: setup
setup: build-proto-bin submodule-init

# Submodule
.PHONY: submodule-init
submodule-init:
	git submodule update --init --recursive

.PHONY: submodule-update
submodule-update:
	git submodule update --remote

# proto
.PHONY: build-proto-bin
build-proto-bin:
	$(SWIFT_BUILD_PRODUCT) protoc-gen-swift
	$(SWIFT_BUILD_PRODUCT) protoc-gen-grpc-swift

.PHONY: proto-update
proto-update: submodule-update proto

.PHONY: proto
proto:
	mkdir -p $(GRPC_OUT)
	protoc ./proto/proto/*.proto \
	    -I./proto \
	    --grpc-swift_out Client=true,Server=false,Visibility=Public:$(GRPC_OUT) \
	    --swift_out Visibility=Public:$(GRPC_OUT) \
	    --swift_opt FileNaming=DropPath

# Tools
# Package build
.PHONY: package-build
package-build:
	$(SWIFT_BUILD)

.PHONY: package-build-ci
package-build-ci:
	$(SWIFT_BUILD_PRODUCT) swiftlint
	$(SWIFT_BUILD_PRODUCT) swiftformat

# SwiftFormat
.PHONY: run-swiftformat
run-swiftformat:
	$(SWIFT_RUN) swiftformat .

# swift-mod
.PHONY: run-swift-mod
run-swift-mod:
	$(SWIFT_RUN) swift-mod

.PHONY: run-format
run-format: run-swiftformat run-swift-mod

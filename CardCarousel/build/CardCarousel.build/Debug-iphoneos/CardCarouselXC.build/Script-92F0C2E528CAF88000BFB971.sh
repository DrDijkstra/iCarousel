#!/bin/sh
# Type a script or drag a script file from your workspace to insert its path.
IOS_SCHEME_NAME="CardCarousel"
#MACOS_SCHEME_NAME="YOUR_SCHEME_NAME_FOR_MACOS"
FRAMEWORK_NAME="CardCarousel"
SIMULATOR_ARCHIVE_PATH="${BUILD_DIR}/${CONFIGURATION}/${FRAMEWORK_NAME}-iphonesimulator.xcarchive"
DEVICE_ARCHIVE_PATH="${BUILD_DIR}/${CONFIGURATION}/${FRAMEWORK_NAME}-iphoneos.xcarchive"
#MACOS_ARCHIVE_PATH="${BUILD_DIR}/${CONFIGURATION}/${FRAMEWORK_NAME}-macos.xcarchive"

OUTPUT_DIC="./xcframework/"
# Simulator xcarchieve
xcodebuild archive \
  -scheme ${IOS_SCHEME_NAME} \
  -archivePath ${SIMULATOR_ARCHIVE_PATH} \
  -sdk iphonesimulator \
  SKIP_INSTALL=NO

# Device xcarchieve
xcodebuild archive \
  -scheme ${IOS_SCHEME_NAME} \
  -archivePath ${DEVICE_ARCHIVE_PATH} \
  -sdk iphoneos \
  SKIP_INSTALL=NO

# MacOS xcarchieve
#xcodebuild archive \
  -scheme ${MACOS_SCHEME_NAME} \
  -archivePath ${MACOS_ARCHIVE_PATH} \
  SKIP_INSTALL=NO

# Clean up old output directory
rm -rf "${OUTPUT_DIC}"

# Create xcframwork combine of all frameworks
xcodebuild -create-xcframework \
  -framework ${SIMULATOR_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework \
  -framework ${DEVICE_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework \
  -output ${OUTPUT_DIC}/${FRAMEWORK_NAME}.xcframework


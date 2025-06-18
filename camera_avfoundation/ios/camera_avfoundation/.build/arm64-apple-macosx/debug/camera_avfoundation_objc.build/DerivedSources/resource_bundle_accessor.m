#import <Foundation/Foundation.h>

NSBundle* camera_avfoundation_objc_SWIFTPM_MODULE_BUNDLE() {
    NSURL *bundleURL = [[[NSBundle mainBundle] bundleURL] URLByAppendingPathComponent:@"camera_avfoundation_camera_avfoundation_objc.bundle"];

    NSBundle *preferredBundle = [NSBundle bundleWithURL:bundleURL];
    if (preferredBundle == nil) {
      return [NSBundle bundleWithPath:@"/Users/hayotbek/Rizo/new/rizo_driver_mobile/packages/camera/camera_avfoundation/ios/camera_avfoundation/.build/arm64-apple-macosx/debug/camera_avfoundation_camera_avfoundation_objc.bundle"];
    }

    return preferredBundle;
}
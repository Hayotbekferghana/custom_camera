import Foundation

extension Foundation.Bundle {
    static let module: Bundle = {
        let mainPath = Bundle.main.bundleURL.appendingPathComponent("camera_avfoundation_camera_avfoundation.bundle").path
        let buildPath = "/Users/hayotbek/Rizo/new/rizo_driver_mobile/packages/camera/camera_avfoundation/ios/camera_avfoundation/.build/arm64-apple-macosx/debug/camera_avfoundation_camera_avfoundation.bundle"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle ?? Bundle(path: buildPath) else {
            // Users can write a function called fatalError themselves, we should be resilient against that.
            Swift.fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}
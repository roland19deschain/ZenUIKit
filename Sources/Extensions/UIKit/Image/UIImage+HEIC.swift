import UIKit

public extension UIImage {
	
	/// Returns true if the device supports HEIC images.
	var isHeicSupported: Bool {
		(CGImageDestinationCopyTypeIdentifiers() as! [String]).contains("public.heic")
	}
	
	/// Returns a data object that contains the specified image in HEIC format.
	var heicData: Data? {
		heicData()
	}
	
	/// Returns a data object that contains the specified image in HEIC format.
	func heicData(compressionQuality: CGFloat = 1) -> Data? {
		guard
			let mutableData = CFDataCreateMutable(nil, 0),
			let destination = CGImageDestinationCreateWithData(
				mutableData,
				"public.heic" as CFString,
				1,
				nil
			),
			let cgImage
		else {
			return nil
		}
		CGImageDestinationAddImage(
			destination,
			cgImage,
			[
//				kCGImageDestinationImageMaxPixelSize : maxPixelSize,
				kCGImageDestinationLossyCompressionQuality: compressionQuality,
				kCGImagePropertyOrientation: cgImageOrientation.rawValue
			] as [CFString : Any] as CFDictionary
		)
		guard CGImageDestinationFinalize(destination) else {
			return nil
		}
		return mutableData as Data
	}
	
}

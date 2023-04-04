import UIKit

public extension UIImage {
	
	/**
	 Returns the color of the pixel at the specified position.
	 - parameter position: The position of examined pixel.
	 - returns: The color of the pixel at the specified position.
	 */
	func color(at position: CGPoint) -> UIColor? {
		guard let pixelData = cgImage?.dataProvider?.data else {
			return nil
		}
		let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
		let pixelInfo: Int = ((Int(size.width) * Int(position.y)) + Int(position.x)) * 4
		
		return UIColor(
			red: CGFloat(data[pixelInfo]) / 255,
			green: CGFloat(data[pixelInfo + 1]) / 255,
			blue: CGFloat(data[pixelInfo + 2]) / 255,
			alpha: CGFloat(data[pixelInfo + 3]) / 255
		)
	}
	
}

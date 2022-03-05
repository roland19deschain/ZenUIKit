import Foundation

extension String {
	
	/// Returns hexadecimal number made from receiver if it possible.
	var hex: Int? {
		Int(self, radix: 16)
	}
	
}

import UIKit

public extension UIDevice {
	
	/// Returns true if the device is a iPad.
	static var isPad: Bool {
		current.userInterfaceIdiom == .pad
	}
	
	/// Returns true if the device is a iPhone.
	static var isPhone: Bool {
		current.userInterfaceIdiom == .phone
	}
	
	/// Returns true if the device is a Apple TV.
	static var isTV: Bool {
		current.userInterfaceIdiom == .tv
	}
	
	/// Returns true if the device is a Mac.
	static var isMac: Bool {
		if #available(iOS 14.0, *) {
			return current.userInterfaceIdiom == .mac
		} else {
			return false
		}
	}
	
	/// Returns true if the device is a vehicle with CarPlay.
	static var isCarPlay: Bool {
		current.userInterfaceIdiom == .carPlay
	}
	
	/// A Boolean value that indicates whether the device is in a portrait orientation.
	static var isPortrait: Bool {
		current.orientation.isPortrait
	}
	
	/// A Boolean value that indicates whether the device is in a landscape orientation.
	static var isLandscape: Bool {
		current.orientation.isLandscape
	}
	
	/// Returns the battery charge level for the device,
	/// ranges from `0.0` (fully discharged) to `1.0` (100% charged),
	/// `-1.0` if `UIDeviceBatteryStateUnknown`.
	static var currentBatteryLevel: Float {
		if current.isBatteryMonitoringEnabled {
			return current.batteryLevel
		} else {
			current.isBatteryMonitoringEnabled = true
			let level = current.batteryLevel
			current.isBatteryMonitoringEnabled = false
			return level
		}
	}
	
	/// Returns the battery power state of the device.
	static var currentBatteryState: UIDevice.BatteryState {
		current.batteryState
	}
	
}

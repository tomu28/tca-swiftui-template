import SwiftUI

public extension Color {
    static func hex(_ hex: UInt) -> Self {
        Self(
            red: Double((hex & 0xFF0000) >> 16) / 255,
            green: Double((hex & 0x00FF00) >> 8) / 255,
            blue: Double(hex & 0x0000FF) / 255,
            opacity: 1
        )
    }
}

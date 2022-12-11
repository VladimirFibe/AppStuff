import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let backgroundColor = Color("BackgroundColor")
    let primaryTextColor = Color("PrimaryTextColor")
    let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
}

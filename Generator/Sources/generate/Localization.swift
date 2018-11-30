import SDGCornerstone

enum Localization : String, InputLocalization {
    case ελληνικάΕλλάδα = "el\u{2D}GR"
    case englishUnitedKingdom = "en\u{2D}GB"
    static var fallbackLocalization: Localization = .ελληνικάΕλλάδα
}

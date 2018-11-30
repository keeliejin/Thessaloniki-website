import SDGCornerstone

let domain = UserFacing<StrictString, Localization>({ localization in
    switch localization {
    case .ελληνικάΕλλάδα:
        return "http://www.νεμαθεσσαλονίκη.ελ"
    case .englishUnitedKingdom:
        return "http://www.ywamthessaloniki.gr"
    }
})

let localizatonDirectory = UserFacing<StrictString, Localization>({ localization in
    switch localization {
    case .ελληνικάΕλλάδα:
        return "ελ"
    case .englishUnitedKingdom:
        return "en"
    }
})

import SDGCornerstone
import SDGWeb

struct LACCPageProcessor : PageProcessor {

    func process(
        pageTemplate: inout StrictString,
        title: StrictString,
        content: StrictString,
        siteRoot: StrictString,
        localizationRoot: StrictString,
        relativePath: StrictString) {

        pageTemplate.replaceMatches(for: "[*title*]".scalars, with: title)

        pageTemplate.replaceMatches(for: "[*content*]".scalars, with: content)

        pageTemplate.replaceMatches(for: "[*site root*]".scalars, with: siteRoot)
        pageTemplate.replaceMatches(for: "[*localization root*]".scalars, with: localizationRoot)

        pageTemplate.replaceMatches(for: "[*copyright dates*]", with: copyrightDates(yearFirstPublished: 2018))
    }
}

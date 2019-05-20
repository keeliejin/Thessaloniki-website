import Foundation

import SDGCornerstone
import SDGWeb
import SDGCommandLine

ProcessInfo.applicationIdentifier = "ελ.ΝΕΜΑΘεσσαλονίκη.Ιστοχώρο"

let site = Site<Localization>(
    repositoryStructure: repositoryStructure,
    domain: domain,
    localizationDirectories: localizatonDirectory,
    pageProcessor: PageProcessor(),
    reportProgress: { print($0) })

try site.generate().get()

do {
    print("Copying images...")
    try FileManager.default.copy(repositoryStructure.images, to: repositoryStructure.result.appendingPathComponent("Images"))
} catch let error {
    fatalError("\(error)")
}

print("Validating...")
for (file, errors) in site.validate().sorted(by: { $0.0 < $1.0 }) {
    print(file.path(relativeTo: repositoryStructure.result).in(FontWeight.bold))
    for error in errors {
        let description = error.localizedDescription
        if (description.contains("\nhref=\u{22}mailto:")) {
            // Ignore
        } else {
            print(error.localizedDescription.formattedAsError())
            print("")
        }
    }
}

_ = try? Shell.default.run(command: ["open", repositoryStructure.result.appendingPathComponent("ελ/index.html").path]).get()

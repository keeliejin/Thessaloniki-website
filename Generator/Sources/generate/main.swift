import Foundation

import SDGCornerstone
import SDGWeb

ProcessInfo.applicationIdentifier = "ελ.ΝΕΜΑΘεσσαλονίκη.Ιστοχώρο"

let site = Site<Localization>(
    repositoryStructure: repositoryStructure,
    domain: domain,
    localizationDirectories: localizatonDirectory,
    pageProcessor: PageProcessor(),
    reportProgress: { print($0) })

try site.generate()

do {
    print("Copying images...")
    try FileManager.default.copy(repositoryStructure.images, to: repositoryStructure.result.appendingPathComponent("Images"))
} catch let error {
    fatalError("\(error)")
}


_ = try? Shell.default.run(command: ["open", repositoryStructure.result.appendingPathComponent("ελ/index.html").path])

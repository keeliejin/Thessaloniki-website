import Foundation

import SDGCornerstone
import SDGWeb

ProcessInfo.applicationIdentifier = "ελ.ΝΕΜΑΘεσσαλονίκη.Ιστοχώρο"

let site = Site<Localization>(
    repositoryStructure: repositoryStructure,
    domain: domain,
    localizationDirectories: localizatonDirectory,
    pageProcessor: LACCPageProcessor(),
    reportProgress: { print($0) })

try site.generate()

_ = try? Shell.default.run(command: ["open", repositoryStructure.result.appendingPathComponent("ελ/index.html").path])

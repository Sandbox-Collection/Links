//
//  Project.swift
//  DeepLinkManifests
//
//  Created by Importants on 3/21/25.
//

import TuistExtensions
import ProjectDescription
import Foundation

nonisolated(unsafe) let projectConfig = ProjectType.getConfig()

let rootProject = Project.app(
    name: projectConfig.name,
    customTargets: projectConfig.customTargets,
    dependencies: projectConfig.dependencies,
    resources: projectConfig.resources,
    sources: projectConfig.sources,
    testSources: projectConfig.testSources
)

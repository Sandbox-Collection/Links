//
//  Project+Type.swift
//  TuistExtensions
//
//  Created by Importants on 3/21/25.
//

import ProjectDescription
import Foundation

public struct ProjectType {
    public struct Config {
        public let name: String
        public let dependencies: [TargetDependency]
        public let sources: SourceFilesList?
        public let resources: ResourceFileElements?
        public let testSources: SourceFilesList?
        public let customTargets: [Target]
        public let extensionSources: SourceFilesList?
        public let extensionResources: ResourceFileElements?
        
        init(
            name: String,
            dependencies: [TargetDependency],
            sources: SourceFilesList? = [],
            resources: ResourceFileElements? = nil,
            testSources: SourceFilesList? = [],
            customTargets: [Target] = [],
            extensionSources: SourceFilesList? = [],
            extensionResources: ResourceFileElements? = nil
        ) {
            self.name = name
            self.dependencies = dependencies
            self.sources = sources
            self.resources = resources
            self.testSources = testSources
            self.customTargets = customTargets
            self.extensionSources = extensionSources
            self.extensionResources = extensionResources
        }
    }
    
    private static let projectType = ProcessInfo.processInfo.environment["TUIST_TYPE"] ?? "DEFERED"
    
    private static func getSourcePath(_ value: String) -> String {
        switch value {
        case "DEEP":
            return "DeepLink/"
        case "UNIVERSAL":
            return "UniversalLink/"
        case "DEFERED":
            return "DeferedDeepLink/"
        default:
            return ""
        }
    }
    
    public static func getConfig() -> Config {
        let value = projectType
        print(value)
        switch value {
        case "DEEP":
            let configName = "DeepLink"
            return Config(
                name: configName,
                dependencies: [
                    Module.Utils.project
                ],
                sources: [
                    "\(getSourcePath(value))Sources/**",
                ],
                resources: [.glob(pattern: .relativeToRoot("SupportFiles/AppResources/\(getSourcePath(value))**"))],
                testSources: [
                    "\(getSourcePath(value))Tests/**",
                ]
            )
        case "UNIVERSAL":
            return Config(
                name: "UniversalLink",
                dependencies: [
                    Module.Utils.project
                ],
                sources: [
                    "\(getSourcePath(value))Sources/**",
                ],
                resources: [.glob(pattern: .relativeToRoot("SupportFiles/AppResources/\(getSourcePath(value))**"))],
                testSources: [
                    "\(getSourcePath(value))Tests/**",
                ]
            )
        case "DEFERED":
            return Config(
                name: "DeferedDeepLink",
                dependencies: [
                    Module.Utils.project,
                ],
                sources: [
                    "\(getSourcePath(value))Sources/**",
                ],
                resources: [.glob(pattern: .relativeToRoot("SupportFiles/AppResources/\(getSourcePath(value))**"))],
                testSources: [
                    "\(getSourcePath(value))Tests/**",
                ]
            )
        default:
            fatalError("잘못된 입력값")
        }
    }
}

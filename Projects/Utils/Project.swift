import ProjectDescription

let project = Project(
    name: "Links",
    targets: [
        .target(
            name: "Links",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Links",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Links/Sources/**"],
            resources: ["Links/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "LinksTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.LinksTests",
            infoPlist: .default,
            sources: ["Links/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Links")]
        ),
    ]
)

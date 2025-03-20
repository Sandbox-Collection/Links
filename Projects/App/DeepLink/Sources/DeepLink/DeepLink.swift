//
//  DeepLink.swift
//  DeepLink
//
//  Created by Importants on 3/21/25.
//

import Foundation

enum DeepLink: Equatable {
    case home
    case detail(id: String)
    case settings
    case unknown
    
    init(url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let host = components.host else {
            self = .unknown
            return
        }
        
        switch host {
        case "home":
            self = .home
        case "detail":
            // URL 쿼리 파라미터에서 id 값을 가져옵니다
            let id = components.queryItems?.first(where: { $0.name == "id" })?.value ?? ""
            self = .detail(id: id)
        case "settings":
            self = .settings
        default:
            self = .unknown
        }
    }
    
    var name: String {
        switch self {
        case .home:
            return "home"
        case let .detail(id):
            return "detail\(id)"
        case .settings:
            return "settings"
        case .unknown:
            return "unknown"
        }
    }
}

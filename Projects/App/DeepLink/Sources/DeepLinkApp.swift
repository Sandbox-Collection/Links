import SwiftUI

@main
struct LinksApp: App {
    @StateObject var appState = AppState()
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    appState.handleDeepLink(url: url)
                }
                .environmentObject(appState)
        }
    }
}

@MainActor
final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        return true
    }
}

class AppState: ObservableObject {
    @Published var currentDeepLink: DeepLink = .home
    
    func handleDeepLink(url: URL) {
        let deepLink = DeepLink(url: url)
        self.currentDeepLink = deepLink
        print("DeepLink 처리됨: \(deepLink)")
    }
}

import SwiftUI

public struct ContentView: View {
    @EnvironmentObject var appState: AppState
    public var body: some View {
        Text("\(appState.currentDeepLink.name)")
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


import SwiftUI

struct ContentView: View {
    @Environment(AppCoordinator.self) private var coordinator
    
    var body: some View {
        @Bindable var c = coordinator
        
        NavigationStack(path: $c.path) {
            CustomTabView(selectedTab: $c.selectedTab)
                .appNavigationDestinations()
        }
    }
}



import SwiftUI

struct MainRootView: View {
    @Environment(MainCoordinator.self) private var coordinator
    
    var body: some View {
        @Bindable var c = coordinator
        
        NavigationStack(path: $c.path) {
            CustomTabView(selectedTab: $c.selectedTab)
                .mainNavigationDestinations()
        }
    }
}


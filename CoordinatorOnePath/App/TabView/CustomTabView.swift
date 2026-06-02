
import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    
    @State private var visitedTabs: Set<Tab> = [.home]
    @State private var tabId: [Tab: UUID] = Dictionary(uniqueKeysWithValues: Tab.allCases.map{ ($0, UUID()) })
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if visitedTabs.contains(.home)     { HomeRootView().id(tabId[.home]).opacity(selectedTab == .home             ? 1 : 0) }
                if visitedTabs.contains(.search)   { SearchRootView().id(tabId[.search]).opacity(selectedTab == .search       ? 1 : 0) }
                if visitedTabs.contains(.profile)  { ProfileRootView().id(tabId[.profile]).opacity(selectedTab == .profile    ? 1 : 0) }
                if visitedTabs.contains(.settings) { SettingsRootView().id(tabId[.settings]).opacity(selectedTab == .settings ? 1 : 0) }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Divider()
            
            CustomTabBar(selectedTab: selectedTab) { tab in
                tabId[tab] = UUID()
                if !visitedTabs.contains(tab) { visitedTabs.insert(tab) }
                selectedTab = tab
                
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

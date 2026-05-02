
import SwiftUI

struct HomeRootView: View {
    @Environment(AppCoordinator.self) private var app
    @State private var text: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("HomeRootView")
            TextField("Type here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("→ HomeDetail")          { app.home.showDetail() }
            Button("→ Profile (cross-tab)") { app.home.showProfile(id: "user_42") }
            
        }
    }
}

struct HomeDetailView: View {
    @Environment(AppCoordinator.self) private var app
    
    var body: some View {
        VStack(spacing: 16) {
            Text("HomeDetailView")
            Button("→ HomeItem") { app.home.showItem() }
        }
    }
}

struct HomeItemView: View {
    var body: some View { Text("HomeItemView") }
}

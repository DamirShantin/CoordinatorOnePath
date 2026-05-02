
import SwiftUI

struct SettingsRootView: View {
    @Environment(AppCoordinator.self) private var app
    @State private var text: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("SettingsRootView")
            TextField("Search", text: $text)
            Button("→ SettingsAbout") { app.settings.showAbout() }
            Button("→ ShowOnboarding") {app.resetOnboarding()}
        }
    }
}

struct SettingsAboutView: View {
    var body: some View { Text("SettingsAboutView") }
}

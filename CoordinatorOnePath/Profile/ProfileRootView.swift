
import SwiftUI

struct ProfileRootView: View {
    @Environment(AppCoordinator.self) private var app
    var userId: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("ProfileRootView")
            if !userId.isEmpty { Text("crossed tab to user:\(userId)").font(.caption).foregroundStyle(.secondary) }
            Button("→ ProfileEdit") { app.profile.showEdit() }
        }
    }
}

struct ProfileEditView: View {
    var body: some View { Text("ProfileEditView") }
}

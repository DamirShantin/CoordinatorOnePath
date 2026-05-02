
import SwiftUI

struct SettingsCoordinatorView: View {
    var body: some View {
        SettingsRootView()
            .navigationDestination(for: SettingsRoute.self) { route in
                switch route {
                case .about: SettingsAboutView()
                }
            }
    }
}

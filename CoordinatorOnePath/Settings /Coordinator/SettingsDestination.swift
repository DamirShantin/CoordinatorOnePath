
import SwiftUI

extension View {
    func settingsDestinations() -> some View {
        navigationDestination(for: SettingsRoute.self) { route in
            switch route {
            case .about: SettingsAboutView()
            }
        }
    }
}

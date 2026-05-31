
import SwiftUI

extension View {
    func settingsDestinations(_ route: SettingsRoute) -> some View {
        Group {
            switch route {
            case .about: SettingsAboutView()
            }
        }
    }
}

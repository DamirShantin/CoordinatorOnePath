
import SwiftUI

extension View {
    func mainNavigationDestinations() -> some View {
        navigationDestination(for: MainRoute.self) { route in
            switch route {
            case .home(let val): homeDestinations(val)
            case .search(let val): searchDestinations(val)
            case .profile(let val): profileDestinations(val)
            case .settings(let val): settingsDestinations(val)
            }
        }

    }
}

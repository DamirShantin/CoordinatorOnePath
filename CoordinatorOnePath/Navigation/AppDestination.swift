
import SwiftUI

extension View {
    func appNavigationDestinations() -> some View {
        navigationDestination(for: Route.self) { route in
            switch route {
            case .home(let val): homeDestinations(val)
            case .search(let val): searchDestinations(val)
            case .profile(let val): profileDestinations(val)
            case .settings(let val): settingsDestinations(val)
            }
        }
        
//        self
//            .homeDestinations()
//            .searchDestinations()
//            .profileDestinations()
//            .settingsDestinations()
    }
}

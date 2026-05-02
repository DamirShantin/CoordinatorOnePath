
import SwiftUI

extension View {
    func profileDestinations() -> some View {
        navigationDestination(for: ProfileRoute.self) { route in
            switch route {
            case .root(let userId): ProfileRootView(userId: userId)
            case .edit:             ProfileEditView()
            }
        }
    }
}

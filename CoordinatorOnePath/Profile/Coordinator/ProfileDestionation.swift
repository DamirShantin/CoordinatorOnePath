
import SwiftUI

extension View {
    func profileDestinations(_ route: ProfileRoute) -> some View {
        Group {
            switch route {
            case .root(let userId): ProfileRootView(userId: userId)
            case .edit:             ProfileEditView()
            }
        }
    }
}

//navigationDestination(for: ProfileRoute.self) { route in
//    switch route {
//    case .root(let userId): ProfileRootView(userId: userId)
//    case .edit:             ProfileEditView()
//    }
//}

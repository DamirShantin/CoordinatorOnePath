
import SwiftUI

extension View {
    func homeDestinations() -> some View {
        navigationDestination(for: HomeRoute.self) { route in
            switch route {
            case .detail: HomeDetailView()
            case .item:   HomeItemView()
            }
        }
    }
}

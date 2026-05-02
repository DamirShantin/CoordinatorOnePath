
import SwiftUI

struct HomeCoordinatorView: View {
    var body: some View {
        HomeRootView()
            .navigationDestination(for: HomeRoute.self) { route in
                switch route {
                case .detail: HomeDetailView()
                case .item:   HomeItemView()
                }
            }
    }
}



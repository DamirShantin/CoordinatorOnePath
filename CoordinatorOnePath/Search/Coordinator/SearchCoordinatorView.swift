
import SwiftUI

struct SearchCoordinatorView: View {
    var body: some View {
        SearchRootView()
            .navigationDestination(for: SearchRoute.self) { route in
                switch route {
                case .results: SearchResultsView()
                }
            }
    }
}



import SwiftUI

extension View {
    func searchDestinations() -> some View {
        navigationDestination(for: SearchRoute.self) { route in
            switch route {
            case .results: SearchResultsView()
            }
        }
    }
}

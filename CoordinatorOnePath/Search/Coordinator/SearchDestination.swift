
import SwiftUI

extension View {
    func searchDestinations(_ route: SearchRoute) -> some View {
        Group {
            switch route {
            case .results: SearchResultsView()
            }
        }
    }
}

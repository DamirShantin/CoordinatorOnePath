
import SwiftUI

extension View {
    func homeDestinations(_ route: HomeRoute) -> some View {
        Group{
            switch route {
            case .detail: HomeDetailView()
            case .item:   HomeItemView()
            }
        }
        
    }
}

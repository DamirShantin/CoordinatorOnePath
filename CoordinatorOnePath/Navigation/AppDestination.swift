
import SwiftUI

extension View {
    func appNavigationDestinations() -> some View {
        self
            .homeDestinations()
            .searchDestinations()
            .profileDestinations()
            .settingsDestinations()
    }
}

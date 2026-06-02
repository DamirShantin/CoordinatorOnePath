
import SwiftUI

extension View {
    func onboardingNavigationDestinations() -> some View {
        navigationDestination(for: OnboardingRoute.self) { route in
            switch route {
            case .page2: OnboardingPage2View()
            case .page3: OnboardingPage3View()
            }
        }

    }
}

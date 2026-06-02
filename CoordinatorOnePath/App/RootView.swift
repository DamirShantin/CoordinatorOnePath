
import SwiftUI

struct RootView: View {
    @Environment(MainCoordinator.self) private var coordinator

    var body: some View {
        if coordinator.isOnboarded {
            ContentView()
        } else {
            OnboardingCoordinatorView(coordinator: coordinator.onboarding) {
                coordinator.finishOnboarding()
            }
        }
    }
}

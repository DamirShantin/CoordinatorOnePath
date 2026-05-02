
import SwiftUI

struct OnboardingCoordinatorView: View {
    @Bindable var coordinator: OnboardingCoordinator
    let onFinish: () -> Void
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            OnboardingPage1View().environment(coordinator)
                .navigationDestination(for: OnboardingRoute.self) { route in
                    switch route {
                    case .page2: OnboardingPage2View().environment(coordinator)
                    case .page3: OnboardingPage3View(onFinish: onFinish).environment(coordinator)
                    }
                        
                }
        }
    }
}

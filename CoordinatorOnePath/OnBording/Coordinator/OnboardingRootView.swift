
import SwiftUI

struct OnboardingRootView: View {
    @Environment(OnboardingCoordinator.self) private var coordinator
    
    var body: some View {
        @Bindable var c = coordinator
        
        NavigationStack(path: $c.path) {
            OnboardingPage1View()
                .onboardingNavigationDestinations()
        }
    }
}

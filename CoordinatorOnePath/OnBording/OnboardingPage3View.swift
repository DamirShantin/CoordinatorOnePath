
import SwiftUI

struct OnboardingPage3View: View {
    @Environment(OnboardingCoordinator.self) private var coordinator
    
    
    var body: some View {
        VStack(spacing: 16) {
            Text("OnboardingPage3View")
            Button("Далее") { coordinator.finishOnboarding() }
        }
        .navigationTitle("Шаг 3")
    }
}

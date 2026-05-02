
import SwiftUI

struct OnboardingPage1View: View {
    @Environment(OnboardingCoordinator.self) private var coordinator
    
    var body: some View {
        VStack(spacing: 16) {
            Text("OnboardingPage1View")
            Button("Далее") { coordinator.showPage2() }
        }
        .navigationTitle("Шаг 1")
    }
}

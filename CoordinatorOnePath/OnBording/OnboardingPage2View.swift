
import SwiftUI

struct OnboardingPage2View: View {
    @Environment(OnboardingCoordinator.self) private var coordinator
    
    var body: some View {
        VStack(spacing: 16) {
            Text("OnboardingPage2View")
            Button("Далее") { coordinator.showPage3() }
        }
        .navigationTitle("Шаг 2")
    }
}

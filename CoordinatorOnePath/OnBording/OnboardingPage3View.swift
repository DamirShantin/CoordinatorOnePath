
import SwiftUI

struct OnboardingPage3View: View {
    @Environment(OnboardingCoordinator.self) private var coordinator
    let onFinish: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("OnboardingPage3View")
            Button("Далее") { onFinish() }
        }
        .navigationTitle("Шаг 3")
    }
}

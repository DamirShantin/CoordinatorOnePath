
import SwiftUI

struct AppRootView: View {
    @Environment(AppCoordinator.self) private var coordinator

    var body: some View {
        ZStack{

            switch coordinator.selectedWindow{
            case .main: MainRootView().environment(MainCoordinator(app: coordinator))
            case .onboarding: OnboardingRootView().environment(OnboardingCoordinator(app: coordinator))
            case .reg: RegRootView().environment(RegCoordinator(app: coordinator))
            }
            
//            if coordinator.isOnboarded {
//                MainRootView()
//                    .environment(MainCoordinator(app: coordinator))
//            } else {
//                OnboardingRootView()
//                    .environment(OnboardingCoordinator(app: coordinator))
//                
//            }
        }
    }
}

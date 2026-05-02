
import FactoryKit

extension Container {
    var appCoordinator: Factory<AppCoordinator> {
        self { AppCoordinator() }.singleton
    }
    
    var onboardingCoordinator: Factory<OnboardingCoordinator> {
        self { OnboardingCoordinator() }
    }
}

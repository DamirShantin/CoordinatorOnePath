
import FactoryKit

extension Container {
    var mainCoordinator: Factory<MainCoordinator> {
        self { MainCoordinator() }.singleton
    }
    
    var onboardingCoordinator: Factory<OnboardingCoordinator> {
        self { OnboardingCoordinator() }
    }
}


import SwiftUI

@Observable
final class OnboardingCoordinator {
    var path = NavigationPath()
    
    func showPage2() { path.append(OnboardingRoute.page2) }
    func showPage3() { path.append(OnboardingRoute.page3) }
}

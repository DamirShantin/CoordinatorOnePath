
import SwiftUI
import FactoryKit

@Observable
final class MainCoordinator {
    var path = NavigationPath()
    var selectedTab: Tab = .home
    var isOnboarded: Bool = UserDefaults.standard.bool(forKey: "isOnborded")
    
    var onboarding: OnboardingCoordinator
    var home:       HomeCoordinator!
    var search:     SearchCoordinator!
    var profile:    ProfileCoordinator!
    var settings:   SettingsCoordinator!
    
    init(){
        onboarding = Container.shared.onboardingCoordinator()
        home =     HomeCoordinator(app: self)
        search =   SearchCoordinator(app: self)
        profile =  ProfileCoordinator(app: self)
        settings = SettingsCoordinator(app: self)
    }
    
    func finishOnboarding() {
        UserDefaults.standard.set(true, forKey: "isOnborded")
        isOnboarded = true
    }
    
    func resetOnboarding() {
        UserDefaults.standard.set(false, forKey: "isOnborded")
        onboarding = Container.shared.onboardingCoordinator()
        selectedTab = .home
        isOnboarded = false
    }
    
    func push(_ route: Route) { path.append(route) } 
    func pop()       { if !path.isEmpty { path.removeLast() } }
    func popToRoot() { path = NavigationPath() }
}


import SwiftUI

@Observable
final class MainCoordinator {
    var path = NavigationPath()
    var selectedTab: Tab = .home
    
    private weak var app: AppCoordinator?
    
    var home:       HomeCoordinator!
    var search:     SearchCoordinator!
    var profile:    ProfileCoordinator!
    var settings:   SettingsCoordinator!
    
    init(app: AppCoordinator){
        self.app = app
        home =     HomeCoordinator(app: self)
        search =   SearchCoordinator(app: self)
        profile =  ProfileCoordinator(app: self)
        settings = SettingsCoordinator(app: self)
    }
    
//    func finishOnboarding() {
//        UserDefaults.standard.set(true, forKey: "isOnborded")
//        isOnboarded = true
//    }
//    
//    func resetOnboarding() {
//        UserDefaults.standard.set(false, forKey: "isOnborded")
//        onboarding = Container.shared.onboardingCoordinator()
//        selectedTab = .home
//        isOnboarded = false
//    }
    
    func push(_ route: MainRoute) { path.append(route) } 
    func pop()       { if !path.isEmpty { path.removeLast() } }
    func popToRoot() { path = NavigationPath() }
    
    func resetOnboarding(){
        app?.showOnboarding()
    }
    func registration(){
        app?.startReg()
    }
}

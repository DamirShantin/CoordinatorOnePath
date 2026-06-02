
import Foundation
import FactoryKit

enum WindowCase {
    case reg
    case onboarding
    case main
}

@Observable
final class AppCoordinator{
    var selectedWindow: WindowCase = .main
    var isOnboarded: Bool
    var isRegistred: Bool
    
    init(){
        if UserDefaults.standard.value(forKey: "isRegistred") == nil  { UserDefaults.standard.set(false, forKey: "isRegistred") }
        if UserDefaults.standard.value(forKey: "isOnboarding") == nil { UserDefaults.standard.set(false, forKey: "isOnboarding")}
        
        self.isOnboarded = UserDefaults.standard.bool(forKey: "isOnborded")
        self.isRegistred = UserDefaults.standard.bool(forKey: "isRegistred")
        checkWindowCase()
    }
    
    //MARK: - Registration
    func startReg(){
        self.selectedWindow = .reg
        UserDefaults.standard.set(false, forKey: "isRegistred")
        isRegistred = false
    }
    
    func finishReg(){
        UserDefaults.standard.set(true, forKey: "isRegistred")
        isRegistred = true
        checkWindowCase()
    }
    
    //MARK: - Onboarding
    func showOnboarding(){
        self.selectedWindow = .onboarding
        UserDefaults.standard.set(false, forKey: "isOnboarding")
        isOnboarded = false
    }
    
    func finishOnboarding(){
        self.selectedWindow = .main
        UserDefaults.standard.set(true, forKey: "isOnboarding")
        isOnboarded = true
        checkWindowCase()
    }
    
    //MARK: - Main
    func showMain(){
        self.selectedWindow = .main
    }
    
    private func checkWindowCase(){
        if isRegistred {
            if isOnboarded {
                selectedWindow = .main
            } else {
                selectedWindow = .onboarding
            }
        } else {
            selectedWindow = .reg
        }
    }
    
}


import SwiftUI

struct ProfileCoordinatorView: View {
    var body: some View {              
        ProfileRootView()                    
            .navigationDestination(for: ProfileRoute.self) { route in
                switch route {
                case .root(let userId): ProfileRootView(userId: userId)  // cross-tab destination
                case .edit: ProfileEditView()
                }
            }                                                                      
    }                                                    
}                                                                                  


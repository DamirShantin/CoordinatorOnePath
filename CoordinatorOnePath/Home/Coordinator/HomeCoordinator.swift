
import SwiftUI

final class HomeCoordinator {                            
      private weak var app: AppCoordinator?                                          
      init(app: AppCoordinator) { self.app = app }         
                                               
    func showDetail()            { app?.push(HomeRoute.detail) }
    func showItem()              { app?.push(HomeRoute.item) }
    func showProfile(id: String) { app?.push(ProfileRoute.root(userId: id)) }
  }
                                  
 

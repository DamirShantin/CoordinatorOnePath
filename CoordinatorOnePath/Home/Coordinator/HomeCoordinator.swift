
import SwiftUI

final class HomeCoordinator {                            
      private weak var app: AppCoordinator?                                          
      init(app: AppCoordinator) { self.app = app }         
                                               
    func showDetail()            { app?.push(Route.home(.detail)) }
    func showItem()              { app?.push(Route.home(.item)) }
    func showProfile(id: String) { app?.push(Route.profile(.root(userId: id))) }
  }
                                  
 

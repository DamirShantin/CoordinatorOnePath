
import SwiftUI

final class HomeCoordinator {
    private weak var app: MainCoordinator?
    init(app: MainCoordinator) { self.app = app }
    
    func showDetail()            { app?.push(.home(.detail)) }
    func showItem()              { app?.push(.home(.item)) }
    func showProfile(id: String) { app?.push(.profile(.root(userId: id))) }
}
                                  
 

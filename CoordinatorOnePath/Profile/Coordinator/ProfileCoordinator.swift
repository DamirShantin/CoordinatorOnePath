
import SwiftUI

final class ProfileCoordinator {                         
    private weak var app: MainCoordinator?
    init(app: MainCoordinator) { self.app = app }
    
    func showEdit() { app?.push(MainRoute.profile(.edit)) }
}



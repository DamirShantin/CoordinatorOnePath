
import SwiftUI

final class ProfileCoordinator {                         
    private weak var app: AppCoordinator?
    init(app: AppCoordinator) { self.app = app }
    
    func showEdit() { app?.push(Route.profile(.edit)) }
}



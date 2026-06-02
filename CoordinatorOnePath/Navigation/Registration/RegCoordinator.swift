
import SwiftUI

@Observable
final class RegCoordinator{
    var path = NavigationPath()
    
    private weak var app: AppCoordinator?
    init(app: AppCoordinator) {
        self.app = app
    }
    
    func finish(){
        app?.finishReg()
    }
}

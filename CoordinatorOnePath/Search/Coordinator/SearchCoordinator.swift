
import SwiftUI

final class SearchCoordinator {
    private weak var app: MainCoordinator?
    init(app: MainCoordinator) { self.app = app }
    
    func showResults() { app?.push(MainRoute.search(.results)) }
}



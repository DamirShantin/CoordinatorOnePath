
import SwiftUI

final class SearchCoordinator {
    private weak var app: AppCoordinator?
    init(app: AppCoordinator) { self.app = app }
    
    func showResults() { app?.push(SearchRoute.results) }
}



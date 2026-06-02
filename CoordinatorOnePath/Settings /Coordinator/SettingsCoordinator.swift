
import SwiftUI

final class SettingsCoordinator {
    private weak var app: MainCoordinator?
    init(app: MainCoordinator) { self.app = app }
    
    func showAbout() { app?.push(Route.settings(.about)) }
}

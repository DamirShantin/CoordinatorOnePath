
import SwiftUI

final class SettingsCoordinator {
    private weak var app: AppCoordinator?
    init(app: AppCoordinator) { self.app = app }
    
    func showAbout() { app?.push(SettingsRoute.about) }
}

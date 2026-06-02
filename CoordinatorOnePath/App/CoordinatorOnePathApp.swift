
import SwiftUI
import FactoryKit

@main
struct CoordinatorOnePathApp: App {
    @State private var coordinator = AppCoordinator()
    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environment(coordinator)
        }
    }
}

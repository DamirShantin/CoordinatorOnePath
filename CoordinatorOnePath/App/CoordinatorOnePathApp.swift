
import SwiftUI
import FactoryKit

@main
struct CoordinatorOnePathApp: App {
    @State private var coordinator = Container.shared.appCoordinator()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(coordinator)
        }
    }
}

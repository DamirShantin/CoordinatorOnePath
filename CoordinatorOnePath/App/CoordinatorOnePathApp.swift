
import SwiftUI
import FactoryKit

@main
struct CoordinatorOnePathApp: App {
    @State private var coordinator = Container.shared.mainCoordinator()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(coordinator)
        }
    }
}


import SwiftUI

struct RegRootView: View {
    
    @Environment(RegCoordinator.self) var coordinator
    
    var body: some View {
        @Bindable var c = coordinator
        
        NavigationStack(path: $c.path) {
            VStack{
                Text("Reg root view")
                Button("Finish registration") { c.finish()}
            }
        }
        
    }
}

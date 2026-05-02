
import SwiftUI

struct SearchRootView: View {
    @Environment(AppCoordinator.self) private var app
    
    var body: some View {
        VStack(spacing: 16) {                                                      
            Text("SearchRootView")                       
            Button("→ SearchResults") { app.search.showResults() }
        }                              
    }                                        
}

struct SearchResultsView: View {                                                   
    var body: some View { Text("SearchResultsView") }
} 

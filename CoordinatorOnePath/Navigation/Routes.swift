
import Foundation

enum OnboardingRoute {
    case page2
    case page3
}

enum HomeRoute: Hashable {
    case detail
    case item
}

enum SearchRoute: Hashable {
    case results
}

enum ProfileRoute: Hashable {
    case root(userId: String)
    case edit
}

enum SettingsRoute: Hashable {
    case about
}

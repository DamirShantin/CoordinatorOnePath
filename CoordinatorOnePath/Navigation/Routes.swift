
import Foundation

enum Route: Hashable{
//    case onBoarding(_ val: OnboardingRoute)
    case home(_ val:HomeRoute)
    case search(_ val:SearchRoute)
    case profile(_ val:ProfileRoute)
    case settings(_ val:SettingsRoute)
}

enum OnboardingRoute: Hashable {
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


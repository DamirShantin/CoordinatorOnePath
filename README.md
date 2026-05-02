# CoordinatorOnePath

A SwiftUI iOS app demonstrating the **Coordinator pattern** with a single shared `NavigationPath` across the entire application.

## Concept

The core idea is to use **one** `NavigationPath` inside the root `AppCoordinator` for navigating across and between all tabs. This makes cross-tab navigation straightforward — a button on the Home tab can push a Profile screen without switching the active tab.

## Requirements

- iOS 17+
- Xcode 15+
- Swift 5.9+

## Dependencies

| Library | Version | Purpose |
|---|---|---|
| [Factory (FactoryKit)](https://github.com/hmlongco/Factory) | 3.0.1 | Dependency Injection |

## Project Structure

```
CoordinatorOnePath/
├── App/
│   ├── CoordinatorOnePathApp.swift     # @main entry point
│   ├── RootView.swift                  # onboarding / main branch
│   ├── ContentView.swift               # NavigationStack + CustomTabView
│   └── TabView/
│       ├── CustomTabView.swift         # ZStack tab view with state preservation
│       └── CustomTabBar.swift          # custom tab bar UI
│
├── Navigation/
│   ├── AppCoordinator.swift            # root coordinator (NavigationPath + tabs)
│   ├── AppCoordinator+Container.swift  # FactoryKit registration
│   ├── AppDestination.swift            # aggregates all navigationDestination modifiers
│   ├── Routes.swift                    # type-safe route enums for all modules
│   └── Tab.swift                       # enum Tab: home, search, profile, settings
│
├── Home/
│   ├── HomeRootView.swift
│   └── Coordinator/
│       ├── HomeCoordinator.swift
│       ├── HomeCoordinatorView.swift
│       └── HomeDestination.swift
│
├── Search/
│   ├── SearchRootView.swift
│   └── Coordinator/
│       ├── SearchCoordinator.swift
│       ├── SearchCoordinatorView.swift
│       └── SearchDestination.swift
│
├── Profile/
│   ├── ProfileRootView.swift
│   └── Coordinator/
│       ├── ProfileCoordinator.swift
│       ├── ProfileCoordinatorView.swift
│       └── ProfileDestionation.swift
│
├── Settings/
│   ├── SettingsRootView.swift
│   └── Coordinator/
│       ├── SettingsCoordinator.swift
│       ├── SettingsCoordinatorView.swift
│       └── SettingsDestination.swift
│
└── OnBording/
    ├── OnboardingPage1View.swift
    ├── OnboardingPage2View.swift
    ├── OnboardingPage3View.swift
    └── Coordinator/
        ├── OnboardingCoordinator.swift
        └── OnboardingCoordinatorView.swift
```

## Architecture

### Navigation Layers

```
CoordinatorOnePathApp
        │
        └── RootView
               │
        ┌──────┴──────────────────────┐
        │ isOnboarded == false        │ isOnboarded == true
        │                            │
OnboardingCoordinatorView        ContentView
  (own isolated NavigationStack)      │
                             NavigationStack(path: AppCoordinator.path)
                                      │
                                 CustomTabView
                           ┌──────────┼──────────┬──────────┐
                         Home      Search      Profile   Settings
```

### AppCoordinator

The central application object — `@Observable`, registered as a singleton via FactoryKit.

```swift
@Observable
final class AppCoordinator {
    var path = NavigationPath()   // the single navigation stack
    var selectedTab: Tab = .home
    var isOnboarded: Bool

    func push(_ route: some Hashable) { path.append(route) }
    func pop()       { path.removeLast() }
    func popToRoot() { path = NavigationPath() }
}
```

### Tab Coordinators

Each tab has its own coordinator (`HomeCoordinator`, `SearchCoordinator`, `ProfileCoordinator`, `SettingsCoordinator`). They hold a weak reference to `AppCoordinator` and push routes onto its shared `path`:

```swift
final class HomeCoordinator {
    private weak var app: AppCoordinator?

    func showDetail()            { app?.push(HomeRoute.detail) }
    func showItem()              { app?.push(HomeRoute.item) }
    func showProfile(id: String) { app?.push(ProfileRoute.root(userId: id)) } // cross-tab navigation
}
```

### Routes

All routes are type-safe `Hashable` enums defined in `Routes.swift`:

```swift
enum HomeRoute: Hashable    { case detail, item }
enum SearchRoute: Hashable  { case results }
enum ProfileRoute: Hashable { case root(userId: String), edit }
enum SettingsRoute: Hashable{ case about }
enum OnboardingRoute        { case page2, page3 }
```

### Destination Registration

`AppDestination.swift` aggregates all `navigationDestination` modifiers in one place via a `View` extension:

```swift
extension View {
    func appNavigationDestinations() -> some View {
        self
            .homeDestinations()
            .searchDestinations()
            .profileDestinations()
            .settingsDestinations()
    }
}
```

This is applied to the `NavigationStack` once in `ContentView`, keeping the stack aware of every possible destination.

### Custom Tab Bar

`CustomTabView` uses a `ZStack` with opacity switching instead of the native `TabView`. Benefits:
- tab state is preserved when switching between tabs
- tapping the active tab icon resets its stack by reassigning a new `UUID`

### Onboarding

`OnboardingCoordinator` is a separate `@Observable` object with its **own** `NavigationPath`, fully isolated from the main navigation. Once the user completes onboarding, the flag is saved to `UserDefaults` and `RootView` switches to `ContentView`.

## Navigation Flow

```
App launch
  └─ isOnboarded?
       ├─ false → OnboardingPage1 → Page2 → Page3 → [finishOnboarding()] → ContentView
       └─ true  → ContentView (CustomTabView)
                       ├─ Home     → HomeDetail → HomeItem
                       │             └─ Profile (cross-tab, userId: String)
                       ├─ Search   → Results
                       ├─ Profile  → ProfileEdit
                       └─ Settings → About
```

## Dependency Injection

`AppCoordinator` is registered as a **singleton** in the FactoryKit container. `OnboardingCoordinator` is registered as a **transient** — a fresh instance is created on every call, which makes resetting the onboarding flow trivial:

```swift
extension Container {
    var appCoordinator: Factory<AppCoordinator> {
        self { AppCoordinator() }.singleton
    }
    var onboardingCoordinator: Factory<OnboardingCoordinator> {
        self { OnboardingCoordinator() }
    }
}
```

## Key Benefits of This Pattern

- **Single navigation source of truth** — the entire stack lives in one `path`, simplifying deep links and universal links
- **Cross-tab navigation** — any coordinator can push a route from any other module
- **Testability** — coordinators have no dependency on concrete View types
- **Scalability** — adding a new route only requires a new `case` in the enum and one `navigationDestination` handler

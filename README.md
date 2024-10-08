# BetterNavigation

This project demonstrates a custom navigation system in SwiftUI using the `NavigationStack` and `@Environment` to manage navigation actions. The app displays a list of animals, allowing the user to tap on any animal to navigate to a detailed view of the selected animal.

# Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Custom Navigation System](#custom-navigation-system)
    - [Acknowledgements](#acknowledgements)
    - [NavigateAction](#navigateaction)
    - [Route](#route)
- [Animal and Location Views](#animal-and-location-views)
    - [Animal List Navigationstack](#animallistnavigationstack)
        - [Animal List View](#animallistview)
        - [Animal Details](#animaldetails)
    - [Locations Navigationstack](#locationsnavigationstack)
- [Running the Project](#running-the-project)
- [Preview Setup](#preview-setup)

# Features

- Displays a list of animals.
- Tapping on an animal navigates to a detailed screen with the animal’s name and image.
- Uses a custom navigation system implemented via SwiftUI’s `@Environment`.
- Supports `NavigationStack` for managing navigation state and paths.
- Provides back navigation with customizable UI, including colored back buttons.

# Project Structure

Here’s a breakdown of the files and their purpose: 
* **`Animal.swift`**: Defines the `Animal` model, which represents each animal with a `name` and `image`.
* **`Location.swift`**: Defines the `Location` model, representing each location with a `name` and `description`.
* **`AppScreen.swift`**: Enum that defines the app's available screens: animals and locations, with labels and destination views.
* **`AnimalRoute.swift`**: Enum that defines different routes related to animal views (list and detail).
* **`LocationRoute.swift`**: Enum that defines different routes related to location views. 
* **`Route.swift`**: Enum that encapsulates all possible routes in the app, including `AnimalRoute` and `LocationRoute`. 
* **`NavigateAction.swift`**: Defines an action used to handle navigation through the `@Environment` key. 
* **`AnimalListView.swift`**: Displays the list of animals and handles navigation to the detail screen when an animal is tapped. 
* **`AnimalDetails.swift`**: Displays the details of a selected animal. 
* **`LocationView.swift`**: Displays details for a specific location.
* **`AnimalListNavigationStack.swift`**: Manages navigation for animal-related views using `NavigationStack`.
* **`LocationsNavigationStackStack.swift`**: Manages navigation for location-related views using `NavigationStack`.
* **`ContentView.swift`**: The main view that sets up the tab bar and switches between `animal` and `location` screens.
* **`BetterNavigationApp.swift`**: The entry point of the app, setting up the `NavigationStack` and injecting the custom `NavigateAction` environment key.

# Custom Navigation System

This project uses a custom navigation system that allows for seamless navigation between views using `NavigationStack` and `@Environment`.

# Acknowledgements

This project takes inspiration from the [React Router's useNavigate](https://reactrouter.com/en/main/hooks/use-navigate) hook, particularly in the way navigation actions are abstracted into an environment variable. Just as `useNavigate` in React Router enables declarative navigation within components, `NavigateAction` in this SwiftUI project serves a similar role by allowing views to trigger navigation using the `@Environment` key. This approach provides a cleaner separation of navigation logic from view code, improving flexibility and reusability.

# NavigateAction
The `NavigateAction` struct defines how navigation is triggered. It is injected into the environment so that any view can access the `navigate` function to push new routes.

```swift
struct NavigateAction {
    typealias Action = (Route) -> ()
    let action: Action
    func callAsFunction(_ route: Route) {
        action(route)
    }
}
```

This enables triggering navigation like this:

```swift
@Environment(\.navigate) private var navigate

.onTapGesture {
    navigate(.animal(.detail(animal)))
}
```

# Route
The `Route` enum defines the possible navigation routes within the app. It supports nesting, so different sections of the app can have their own routing logic.

```swift
enum Route: Hashable {
    case animal(AnimalRoute)
    case location(LocationRoute)
}
```

The `AnimalRoute` enum defines specific routes related to animal-related views:

```swift
enum AnimalRoute: Hashable {
    case list
    case detail(Animal)
}

enum LocationRoute: Hashable {
    case location
}
```

By using enums, we ensure that each route is strongly typed and well-organized, making it easier to handle navigation flows.

# Animal and Location Views

## AnimalListNavigationStack
The `AnimalListNavigationStack` handles navigation for animal-related views. It presents a list of animals, and tapping on any of them navigates to the detail screen.

```swift
struct AnimalListNavigationStack: View {
    
    @State var routes: [AnimalRoute] = []
    
    var body: some View {
        NavigationStack(path: $routes) {
            AnimalListView()
                .navigationDestination(for: AnimalRoute.self) { route in
                    route.destination
                }
                .environment(\.navigate, NavigateAction(action: { route in
                    if case let .animal(animalRoute) = route {
                        routes.append(animalRoute)
                    }
                }))
        }
    }
}
```

## LocationsNavigationStack
The `LocationsNavigationStack` handles navigation for location-related views. It presents a detailed view for the selected location.

```swift
struct LocationsNavigationStack: View {
    
    @State private var routes: [LocationRoute] = []
    
    var body: some View {
        NavigationStack(path: $routes) {
            LocationView()
                .navigationDestination(for: LocationRoute.self) { route in
                    route.destination
                }
        }
        .environment(\.navigate, NavigateAction(action: { route in
            if case let .location(locationRoute) = route {
                routes.append(locationRoute)
            }
        }))
    }
}
```

### AnimalListView
The `AnimalListView` displays a list of animals. Each animal in the list is tappable, and when tapped, it navigates to the `AnimalDetails` view.

```swift
struct AnimalListView: View {
    var animals: [Animal] = [ ... ] // Predefined list of animals

    var body: some View {
        List(animals) { animal in
            // List item layout
            .onTapGesture {
                navigate(.animal(.detail(animal)))
            }
        }
    }
}
```

## AnimalDetails
The `AnimalDetails` view displays the selected animal's name and an image associated with it.

```swift
struct AnimalDetails: View {
    let animal: Animal
    
    var body: some View {
        VStack {
            Text(animal.name).font(.largeTitle)
            Image(systemName: animal.image).resizable()
        }
    }
}
```

# Running the Project

1. Clone the repository or download the project files.
2. Open the project in Xcode.
3. Run the project on the simulator or a physical device.
4. The app will launch with a list of animals. Tapping on an animal will navigate to a detail view for that animal.

# Preview Setup

To test your views without running the entire app, SwiftUI provides previews. This project includes `#Preview` blocks for testing the individual views in Xcode.

For instance, the preview for `AnimalDetails` looks like this:

```swift
#Preview {
    let animal = Animal(name: "Lion", image: "crown.fill")
    AnimalDetails(animal: animal)
}
```
This allows you to test how the detail view looks in Xcode's preview canvas.

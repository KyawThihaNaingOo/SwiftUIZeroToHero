//
//  ContentView.swift
//  swift_ui_ios_widgets
//
//  Created by Kyaw Thiha on 07/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var goToBasicView = false
    @State var routes: [Route] = []
    @State var returnHandlers: [((Any?) -> Void)?] = []
    @Environment(\.navigate) private var navigate
    
    var body: some View {
        NavigationStack(path: $routes) {
            VStack {
                BasicWidgets()
                Button("Go To Simple List") {
                    navigate(.simpleListWiget)
                }
            }.navigationDestination(for: Route.self) { route in
                route.destination
            }
        }.environment(\.navigate, NavigateAction(
            push: { route, onReturn in
                print("Route called")
                routes.append(route)
                returnHandlers.append(onReturn)
            },
            pop: { value in
                if !routes.isEmpty {
                    routes.removeLast()
                    // When popping, call the callback of the previous route
                    if let handler = returnHandlers.popLast(), let callback = handler {
                        callback(value)
                    }
                }
            }
        ))
    }
}

#Preview {
    ContentView()
}

//
//  NavScreen.swift
//  Learn
//
//  Created by Mohammad Azam on 3/22/25.
//

import SwiftUI

enum Route: Hashable {
    case login
    case register
    
    @ViewBuilder
    var destination: some View {
        switch self {
            case .login:
                LoginScreen()
            case .register:
                RegisterScreen()
        }
    }
    
}

struct NavigateAction {
    typealias Action = (Route) -> ()
    let action: Action
    func callAsFunction(_ route: Route) {
        action(route)
    }
}

extension EnvironmentValues {
    @Entry var navigate = NavigateAction { _ in }
}

struct RegisterScreen: View {
    
    var body: some View {
        VStack {
           Text("Register Screen")
        }
    }
}

struct LoginScreen: View {
    
    @Environment(\.navigate) private var navigate
    
    var body: some View {
        VStack {
            Button("Go to Register Screen") {
                Task {
                    try? await Task.sleep(for: .seconds(2.0))
                    navigate(.register)
                }
            }
        }
    }
}

#Preview {
    
    @Previewable @State var routes: [Route] = []
    
    NavigationStack(path: $routes) {
        LoginScreen()
            .navigationDestination(for: Route.self) { route in
                route.destination
            }
    }.environment(\.navigate, NavigateAction(action: { route in
        routes.append(route)
    }))
}
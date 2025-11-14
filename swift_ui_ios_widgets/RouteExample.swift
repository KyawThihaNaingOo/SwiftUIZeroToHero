//
//  Route.swift
//  swift_ui_ios_widgets
//
//  Created by Kyaw Thiha on 09/11/2025.
//

import SwiftUI

enum Route: Hashable {
    case login
    case register
    case detail(id: Int, name: String)
    ///
    case simpleListWiget
    case listWithModel
    case editableListWidget
    case simpleGridWidget
    case gridViewDynamicWidget
    case themeModelPickerWidget
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .login:
            LoginScreen()
        case .register:
            RegisterScreen()
        case .detail(id: let id, name: let name):
            DetailScreen(id: id, name: name)
        case .simpleListWiget:
            SimpleListWidget()
        case .listWithModel:
            UserList()
        case .editableListWidget:
            EditableList()
        case .simpleGridWidget:
            SimpleGridWidget()
        case .gridViewDynamicWidget:
            GridViewDynaimcWidget()
        case .themeModelPickerWidget:
            DialogAndSheetWidgets()
        }
    }
}

struct NavigateAction {
    typealias PushAction = (_ route: Route, _ onReturn: ((Any?) -> Void)?) -> ()
    typealias PopAction = (_ value:  Dictionary<String, Any>?) -> ()
    
    let push: PushAction
    let pop: PopAction
    
    func callAsFunction(_ route: Route, onReturn: ((Any?) -> Void)? = nil) {
        push(route, onReturn)
    }
    
    func back(value: Dictionary<String, Any>? = nil) {
        pop(value)
    }
}


extension EnvironmentValues {
    @Entry var navigate = NavigateAction(push: { _,_  in }, pop: { _ in})
}

struct RegisterScreen: View {
    @Environment(\.navigate) private var navigate
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Register Screen")
            Button("Go to Detail with Data") {
                navigate(.detail(id: 101, name: "New User"), onReturn: { value in
                    print(value ?? "Defalut value")
                })
            }
            Button("Go Back to Login") {
                navigate.back()
            }
        }
    }
}


struct LoginScreen: View {
    
    @Environment(\.navigate) private var navigate
    
    var body: some View {
        VStack {
            Button("Go to Register Screen") {
                Task {
                    try? await Task.sleep(for: .seconds(1.0))
                    navigate(.register)
                }
            }
        }
    }
}

struct DetailScreen: View {
    let id: Int
    let name: String
    
    @Environment(\.navigate) private var navigate
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Detail Screen")
                .font(.title)
            Text("ID: \(id)")
            Text("Name: \(name)")
            
            Button("Go Back") {
                let rtnValue: [String: Any] = [
                    "name": "Kyaw Thiha",
                    "age": 30,
                    "isMember": true,
                    "scores": [90, 85, 88],
                    "profile": ["city": "Yangon", "country": "Myanmar"]
                ]
                navigate.back(value: rtnValue)
            }
        }
        .padding()
    }
}


//
//#Preview {
//    @Previewable @State var routes: [Route] = []
//    @Previewable @State var returnHandlers: [((Any?) -> Void)?] = []
//    
//    NavigationStack(path: $routes) {
//        LoginScreen()
//            .navigationDestination(for: Route.self) { route in
//                route.destination
//            }
//    }
//    .environment(\.navigate, NavigateAction(
//        push: { route, onReturn in
//            routes.append(route)
//            returnHandlers.append(onReturn)
//        },
//        pop: { value in
//            if !routes.isEmpty {
//                routes.removeLast()
//                // When popping, call the callback of the previous route
//                if let handler = returnHandlers.popLast(), let callback = handler {
//                    callback(value)
//                }
//            }
//        }
//    ))
//}

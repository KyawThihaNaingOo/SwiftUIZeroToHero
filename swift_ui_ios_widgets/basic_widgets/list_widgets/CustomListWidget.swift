//
//  CustomListWidget.swift
//  swift_ui_ios_widgets
//
//  Created by Kyaw Thiha on 10/11/2025.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
}

struct UserList: View {
    let users = [
        User(name: "Alice", age: 22),
        User(name: "Bob", age: 30),
        User(name: "Charlie", age: 27)
    ]
    
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
                Spacer()
                Text("\(user.age)")
                    .foregroundColor(.gray)
            }
        }.padding(0)
    }
}


#Preview {
    UserList()
}

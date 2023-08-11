//
//  User.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 01.08.2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var email: String
    var username: String
    var fullname: String
    var bio: String?
    var imageUrl: String?
}

extension User {
    static var dummyUsers: [User] = [
        User(id: UUID().uuidString, email: "oscar.knight@email.com", username: "oscar.knight", fullname: "Oscar Knight", bio: "Bio 1", imageUrl: "https://picsum.photos/200/300"),
        User(id: UUID().uuidString, email: "peter.doyle@email.com", username: "peter.doyle", fullname: "Peter Doyle", bio: "Bio 2", imageUrl: "https://picsum.photos/200/300"),
        User(id: UUID().uuidString, email: "zayne.newton@email.com", username: "zayne.newton", fullname: "Zayne Newton", bio: "Bio 3", imageUrl: "https://picsum.photos/200/300"),
        User(id: UUID().uuidString, email: "george.barker@email.com", username: "george.barker", fullname: "George Barker", bio: "Bio 4", imageUrl: "https://picsum.photos/200/300"),
        User(id: UUID().uuidString, email: "jamar.fox@email.com", username: "jamar.fox", fullname: "Jamar Fox", bio: "Bio 5", imageUrl: "https://picsum.photos/200/300")
    ]
}

//
//  ViewModel.swift
//  Grouping
//
//  Created by Joal Arcos on 11/27/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var group: [PersonGroup] = []

    func start() {
        let elements = MockData.personArray
        group = elements.group { last, current in
            last.age == current.age
        }
        .map { PersonGroup(
            age: $0.first?.age ?? 0, type: $0.first?.sex.description ?? "", persons: $0)
        }
    }

    func groupByAge() {
        let elements = MockData.personArray
        let personByAge = Dictionary(grouping: elements, by: {$0.age})

        group = personByAge.map { age, persons in
            PersonGroup(age: age, type: persons.first?.sex.description ?? "", persons: persons)
        }
    }

    func update() {
        let elements = MockData.newPersonArray
        group = elements.group { last, current in
            last.age == current.age
        }
        .map { PersonGroup(
            age: $0.first?.age ?? 0, type: $0.first?.sex.description ?? "", persons: $0)
        }
    }
}

/// This is really a Person object
/// 18-21 22-35 36-45

struct Person: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let age: Int
    let sex: SexType
}

struct PersonGroup: Identifiable {
    let id = UUID()
    let age: Int
    let type: String
    let persons: [Person]
}

enum SexType {
    case male
    case female
    case nonBinary

    var description: String {
        switch self {
        case .female:
            "Female"
        case .male:
            "Male"
        case .nonBinary:
            "Non-binary"
        }
    }
}

struct MockData {
    static let person1 = Person(name: "John", age: 22, sex: .male)
    static let person2 = Person(name: "Mike", age: 22, sex: .male)
    static let person3 = Person(name: "Johnathan", age: 22, sex: .male)
    static let person4 = Person(name: "Jennifer", age: 32, sex: .female)
    static let person5 = Person(name: "Maria", age: 43, sex: .nonBinary)
    static let person6 = Person(name: "Keenie", age: 20, sex: .nonBinary)
    static let person7 = Person(name: "Yanara", age: 99, sex: .nonBinary)
    static let newPerson1 = Person(name: "Tyson", age: 21, sex: .male)
    static let personArray = [person1, person2, person3, person4, person5, person6, person7]
    static let newPersonArray = [newPerson1, person1, person2, person3, person4, person5, person6, person7]

    static let personDict = ["person1": person1, "person2": person2, "person3": person3, "person4": person4, "person5": person5, "person6": person6, "person7": person7]
}

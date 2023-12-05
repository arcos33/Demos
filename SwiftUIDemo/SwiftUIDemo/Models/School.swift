//
//  School.swift
//  SwiftUIDemo
//
//  Created by Joal Arcos on 9/20/23.
//

import Foundation

class School: Identifiable, ObservableObject {

    // MARK: - Properties

    var name: String

    var children: [School]? = nil

    let id = UUID()

    // MARK: - Init

    init(name: String, children: [School]?) {
        self.name = name
        self.children = children
    }
}

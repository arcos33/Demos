//
//  ViewModel.swift
//  EnumDemo
//
//  Created by Joal Arcos on 11/9/23.
//

import SwiftUI

class ViewModel: ObservableObject {
    var carType: CarType?

    func prepare() {
        if let type = carType {
            switch type {
            case .Ford:
                print("ok")
            case .Chevy(let title):
                print(title)
            case .Mazda:
                print("No problem")
            }
        }
    }
}

enum CarType {
    case Ford(_ title: String)
    case Chevy(_ title: String)
    case Mazda(_ title: String)

    // This sets the default value
    init() {
        self = .Chevy("#1")
    }
}



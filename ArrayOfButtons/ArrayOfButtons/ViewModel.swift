//
//  ViewModel.swift
//  ArrayOfButtons
//
//  Created by Joal Arcos on 11/5/23.
//

import SwiftUI

class ViewModel: ObservableObject {
    var buttonData = ButtonData(b1: false)

    func checkData() {
        print(buttonData)
    }
}

struct ButtonData {
    var b1: Bool
}

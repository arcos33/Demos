//
//  ArrayOfButtonsApp.swift
//  ArrayOfButtons
//
//  Created by Joal Arcos on 11/5/23.
//

import SwiftUI

@main
struct ArrayOfButtonsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: ViewModel(), content: Text("he"))
        }
    }
}

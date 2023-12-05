//
//  SwiftUIdemo2App.swift
//  SwiftUIdemo2
//
//  Created by Joal Arcos on 10/18/23.
//

import SwiftUI

@main
struct SwiftUIdemo2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel(id: "123"))
        }
    }
}

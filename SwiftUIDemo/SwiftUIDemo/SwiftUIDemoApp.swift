//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Joal Arcos on 7/28/23.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}

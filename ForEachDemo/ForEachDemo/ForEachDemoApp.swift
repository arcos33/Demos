//
//  ForEachDemoApp.swift
//  ForEachDemo
//
//  Created by Joal Arcos on 11/3/23.
//

import SwiftUI

@main
struct ForEachDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel(demoTypes: []))
        }
    }
}

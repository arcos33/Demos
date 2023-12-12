//
//  ContentView.swift
//  ToolbarItemGroupDemo
//
//  Created by Joal Arcos on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello, World!").padding()
                .navigationTitle("SwiftUI")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("First") {
                            print("Pressed")
                        }

                        Button("Second") {
                            print("Pressed")
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}

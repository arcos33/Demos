//
//  ContentView.swift
//  LazyGrid
//
//  Created by Joal Arcos on 10/30/23.
//

import SwiftUI

private let config = [
    GridItem(.fixed(50), spacing: 50),
    GridItem(.fixed(50), spacing: 0)
]

struct ContentView: View {
    var body: some View {
        ForEach((1...4), id: \.self) {_ in
            HStack {
                ZStack {
                    Color(.green)
                        .frame(width: 200, height: 200)
                    LazyHGrid(rows: config) {
                        Color(.red)
                            .frame(width: 90, height: 90)
                        Color(.red)
                            .frame(width: 90, height: 90)
                        Color(.red)
                            .frame(width: 90, height: 90)
                        Color(.red)
                            .frame(width: 90, height: 90)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

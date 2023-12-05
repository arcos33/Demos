//
//  ContentView.swift
//  ArrayOfButtons
//
//  Created by Joal Arcos on 11/5/23.
//

import SwiftUI

struct MainView<Content: View>: View {
    @ObservedObject var viewModel: ViewModel
    @State var b1: Bool = false
    private let content: Content

    init(viewModel: ViewModel, b1: Bool = false, content: Content) {
        self.viewModel = viewModel
        self.content = content
        self.b1 = viewModel.buttonData.b1
        doSome()
    }

    var body: some View {
        VStack {
            content
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onTapGesture {
            b1.toggle()
            print(b1)
        }
        .padding()
    }

    func doSome() {

    }
}

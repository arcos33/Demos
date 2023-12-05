//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Joal Arcos on 7/28/23.
//

import SwiftUI

struct ContentView: View {
    let viewModel: ContentViewModel

    var body: some View {
        VStack {
            ExpandingList(school: viewModel.school)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}


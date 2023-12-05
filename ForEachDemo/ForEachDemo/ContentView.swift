//
//  ContentView.swift
//  ForEachDemo
//
//  Created by Joal Arcos on 11/3/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ForEach(viewModel.selectableAttachments) { element in
            Text(element.id.uuidString)
        }
        .onAppear {
            viewModel.prepare()
        }
    }
}

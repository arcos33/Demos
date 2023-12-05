//
//  ContentView.swift
//  GroupedMessage
//
//  Created by Joal Arcos on 11/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Joel")
        VStack {
            HStack {
                Text("Hello how are you John?")
                    .padding(.leading, 14)
                    .padding(.vertical, 5)
                    .font(.subheadline)
                Spacer()
            }
            HStack {
                Text("I'm doing really well, been a long time though.")
                    .padding(.leading, 14)
                    .padding(.vertical, 5)
                    .font(.subheadline)
                Spacer()
            }
            HStack {
                Text("When are we gonna grab the boat and go fishing like in the old days...")
                    .padding(.leading, 14)
                    .padding(.vertical, 5)
                    .font(.subheadline)
                Spacer()
            }
        }
        .frame(width: .infinity)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
        .padding(.leading, 14)
        .padding(.trailing, 100)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Grouping
//
//  Created by Joal Arcos on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        List(viewModel.group) { group in
            Section(group.age.description) {
                ForEach(group.persons) { person in
                    HStack(alignment: .center) {
                        Text(person.name)
                            .frame(minWidth: 0, maxWidth: .infinity)
                        Spacer()
                        Text(person.age.description)
                            .frame(minWidth: 0, maxWidth: .infinity)
                        Spacer()
                        Text(person.sex.description)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .background(Color.blue)
                }
            }
        }
        .onAppear {
            viewModel.groupByAge()
        }

        Button("+") {
            viewModel.group.append(PersonGroup(age: 19, type: SexType.male.description, persons: [MockData.newPerson1]))
            viewModel.update()
        }
        .buttonStyle(BorderedButtonStyle())
        .foregroundColor(.primary)
    }
}

#Preview {
    ContentView()
}

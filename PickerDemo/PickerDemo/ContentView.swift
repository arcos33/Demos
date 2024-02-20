//
//  ContentView.swift
//  PickerDemo
//
//  Created by jediOne on 2/19/24.
//

import SwiftUI

struct ContentView: View {
    @State var colorType: ColorType = .Orange
    
    /// This works without setting tag.
    var body: some View {
        VStack {
            Picker("Picker Title", selection: $colorType) {
                ForEach(ColorType.allCases, id: \.self) {
                    Text($0.rawValue).tag($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
    }
}

enum ColorType: String, CaseIterable {
    case Orange
    case Red
    case Green
    case Purple
    case Black
    case White
    case Gray
    case Blue
    case Aqua
    case One
}

#Preview {
    ContentView()
}

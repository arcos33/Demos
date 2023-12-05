//
//  ExpandingList2.swift
//  SwiftUIDemo
//
//  Created by Joal Arcos on 9/20/23.
//

import SwiftUI

struct ExpandingList2: View {
    @ObservedObject var school: School

    @State var listHeight: CGFloat = 50

    var body: some View {
        List(school.children ?? [], children: \.children) { item in
            GeometryReader { geometry in
                Text(item.name)
                    .onAppear {
                        listHeight += geometry.size.height
                    }
                    .onDisappear {
                        listHeight -= geometry.size.height
                    }
            }
        }
        .frame(height: listHeight)
    }
}


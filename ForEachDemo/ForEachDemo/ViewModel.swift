//
//  ViewModel.swift
//  ForEachDemo
//
//  Created by Joal Arcos on 11/3/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var selectableAttachments: [SelectableAttachment] = []

    var demoTypes: [DemoType]

    init(demoTypes: [DemoType]) {
        self.demoTypes = demoTypes
    }

    func prepare() {
        let item1 = DemoType.self.text("Test1")
        demoTypes.append(item1)
        let item2 = DemoType.self.text("Test2")
        demoTypes.append(item2)
        selectableAttachments = demoTypes.map {
            SelectableAttachmentMapper.map($0)
        }
    }
}







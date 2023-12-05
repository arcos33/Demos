//
//  SelectableAttachment.swift
//  ForEachDemo
//
//  Created by Joal Arcos on 11/3/23.
//

import Foundation

struct SelectableAttachment: Identifiable {
    let id = UUID()
    let isSelected: Bool
    let messageType: DemoType
}

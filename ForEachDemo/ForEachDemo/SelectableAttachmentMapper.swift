//
//  SelectableAttachmentMapper.swift
//  ForEachDemo
//
//  Created by Joal Arcos on 11/3/23.
//

import Foundation

enum SelectableAttachmentMapper {
    static func map(_ entity: DemoType) -> SelectableAttachment {
        SelectableAttachment(isSelected: false,
                             messageType: entity
        )
    }
}

//
//  Array+Extension.swift
//  Grouping
//
//  Created by Joal Arcos on 11/27/23.
//

import Foundation

/// This can be used when comparing objects that are next to each other
extension Array {
    func group(using compare: (Element, Element) -> Bool) -> [[Element]] {
        let result = [[Element]]()
        return reduce(into: result) { result, element in
            switch result.last?.last {
            case .none:
                result.append([element])
            case .some(let prior) where compare(prior, element):
                result[result.count - 1].append(element)
            default:
                result.append([element])
            }
        }
    }
}

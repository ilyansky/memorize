//
//  Extensions.swift
//  Memorize
//
//  Created by Satin on 25.08.2025.
//

import Foundation

extension Array {

    var only: Element? {
        count == 1 ? first : nil
    }
}

extension Collection {

    subscript(safe: Index) -> Element? {
        return indices.contains(safe) ? self[safe] : nil
    }

}

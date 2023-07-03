//
//  KeyedDecodingContainer+.swift
//  
//
//  Created by 정김기보 on 2023/07/03.
//

import Foundation

extension KeyedDecodingContainer {
    func decodeHeterogeneousArray<Family: DecodableClassFamily>(
        familly: Family.Type,
        forKey key: K
    ) throws -> [Family.BaseType] {
        var itemsContainer = try nestedUnkeyedContainer(forKey: key)
        var itemsContainerCopy = itemsContainer
        
        var items: [Family.BaseType] = []
        
        while !itemsContainer.isAtEnd {
            // peek at the type
            let typeContainer = try itemsContainer.nestedContainer(keyedBy: AnyCodingKey.self)
            let family = try typeContainer.decode(Family.self, forKey: Family.discriminator)
            let type = family.getType()
            let item = try itemsContainerCopy.decode(type)
            items.append(item)
        }
        return items
    }
}

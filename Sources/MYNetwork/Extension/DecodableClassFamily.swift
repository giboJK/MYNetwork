//
//  DecodableClassFamily.swift
//  
//
//  Created by 정김기보 on 2023/07/03.
//

import Foundation

protocol DecodableClassFamily: Decodable {
    associatedtype BaseType: Decodable
    static var discriminator: AnyCodingKey { get }
    func getType() -> BaseType.Type
}

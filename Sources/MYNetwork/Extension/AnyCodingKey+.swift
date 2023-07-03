//
//  File.swift
//  
//
//  Created by 정김기보 on 2023/07/03.
//

import Foundation

struct AnyCodingKey: CodingKey {
    var stringValue: String
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int?
    init?(intValue: Int) {
        stringValue = String(intValue)
    }
}

extension AnyCodingKey: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        self.init(stringValue: value)!
    }
}

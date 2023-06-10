//
//  NetworkError.swift
//  
//
//  Created by 정김기보 on 2023/06/06.
//

import Foundation
import Alamofire

public enum NetworkError: Error {
    case http(ErrorData)
    case invalidURL
    case decodingFailed
    case undefineMethod(Alamofire.HTTPMethod)
    case unknown
}

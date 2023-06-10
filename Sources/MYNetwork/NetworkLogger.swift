//
//  File.swift
//  
//
//  Created by 정김기보 on 2023/06/06.
//

import Foundation
import Alamofire

final class NetworkLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "com.moyang.networklogger")
    
    func requestDidFinish(_ request: Request) {
        print(request.description)
    }
    
    func request<Value>(_ request: DataRequest,
                        didParseResponse response: DataResponse<Value, AFError>) {
        guard let data = response.data else { return }
        
        if let json = try? JSONSerialization
            .jsonObject(with: data, options: .mutableContainers) {
            print(json)
        }
    }
}

extension Data {
    var toPrettyPrintedString: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        return prettyPrintedString as String
    }
}

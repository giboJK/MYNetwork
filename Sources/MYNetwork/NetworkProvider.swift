
import Foundation
import Alamofire

public struct NetworkProvider {
    private let session: Session
    
    public init(configuration: URLSessionConfiguration = URLSessionConfiguration.af.default) {
        configuration.timeoutIntervalForRequest = 15
        self.session = Session(configuration: configuration, eventMonitors: [NetworkLogger()])
    }
    
    func request<T: Decodable> (_ urlRequest: URLRequest,
                                type: T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            session.request(urlRequest)
                .validate(statusCode: 200...599)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case let .success(value):
                        continuation.resume(returning: value)
                    case .failure(let error):
                        let myError = self.handleAFError(error: error)
                        continuation.resume(throwing: myError)
                    }
                }
        }
    }
    
    private func handleAFError(error: AFError) -> NetworkError {
        switch error {
        case .invalidURL:
            return .invalidURL
        case .responseSerializationFailed:
            return .decodingFailed
        default:
            return .unknown
        }
    }
}

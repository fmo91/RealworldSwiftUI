//
//  NetworkClient.swift
//  RealworldSwiftUI
//
//  Created by Fernando Ortiz on 21/11/2022.
//

import Foundation

protocol NetworkClientType {
    func perform<R: RequestType>(request: R) async throws -> R.ResponseType
}

final class NetworkClient: NetworkClientType {
    let baseURL: String
    let session: URLSession
    
    init(baseURL: String, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func perform<R: RequestType>(request: R) async throws -> R.ResponseType {
        let urlRequest = try request.urlRequest(for: baseURL)
        let (data, _) = try await session.data(for: urlRequest)
        let decoder = JSONDecoder()
        return try decoder.decode(R.ResponseType.self, from: data)
    }
}

struct Request<ResponseType: Decodable>: RequestType {
    let path: String
    let method: HTTPMethod
    let body: [String : Any]?
    let headers: [String : String]
    
    init(
        path: String,
        method: HTTPMethod = .get,
        body: [String : Any]? = nil,
        headers: [String : String] = [:]
    ) {
        self.path = path
        self.method = method
        self.body = body
        self.headers = headers
    }
}

protocol RequestType {
    associatedtype ResponseType: Decodable
    
    var path: String { get }
    var method: HTTPMethod { get }
    var body: [String: Any]? { get }
    var headers: [String: String] { get }
}

enum RequestTypeError: Error {
    case invalidURL
}

extension RequestType {
    func urlRequest(for baseURL: String) throws -> URLRequest {
        guard let url = URL(string: "\(baseURL)\(path)") else {
            throw RequestTypeError.invalidURL
        }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        if let body = body {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        }
        return request
    }
}

enum HTTPMethod: String {
    case `get` = "GET"
    case post = "POST"
    case delete = "DELETE"
}

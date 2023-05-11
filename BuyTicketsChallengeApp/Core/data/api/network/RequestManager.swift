//
//  RequestManager.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 09/05/2023.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}


final class RequestManager: RequestManagerProtocol {
    
    static let shared = RequestManager()
    
    let apiManager: APIManagerProtocol
    let parser: DataParserProtocol
    
    init(
        apiManager: APIManagerProtocol = APIManager(),
        parser: DataParserProtocol = DataParser()
    ) {
        self.apiManager = apiManager
        self.parser = parser
    }
    
    func requestAccessToken() async throws -> String {
        return APIConstants.authToken
    }
    
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let authToken = try await requestAccessToken()
        let data = try await apiManager.perform(request, authToken: authToken)
//        print(String(decoding: data, as: UTF8.self))
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}

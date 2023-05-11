//
//  DataCoder.swift
//  BuyTicketsChallengeApp
//
//  Created by Alexey Lisov on 11/05/2023.
//

import Foundation

protocol DataCoderProtocol {
    func decode<T: Decodable>(data: Data) throws -> T
    func encode<T: Encodable>(value: T) throws -> Data
}

class DataCoder: DataCoderProtocol {
    private var jsonDecoder: JSONDecoder
    private var jsonEncoder: JSONEncoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder(),
         jsonEncoder: JSONEncoder = JSONEncoder()) {
        self.jsonDecoder = jsonDecoder
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        self.jsonDecoder.dateDecodingStrategy = .iso8601
        
        self.jsonEncoder = jsonEncoder
        self.jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        self.jsonEncoder.dateEncodingStrategy = .iso8601
        
    }
    
    func decode<T: Decodable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
    
    func encode<T: Encodable>(value: T) throws -> Data {
        return try jsonEncoder.encode(value)
    }
}

//
//  APIManagerMock.swift
//  BuyTicketsChallengeAppTests
//
//  Created by Alexey Lisov on 09/05/2023.
//

import XCTest
@testable import BuyTicketsChallengeApp

struct APIManagerMock: APIManagerProtocol {
    func perform(_ request: RequestProtocol, authToken: String) async throws -> Data {
        return try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
    }
}

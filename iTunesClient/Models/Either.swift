//
//  Either.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 4/26/20.
//  Copyright © 2020 Samuel Yanez. All rights reserved.
//

import Foundation

enum Either<T, U>: Decodable where T: Decodable, U: Decodable {
    case left(T)
    case right(U)
}

extension Either {
    init(from decoder: Decoder) throws {
        if let value = try? T(from: decoder) {
            self = .left(value)
        }
        else if let value = try? U(from: decoder) {
            self = .right(value)
        } else {
            let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription:"Cannot decode \(T.self) or \(U.self)")
            throw DecodingError.dataCorrupted(context)
        }
    }
}

extension Either {
    struct Response: Decodable {
        var count: Int
        var results: [Either]
        
        private enum CodingKeys: String, CodingKey {
            case count = "resultCount"
            case results
        }
    }
}

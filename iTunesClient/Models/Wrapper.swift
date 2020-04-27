//
//  Wrapper.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 4/26/20.
//  Copyright © 2020 Samuel Yanez. All rights reserved.
//

import Foundation

enum Wrapper<T, U>: Decodable where T: Decodable, U: Decodable {
    case left(T)
    case right(U)
    case other
}

extension Wrapper {
    init(from decoder: Decoder) throws {
        if let value = try? T(from: decoder) {
            self = .left(value)
        }
        else if let value = try? U(from: decoder) {
            self = .right(value)
        } else {
            self = .other
        }
    }
}

extension Wrapper {
    struct Response: Decodable {
        var count: Int
        var results: [Wrapper]
        
        private enum CodingKeys: String, CodingKey {
            case count = "resultCount"
            case results
        }
    }
}

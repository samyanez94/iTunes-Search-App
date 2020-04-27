//
//  Explicitness.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 4/27/20.
//  Copyright © 2020 Samuel Yanez. All rights reserved.
//

import Foundation

public enum Explicitness: String, Decodable {
    case explicit
    case cleaned
    case notExplicit
}

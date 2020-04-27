//
//  APIError.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 4/26/20.
//  Copyright © 2020 Samuel Yanez. All rights reserved.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonParsingError
}

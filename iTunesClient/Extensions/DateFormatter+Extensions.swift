//
//  DateFormatter+Extensions.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 4/27/20.
//  Copyright © 2020 Samuel Yanez. All rights reserved.
//

import Foundation

extension DateFormatter {
    convenience init(with locale: Locale = .current, format dateFormat: String) {
        self.init()
        self.locale = locale
        self.dateFormat = dateFormat
    }
}

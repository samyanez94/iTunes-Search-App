//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/19/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    
    let downloadQueue = OperationQueue()
}

//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by Dan on 05/12/2018.
//  Copyright © 2018 Daniil. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    
    let downloadQueue = OperationQueue()
}

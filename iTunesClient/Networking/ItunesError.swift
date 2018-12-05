//
//  ItunesError.swift
//  iTunesClient
//
//  Created by Dan on 03/12/2018.
//  Copyright © 2018 Daniil. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}

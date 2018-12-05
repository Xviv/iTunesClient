//
//  QueryItemProvider.swift
//  iTunesClient
//
//  Created by Dan on 03/12/2018.
//  Copyright © 2018 Daniil. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}

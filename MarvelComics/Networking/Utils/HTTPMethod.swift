//
//  HTTPMethod.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

/// Enum that models the different HTTP request methods
/// Note: This is only a subset of the available methods for demo purposes
enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

//
//  APIError.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

enum APIError: LocalizedError {
    
    case malformedURL
    case invalidData
    case networkError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidData:
            return "Failed to receive raw data from the network."
        case .malformedURL:
           return "URL is invalid or malformed."
        case .networkError(let errorDescription):
            return errorDescription
        }
    }
}

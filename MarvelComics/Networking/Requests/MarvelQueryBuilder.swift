//
//  MarvelQueryBuilder.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/8/22.
//

import Foundation

/// Generates query items for Marvel API Requests
struct MarvelQueryBuilder {
    
    // MARK: - Query Keys
    
    private enum AuthKey: String {
        case apiKey = "apikey"
        case timestamp = "ts"
        case hash
    }
    
    private enum SortKey: String {
        case orderBy
        case title
    }
    
    // MARK: - Public API
    
    static func buildSortByTitleQuery(_ pagination: Pagination) -> [URLQueryItem] {
        return authParams + pagination.queryItems + sortByTitleParams
    }
}

// MARK: - Private Properties

private extension MarvelQueryBuilder {
    
    static var authParams: [URLQueryItem] {
        let timeString = String(Date().timeIntervalSince1970)
        let authString = timeString + MarvelSecrets.privateKey + MarvelSecrets.publickKey
        let authItems = [
            URLQueryItem(name: AuthKey.apiKey.rawValue, value: MarvelSecrets.publickKey),
            URLQueryItem(name: AuthKey.timestamp.rawValue, value: timeString),
            URLQueryItem(name: AuthKey.hash.rawValue, value: authString.MD5())
        ]
        
        return authItems
    }
    
    static var sortByTitleParams: [URLQueryItem] {
        return [
            URLQueryItem(name: SortKey.orderBy.rawValue, value: SortKey.title.rawValue)
        ]
    }
}

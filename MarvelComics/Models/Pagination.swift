//
//  Pagination.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

/// Wrapper around the information needed to make paged API requests
struct Pagination {
    
    // MARK: - Constants
    
    enum Constants {
        static let startOffset = 0
        static let defaultLimit = 20
    }
    
    // MARK: - Properties
    
    let limit: Int
    var offset: Int
    var isPaging: Bool = false
    
    // MARK: - Initializers
    
    init(limit: Int = Constants.defaultLimit, offset: Int = Constants.startOffset) {
        self.limit = limit
        self.offset = offset
    }
    
    // MARK: - Methods
    
    mutating func incrementPage() {
        offset += limit
    }
}

// MARK: - Utilities

extension Pagination {
    
    private enum PaginationKey: String {
        case limit
        case offset
    }
    
    var queryItems: [URLQueryItem] {
        return [
            URLQueryItem(name: PaginationKey.limit.rawValue, value: "\(limit)"),
            URLQueryItem(name: PaginationKey.offset.rawValue, value: "\(offset)")
        ]
    }
}

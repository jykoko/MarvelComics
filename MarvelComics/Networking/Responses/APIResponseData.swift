//
//  APIResponseData.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/5/22.
//

import Foundation

struct APIResponseData<T: Codable>: Codable {
    
    // MARK: - Properties
    
    var offset: Int
    var limit: Int
    var count: Int
    var results: [T]
    
    // MARK: - CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case count
        case results
    }
}

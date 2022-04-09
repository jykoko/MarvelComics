//
//  APIResponse.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    
    // MARK: - Properties

    var code: Int
    var status: String
    var data: APIResponseData<T>
    
    // MARK: - CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case code
        case status
        case data
    }
}

//
//  Comic.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

/// Represents a comic that's returned from the Marvel API
struct Comic: Codable {
    
    // MARK: - Properties
    
    let id: Int?
    let title: String?
    let description: String?
    let thumbnail: ThumbnailResource?
    
    // MARK: - CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case thumbnail
    }
}

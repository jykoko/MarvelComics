//
//  ThumbnailResource.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

/// Represents an image resource that's returned from the Marvel API
struct ThumbnailResource: Codable {
    
    // MARK: - Photo Sizes
    
    enum PortraitPhotoSize: String {
        case portraitSmall = "portrait_small"           // 50x75px
        case portraitMedium = "portrait_medium"         // 100x150px
        case portraitXLarge = "portrait_xlarge"         // 150x225px
        case portraitFantastic = "portrait_fantastic"   // 168x252px
        case portraitUncanny = "portrait_uncanny"       // 216x324px
        case portraitIncredible = "portrait_incredible" // 300x450px
    }
    
    // MARK: - Properties
    
    private let path: String
    private let extensionType: String
    
    // MARK: - CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case path
        case extensionType = "extension"
    }
}

// MARK: - Utilities

extension ThumbnailResource {
    /// Build out the formatted image path as specified in the Marvel API docs
    func formattedUrlPath(for size: PortraitPhotoSize = .portraitSmall) -> String? {
        let formattedPath = path + "/\(size.rawValue)" + ".\(extensionType)"
        return formattedPath
    }
}

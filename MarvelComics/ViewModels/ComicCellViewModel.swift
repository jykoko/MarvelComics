//
//  ComicCellViewModel.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/5/22.
//

import Foundation

struct ComicCellViewModel {
    
    // MARK: - Public Properties
    
    var highResImgPath: String? {
        let thumbnail = comic.thumbnail
        let thumbnailPath = thumbnail?.formattedUrlPath(for: .portraitFantastic)
        return thumbnailPath
    }
    
    var lowResImgPath: String? {
        let thumbnail = comic.thumbnail
        let thumbnailPath = thumbnail?.formattedUrlPath(for: .portraitMedium)
        return thumbnailPath
    }
    
    var title: String {
        return comic.title ?? "Unknown"
    }
    
    // MARK: - Private Properties
    
    private let comic: Comic
    
    // MARK: - Initializers
    
    init(_ comic: Comic) {
        self.comic = comic
    }
}

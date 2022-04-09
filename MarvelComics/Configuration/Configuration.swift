//
//  Configuration.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

/// A wrapper that contains configuration information related to the Marvel API service
enum MarvelSecrets {
    // This is a very simple approach for demo purposes but there are better ways to store/load secret keys..
    // Using this approach, the keys would be accessible from the compiled executable using a reverse engineering tool
    static let privateKey = "Add-Your-Private-API-Key"
    static let publickKey = "Add-Your-Public-API-Key"
}

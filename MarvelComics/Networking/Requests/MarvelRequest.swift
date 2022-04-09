//
//  MarvelRequest.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/5/22.
//

import Foundation

final class MarvelRequest: APIRequest {
    
    // MARK: - Routes
    
    enum Route: String {
        case comics = "comics"
        case characters = "characters"
        case creators = "creators"
    }
    
    // MARK: - Endpoints
    
    private enum Endpoint {
        // Note: I'm only force unwrapping here because we know it's a valid url
        static let baseV1Url = URL(string: "https://gateway.marvel.com:443/v1/public")!
    }
    
    // MARK: - Initializers
    
    convenience init(route: Route, method: HTTPMethod, queryItems: [URLQueryItem]?) {
        self.init(
            url: Endpoint.baseV1Url,
            path: route.rawValue,
            method: method,
            queryItems: queryItems
        )
    }
}

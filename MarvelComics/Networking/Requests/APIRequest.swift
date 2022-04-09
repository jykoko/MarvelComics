//
//  APIRequest.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

/// A light weight type that contains the information needed to make network requests
/// This is a simplified version, we could add additional info here such as bodyData for POST requests, etc..
class APIRequest {
    
    // MARK: - Properties
    
    private let url: URL
    private let path: String
    private let method: HTTPMethod
    private let queryItems: [URLQueryItem]?
    
    // MARK: - Initializers
    
    init(url: URL, path: String, method: HTTPMethod, queryItems: [URLQueryItem]? = nil) {
        self.url = url
        self.path = path
        self.method = method
        self.queryItems = queryItems
    }
}

// MARK: - Utilities

extension APIRequest {
    
    /// Utility function that converts an APIRequest into a URLRequest
    func buildURLRequest() -> URLRequest? {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }

        urlComponents.queryItems = queryItems
        guard let validURL = urlComponents.url?.appendingPathComponent(path) else {
            return nil
        }
        
        var request = URLRequest(url: validURL)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30
        
        return request
    }
}

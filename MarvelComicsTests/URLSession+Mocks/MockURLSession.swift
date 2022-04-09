//
//  MockURLSession.swift
//  MarvelComicsTests
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

/// A  mock URLSession used for testing purposes, to avoid hitting real endpoint
/// Mocking boilerplate from https://www.swiftbysundell.com/articles/mocking-in-swift/
class URLSessionMock: URLSession {
    
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    var data: Data?
    var error: Error?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let data = self.data
        let error = self.error

        return URLSessionDataTaskMock {
            completionHandler(data, nil, error)
        }
    }
}

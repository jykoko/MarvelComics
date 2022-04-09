//
//  MockDataTask.swift
//  MarvelComicsTests
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

/// A  mock URLSessionDataTask used for testing purposes, to avoid hitting real endpoint
/// Mocking boilerplate from https://www.swiftbysundell.com/articles/mocking-in-swift/
class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    // We override the 'resume' method and simply call our closure
    // instead of actually resuming any task.
    override func resume() {
        closure()
    }
}

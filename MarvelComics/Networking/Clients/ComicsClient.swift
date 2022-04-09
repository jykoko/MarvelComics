//
//  ComicsClient.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

/// A network client responsible for fetching Marvel comic data
struct ComicsClient: NetworkClient {
    
    // MARK: - Types
    
    typealias ComicsResponse = (Result<APIResponse<Comic>, Error>) -> Void
    
    // MARK: - Properties
    
    var session: URLSession
    
    // MARK: - Initializers
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    // MARK: - Public API
    
    func fetchComics(_ pagination: Pagination, completion: @escaping ComicsResponse) {
        let query = MarvelQueryBuilder.buildSortByTitleQuery(pagination)
        let comicsRequest = MarvelRequest(route: .comics, method: .get, queryItems: query)
        makeRequest(request: comicsRequest, completion: completion)
    }
}

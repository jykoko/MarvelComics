//
//  NetworkClient.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

protocol NetworkClient {
    
    // MARK: - Properties
    
    var session: URLSession { get }
    
    // MARK: - Methods
    
    init(session: URLSession)
    func makeRequest<T: Decodable>(request: APIRequest, completion: @escaping (Result<T, Error>) -> Void)
}

// MARK: - Default Implementations

extension NetworkClient {
    
    /// Fire off a network request and attempt to decode the response data
    /// - Parameter request: The APIRequest for the target endpoint
    /// - Parameter completion: The result block that returns decoded data or an error
    func makeRequest<T: Decodable>(request: APIRequest, completion: @escaping (Result<T, Error>) -> Void) {
        guard let request = request.buildURLRequest() else {
            completion(.failure(APIError.malformedURL))
            return
        }
        
        let task = session.dataTask(with: request) { data, _, error in
            do {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(APIError.invalidData))
                    return
                }
                
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let error {
                completion(.failure(APIError.networkError(error.localizedDescription)))
            }
        }
        
        task.resume()
    }
}

//
//  ComicListViewModel.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation

final class ComicListViewModel {
    
    // MARK: - Constants
    
    enum Constants {
        // Note: We'd want to localize these in a production app
        static let title = "Browse"
    }
    
    // MARK: - Properties
    
    private let comicsClient: ComicsClient
    private var pagination = Pagination()
    private var comics: [Comic] = []
    
    // MARK: - Initializers
    
    init(comicClient: ComicsClient) {
        self.comicsClient = comicClient
    }
    
    // MARK: - Data Loading
    
    func loadComics(loadNextPage: Bool = false, completion: @escaping (Error?) -> Void) {
        guard !pagination.isPaging else {
            completion(nil)
            return
        }
        
        pagination.isPaging = true
        if loadNextPage {
            pagination.incrementPage()
        }
        
        comicsClient.fetchComics(pagination) { [weak self] result in
            DispatchQueue.main.async {
                self?.pagination.isPaging = false
                
                switch result {
                case .success(let comicResponse):
                    self?.comics.append(contentsOf: comicResponse.data.results)
                    completion(nil)
                case .failure(let error):
                    print("Failed to load comics! Error: \(error.localizedDescription)")
                    completion(error)
                }
            }
        }
    }
    
    // MARK: - Data Accessors
    
    func numberItemsInSection() -> Int {
        return comics.count
    }
    
    func item(at index: Int) -> Comic? {
        guard index >= 0 && index < comics.count else {
            return nil
        }
        return comics[index]
    }
}

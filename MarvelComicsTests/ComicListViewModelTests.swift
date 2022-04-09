//
//  ComicListViewModelTests.swift
//  MarvelComicsTests
//
//  Created by Jacob Koko on 3/4/22.
//

import XCTest
@testable import MarvelComics

class ComicListViewModelTests: XCTestCase {
    
    // MARK: - Constants
    
    struct TestDataPath {
        static let comicsResponse = "MarvelComicsResponse"
    }
    
    // MARK: - Properties
    
    private var mockSession: URLSessionMock!
    private var networking: ComicsClient!
    private var viewModel: ComicListViewModel!

    // MARK: - Life Cycle

    override func setUpWithError() throws {
        mockSession = URLSessionMock()
        networking = ComicsClient(session: mockSession)
        viewModel = ComicListViewModel(comicClient: networking)
    }
    
    // MARK: - Tests
    
    func testComicFetchSuccess() throws {
        mockSession.data = loadJSON(filePath: TestDataPath.comicsResponse)

        let exp = expectation(description: "Loading comics")
        viewModel.loadComics { _ in
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 3)
        
        // Check numberItemsInSection()
        XCTAssertEqual(viewModel.numberItemsInSection(), 20, "We should have loaded exactly 20 comics.")
        
        // Validate that we're parsing out the comics correctly
        let firstComic = viewModel.item(at: 0)
        XCTAssertTrue(firstComic?.title ==  "Deadpool (2019) #10")
        XCTAssertNotNil(firstComic?.description)
        XCTAssertNotNil(firstComic?.thumbnail)
        
        let lastComic = viewModel.item(at: 19)
        XCTAssertTrue(lastComic?.title ==  "Deadpool (2019) #1 (Variant)")
        XCTAssertNotNil(lastComic?.thumbnail)
    }
    
    func testComicFetchFailure() throws {
        mockSession.error = APIError.invalidData
        mockSession.data = nil

        let exp = expectation(description: "Loading comics")
        viewModel.loadComics { _ in
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 3)
        XCTAssertTrue(viewModel.numberItemsInSection() == 0)
        XCTAssertTrue(viewModel.item(at: 0) == nil)
    }
    
    func testInvalidIndex() throws {
        XCTAssertNil(viewModel.item(at: -1))
        XCTAssertNil(viewModel.item(at: 20))
        XCTAssertNil(viewModel.item(at: 100))
    }
}

// MARK: - Utilities

extension XCTestCase {
    
    /// Utility function to load our mock testing data for unit tests
    func loadJSON(filePath: String) -> Data {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: filePath, ofType: "json") else {
            fatalError("\(filePath).json not found")
        }

        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert \(filePath).json to String")
        }
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert \(filePath).json to Data")
        }
        
        return jsonData
    }
}

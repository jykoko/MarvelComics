//
//  ComicListViewController.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import UIKit

class ComicListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private let viewModel: ComicListViewModel
    
    // MARK: - Initializers
    
    init(with viewModel: ComicListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ComicListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionViewCells()
        loadComics()
    }
    
    // MARK: - View Configuration
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = ComicListViewModel.Constants.title
    }
    
    private func setupCollectionViewCells() {
        collectionView.register(UINib(nibName: ComicCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ComicCollectionViewCell.reuseIdentifier)
    }
    
    // MARK: - Data Population
    
    private func loadComics(loadNextPage: Bool = false) {
        showSpinner()
        viewModel.loadComics(loadNextPage: loadNextPage) { [weak self] networkError in
            self?.hideSpinner()
            if let networkError = networkError {
                self?.showAlert(title: "Network Error", message: networkError.localizedDescription)
            } else {
                self?.collectionView.reloadData()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource + UICollectionViewDelegate

extension ComicListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let comicCell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicCollectionViewCell.reuseIdentifier, for: indexPath) as? ComicCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let comic = viewModel.item(at: indexPath.row) {
            let cellViewModel = ComicCellViewModel(comic)
            comicCell.configure(with: cellViewModel)
        }
        
        return comicCell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // When we reach the end of our list, load more items
        if indexPath.row == viewModel.numberItemsInSection() - 1 {
            loadComics(loadNextPage: true)
        }
    }
}

// MARK: - Loading Indicator

private extension ComicListViewController {
    
    func showSpinner() {
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideSpinner() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}

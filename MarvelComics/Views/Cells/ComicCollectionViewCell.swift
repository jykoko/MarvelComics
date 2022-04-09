//
//  ComicCollectionViewCell.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/5/22.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    enum LayoutConstants {
        static let desiredSize = CGSize(width: 152, height: 244)
    }
    
    private enum Images {
        static let placeholder = UIImage(named: "placeholder")
    }
    
    // MARK: - IBOutlets

    @IBOutlet private var comicImageView: UIImageView!
    @IBOutlet private var comicTitleLabel: UILabel!
    
    // MARK: - Properties
    
    private var imageTask: URLSessionDataTask?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageTask?.cancel() // cancel image task if needed
    }
    
    // MARK: - View Configuration
    
    func configure(with viewModel: ComicCellViewModel) {
        imageTask = comicImageView.loadImage(
            imagePath: viewModel.highResImgPath,
            placeholder: Images.placeholder
        )
        comicTitleLabel.text = viewModel.title
    }
}

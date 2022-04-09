//
//  UIImageView+Cache.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import UIKit.UIImageView

/// The backing cache for images
/// NOTE: Using NSCache here because it provides some key benefits out of the box, such as memory/threading enhancements
let cache = NSCache<NSString, UIImage>()

/// An ImageView extension that provides a convenient API for async image loading/caching
extension UIImageView {
    
    /// Loads an image asynchronously from the provided url path. If we have a cached version available, we'll return that instead of hitting the network again.
    ///
    /// - Parameter imagePath: url path of the image to load
    /// - Parameter placeHolder: image to render while async operation loads
    /// - Returns: The image request's URLSessionDataTask
    func loadImage(imagePath: String?, placeholder: UIImage? = nil) -> URLSessionDataTask? {
        // If we have the image cached already, return it
        if  let imagePath = imagePath,
            let cachedImage = cache.object(forKey: NSString(string: imagePath)) {
            image = cachedImage
            return nil
        }
    
        // Otherwise, set placeholder and proceed to try and fetch/cache the image
        image = placeholder
        guard let imagePath = imagePath,
              let imageURL = URL(string: imagePath) else { return nil }
        
        let task = URLSession.shared.dataTask(with: imageURL) { [weak self] data, _, _ in
            DispatchQueue.main.async {
                if let imageData = data, let image = UIImage(data: imageData) {
                    cache.setObject(image, forKey: NSString(string: imagePath))
                    self?.image = image
                }
            }
        }
        task.resume()
        
        return task
    }
}

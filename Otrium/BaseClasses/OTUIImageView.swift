//
//  OTUIImageView.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTUIImageView: UIImageView {
    let imageCache = NSCache<NSString, AnyObject>()
    
    /// Loads images from cache if exists ro loads from internet
    /// - Parameter urlString: the url to fetch image from
    func loadImageUsingCache(withUrl urlString : String?) {
        guard urlString != nil else {
            return
        }

        let url = URL(string: urlString!)
        image = nil

        if let cachedImage = imageCache.object(forKey: urlString! as NSString) as? UIImage {
            image = cachedImage
            return
        }

        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    self.imageCache.setObject(image, forKey: urlString! as NSString)
                    self.image = image
                }
            }

        }).resume()
    }
}

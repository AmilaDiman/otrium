//
//  OTUIImageView.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTUIImageView: UIImageView {
    let imageCache = NSCache<NSString, AnyObject>()

    func loadImageUsingCache(withUrl urlString : String?) {
        guard urlString != nil else {
            return
        }

        let url = URL(string: urlString!)
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as! NSString) as? UIImage {
            self.image = cachedImage
            return
        }

        // if not, download image from url
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

//
//  Extensions.swift
//  MarvelList
//
//  Created by Daniel Silva on 9/15/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

extension UIImageView {
    func download(image url: String) {
        guard let imageURL = URL(string:url) else {
            return
        }
        self.kf.setImage(with: ImageResource(downloadURL: imageURL))
    }
}

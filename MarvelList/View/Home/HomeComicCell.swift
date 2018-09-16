//
//  HomeComicCell.swift
//  MarvelList
//
//  Created by Daniel Silva on 9/15/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//

import UIKit

class HomeComicCell: UICollectionViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var thumbIV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ item: Comic){
        titleLbl.text = item.title
        releaseDateLbl.text = "Release date: \(item.getReleaseDate())"
        if let url = item.thumbnail?.getUrl() {
            thumbIV.download(image: url)
        }
    }
}


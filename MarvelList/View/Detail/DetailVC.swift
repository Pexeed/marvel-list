//
//  DetailVC.swift
//  MarvelList
//
//  Created by Daniel Silva on 9/14/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//

import UIKit
import RealmSwift

class DetailVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView : UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var coverIV: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var charactersLbl: UILabel!
    @IBOutlet weak var creatorsLbl: UILabel!
    var favoriteBt : UIBarButtonItem!

    var item: Comic!
    var isFavorite: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularTela()
        updateUI()
    }
    
    func popularTela() {
        DispatchQueue.main.async {
            self.titleLbl.text = self.item.title
            if let url = self.item.thumbnail?.getUrl(){
                self.coverIV.download(image: url)
            }
            self.priceLbl.text = self.item.getPrintPrice()
            self.dateLbl.text = self.item.getReleaseDate()
            self.descriptionLbl.text = self.item.desc
            self.charactersLbl.text = self.item.getCharacters()
            self.creatorsLbl.text = self.item.getCreators()
        }
    }
    
    func updateUI() {
        title = "Marvel Comics"
        adjustScrollViewHeight()
        setFavoriteBt()
    }
    
    func adjustScrollViewHeight(){
        scrollView.layoutIfNeeded()
    }
    
    func setFavoriteBt() {
        favoriteBt = UIBarButtonItem(image: UIImage(named: "star"), style: .plain, target: self, action: #selector(favoritePressed))
        self.navigationItem.rightBarButtonItem = favoriteBt
        
        let realm = try! Realm()
        if let itemDB = realm.object(ofType: Comic.self, forPrimaryKey: item.id) {
            item = itemDB
            favoriteBt.image = UIImage(named: "selected-star")
            isFavorite = true
        }
    }
    
    @objc func favoritePressed() {
        let realm = try! Realm()
        if isFavorite {
            
            try! realm.write {
                realm.delete(item)
            }
            favoriteBt.image = UIImage(named: "star")
            isFavorite = false
        }else {
            try! realm.write {
                realm.add(item)
            }
            favoriteBt.image = UIImage(named: "selected-star")
            isFavorite = true
        }
    }
}

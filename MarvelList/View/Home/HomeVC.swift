//
//  ViewController.swift
//  MarvelList
//
//  Created by Daniel Silva on 9/14/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//

import UIKit
import Alamofire

class HomeVC: BaseVC
{
    
    let viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loading.startAnimating()
        viewModel.popularLista() { (objeto, result) -> () in
            self.loading.stopAnimating()
            if result {
                self.collectionView.reloadData()
            } else {
                let errorMsg = objeto as! String
                self.msgErro(errorMsg)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            return viewModel.filteredList!.count
        }
        return viewModel.list.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "HomeComicCell"
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? HomeComicCell {
            
            let item: Comic!

            if inSearchMode {
                item = viewModel.filteredList![indexPath.row]
            } else {
                item = viewModel.list[indexPath.row]
            }
            
            cell.configureCell(item)
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item: Comic!
        
        if inSearchMode {
            item = viewModel.filteredList![indexPath.row]
        } else {
            item = viewModel.list[indexPath.row]
        }
        
        let detalhe = DetailVC()
        detalhe.item = item
        self.navigationController?.pushViewController(detalhe, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            collectionView.reloadData()
        } else {
            inSearchMode = true
            viewModel.filterList(text: searchBar.text!.lowercased())
            collectionView.reloadData()
        }
    }
    
}

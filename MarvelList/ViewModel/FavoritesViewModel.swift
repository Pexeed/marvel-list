//
//  FavoritesViewModel.swift
//  MarvelList
//
//  Created by Daniel Silva on 9/16/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//

import Foundation
import RealmSwift

class FavoritesViewModel {
    
    var list: [Comic]
    var filteredList: [Comic]?
    
    init() {
        list = [Comic]()
    }
    
    func popularLista(_ completed: @escaping Callback){
        
        let realm = try! Realm()
        let comics = realm.objects(Comic.self)
        list.removeAll()
        list.append(contentsOf: comics)
        completed()
    }
    
    func filterList(text: String) {
        filteredList = list.filter({$0.title!.lowercased().range(of: text) != nil})
    }
    
}

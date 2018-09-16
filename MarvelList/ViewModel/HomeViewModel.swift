//
//  HomeViewModel.swift
//  MarvelList
//
//  Created by Daniel Silva on 9/14/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class HomeViewModel {
    
    var list: [Comic]
    var filteredList: [Comic]?
    
    init() {
        list = [Comic]()
    }
    
    func popularLista(_ completed: @escaping ConsultaComplete){
        requisitarLista() { [weak self] (objeto, result) -> ()  in
            if result {
                let marvelResponse = objeto as! MarvelResponse
                self?.list.removeAll()
                self?.list.append(contentsOf: marvelResponse.data.results)
                completed(true as AnyObject, true)
            } else {
                completed(objeto, false)
            }
        }
    }
    
    func requisitarLista(_ completed: @escaping ConsultaComplete){
        let url = URL(string: "\(MARVEL_API_URL)")!
        
        let params = [
            "formatType": "comic",
            "orderBy": "-focDate",
            "limit": 50,
            "apikey": MARVEL_API_PUBLIC_KEY,
            "ts": MARVEL_API_TIMESTAMP,
            "hash": MARVEL_API_HASH
            ] as [String : Any]
        
        SessionManager.default.request(url, method: .get, parameters: params)
            .responseObject { (response: DataResponse<MarvelResponse>) in
            
            if let error = response.result.error{
                completed(error.localizedDescription as AnyObject, false)
            }else{
                let lista = response.result.value
                completed(lista! as AnyObject, true)
            }
        }
    }
    
    func filterList(text: String) {
        filteredList = list.filter({$0.title!.lowercased().range(of: text) != nil})
    }
    
}

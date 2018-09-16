//
//  MarvelResponse.swift
//  MarvelList
//
//  Created by Daniel Silva on 9/15/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class MarvelResponse: Mappable {
    
    var code: Int!
    var status: String!
    var data: MarvelDataResponse!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.code <- map["code"]
        self.status <- map["status"]
        self.data <- map["data"]
    }
}

class MarvelDataResponse: Mappable {
    
    var offset: Int!
    var limit: Int!
    var total: Int!
    var count: Int!
    var results: [Comic]!
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        self.offset <- map["offset"]
        self.limit <- map["limit"]
        self.total <- map["total"]
        self.count <- map["count"]
        self.results <- map["results"]
    }
}

class MarvelDate: GenericModel {
    @objc dynamic var type: String = ""
    @objc dynamic var date: String = ""
    
    override func mapping(map: Map) {
        self.type <- map["type"]
        self.date <- map["date"]
    }
}

class MarvelPrice: GenericModel {
    @objc dynamic var type: String = ""
    @objc dynamic var price: NSNumber = 0.0
    
    override func mapping(map: Map) {
        self.type <- map["type"]
        self.price <- map["price"]
    }
}

class MarvelImage: GenericModel {
    @objc dynamic var path: String = ""
    @objc dynamic var ext: String = ""
    
    override func mapping(map: Map) {
        self.path <- map["path"]
        self.ext <- map["extension"]
    }
    
    func getUrl() -> String{
        return "\(path).\(ext)"
    }
}

class MarvelContainer: GenericModel {
    @objc dynamic var available: NSNumber = 0
    let items = List<MarvelItem>()
    
    override func mapping(map: Map) {
        self.available <- map["available"]
        var mapItems: [MarvelItem] = []
        mapItems <- map["items"]
        items.append(objectsIn: mapItems)
    }
}

class MarvelItem: GenericModel {
    @objc dynamic var name: String = ""
    
    override func mapping(map: Map) {
        self.name <- map["name"]
    }
}

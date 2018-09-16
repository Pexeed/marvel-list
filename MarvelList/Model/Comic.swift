//
//  Comic.Swift
//  MarvelList
//
//  Created by Daniel Silva on 9/14/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Comic: GenericModel {
    
    @objc dynamic var id: NSNumber = 999
    @objc dynamic public var title: String?
    @objc dynamic public var desc: String?
    let dates:List<MarvelDate>? = List<MarvelDate>()
    let prices:List<MarvelPrice>? = List<MarvelPrice>()
    @objc dynamic public var thumbnail: MarvelImage?
    @objc dynamic var creators: MarvelContainer? = MarvelContainer()
    @objc dynamic var characters: MarvelContainer? = MarvelContainer()
    @objc dynamic var favorite: Bool = false
    
    override func mapping(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.desc <- map["description"]
        var mapDates: [MarvelDate] = []
        mapDates <- map["dates"]
        dates?.append(objectsIn: mapDates)
        var mapPrices: [MarvelPrice] = []
        mapPrices <- map["prices"]
        prices?.append(objectsIn: mapPrices)
        self.thumbnail <- map["thumbnail"]
        self.creators <- map["creators"]
        self.characters <- map["characters"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    public func getReleaseDate() -> String {
        if dates!.count > 0 {
            for date in dates! {
                if date.type == "focDate"{
                    let df = DateFormatter(withFormat: "yyyy-MM-dd'T'HH:mm:ss-SSSS", locale: NSLocale.current.languageCode!)
                    if let localizedDate = df.date(from: date.date) {
                        df.dateStyle = .medium
                        df.timeStyle = .none
                        
                        return df.string(from: localizedDate)
                    } else{
                        return ""
                    }
                }
            }
        }
        return ""
    }
    
    public func getPrintPrice() -> String {
        if prices!.count > 0 {
            for price in prices! {
                if price.type == "printPrice" {
                    return String(format: "$%.02f", price.price)
                }
            }
        }
        return "-"
    }
    
    public func getCharacters() -> String {
        var heroesString = ""
        var i = 0
        for hero in characters!.items {
            heroesString.append(hero.name)
            i = i+1
            if i != characters!.items.count{
                heroesString.append(", ")
            }
        }
        return heroesString
    }
    
    public func getCreators() -> String {
        var creatorsString = ""
        var i = 0
        for creator in creators!.items {
            creatorsString.append(creator.name)
            i = i+1
            if i != creators!.items.count{
                creatorsString.append(", ")
            }
        }
        return creatorsString
    }
}

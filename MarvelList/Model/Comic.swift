//
//  Comic.Swift
//  MarvelList
//
//  Created by Daniel Silva on 9/14/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//

import Foundation
import ObjectMapper

class Comic: Object, Mappable {
    
    @objc dynamic var name: String
    
    required init?(map: Map) {
        <#code#>
    }
    
    func mapping(map: Map) {
        <#code#>
    }
}

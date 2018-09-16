//
//  GenericModel.swift
//  MarvelList
//
//  Created by Daniel Silva on 9/16/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import Realm

public class GenericModel: Object, Mappable {
    
    public required init(map: Map) {
        super.init()
    }
    
    required public init() {
        super.init()
    }
    
    required public init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required public init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public override init(value: Any) {
        super.init(value: value)
    }
    
    public func mapping(map: Map) {
        
    }
    
}

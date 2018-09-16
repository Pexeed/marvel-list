//
//  Constants.swift
//  MarvelList
//
//  Created by Daniel Silva on 9/14/18.
//  Copyright © 2018 Daniel Silva. All rights reserved.
//
import CryptoSwift
import Foundation

let MARVEL_API_URL = "https://gateway.marvel.com/v1/public/comics"
let MARVEL_API_PUBLIC_KEY = "79920657e0f93726d462e0ce694b00b1"
let MARVEL_API_PRIVATE_KEY = "fbd2a50b16a6f4e62940207987214ee509f147b8"
let MARVEL_API_TIMESTAMP = Date().timeIntervalSince1970.description
let MARVEL_API_HASH = "\(MARVEL_API_TIMESTAMP)\(MARVEL_API_PRIVATE_KEY)\(MARVEL_API_PUBLIC_KEY)".md5()
typealias ConsultaComplete = ( _ objeto: AnyObject, _ result: Bool) -> ()
typealias Callback = () -> ()

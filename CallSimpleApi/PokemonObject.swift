//
//  PokemonObject.swift
//  CallSimpleApi
//
//  Created by Josue J Maqueda Flores on 6/1/19.
//  Copyright © 2019 Josue J Maqueda Flores. All rights reserved.
//

import Foundation
import ObjectMapper

struct PokemonObject:Mappable
{
    var count:Int?
    var next:String?
    var results:[Pokemon]?

    init?(map:Map) {}

    mutating func mapping(map: Map) {
        count <- map["count"]
        next <- map["next"]
        results <- map["results"]
    }
}


struct Pokemon:Mappable
{
    var name:String?
    var url:String?

    init?(map:Map) {}

    mutating func mapping(map: Map) {
        name <- map["name"]
        url <- map["url"]
    }
}


//MAPPING PokemonForm
struct PokemonForm:Mappable {
    var name:String?
    var order:Int?
    var is_mega:Bool?
    //
    init?(map:Map) {}

    mutating func mapping(map: Map) {
        name <- map["name"]
        order <- map["order"]
        is_mega <- map["is_mega"]
    }
}

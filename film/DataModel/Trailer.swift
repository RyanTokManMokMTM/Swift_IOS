//
//  Trailer.swift
//  film
//
//  Created by Jackson on 24/1/2021.
//

import Foundation

struct trailer:Identifiable,Hashable{
    var id = UUID().uuidString
    var name:String
    var videoURL:URL
    var CovorURL:URL
}

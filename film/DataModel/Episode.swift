//
//  Episode.swift
//  film
//
//  Created by Jackson on 23/1/2021.
//

import Foundation

struct Episode:Identifiable {
    var id =  UUID().uuidString
    var name:String
    var seasonNum:Int // which season
    var episodeNum:Int //which episode
    var videoIconURLStr:String
    var description:String
    var length:Int // IN MINS
    var videoURL:URL
    
    var IconURL:URL{
        return URL(string: videoIconURLStr)! //change str to url
    }
    
}

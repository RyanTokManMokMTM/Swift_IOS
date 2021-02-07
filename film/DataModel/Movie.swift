//
//  Movie.swift
//  film
//
//  Created by Jackson on 20/1/2021.
//

import Foundation
import SwiftUI

struct Movie:Identifiable{
    var id:String
    var name:String
    var imageURL:URL
    var movieCategory:[String]
    var genra:AllGenre = .AllGenre //if not set set Allgenra by default
    
    //preview
    var previewImg:String
    var previewURL:URL? //may be empty
    var accentColor:Color = Color.white //white color by defalut
    
    //Movie Detail
    var year:Int
    var rating:String
    var numberofseason:Int?
    
//    var movietype:String
    
    var trailers : [trailer] // at least one trailer for each one
    
    //user current episode
    var currentEpisodeInfo:episodeInfo?
    
    //user begin default Episode
    var defaultEpisodeInfo:episodeInfo
    var episode:[Episode]? //if movie there hasn't any episode
    var promoteHeadLine:String? //Show the headline in move detail,it might be empty
    
    
    var cast:String
    var creators:String
    
    var moreAndLike:[Movie]
    
    var movieType:HomeTopRow{
        return episode == nil ? .movie : .tvShow //movie have no episode,if nil must movies
    }
    
    var displaynumberofseason: String {
        // GET TOTAL Season that TV HAD
        if let num = numberofseason {
            if(num == 1){
                return "1 season"
            }
            else{
                return "\(num) season"
            }
        }
        
        return ""
    }
    
    //get current season and ep if not nil
    var currentEpInfo:String{
        if let ep = currentEpisodeInfo {
            return "S\(ep.season):E\(ep.episode) \(ep.episodeName)"
        }
        else{
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    //get ep decuription
    var currentEpDescurption:String{
        if let ep = currentEpisodeInfo {
            return ep.episodeDescription
        }
        else{
            return defaultEpisodeInfo.episodeDescription
        }
    }
}

struct episodeInfo:Hashable,Equatable{
    var episodeName:String
    var episodeDescription:String
    var season:Int
    var episode:Int
}



//
//  PreviewVideoPlayer.swift
//  film
//
//  Created by Jackson on 4/2/2021.
//

import SwiftUI
import VideoPlayer

struct PreviewVideoPlayer: View {
    var videoURL:URL?
    @Binding var isPlayer:Bool
    var body: some View {
        if videoURL != nil{
            VideoPlayer(url: videoURL!, play: $isPlayer)
        }
    }
}

struct PreviewVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PreviewVideoPlayer(videoURL: trailerURL, isPlayer: .constant(true))
        }
     
    }
}

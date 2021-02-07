//
//  VideoPlayer.swift
//  film
//
//  Created by Jackson on 24/1/2021.
//

import SwiftUI
import AVKit

struct SwiftUIVideoPlayerPriview: View {
    var videoURL:URL
    private var player:AVPlayer{
        AVPlayer(url: videoURL )
    }
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIVideoPlayerPriview(videoURL: trailerURL)
    }
}

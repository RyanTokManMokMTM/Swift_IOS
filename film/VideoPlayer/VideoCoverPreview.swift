//
//  VideoCoverPreview.swift
//  film
//
//  Created by Jackson on 24/1/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct VideoCoverPreview: View {
    var coverURL:URL
    var videoURL:URL
    @State var isPlay:Bool = false
    
    var body: some View {
        ZStack{
            KFImage(coverURL)
                .resizable()
                .aspectRatio(contentMode: .fit) //fill to full screen
                
            
            Button(action: {
                //TODO
                isPlay = true
            }){
                ZStack{
                    Image(systemName: "play.circle")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                }
            }
            .fullScreenCover(isPresented: self.$isPlay, content: {
                SwiftUIVideoPlayerPriview(videoURL: videoURL)
            })
//            .sheet(isPresented: self.$isPlay, content: {
//                SwiftUIVideoPlayerPriview(videoURL: videoURL)
//                //onpen the video player if is true
//            })
        }
    }
}

struct VideoCoverPreview_Previews: PreviewProvider {
    static var previews: some View {
        VideoCoverPreview(coverURL: trailerCoverURL2, videoURL: trailerURL)
    }
}

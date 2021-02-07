//
//  ComingSoonRow.swift
//  film
//
//  Created by Jackson on 2/2/2021.
//

import SwiftUI
import KingfisherSwiftUI
import AVKit

struct ComingSoonRow: View {
    
    var movie:Movie
    
    @Binding var MovieToShow:Movie? //for current movie info
    
    
    var avplayer:AVPlayer{
        return AVPlayer(url: URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!)
    }
    
    let screen = UIScreen.main.bounds
    var body: some View {
        VStack{
            VideoPlayer(player: avplayer)
                .frame(height:200)
            
            VStack {
                HStack{
                    KFImage(movie.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:screen.width / 3,height: 75)
                        .clipped()
                    Spacer()
                    
                    Button(action:{
                        //TODO remind
                    }){
                        VStack(spacing:6){
                            Image(systemName:"bell")
                                .font(.title3)
                            Text("Remind Me")
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    Button(action:{
                        //TODO
                        MovieToShow = movie
                    }){
                        VStack(spacing:6){
                            Image(systemName:"info.circle")
                                .font(.title2)
                            Text("Info")
                        }
                    }
                    .padding(.trailing,24)
                }
                .font(.caption)
                
                VStack(alignment:.leading){
                    Text(movie.name)
                        .font(.title2)
                        .bold()
                    
                    Text(movie.currentEpDescurption)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }

    }
}

struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ComingSoonRow(movie: test_movie, MovieToShow: .constant(nil))
        }

    }
}

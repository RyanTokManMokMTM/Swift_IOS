//
//  MovieTrailerList.swift
//  film
//
//  Created by Jackson on 24/1/2021.
//

import SwiftUI

struct MovieTrailerList: View {
    var movie_trailerList: [trailer]
    let video_frame = UIScreen.main.bounds.width
    
    var body: some View {
        VStack{
            ForEach(movie_trailerList) { trailers in
                
                VStack(alignment:.leading){
                    VideoCoverPreview(coverURL: trailers.CovorURL, videoURL: trailers.videoURL)
                        .frame(maxWidth:video_frame) // because .aspectRatio(contentMode: .fill is out side the width of screen and set frame to screent size
                        
                    Text(trailers.name)
                        .font(.headline)
                }
                .padding(.bottom,10)
                .foregroundColor(.white)
                
            }
        }

    }
}

struct MovieTrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            MovieTrailerList(movie_trailerList: examplettrailerList)
        }

    }
}

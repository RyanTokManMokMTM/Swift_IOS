//
//  MoviewPreview.swift
//  film
//
//  Created by Jackson on 4/2/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct MoviewPreview: View {
    var movies:[Movie]
    var body: some View {
        

            VStack(alignment:.leading){
                Text("Preview")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.leading,6)
                
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack{
                        ForEach(0..<movies.count){ movieIndex in //forEach always need a index if we need the index
                            let movie = movies[movieIndex]
                            
                            PreviewIcon(movie: movie)
                                .frame(width:120,height:120)
                                .padding(.leading,6)
                                .padding(.trailing,16)
                               
                        }
                        
                    }

                }
            }
        
        .frame(height:200) // set it not fixable -> coz only use one no need,otherwise not set here, give parent to set
    }
}

struct MoviewPreview_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            MoviewPreview(movies:toatal_movie )
        }
    }
}

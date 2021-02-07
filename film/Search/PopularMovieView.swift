//
//  PopularMovieView.swift
//  film
//
//  Created by Jackson on 1/2/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct PopularMovieView: View {
    var movie:Movie
    
    @Binding var MovieToShow:Movie?
    var body: some View {
        
        GeometryReader{ poxy in
            HStack{
                KFImage(movie.imageURL)
                    .resizable()
                    .frame(width:poxy.size.width/3)
                    .padding(.leading,3)
     
                
                Text(movie.name)
                
                Spacer()
                
                Button(action:{
                    
                }){
                    Image(systemName: "arrowtriangle.right.fill")
                }
                .padding(.trailing,20)
            }
            .foregroundColor(.white)
            .onTapGesture(perform: {
                self.MovieToShow = movie // if tag set it to move
            })
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            PopularMovieView(movie:test_movie,MovieToShow: .constant(nil))
                .frame(height:75)
        }
    }
}

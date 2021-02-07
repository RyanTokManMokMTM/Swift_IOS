//
//  SearchResultView.swift
//  film
//
//  Created by Jackson on 1/2/2021.
//

import SwiftUI
import KingfisherSwiftUI


struct SearchResultView: View { 
    var searchedMovied:[Movie] //a set to search the movie
    @Binding var MovieToShow:Movie?

    let  cols:[GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        LazyVGrid(columns: cols,spacing:10){
            ForEach(searchedMovied,id:\.id){movies in
                KFImage(movies.imageURL)
                    .resizable()
                    .frame(height:160)
                    .scaledToFit()
                    .onTapGesture(perform: {
                        MovieToShow = movies
                    })
                    
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(searchedMovied: generateMovies(20), MovieToShow: .constant(nil))
    }
}

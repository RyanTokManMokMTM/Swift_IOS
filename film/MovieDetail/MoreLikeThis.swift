//
//  MoreLikeThis.swift
//  film
//
//  Created by Jackson on 23/1/2021.
//

import SwiftUI


struct MoreLikeThis: View {
    var movie:[Movie]
    
    let Colums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {

            LazyVGrid(columns: Colums) {
                ForEach(0..<movie.count){ index in
                    StandardHomeViewRow(movie: movie[index])
                        .scaledToFill()
                }
        }
    }
}

struct MoreLikeThis_Previews: PreviewProvider {
    static var previews: some View {
        MoreLikeThis(movie: toatal_movie)
    }
}

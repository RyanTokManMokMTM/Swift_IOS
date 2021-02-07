//
//  StandardHomeViewRow.swift
//  film
//
//  Created by Jackson on 20/1/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct StandardHomeViewRow: View {
    var movie:Movie
    var body: some View {
        KFImage(movie.imageURL)
            .resizable()
            .scaledToFill()
            
    }
}

struct StandardHomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeViewRow(movie:test_movie)
    }
}

//
//  PreviewIcon.swift
//  film
//
//  Created by Jackson on 4/2/2021.
//

import SwiftUI
import KingfisherSwiftUI


struct PreviewIcon: View {
    var movie:Movie
    
    let Color:[Color] = [.red,.orange,.pink,.green,.purple,.yellow] //it may add to model data
    var body: some View {
        
        ZStack(alignment:.bottom){ //ZStack aligment accroding to the max frame Content
            VStack{
                KFImage(movie.imageURL)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.randomElement())
                    )
            }
            
            Image(movie.previewImg)
                .resizable()
                .scaledToFit()
                .offset(y:-20)
                .frame(height:65)
        }
    }
}

struct PreviewIcon_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PreviewIcon(movie: test_movie)
                .frame(width: 125, height: 125)
        }
        

    }
}

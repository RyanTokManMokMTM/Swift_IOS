//
//  HomeViewTop.swift
//  film
//
//  Created by Jackson on 21/1/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct HomeViewTop: View {
    var movie:Movie
    
    
    //check categort list
    func IsLastCategory(forCat cat:String)->Bool{
        let total_category = movie.movieCategory.count
        
        //firstIndex => find the index of spcified value
        if let index = movie.movieCategory.firstIndex(of: cat){
            if index + 1 != total_category{
                // if not the last one
                return false
            }
        }
        return true
    }
    
    var body: some View {
        ZStack{
            KFImage(movie.imageURL)
                .resizable()
                .scaledToFill() //fill all screen
                .clipped() //cut the image
            
            VStack(spacing:5){
                Spacer()
                HStack{
                    //Strting of category
                    ForEach(movie.movieCategory,id:\.self){ category in
                        Text(category)
                            .font(.footnote)
                            
                        
                        //if not the last category ->show circle
                        if !IsLastCategory(forCat: category){
                            Image(systemName: "circle.fill")
                                .font(.system(size: 3))
                                .foregroundColor(.blue)
                        }

                    }
                }
                
                HStack{
                    Spacer()
                    //button list
                    SmallVerticalButton(IsOnImage: "plus", IsOffImage: "checkmark", text: "My List", IsOn: true){
                        
                        print("Added")
                    }
                    
                    Spacer()
                    
                    PlayButton(text: "Play", Icon: "play.fill"){
                        print("button test")
                    }
                    .frame(width:120)
                    
                    Spacer()
                    SmallVerticalButton(IsOnImage: "info.circle", IsOffImage: "info.circlee", text: "Info", IsOn: true){
                        print("pressed")
                    }
                    
                    Spacer()
                }
                
            }
            .background(LinearGradient.BlackOpacityGradient)
            .padding(.top,250) // linear start at top of 200 px and 200=color(0%) to the bottom(95%)

        }
        .foregroundColor(.white)
    }
}

struct HomeViewTop_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewTop(movie: test_movie5)
    }
}



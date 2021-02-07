//
//  HomeStack.swift
//  film
//
//  Created by Jackson on 27/1/2021.
//

import Foundation
import SwiftUI

struct HomeStack: View {
    var movieList : HomeVM
    
    @Binding var ShowMovieDetail:Movie?
    var selectedGenra:AllGenre
    var HomeRow:HomeTopRow //only need the value to render
    
    var body: some View {
        
        ForEach(movieList.allcategory(), id:\.self){ cat in
            VStack{
                HStack{
                    Text(cat)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title3)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack{//when need send request and show ,within lazy(not load all at once)
                        ForEach(movieList.getCategoryList(forCat: cat,andHomeTab: HomeRow, andGenra: selectedGenra)){ movie in
                            StandardHomeViewRow(movie: movie)
                                .frame(width:100,height:200)
                                .padding(.horizontal,20)
                                .onTapGesture {
                                    ShowMovieDetail = movie
                                }
                        }
                    }
                }
            }
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                HomeStack(movieList: HomeVM(), ShowMovieDetail: .constant(nil), selectedGenra: .AllGenre, HomeRow: .home)
            }
        }
    }
}

//
//  CustomTabSwitcher.swift
//  film
//
//  Created by Jackson on 23/1/2021.
//

import SwiftUI

struct CustomTabSwitcher: View {
    var tabs:[CustomTab]
    var movie:Movie // movie show on current page
    @State private var currentTab:CustomTab = .episode
    
    @Binding var ISshowSeasonPicker:Bool
    @Binding var SeasonSelected:Int
    
    func widthofString(_ tab:CustomTab)->CGFloat{
        let current = tab.rawValue
        return current.widthofStr(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        ZStack{
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:20){
                        ForEach(tabs,id:\.self){ tab in
                            
                            VStack{
                                Rectangle()
                                    .frame(width:widthofString(tab),height:6)
                                    .foregroundColor(currentTab == tab ? Color.red : Color.clear)
                                    
                                    //if is the current tag is selected, set to org color and else clear the color
                                
                                Button(action:{
                                    withAnimation(.easeIn){
                                        currentTab = tab
                                    }
                                }){
                                    Text(tab.rawValue)
                                        .font(.system(size:16))
                                        .bold()
                                        .foregroundColor(currentTab == tab ? .white:.gray)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .frame(width:widthofString(tab),height:30)
                                
                            }


                        }
                    }
              
                }
                
                //when selected a tab show a correct info view
                switch currentTab{
                case .episode:
                    EpisodeView(epidsos: movie.episode ?? [], ISshowSeasonPicker: self.$ISshowSeasonPicker, SeasonSelected: self.$SeasonSelected)
                case .trailers:
                    MovieTrailerList(movie_trailerList: movie.trailers)
                        .aspectRatio(contentMode: .fill)
                case .more:
                    MoreLikeThis(movie: movie.moreAndLike)
                }
            }
        }
            
        .foregroundColor(.white)
    }
}

enum CustomTab :String{
    case episode = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            CustomTabSwitcher(tabs:[.episode,.trailers,.more],
                              movie: test_movie,ISshowSeasonPicker: .constant(false),SeasonSelected: .constant(Int(1.0)))
        }
     
    }
}

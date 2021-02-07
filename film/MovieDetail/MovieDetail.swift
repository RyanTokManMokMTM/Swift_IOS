//
//  MovieDetail.swift
//  film
//
//  Created by Jackson on 23/1/2021.
//

import SwiftUI

struct MovieDetail: View {
    var movie:Movie
    
    @State private var IsShowSeasonPicker:Bool = false
    @State private var SelectedSeason:Int = 1 //default season 1
    
    @Binding var MovieShow:Movie?
    
    
    var body: some View {
        let screen_width = UIScreen.main.bounds
        
        ZStack{
            Color
                .black
                .edgesIgnoringSafeArea(.all)
            
            ZStack{
                VStack{
                    HStack{
                        Spacer()
                        Button(action:{
                            
                            self.MovieShow = nil
                        }){
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 22))
                        }
                        .buttonStyle(PlainButtonStyle())

                    }
                    .padding(.horizontal,20)
                    Spacer()
                    
                    ScrollView(.vertical, showsIndicators: false){
                        StandardHomeViewRow(movie: movie)
                            .frame(width:screen_width.width/2.5,height: 300) //why not just set a fixed width?? ,it we change to an ipad,it still at fixed witdh!!,so it has to use screen with
                        MovieInfoSubHeadline(movie: movie)
                        
                        Text(movie.promoteHeadLine ?? "") // if move having promotion
                            .bold()
                            .font(.headline)
                        
                        PlayButton(text: "Play", Icon: "play.fill", buttonColor: .red){
                            //TODO
                        }
                        
                        CurrentEpisodeInfo(movie: movie)
     

                        CurrentCastCreatorsInfo(movie: movie)
                        
                        
                        HStack(spacing:60){
                            SmallVerticalButton(IsOnImage: "checkmark", IsOffImage: "plus", text: "My List", IsOn: true){
                                    //TODO
                            }
                            
                            SmallVerticalButton(IsOnImage: "hand.thumbsup.fill", IsOffImage: "hand.thumbsup", text: "Rate", IsOn: true){
                                    //TODO
                            }
                            
                            SmallVerticalButton(IsOnImage: "paperplane.fill", IsOffImage: "paperplane.fill", text: "Share", IsOn: true){
                                    //TODO
                            }
                            Spacer()
                        }
                        .padding(.leading,20)
                        
                        CustomTabSwitcher(tabs: [.episode,.trailers,.more], movie: movie, ISshowSeasonPicker: self.$IsShowSeasonPicker, SeasonSelected: self.$SelectedSeason)

                    }
                    .padding(.horizontal,10)
                }
                
                
                if(self.IsShowSeasonPicker){
                    
                    Group{
                        Color.black.opacity(0.9)
                            
                        
                        VStack(spacing:40){
                            Spacer()
                            ForEach(0..<(movie.numberofseason ?? 0)){season in
                                Button(action:{
                                    self.IsShowSeasonPicker = false // close the page
                                    self.SelectedSeason = season + 1 //set the number of season
                                    
                                }){
                                    Text("Season \(season + 1)")
                                        .bold()
                                        .foregroundColor(season + 1 == self.SelectedSeason ? .white : .gray)
                                        .font(season + 1 == self.SelectedSeason ? .title : .title2)

                                }
                                
                            }
                            Spacer()
                            Button(action:{
                                self.IsShowSeasonPicker = false
                            }){
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 40))
                                    .scaleEffect(x: 1.1)

                            }
                        }
                        .padding(.bottom,20)

                    }
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .foregroundColor(.white)

    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: test_movie,MovieShow: .constant(nil))
    }
}

struct MovieInfoSubHeadline: View {
    var movie:Movie
    
    var body: some View {
        HStack{
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            Text(String(movie.year)) //text suport int only
            
            MovieRate(rating:movie.rating)
            
            Text(movie.displaynumberofseason)
//            ZStack{
//                Rectangle()
//                    .frame(width: 30, height: 25)
//                    .opacity(0.5)
//                Rectangle()
//                    .frame(width: 25, height: 20)
//                    .foregroundColor(.black)
//                    .opacity(0.5)
//                Text("HP")
//                    .foregroundColor(.white)
//                    .font(.system(size:13))
//                    .bold()
//
//            }
            
            
        }
        .foregroundColor(.gray)
        .padding(.vertical,6)
    }
}

struct MovieRate: View {
    var rating:String
    var body: some View {
        ZStack{
            Rectangle()
                .background(Color.gray)
                .opacity(0.5)
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width:50,height:25)
    }
}

struct CurrentEpisodeInfo: View {
    var movie:Movie
    var body: some View {
        Group{
            HStack{
                Text(movie.currentEpInfo)
                    .bold()
                Spacer()
            }
            .padding(.vertical,4)
            
            HStack{
                Text(movie.currentEpDescurption)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}

struct CurrentCastCreatorsInfo: View {
    var movie:Movie
    var body: some View {
        VStack{
            HStack{
                Text("Cast:\(movie.cast)")
                Spacer()
            }
            
            HStack{
                Text("Creators:\(movie.creators)")
                Spacer()
            }
        }
        .foregroundColor(.gray)
        .font(.caption)
        .padding(.vertical,10)
    }
}

//
//  MovieHomeView.swift
//  film
//
//  Created by Jackson on 20/1/2021.
//

import SwiftUI


struct TopHomeViewBar:View{
    @Binding var TopRowSelected :HomeTopRow
    @Binding var Genre:AllGenre
    
    @Binding var showHomeTopRow:Bool
    @Binding var showAllGenre:Bool
    
    var body:some View {
        switch TopRowSelected{
        case .home:
            HStack{
                Button(action:{
                    TopRowSelected = .tvShow
                }){
                    Text("TVShow")
                }
                .buttonStyle(PlainButtonStyle()) //remove all the button style that apply to child view
                
                Spacer()
                
                Button(action:{
                    TopRowSelected = .movie
                }){
                    Text("Movies")
                }
                .buttonStyle(PlainButtonStyle()) //remove all the button style that apply to child view
                
                Spacer()
                
                Button(action:{
                    TopRowSelected = .mylist
                }){
                    Text("My List")
                }
                .buttonStyle(PlainButtonStyle()) //remove all the button style that apply to child view
            }
            .foregroundColor(.white)
            .padding(.horizontal,30)
            
        case .tvShow,.movie,.mylist:
            HStack(spacing:20){
                Button(action:{
                    self.showHomeTopRow = true
                }){
                    HStack{
                        Text(TopRowSelected.rawValue)
                            .font(.system(size:18))
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.system(size:10))
                    }
                }
                .buttonStyle(PlainButtonStyle()) //remove all the button style that apply to child view
                
                
                Button(action:{
                    self.showAllGenre = true
                }){
                    HStack{
                        Text(Genre.rawValue)
                            .font(.system(size:12))
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.system(size:8))
                    }
                }
                .buttonStyle(PlainButtonStyle()) //remove all the button style that apply to child view
                
                Spacer()
                
            }
            .foregroundColor(.white)
            .padding(.horizontal,30)
        }
    }
}


//HomePage
struct MovieHomeView: View {
    @ObservedObject var movieList = HomeVM() // if obj change with @Published variable all UI view will change
    @State private var ShowMovieDetail:Movie? = nil
    
    @State private var HomeTopRows:HomeTopRow = .home //which tab is selected
    @State private var Genre:AllGenre = .AllGenre //show all genre only in tv show
    
    @State private var showHomeTopRow = false
    @State private var showAllGenre = false
    
    var body: some View {
        
        let screen_width = UIScreen.main.bounds
        
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView(showsIndicators: false){
                LazyVStack{
                    TopHomeViewBar(TopRowSelected: self.$HomeTopRows, Genre: self.$Genre,showHomeTopRow: self.$showHomeTopRow,showAllGenre: self.$showAllGenre)
                    
                    
                    HomeViewTop(movie: test_movie2)
                        .frame(width:screen_width.width) //if your image is not fill your screen or bigger than,fill to screen width screen
                        .padding(.top,-110) //our parant does not know his child is padding
                        .zIndex(-1) //this view always at the bottom
                    
                    MoviewPreview(movies: toatal_movie)
                    
                    HomeStack(movieList: movieList, ShowMovieDetail: self.$ShowMovieDetail,selectedGenra: Genre,HomeRow: HomeTopRows)
                    //change the homeStack accroading to HomeRaw and genre
                    
                }
            }
            
            if ShowMovieDetail != nil {
                MovieDetail(movie: ShowMovieDetail!, MovieShow: self.$ShowMovieDetail)
                    .animation(.easeInOut)
                    .transition(.slide)
            }
            
            if showHomeTopRow { //if user tab the HomeRow in tvshow or movie or mylist
                Group{
                    ZStack{
                        Color.black.opacity(0.95) //blur the bottom view
                        
                        
                        VStack(spacing:40){
                            Spacer()
                            
                            ForEach(HomeTopRow.allCases,id:\.self){ nav in
                                Button(action:{
                                    HomeTopRows = nav
                                    showHomeTopRow = false
                                    
                                }){
                                    if nav == HomeTopRows{
                                        Text("\(nav.rawValue)")
                                            .bold()
                                            .font(.system(size: 30))
                                    }
                                    else{
                                        Text("\(nav.rawValue)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 18))
                                    }
                                }
                            }
                            Spacer()
                            
                            Button(action:{
                                showHomeTopRow = false
                            }){
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 40))
                                    .scaleEffect(x:1.1)
                            }
                            .padding(.bottom,40)
                            
                            
                            
                        }
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
            }
            
            
            if showAllGenre { //if user tab the HomeRow in tvshow or movie or mylist
                Group{
                    ZStack{
                        Color.black.opacity(0.95) //blur the bottom view
                        
                        
                        VStack(spacing:40){
                            Spacer()
                            ScrollView{
                                ForEach(movieList.allgenre,id:\.self){ genre in
                                    Button(action:{
                                        Genre = genre
                                        showAllGenre = false
                                        
                                    }){
                                        if genre == Genre{
                                            Text("\(genre.rawValue)")
                                                .bold()
                                                .font(.system(size: 30))
                                        }
                                        else{
                                            Text("\(genre.rawValue)")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 18))
                                        }
                                    }
                                    .padding(.bottom,40)
                                }
                            }

                            Spacer()
                            
                            Button(action:{
                                showAllGenre = false
                            }){
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 40))
                                    .scaleEffect(x:1.1)
                            }
                            .padding(.bottom,40)

                        }
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .foregroundColor(.white)
    }
}



struct MovieHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MovieHomeView()
    }
}


//Info of tab
enum HomeTopRow:String, CaseIterable{
    case home = "Home"
    case tvShow = "TV Show"
    case movie = "Movie"
    case mylist = "My list"
}

enum AllGenre:String{
    case AllGenre
    case Action
    case Comedy
    case Horror
    case Thriller
}

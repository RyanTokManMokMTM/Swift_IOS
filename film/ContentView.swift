//
//  ContentView.swift
//  film
//
//  Created by Jackson on 20/1/2021.
//

import SwiftUI

struct ContentView: View {
    
    let screen = UIScreen.main.bounds
    
    @State var currentMovieInde :Int = 0
    @State var IsShowFullScreen:Bool = false
    
    @State var ViewPosCurrent:CGFloat = 1000
    @State var ViewPosNew:CGFloat = 1000
    
    //moodify TagView UI in UIKit
    init(){
        UITabBar.appearance().isTranslucent = false
        //is the tabbar with opacity(like a blur effect)
        UITabBar.appearance().barTintColor = UIColor.black
        //change background color to black, defalut is white
    }
    
    var body: some View {
        ZStack{
            TabView{
                MovieHomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0) //this is tag 0
                
                    SearchView()
                        .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(1)  //this is tag 1
                
                Text("Video")
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Video")
                    }
                    .tag(2)  //this is tag 2
                
                Text("Download")
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Download")
                    }
                    .tag(3)  //this is tag 4
                
                Text("More")
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("More")
                    }
                    .tag(4)  //this is tag 5
            }
            .accentColor(.white) //selected tab item color
            
            PreviewList(
                movie: toatal_movie,
                currentIndex: $currentMovieInde,
                IsVisable: $IsShowFullScreen)
                .offset(y:ViewPosCurrent)
                .isHidden(!IsShowFullScreen)
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
        }
        .onChange(of: IsShowFullScreen, perform: { value in
            if value {
                //is visiable
                withAnimation(){
                    ViewPosCurrent = .zero
                }
            }
            else{
                withAnimation(){
                    
                    ViewPosCurrent = screen.height + 20 //add 20 to devices hight
                }
            }
        })
  
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

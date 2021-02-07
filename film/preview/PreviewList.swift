//
//  PreviewList.swift
//  film
//
//  Created by Jackson on 6/2/2021.
//

import SwiftUI

struct PreviewList: View {
    var movie:[Movie]
    
    let screen =  UIScreen.main.bounds
    
    @Binding var currentIndex : Int //which movie is user vising?
    @Binding var IsVisable: Bool //is user visiting the list?
    
    private func IsCurrentIndexToStartPlaying(Index:Int)->Bool{
        if currentIndex != Index || !IsVisable{
            return false // user not vising the preview ,user is no longer in preview ,may leave??
        }
        
        return true
    }
    
    @State private var currentTranslation : CGFloat = 0 //just care about current view translation
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PreviewPage(pageCount: movie.count,
                        pageIndex: $currentIndex,
                        translation: $currentTranslation){
                
                ForEach(0..<movie.count){mv in
                    PerviewViewPage(vm: perviewVM(movie: movie[mv]),isPlaying: IsCurrentIndexToStartPlaying(Index: mv))
                        .frame(width:screen.width)
                }
                
            }
            .frame(width:screen.width)
                        
        }
    }
}

struct perviewDummy:View{
    @State private var currentIndex = 0
    @State private var isVisable:Bool = true
    
    var body : some View{
        PreviewList(movie: toatal_movie,currentIndex: $currentIndex,IsVisable: $isVisable)
    }
}

struct PreviewList_Previews: PreviewProvider {
    static var previews: some View {
        perviewDummy()
    }
}

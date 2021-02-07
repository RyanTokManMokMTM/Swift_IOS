//
//  PerviewViewPage.swift
//  film
//
//  Created by Jackson on 6/2/2021.
//

import SwiftUI

struct PerviewViewPage: View {
    @ObservedObject var vm : perviewVM
    
    var isPlaying:Bool
    
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            //video player at bottom
            PreviewVideoPlayer(videoURL: vm.movie.trailers.first?.videoURL, isPlayer: .constant(isPlaying))
            
            VStack{
                HStack {
                    Text(vm.movie.name)
                        .bold()
                        .font(.largeTitle)
                    
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.top,60)
                
                Spacer()
                
                HStack{
                    ForEach(0..<vm.movie.movieCategory.count,id:\.self){ cat in
                        HStack{
                            Text(vm.movie.movieCategory[cat])
                                .font(.footnote)
                            
                            if cat != vm.movie.movieCategory.count - 1{
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                            }
                        }
                        
                    }
                    
                }
                
                HStack{
                    Spacer()
                    //my list
                    SmallVerticalButton(IsOnImage: "plus", IsOffImage: "checkmark", colors: vm.movie.accentColor, text: "Myl List", IsOn: true){
                        //TODO
                    }
                    Spacer()
                    Button(action: {
                        //TODO
                    }){
                        HStack{
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("Play")
                        }
                        .padding(.horizontal,26)
                        .padding(.vertical,12)
                        .border(vm.movie.accentColor,width: 3)
                    }
                    
                    Spacer()
                    
                    //info
                    SmallVerticalButton(IsOnImage: "info.circle", IsOffImage: "info.circle", colors: vm.movie.accentColor, text: "info", IsOn: true){
                        //TODO
                    }
                    
                    Spacer()
                }
                .padding(.top,14)
            }
            .padding(.bottom,48)
            .foregroundColor(vm.movie.accentColor)
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct PerviewViewPage_Previews: PreviewProvider {
    static var previews: some View {
        PerviewViewPage(vm: perviewVM(movie: test_movie),isPlaying: true)
    }
}

//
//  WhiteButton.swift
//  film
//
//  Created by Jackson on 21/1/2021.
//

import SwiftUI

struct PlayButton: View {
    var text:String
    var Icon:String
    var buttonColor:Color = Color.white
    
    var action:()->()
    
    var body: some View {
        Button(action:{}){
            HStack{
                Spacer()
                Image(systemName: Icon)
                    .font(.headline)
                Text(text)
                    .bold()
                    .font(.system(size: 16))
                Spacer()
                
            }
            .foregroundColor(buttonColor == Color.white ? .black:.white)
            .padding(.vertical,6)
            .background(buttonColor)
            .cornerRadius(3.0)
        }
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            PlayButton(text: "Play", Icon: "play.fill"){
                print("test button")
            }
        }

    }
}

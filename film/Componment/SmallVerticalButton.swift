//
//  SmallVerticalButton.swift
//  film
//
//  Created by Jackson on 21/1/2021.
//

import SwiftUI

struct SmallVerticalButton: View {
    
    var IsOnImage:String
    var IsOffImage:String
    var colors:Color = Color.white
    var text:String
    var IsOn:Bool
    
    var buttonImage:String{
        if IsOn{
            return IsOnImage
        }
        else{
            return IsOffImage
        }
    }
    
    
    //closer func
    //button function
    var action:()->()
    
    var body: some View {
            Button(action:{
                //TODO
                action()
            }){
                VStack(spacing:5){
                    Image(systemName: buttonImage)
                        .foregroundColor(colors)
                    Text(text)
                        .bold()
                        .foregroundColor(colors)
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                }

            }
        
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SmallVerticalButton(IsOnImage: "plus", IsOffImage: "checkmark",text: "My List",IsOn: false){
                print("Pressed")
            }
            
        }
    }
    
}


//
//  SearchBar.swift
//  film
//
//  Created by Jackson on 29/1/2021.
//
/*
 在Textfield上覆蓋一個長方形
 下層是Textfield
 
 Rectangle width height cover the textfiled as well as possible

 */


import SwiftUI

struct SearchBar: View {
    
    @Binding var text:String
    @State var isEidting:Bool = false
    @Binding var isLoading:Bool
    
    var body: some View {
        
        ZStack(alignment:.leading){
            //same background as textfield
            //cover the textfield
            Rectangle()
                .frame(width:290,height:36)
                .foregroundColor(.graysearchbackground)
                .cornerRadius(8)
            
            HStack{
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.graysearchtext)
                    .padding(.leading,10)
                
                TextField("Search", text: self.$text)
                    .padding(7)
                    .padding(.leading,-7)
                    .padding(.horizontal,10)
                    .background(Color.graysearchbackground)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onTapGesture(perform: {
                            isEidting = true
                    })
                    .animation(.default)
                    
                if !text.isEmpty{
                    if isLoading{
                        Button(action:{
                            withAnimation(){
                                text = ""
                            }
                        }){
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure{
                                    $0.color = UIColor.white
                                    //change  UIView to color white
                                }
                        }
                        .frame(width:35,height:35)
                        .transition(.scale)
                    }
                    else{
                        Button(action:{
                            text = ""
                        }){
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .frame(width:35,height:35)
                        }
                        .transition(.scale)
                    }
                }
                if isEidting{
                    Button(action:{
                        withAnimation(.easeOut){
                            text = ""
                            isEidting = false
                            hiddenKeyboard()
                        }
                    }){
                        Text("Cancel")
                            .foregroundColor(.white)
                    }
                    .padding(.trailing,10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        }

    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SearchBar(text: .constant(""), isLoading: .constant(false))
                .padding()
        }
    }
}

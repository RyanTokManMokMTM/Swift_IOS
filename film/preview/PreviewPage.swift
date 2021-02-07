//
//  PreviewPage.swift
//  film
//
//  Created by Jackson on 4/2/2021.
//

import SwiftUI

//Template <Content:View> be able to pass any viiew ->same as vstack etc
struct PreviewPage<Content : View>: View {
    let pageCount:Int //total page
    @Binding var pageIndex:Int //which one is now playing
    @Binding var translation:CGFloat
    let content:Content
    
    
    /*
     @@ViewBuilder let switUI know which content it need to render
     */
    init(pageCount:Int,pageIndex:Binding<Int>,translation:Binding<CGFloat>,@ViewBuilder content:()->Content){
        self.pageCount = pageCount
        self._pageIndex = pageIndex
        self.content = content()
        self._translation = translation
        
    }
    
    var body: some View {
        GeometryReader{ proxy in
            HStack(spacing:0){
                self.content
                    .frame(width:proxy.size.width)
                    .offset(x: -CGFloat(pageIndex) * proxy.size.width)
                    .offset(x:translation)
                    .animation(.interactiveSpring())
                    .gesture(
                        DragGesture()
                            .onChanged{value in
                                //when graging call it
                                translation = value.translation.width
                            }
                            .onEnded{ value in
                                let viewpercent = (value.translation.width / proxy.size.width)
                                let index = (CGFloat(self.pageIndex) - viewpercent).rounded() //if 0.5 ->1 0.4->0(rounded)
                                
                                //index might last tham 0 or over pageCount,we need to make a condition
                                //is last than 0 ? max(index,0)
                                //is greater than pagecount -1  ? min(max(index,0),pageCount -1)
                                pageIndex = min(max(Int(index) , 0),pageCount-1)
                                self.translation = 0 //set offset to 0
                                
                                
                                /*
                                 suppose
                                 screen width : 100
                                 index = 1
                                 drag = 75
                                 75/100 = 75%
                                 
                                 if left = -75 = round 0
                                 if right = 75 = round 1
                                 */
                            }
                    )
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct previewDummy: View {
    @State private var pageIndex = 0
    @State private var translation:CGFloat = 0
    var body : some View{
        PreviewPage(pageCount: 6, pageIndex: $pageIndex,translation:$translation){
            //All content will pass !
            ZStack{
                Color.pink
                Image("ozarkPreview")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    
            }
            
            ZStack{
                Color.blue
                Image("whiteLinesPreview")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            
            ZStack{
                Color.black
                Image("travelersPreview")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            
            ZStack{
                Color.orange
                Image("dirtyJohnPreview")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            
            ZStack{
                Color.purple
                Image("darkPreview")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            
            ZStack{
                Color.green
                Image("arrestedDevPreview")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }

        }
    }
}

//
//struct previewDummy_preview: PreviewProvider {
//    static var previews: some View {
//        previewDummy()
//    }
//}

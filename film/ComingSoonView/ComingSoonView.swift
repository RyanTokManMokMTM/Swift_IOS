//
//  ComingSoonView.swift
//  film
//
//  Created by Jackson on 2/2/2021.
//

import SwiftUI

struct ComingSoonView: View {
    @State private var IsShowNotification:Bool = false
    @State private var IsNavigationBarHidden:Bool = true
    @State private var MovieToShow:Movie?
    
    @State private var scrollOffset:CGFloat = 0.0
    @State private var movie_index = 0
    
    private func updatedIndex(wifhScrollOffset offset:CGFloat){
        if offset < 120{
            movie_index = 0
        }
        else{
            let remove120 = offset - 120
            let active = Int(remove120 / 410 )+1
            movie_index = active
        }
    }
    
    @ObservedObject var vm = commingsonn()
    
    var body: some View {
        ///       NavigationView {
        let movie = vm.movie.enumerated().map({$0})
        
        let scrollViewBinding = Binding{
            return scrollOffset
        }set:{ newValue in
            scrollOffset = newValue
            updatedIndex(wifhScrollOffset: newValue)
        }
        
        return Group {
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                
                TrackableScrollView(.vertical, showIndicators: true, contentOffset: scrollViewBinding){
                    
                    NotificationBar(IsShowNotificationList: $IsShowNotification)
                    
                    LazyVStack{
                        ForEach(Array(movie),id:\.offset){index,movies in
                            ComingSoonRow(movie: movies, MovieToShow: $MovieToShow)
                                .frame(height:400)
                                .overlay(
                                    Group{
                                        index == self.movie_index ? Color.clear : Color.black.opacity(0.9)
                                    }
                                    .animation(.easeInOut)

                                )

                        }
                        
                    }
                }
                .foregroundColor(.white)
                
//                Text("\(scrollOffset)")
//                    .background(Color.red)
                //???????
                NavigationLink(
                    destination: Text(""),
                    isActive: $IsShowNotification,
                    label: {
                        EmptyView() //no going to render
                    })
                    .navigationTitle("empty")
                    .navigationBarHidden(IsNavigationBarHidden)
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                        IsNavigationBarHidden = false
                    })
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                        IsNavigationBarHidden = false
                    })
            }
            

        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}

//
//  SearchView.swift
//  film
//
//  Created by Jackson on 31/1/2021.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchVM()
    @State private var searchingText:String = ""
    
    @State private var MovieToShow :Movie? =  nil
    
    //@State cant use didset(ater set what happen) and will set(before set what happen)
    //@State is a propertyWrapper not change
    //We need to create a binding
    
    var body: some View {
        
        let search = Binding{ //getter first
            return searchingText
        }set:{ //and if searching text is updated call setter
            //set update test to @State warpper
            self.searchingText = $0 //$0 acorrding to what will return(type)
            //updated search view obv model
            vm.UpdateView(Searched: $0)
        }
        
        
        return ZStack(){
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                SearchBar(text: search, isLoading: $vm.isLoading)
                    .padding()
                
                
                ScrollView(.vertical, showsIndicators: false){
                    //user not yet searching
                    if vm.showPopularMovie {
                        VStack{
                            HStack{
                                Text("PolularMovie")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading,12)
                                
                                Spacer()
                            }
                            
                            LazyVStack{
                                //id to identify each movie
                                ForEach(vm.populardMovie,id:\.id){ pm in
                                    PopularMovieView(movie: pm, MovieToShow: self.$MovieToShow)
                                        .frame(height:75)

                                }
                            }
                        }
                    }
                    
                    //if no result
                    if vm.viewState == .empty{
                        Text("Your seach have no result")
                            .bold()
                            .padding(.top,150)
                    }
                    
                    //searching result
                    if vm.viewState == .ready && !vm.showPopularMovie {
                        
                        VStack{
                            HStack{
                                Text("Searching result")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading,12)
                                
                                Spacer()
                            }
                            
                            SearchResultView(searchedMovied: vm.searchedMovie, MovieToShow: $MovieToShow)
                        }
                    }
                    
                }
                
                Spacer()
            }
            
            if self.MovieToShow != nil{
                MovieDetail(movie: MovieToShow!, MovieShow: $MovieToShow)
                    .animation(.easeInOut)
                    .transition(.move(edge: .leading))
                
                
            }
            
        }
        .foregroundColor(.white)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

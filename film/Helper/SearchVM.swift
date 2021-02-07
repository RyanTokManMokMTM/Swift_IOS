//
//  SearchVM.swift
//  film
//
//  Created by Jackson on 31/1/2021.
//

import Foundation
import SwiftUI

class SearchVM : ObservableObject{
    //ObservableObject ->shared date which set as @Published
    
    @Published var isLoading:Bool = false // check is loading state or not
    @Published var showPopularMovie = true // show by default
    
    @Published var viewState:viewStates = .ready
    @Published var populardMovie:[Movie] = []
    @Published var searchedMovie:[Movie] = []
    
    init(){
        //geneate Movie when init
        getPopularMovie()
    }
    
    //When updated @State text call it
    public func UpdateView(Searched text:String){
        setState(to: .loading)
        
        if text.count > 0{
            self.showPopularMovie = false
            getSearchingMovie(search: text)
        }
        else{
            self.showPopularMovie = true
        }
    }
    
    private func getPopularMovie(){
        //need to generate some popular movie
        self.populardMovie = generateMovies(40)
    }
    
    private func getSearchingMovie(search text:String){
        let results = Int.random(in: 0..<3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            
            //if no result at seate to empty
            if results == 0{
                self.setState(to: .empty)
                self.searchedMovie = []
            }
            else{
                self.searchedMovie = generateMovies(20)
                self.setState(to: .ready)
            }
        }
    }

    
    
    private func setState(to state:viewStates){
        DispatchQueue.main.async {
            //update statv only at main queue
            self.viewState = state
            self.isLoading = self.viewState == .loading // if state is loading set it to true : false
        }
    }
}

enum viewStates {
    case ready // user not searching any thing
    case loading //user is searching
    case empty // empty result
    case error // searching error
}

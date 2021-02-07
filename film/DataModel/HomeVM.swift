//
//  HomeVM.swift
//  film
//
//  Created by Jackson on 20/1/2021.
//

import Foundation

class HomeVM:ObservableObject {
    @Published var movies:[String:[Movie]] = [:] // store all category movie as dict
    
    public func allcategory() -> [String]{
        return movies.keys.map({String($0)}) //let all to stirng
    }

    public var allgenre:[AllGenre] = [.AllGenre,.Action,.Comedy,.Horror,.Thriller]

    
    public func getCategoryList(forCat cat:String, andHomeTab tab:HomeTopRow, andGenra genra:AllGenre)->[Movie]{ //get movie list : tab + genra
        switch tab {
        case .home :
            return movies[cat] ?? [] // if cat is not nill return movies[cat] else retuern nill list
        case .tvShow:
            return (movies[cat] ?? []).filter({$0.movieType == .tvShow && $0.genra == genra}) // if cat is not nill return movies[cat] else retuern nill list
        case .movie :
            return (movies[cat] ?? []).filter({$0.movieType == .movie && $0.genra == genra}) //
        case .mylist:
            return movies[cat] ?? [] //
        }
    }
    
    
    init(){
        setMovieList()
    }
    
    func setMovieList(){
        movies["Tredening Now"] = toatal_movie
        movies["Stand-up Comedy"] = toatal_movie.shuffled() //random all elements
        movies["New Releases"] = toatal_movie.shuffled() //random all elements
        movies["Watch It again"] = toatal_movie.shuffled() //random all elements
        movies["Sci"] = toatal_movie.shuffled() //random all elements
    }
}

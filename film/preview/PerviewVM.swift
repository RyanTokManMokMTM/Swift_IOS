//
//  PerviewVM.swift
//  film
//
//  Created by Jackson on 6/2/2021.
//

import Foundation

class perviewVM : ObservableObject{
    var movie : Movie
    
    init(movie:Movie){
        self.movie = movie
    }
}

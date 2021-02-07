//
//  Comin.swift
//  film
//
//  Created by Jackson on 2/2/2021.
//

import Foundation

class commingsonn: ObservableObject{
    @Published var movie:[Movie] = []
    
    init(){
        movie = generateMovies(20) //for init to generate 20 movie
    }
}

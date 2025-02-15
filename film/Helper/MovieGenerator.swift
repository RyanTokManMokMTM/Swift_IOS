//
//  MovieGenarator.swift
//  film
//
//  Created by Jackson on 31/1/2021.
//

import Foundation

func generateMovies(_ count:Int)->[Movie]{
    guard count > 0 else {
        return []
    }
    
    var allMovie: [Movie] = []
    
    //geneate total movie
    for _ in 0..<count {
        let id = UUID().uuidString
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0..<9)
        let thumbnail = URL(string: "https://picsum.photos/300/10\(randThumbnail)")!
        
        let year = Int.random(in: 2000...2020)
        
        let cast = "Lorem ipsum, dolor sit"
        let creators = "felis non, libero consectetur"
        let categories = ["consectetur", "neque", "felis", "libero"]
        
        let headline = "Watch now!"
        
        let numSeasons = Int.random(in: 1...3)
        
        var allEpisodes: [Episode] = []
        
        for i in 1...numSeasons {
            allEpisodes.append(contentsOf: generateEpisodes(5, forSeason: i))
        }
        
        let epinameLength = Int.random(in: 9..<20)
        let epiname = randomString(length: epinameLength)
        
        let epidescLength = Int.random(in: 150..<200)
        let epidesc = randomString(length: epidescLength)
        let defEpiInfo = episodeInfo(episodeName: epiname, episodeDescription: epidesc, season: 1, episode: 1)
        
        
        let allTrailers = generateTrailers(3)
        let moreLikeThis = toatal_movie
        
        let PreviewImg = ["whiteLinesPreview","travelersPreview","arrestedDevPreview","darkPreview","dirtyJohnPreview","ozarkPreview"]
        
        let movie = Movie(id: id, name: name, imageURL: thumbnail, movieCategory: categories, genra: .AllGenre, previewImg: PreviewImg.randomElement()!, year: year, rating: "PG-13", numberofseason: numSeasons, trailers: allTrailers, currentEpisodeInfo: defEpiInfo, defaultEpisodeInfo: defEpiInfo, episode: allEpisodes, promoteHeadLine: headline, cast: cast, creators: creators, moreAndLike: moreLikeThis)
        
        allMovie.append(movie)

    }
    
    return allMovie
}


func generateTrailers(_ count : Int) -> [trailer]{
    var allTrailers : [trailer] = []
    
    for _ in 0..<count{
        let id = UUID().uuidString
        
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = URL(string: "https://picsum.photos/300/10\(randThumbnail)")!
        
        let trailers = trailer(id: id, name: name, videoURL: trailerURL, CovorURL: thumbnail)
        allTrailers.append(trailers)
    }
    
    return allTrailers
    
}

func generateEpisodes(_ count: Int, forSeason season: Int) -> [Episode] {
    var allEpisodes: [Episode] = []
    
    for num in 0..<count {
        let id = UUID().uuidString
        
        let nameLength = Int.random(in: 9..<20)
        let name = randomString(length: nameLength)
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = "https://picsum.photos/300/10\(randThumbnail)"
        
        let desc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse at purus diam. Nullam a nulla a augue eleifend convallis ac vitae neque. Curabitur sit amet felis non libero consectetur euismod."
        let randLength = Int.random(in: 20..<59)
        
        let episode = Episode(id: id, name: name, seasonNum: season, episodeNum: num + 1 , videoIconURLStr: thumbnail, description: desc, length: randLength, videoURL: trailerURL)
        
        allEpisodes.append(episode)
    }
    
    return allEpisodes
}



func randomString(length: Int)->String{
    let letters = "abcdefghijklmnopqrstuvwxyz"
    return String((0..<length).map{ _ in
        letters.randomElement()!})
}

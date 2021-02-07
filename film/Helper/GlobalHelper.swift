//
//  GlobalHelper.swift
//  film
//
//  Created by Jackson on 20/1/2021.
//

import Foundation
import SwiftUI

let trailerURL:URL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!

let trailerCoverURL:URL = URL(string: "https://picsum.photos/300/104")!
let trailerCoverURL2:URL = URL(string: "https://picsum.photos/300/105")!
let trailerCoverURL3:URL = URL(string: "https://picsum.photos/300/106")!

var randomCoverImage:URL{
    return [trailerCoverURL,trailerCoverURL2,trailerCoverURL3].randomElement() ?? trailerCoverURL
}

let example_trailer = trailer(name: "Session 3 Trailer", videoURL: trailerURL, CovorURL: randomCoverImage)
let example_trailer1 = trailer(name: "The Hero's Journey", videoURL: trailerURL, CovorURL: randomCoverImage)
let example_trailer2 = trailer(name: "The Mysterious", videoURL: trailerURL, CovorURL: randomCoverImage)

let examplettrailerList:[trailer] = [example_trailer,example_trailer1,example_trailer2]


let ex_episode1 = Episode(name: "Beginnings and Ending", seasonNum: 1 , episodeNum: 1, videoIconURLStr: "https://picsum.photos/300/102", description: "Six mothes after the dissappearances, the police form a task force. In 2052,John learns that most of Winden perished in an apcocalyptic event.", length: 53, videoURL: trailerURL)

let ex_episode2 = Episode(name: "Dark Matter", seasonNum: 1 , episodeNum: 2, videoIconURLStr: "https://picsum.photos/300/103", description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnarving encounter and Egon visits and old nemeis", length: 54, videoURL: trailerURL)

let ex_episode3 = Episode(name: "Beginnings adn Ending", seasonNum: 1 , episodeNum: 3, videoIconURLStr: "https://picsum.photos/300/104", description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again", length: 56, videoURL: trailerURL)

let ex_episode4 = Episode(name: "Beginnings and Ending", seasonNum: 2 , episodeNum: 1, videoIconURLStr: "https://picsum.photos/300/102", description: "Six mothes after the dissappearances, the police form a task force. In 2052,John learns that most of Winden perished in an apcocalyptic event.", length: 53, videoURL: trailerURL)

let ex_episode5 = Episode(name: "Dark Matter", seasonNum: 2 , episodeNum: 2, videoIconURLStr: "https://picsum.photos/300/103", description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnarving encounter and Egon visits and old nemeis", length: 54, videoURL: trailerURL)

let ex_episode6 = Episode(name: "Beginnings adn Ending", seasonNum: 3 , episodeNum: 3, videoIconURLStr: "https://picsum.photos/300/104", description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again", length: 56, videoURL: trailerURL)

let expamle_episode = [ex_episode1,ex_episode2,ex_episode3,ex_episode4,ex_episode5,ex_episode6]

let test_movie = Movie(
    id:UUID().uuidString,
    name: "DARK",
    imageURL: URL(string: "https://picsum.photos/200/300")!,
    movieCategory: ["Dystipoan","Exciting","Suspenseful","Sci-Fi TV"],
    previewImg: "darkPreview", accentColor:.blue, year: 2020,rating: "MA_TV",
    numberofseason: 3, trailers: examplettrailerList,
    defaultEpisodeInfo: example_default_ep,
    episode:expamle_episode,
    promoteHeadLine: "Best it Watch",
    cast: "Baran bo Odan, Jantje Friese",
    creators: "Louis Hofmann, Oliver Masucci,jorids Triebel",
    moreAndLike:[test_movie1,test_movie2,test_movie3,test_movie4,test_movie5,test_movie6]
)

let test_movie1 = Movie(
    id:UUID().uuidString,
    name: "DARK1",
    imageURL: URL(string: "https://picsum.photos/200/300/")!,
    movieCategory: ["Dystipoan","Exciting","Suspenseful","Sci-Fi TV"],
    previewImg: "whiteLinesPreview", year: 2020,rating: "MA_TV",
    trailers: examplettrailerList, defaultEpisodeInfo: example_default_ep,
    promoteHeadLine: "New season is updated",
    cast: "Baran bo Odan, Jantje Friese",
    creators: "Louis Hofmann, Oliver Masucci,jorids Triebel", moreAndLike: [])

let test_movie2 = Movie(
    id:UUID().uuidString,name: "DARK2",
    imageURL: URL(string: "https://picsum.photos/200/301")!,
    movieCategory: ["Dystipoan","Exciting","Suspenseful","Sci-Fi TV"],
    previewImg: "travelersPreview", year: 2020,
    rating: "MA_TV",
    trailers: examplettrailerList, defaultEpisodeInfo: example_default_ep,
    promoteHeadLine: "Best it Watch",
    cast: "Baran bo Odan, Jantje Friese",
    creators: "Louis Hofmann, Oliver Masucci,jorids Triebel", moreAndLike: [])

let test_movie3 = Movie(
    id:UUID().uuidString,
    name: "DARK3",
    imageURL: URL(string: "https://picsum.photos/200/302")!,
    movieCategory: ["Dystipoan","Exciting","Suspenseful","Sci-Fi TV"],
    previewImg: "dirtyJohnPreview", year: 2020,
    rating: "MA_TV",
    trailers: examplettrailerList, defaultEpisodeInfo: example_default_ep,
    cast: "Baran bo Odan, Jantje Friese",
    creators: "Louis Hofmann, Oliver Masucci,jorids Triebel", moreAndLike: [])

let test_movie4 = Movie(
    id:UUID().uuidString,
    name: "DARK4",
    imageURL: URL(string: "https://picsum.photos/200/303")!,
    movieCategory: ["Dystipoan","Exciting","Suspenseful","Sci-Fi TV"],
    previewImg: "ozarkPreview", year: 2020,
    rating: "MA_TV",
    trailers: examplettrailerList, defaultEpisodeInfo: example_default_ep,
    cast: "Baran bo Odan, Jantje Friese",
    creators: "Louis Hofmann, Oliver Masucci,jorids Triebel", moreAndLike: [])

let test_movie5 = Movie(
    id:UUID().uuidString,
    name: "DARK5",
    imageURL: URL(string: "https://picsum.photos/200/304")!,
    movieCategory: ["Dystipoan","Exciting","Suspenseful","Sci-Fi TV"],
    previewImg: "travelersPreview", year: 2020,
    rating: "MA_TV",
    trailers: examplettrailerList, defaultEpisodeInfo: example_default_ep,
    cast: "Baran bo Odan, Jantje Friese",
    creators: "Louis Hofmann, Oliver Masucci,jorids Triebel", moreAndLike: [])

let test_movie6 = Movie(
    id:UUID().uuidString,
    name: "DARK6",
    imageURL: URL(string: "https://picsum.photos/200/305")!,
    movieCategory: ["Dystipoan","Exciting","Suspenseful","Sci-Fi TV"],
    previewImg: "whiteLinesPreview", year: 2020,rating: "MA_TV",
    trailers: examplettrailerList, defaultEpisodeInfo: example_default_ep,
    cast: "Baran bo Odan, Jantje Friese",
    creators: "Louis Hofmann, Oliver Masucci,jorids Triebel", moreAndLike: [])

let toatal_movie = [test_movie,test_movie1,test_movie2,test_movie3,test_movie4,test_movie5,test_movie6]

let example_default_ep = episodeInfo(episodeName: "Beginning adn Endining", episodeDescription: "Six months after the disappearances, the police from a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event", season: 2, episode: 1)



//do not need to wirte it again it can use it again with variable not all function
extension LinearGradient{
    static var BlackOpacityGradient = LinearGradient(gradient:
                                                        Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
                                                     startPoint: .top,
                                                     endPoint: .bottom)
}


extension String{
    func widthofStr(usingFont font:UIFont)->CGFloat{
        let fontattribute = [NSAttributedString.Key.font:font] //get the size of the font
        let size = self.size(withAttributes: fontattribute) //get total size of current string
        return size.width //return the total size with width
    }
}

extension View{
    func hiddenKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        //isFirstResponsder =>if keyboard is not open yet => true / false(handler)
    }
}

extension View{
    
    /*
        hidden = ture -> hidden the view else view is visable
        remove = ture -> remove your current view ,but not need it set to a default value true
    */
   @ViewBuilder func isHidden(_ hidden:Bool,_ remove:Bool = false) -> some View{
        if hidden{
            if !remove{
                self.hidden()
            }
        }
        else{
            self
        }
    }
}

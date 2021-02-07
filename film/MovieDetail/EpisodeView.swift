//
//  EpisodeView.swift
//  film
//
//  Created by Jackson on 25/1/2021.
//

import SwiftUI

struct EpisodeView: View {
    var epidsos:[Episode]
    
    @Binding var ISshowSeasonPicker:Bool //pointer to the parant @State var
    @Binding var SeasonSelected:Int //pointer to which Season is selected @State var
    
    func getEpisode(forSeason season:Int)->[Episode]{
        return epidsos.filter({$0.seasonNum == season}) //cheack is euqal to selected season?
    }
    
    
    var body: some View {
        VStack(spacing:14){
            HStack{
                Button(action:{
                    self.ISshowSeasonPicker = true
                }){
                    Group{
                        Text("Season \(self.SeasonSelected)")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                }
                Spacer()
            }
            
            ForEach(getEpisode(forSeason: self.SeasonSelected)){e in
                VStack(alignment:.leading){
                    HStack{
                        VideoCoverPreview(coverURL: e.IconURL , videoURL: e.videoURL)
                            .frame(width:120,height:70)
                            .clipped()
        
                        
                        VStack(alignment:.leading){
                            Text("\(e.episodeNum) . \(e.name)")
                                .font(.system(size: 16))
                            Text("\(e.length)m")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        Image(systemName: "arrow.down.to.line")
                            .font(.system(size: 20))
                    }
                    
                    Text(e.description)
                        .font(.system(size: 14))
                        .lineLimit(3)
                }
                .padding(.bottom,20)
            }
            Spacer()
            
        }
        .foregroundColor(.white)
        .padding(.horizontal,20)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            EpisodeView(epidsos: expamle_episode,ISshowSeasonPicker: .constant(false),SeasonSelected: .constant(1))
        }

    }
}

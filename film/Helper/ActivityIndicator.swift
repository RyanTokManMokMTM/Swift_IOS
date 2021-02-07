//
//  ActivityIndicator.swift
//  film
//
//  Created by Jackson on 29/1/2021.
//

import Foundation
import SwiftUI

struct ActivityIndicator:UIViewRepresentable{
    
    let style : UIActivityIndicatorView.Style
    @Binding var animate:Bool
    
    private let spinner :UIActivityIndicatorView = {
        $0.hidesWhenStopped = true
        return $0
    }(UIActivityIndicatorView(style: .medium)) //is a closuer
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView { //when swiftUI init that UIKit view will call it
        spinner.style = style
        return spinner
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) { //when swiftUI init that UIKit view is updated ,will call it
        animate ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
    
    //change UIActitvityIndicator Setting : color etc but only UIKit
    func configure(_ indicator: (UIActivityIndicatorView)->Void)-> some View{
        indicator(spinner)
        return self
    }
    
}

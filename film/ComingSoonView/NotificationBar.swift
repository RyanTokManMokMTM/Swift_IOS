//
//  NotificationBar.swift
//  film
//
//  Created by Jackson on 2/2/2021.
//

import SwiftUI

struct NotificationBar: View {
    @Binding var IsShowNotificationList:Bool
    
    var body: some View {
        Button(action:{
            //TODO
            IsShowNotificationList = true
        }){
            HStack{
                Image(systemName: "bell.fill")
                Text("Notification")
                    .bold()
                
                Spacer()
                
                Image(systemName: "arrowtriangle.right.fill")
                    
            }
            .font(.system(size: 18,weight:.bold))
        }
        .foregroundColor(.white)
        .padding()
        
    }
}

struct NotificationBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            NotificationBar(IsShowNotificationList: .constant(false))
        }
    }
}

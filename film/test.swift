//
//  test.swift
//  film
//
//  Created by Jackson on 2/2/2021.
//

import SwiftUI

struct test: View {
    @State var testValue :CGFloat = 0.0
    var body: some View {
        TrackableScrollView(.vertical, showIndicators: true, contentOffset: $testValue){
            Text("\(testValue)")
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}

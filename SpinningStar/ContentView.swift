//
//  ContentView.swift
//  SpinningStar
//
//  Created by William Robert Harrington on 2022-04-27.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    // 1. Starting position for the satr (inital state)
    @State var xOffset = -100.0
    
    // MARK: Computed properties
    var body: some View {
        Image(systemName: "star")
            .resizable()
            .frame(width: 40, height: 40, alignment: .center)
            .foregroundColor(.blue)
            .offset(x: xOffset, y: 0)
            .animation(.default)
        // 3. Trigger the animation on a tap
            .onTapGesture {
                // 2. Logic that changes the state
                xOffset = 100
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

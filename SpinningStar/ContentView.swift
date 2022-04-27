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
    
    // Contorl rotation of the star
    @State var starRotation = 0.0
    
    // Start a time 0.25 seconds after the view appers
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    // MARK: Computed properties
    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 80, height: 80, alignment: .center)
            .foregroundColor(.yellow)
            .rotation3DEffect(Angle.degrees(starRotation), axis: (x: 0, y: 0, z: 1))
            .offset(x: xOffset, y: 0)
            .animation(
                Animation
                    .easeInOut(duration: 1.0)
                    .repeatForever(autoreverses: true)
            )
        // 3. Trigger the animation on a tap
            .onReceive(timer) { input in
                // 2. Logic that changes the state
                xOffset = 100
                
                // Spin the star twice
                starRotation = 360 * 2
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Flashzilla
//
//  Created by Alex Bonder on 9/25/23.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text("Hello, world!")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                    print("Cancelled!!")
                } else {
                    print("The time is now \(time)")
                }
                counter += 1
            }
    }
}

#Preview {
    ContentView()
}

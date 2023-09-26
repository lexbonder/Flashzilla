//
//  ContentView.swift
//  Flashzilla
//
//  Created by Alex Bonder on 9/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("square tapped")
                }
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(Rectangle()) // changes tappable area to whole frame
                .onTapGesture {
                    print("circle tapped")
                }
//                .allowsHitTesting(false) // ignores tap gestures, passes along to whatever is behind it.
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

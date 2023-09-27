//
//  ContentView.swift
//  Flashzilla
//
//  Created by Alex Bonder on 9/25/23.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct ContentView: View {
//    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor // returns boolean, assign different colors to things.

//    @Environment(\.accessibilityReduceMotion) var reduceMotion // returns boolean
//    @State private var scale = 1.0
//    withOptionalAnimation {
//        scale *= 1.5
//    }

    @Environment(\.accessibilityReduceTransparency) var reduceTransparency // returns boolean
    
    var body: some View {
        Text("Hello World")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}

#Preview {
    ContentView()
}

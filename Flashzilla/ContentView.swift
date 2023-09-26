//
//  ContentView.swift
//  Flashzilla
//
//  Created by Alex Bonder on 9/25/23.
//

import SwiftUI

struct ContentView: View {
//    @State private var currentAmount = 0.0 // for pinch gesture
//    @State private var finalAmount = 1.0 // for pinch gesture
    
//    @State private var currentAmount = Angle.zero // for rotation gesture
//    @State private var finalAmount = Angle.zero // for rotation gesture
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5: 1)
            .offset(offset)
            .gesture(combined)
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
            
//                .onTapGesture { // child gesture takes priority unless highPriorityGesture is present
//                    print("text tapped")
//                }
//                .onTapGesture(count: 2) {
//                    print("DoubleTap")
//                }
            
//                .onLongPressGesture(minimumDuration: 2) { // waits 2 seconds
//                    print("Long pressed!")
//                } onPressingChanged: { inProgress in
//                    print("In progress: \(inProgress)")
//                }
//        }
//        .highPriorityGesture( // this will happen instead of child.

//        .simultaneousGesture( // this will happen WITH child
//            TapGesture()
//                .onEnded {
//                    print("VStack tapped")
//                }
//        )
        
//        .scaleEffect(finalAmount + currentAmount)
//        .gesture(
//            MagnificationGesture()
//                .onChanged { amount in
//                    currentAmount = amount - 1
//                }
//                .onEnded { amount in
//                    finalAmount += currentAmount
//                    currentAmount = 0
//                }
//        )
        
//        .rotationEffect(finalAmount + currentAmount)
//        .gesture(
//            RotationGesture()
//                .onChanged { angle in
//                    currentAmount = angle
//                }
//                .onEnded { angle in
//                    finalAmount += currentAmount
//                    currentAmount = .zero
//                }
//            )
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Flashzilla
//
//  Created by Alex Bonder on 9/25/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onChange(of: scenePhase, initial: false) { _, newPhase  in
            switch newPhase {
            case .background:
                print("Background")
            case .inactive:
                print("Inactive")
            case .active:
                print("Active")
            default:
                print("Something very strange...")
            }
        }
    }
}

#Preview {
    ContentView()
}

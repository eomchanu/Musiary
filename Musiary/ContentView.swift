//
//  ContentView.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/11/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var keyboardListener: KeyboardListener
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationStack(path: $navigationManager.path) {
                HomeView()
            }
            if !keyboardListener.isKeyboardOn {
                PlayerView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(NavigationManager())
        .environmentObject(DateManager())
        .environmentObject(KeyboardListener())
        .environmentObject(PlayerViewModel())
        .environmentObject(DiaryViewModel())
}

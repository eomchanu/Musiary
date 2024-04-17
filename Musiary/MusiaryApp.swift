//
//  MusiaryApp.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/11/24.
//

import SwiftUI

@main
struct MusiaryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                .environmentObject(NavigationManager())
                .environmentObject(DateManager())
                .environmentObject(KeyboardListener())
                .environmentObject(PlayerViewModel())
                .environmentObject(DiaryViewModel())
        }
    }
}

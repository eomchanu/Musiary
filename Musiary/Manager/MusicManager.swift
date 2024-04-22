//
//  MusicManager.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/17/24.
//

import SwiftUI
import AVKit

class MusicManager: ObservableObject {
    @Published var player: AVAudioPlayer?
    @Published var isPlaying: Bool = false
    
    func setupAudio() {
        guard let url = Bundle.main.url(forResource: "20 Train (Feat. C JAMM)", withExtension: "mp3")
        else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
//            totalTime = player?.duration ?? 0.0
        } catch {
            print("Error loading audio: \(error)")
        }
    }
    
    func playSound() {
        player?.play()
        isPlaying = true
    }
    
    func pauseSound() {
        player?.pause()
        isPlaying = false
    }
}

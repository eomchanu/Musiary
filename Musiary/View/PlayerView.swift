//
//  Music.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/12/24.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @EnvironmentObject var dateManager: DateManager
    
    var body : some View {
        GeometryReader { geo in
            ZStack {
                if playerViewModel.height == geo.size.height - 75 {
                    FloatingPlayerView()
//                        .animation(.interactiveSpring, value: playerViewModel.height)
//                        .transition(.move(edge: .bottom))
                } else {
                    DiaryView()
                        .animation(.interactiveSpring, value: playerViewModel.height)
                        .transition(.move(edge: .bottom))
                }
            }
            .onChange(of: dateManager.selectedDate, { oldValue, newValue in
                diaryViewModel.selectedDiary = diaryViewModel.diary.first(where: { item in
                    dateManager.formatter.string(from: item.date) == dateManager.formatter.string(from: newValue)
                }) ?? .init(date: .now, musics: [.init(caption: "nil")])
            })
            .gesture(DragGesture()
                .onChanged({ (value) in
                    if playerViewModel.height >= 0 {
                        withAnimation(.interactiveSpring){
                            playerViewModel.height += value.translation.height / 8
                        }
                        playerViewModel.isMoving = true
                    }
                })
                .onEnded({ (value) in
                    if playerViewModel.height > 50 && !playerViewModel.floating {
                        withAnimation(.interactiveSpring) {
                            playerViewModel.height = geo.size.height - 75
                            playerViewModel.floating = true
                            playerViewModel.isMoving = false
                        }
                        
                    }
                    else {
                        if playerViewModel.height < geo.size.height - 50 {
                            withAnimation(.interactiveSpring) {
                                playerViewModel.height = 0
                                playerViewModel.floating = false
                                playerViewModel.isMoving = false
                            }
                        }
                        else {
                            withAnimation(.interactiveSpring) {
                                playerViewModel.height = geo.size.height - 75
                                playerViewModel.isMoving = false
                            }
                        }
                    }
                })
            )
            .ignoresSafeArea()
            .offset(y: playerViewModel.height)
        }
    }
}

#Preview {
    PlayerView()
        .environmentObject(PlayerViewModel())
}

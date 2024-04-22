//
//  DiaryView.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/11/24.
//

import SwiftUI

struct DiaryView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @EnvironmentObject var dateManager: DateManager
    @EnvironmentObject var musicManager: MusicManager
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ZStack(alignment: .topLeading) {
                    Image("lifes_like_cover")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height - 120, alignment: .center)
                        .clipped()
                    
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.2))
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.gray.opacity(0.9))
                                .frame(width: 60, height: 6)
                                .padding(.leading, -20)
                            Spacer()
                        }
                        HStack {
                            Text("\(diaryViewModel.selectedDiary.date.getDay().description)")
                                .font(.system(size: 48))
                            VStack(alignment: .leading) {
                                Text("\(diaryViewModel.selectedDiary.date.getMonth().description)월")
                                Text("\(diaryViewModel.selectedDiary.date.getYear().description)년")
                            }
                        }
                        .padding(.bottom, 5)
                        Text(diaryViewModel.selectedDiary.musics[0].caption)
                            .font(.system(size: 38))
                    }
                    .bold()
                    .padding(.leading, 20)
                    .padding(.top, 70)
                }
                VStack {
                    Spacer()
                    ZStack(alignment: .leading) {
                        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 25, topTrailing: 25))
                            .frame(width: geometry.size.width, height: 210)
                            .foregroundStyle(.black)
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("아까워")
                                        .font(.title2)
                                        .bold()
                                    Text("재지팩트")
                                        .foregroundStyle(.gray)
                                }
                                Spacer()
                                Button {
                                    musicManager.isPlaying ? musicManager.pauseSound() : 
                                    musicManager.playSound()
                                } label: {
                                    Label {
                                        Text("재생/정지")
                                    } icon: {
                                        Image(systemName: musicManager.isPlaying ? "pause.fill" : "play.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30)
                                            .foregroundStyle(.white)
                                    }
                                    .labelStyle(.iconOnly)
                                }
                                .padding(.horizontal)
                            }
                            Spacer().frame(height: 30)
                            // TODO: 커스텀 슬라이더로 변경
                            CustomProgressBar(currentTime: .constant(10))
                            HStack {
//                                Button {
//                                    // TODO: 이전 곡 재생 액션 구현
//                                } label: {
//                                    Label {
//                                        Text("이전 곡 재생")
//                                    } icon: {
//                                        Image(systemName: "backward.fill")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 40)
//                                            .foregroundStyle(.white)
//                                    }
//                                    .labelStyle(.iconOnly)
//                                }
//                                Spacer()
//                                Button {
//                                    MusicManager.instance.playSound()
//                                    print("after playSound()")
//                                } label: {
//                                    Label {
//                                        Text("재생/정지")
//                                    } icon: {
//                                        Image(systemName: "play.fill")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 40)
//                                            .foregroundStyle(.white)
//                                    }
//                                    .labelStyle(.iconOnly)
//                                }
                                Spacer()
//                                Button {
//                                    
//                                } label: {
//                                    Label {
//                                        Text("다음 곡 재생")
//                                    } icon: {
//                                        Image(systemName: "forward.fill")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 40)
//                                            .foregroundStyle(.white)
//                                    }
//                                    .labelStyle(.iconOnly)
//                                }
                            }
//                            .padding(20)
                        }
                        .padding(.horizontal,25)
//                        .padding(10)
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: playerViewModel.isMoving ? 30 : 20))
            .ignoresSafeArea()
        }
    }
}

#Preview {
    DiaryView()
        .environmentObject(DiaryViewModel())
        .environmentObject(DateManager())
        .environmentObject(PlayerViewModel())
}

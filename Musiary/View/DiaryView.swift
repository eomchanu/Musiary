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
    @EnvironmentObject var dateManager: DateManager
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ZStack(alignment: .topLeading) {
                    Image("sza_cover")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width,height: geometry.size.height - 120)
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
                            Text("\(dateManager.getSelectedDay().description)")
                                .font(.system(size: 48))
                            VStack(alignment: .leading) {
                                Text("\(dateManager.getSelectedMonth().description)월")
                                Text("\(dateManager.getSelectedYear().description)년")
                            }
                        }
                        .padding(.bottom, 5)
                        Text("졸리다")
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
                            .frame(width: geometry.size.width, height: 250)
                            .foregroundStyle(.black)
                        VStack(alignment: .leading) {
                            Text("Snooze")
                                .font(.title)
                                .bold()
                            Text("SZA")
                                .foregroundStyle(.gray)
                            // TODO: 커스텀 슬라이더로 변경
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .frame(height: 10)
                                .foregroundStyle(.accent)
                                .padding(.top, 10)
                            HStack {
                                Text("1:31")
                                Spacer()
                                Text("3:18")
                            }
                            .foregroundStyle(.gray)
                            .font(.caption)
                            .padding(.top, 3)
                            HStack {
                                Button {
                                    // TODO: 이전 곡 재생 액션 구현
                                } label: {
                                    Label {
                                        Text("이전 곡 재생")
                                    } icon: {
                                        Image(systemName: "backward.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40)
                                            .foregroundStyle(.white)
                                    }
                                    .labelStyle(.iconOnly)
                                }
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Label {
                                        Text("재생/정지")
                                    } icon: {
                                        Image(systemName: "play.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40)
                                            .foregroundStyle(.white)
                                    }
                                    .labelStyle(.iconOnly)
                                }
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Label {
                                        Text("다음 곡 재생")
                                    } icon: {
                                        Image(systemName: "forward.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40)
                                            .foregroundStyle(.white)
                                    }
                                    .labelStyle(.iconOnly)
                                }
                            }
                            .padding(20)
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
}

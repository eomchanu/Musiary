//
//  FloatingPlayerView.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/12/24.
//

// TODO: 앱 시작 시 뜨지 않도록

import SwiftUI

struct FloatingPlayerView: View {
    @EnvironmentObject var playerViewModel: PlayerViewModel
    
    var body: some View {
        HStack {
            Image("sza_cover")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading){
                Text("Snooze")
                    .bold()
                Text("SZA")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 10)
            Spacer()
            Button {
                // TODO: 헬퍼에 재생/정지 버튼 작성
            } label: {
                Label {
                    Text("재생/정지")
                } icon: {
                    Image(systemName: "play.fill")
                }
                .labelStyle(.iconOnly)
                .foregroundStyle(.white)
                .imageScale(.large)
            }
        }
        .padding(10)
        .padding(.horizontal, 10)
        .background(Color.darkGray)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
        .onTapGesture {
            withAnimation {
                playerViewModel.height = 0
                playerViewModel.floating = false
            }
        }
    }
}

#Preview {
    FloatingPlayerView()
}

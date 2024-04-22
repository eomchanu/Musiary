//
//  MusicSearchView.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/12/24.
//

import SwiftUI

struct MusicSearchView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var query: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                if !query.isEmpty {
                    ScrollView {
                        VStack {
                            SearchMusicRow(cover: "lifes_like_cover", title: "아까워", artist: "재지팩트")
                            SearchMusicRow(cover: "lifes_like_cover", title: "Close To You", artist: "재지팩트")
                            SearchMusicRow(cover: "lifes_like_cover", title: "?!. (feat. DJ Pumkin", artist: "재지팩트")
                            SearchMusicRow(cover: "lifes_like_cover", title: "Mom's Call (feat. Verbal Jint)", artist: "재지팩트")
                        }
                    }
                } else {
                    HStack {
                        Text("음악을 찾아\n오늘의 기록을 남겨보세요!")
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                    .padding(.leading)
                }
            }
            .padding(.top, 30)
            .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("완료") {
                        // TODO: 음악 선택 로직 구현
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("닫기") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    MusicSearchView()
}

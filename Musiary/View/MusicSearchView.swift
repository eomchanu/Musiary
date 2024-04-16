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
                            SearchMusicRow(cover: "giriboy_cover1", title: "2000/90", artist: "기리보이")
                            SearchMusicRow(cover: "giriboy_cover1", title: "2000/90", artist: "기리보이")
                            SearchMusicRow(cover: "giriboy_cover1", title: "2000/90", artist: "기리보이")
                            SearchMusicRow(cover: "giriboy_cover1", title: "2000/90", artist: "기리보이")
                            SearchMusicRow(cover: "giriboy_cover1", title: "2000/90", artist: "기리보이")
                            SearchMusicRow(cover: "giriboy_cover1", title: "2000/90", artist: "기리보이")
                            SearchMusicRow(cover: "giriboy_cover1", title: "2000/90", artist: "기리보이")
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

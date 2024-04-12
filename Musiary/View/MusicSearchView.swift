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
                    VStack {
                        CustomDivider()
                        SearchMusicRow()
                        CustomDivider()
                        SearchMusicRow()
                        CustomDivider()
                        SearchMusicRow()
                        CustomDivider()
                        SearchMusicRow()
                        CustomDivider()
                        SearchMusicRow()
                        CustomDivider()
                        SearchMusicRow()
                        CustomDivider()
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

@ViewBuilder
func CustomDivider() -> some View {
    Rectangle()
        .frame(height: 1)
        .foregroundStyle(.gray.opacity(0.5))
        .padding(.horizontal)
}


#Preview {
    MusicSearchView()
}

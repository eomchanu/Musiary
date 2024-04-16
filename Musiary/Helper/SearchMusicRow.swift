//
//  SearchMusicRow.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/12/24.
//

import SwiftUI

struct SearchMusicRow: View {
    @State private var isSelected: Bool = false
    
    let cover: String
    let title: String
    let artist: String
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 0.3)
                .foregroundStyle(.gray.opacity(0.5))
                .padding(.leading, 70)
            HStack {
                Image(cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.subheadline)
                        .bold()
                    Text(artist)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                .padding(.leading, 10)
                Spacer()
                Image(systemName: "checkmark.circle")
                    .foregroundStyle(isSelected ? .accent : .gray)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchMusicRow(cover: "giriboy_cover1", title: "2000/90", artist: "기리보이")
}

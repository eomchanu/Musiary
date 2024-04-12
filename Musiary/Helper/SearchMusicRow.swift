//
//  SearchMusicRow.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/12/24.
//

import SwiftUI

struct SearchMusicRow: View {
    @State private var isSelected: Bool = false
    
    var body: some View {
        HStack {
            Image("giriboy_cover1")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            VStack(alignment: .leading, spacing: 5) {
                Text("2000/90")
                    .bold()
                Text("기리보이")
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 10)
            Spacer()
            Image(systemName: "checkmark.circle")
                .imageScale(.large)
                .foregroundStyle(isSelected ? .accent : .gray)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchMusicRow()
}

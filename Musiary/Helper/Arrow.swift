//
//  Arrow.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/11/24.
//

import SwiftUI

struct Arrow: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.accent)
                .frame(height: 5)
                .padding(8)
            HStack {
                Spacer()
                VStack {
                    Rectangle()
                        .foregroundStyle(.accent)
                        .frame(width: 23,height: 5)
                        .rotationEffect(.degrees(45))
                    Rectangle()
                        .foregroundStyle(.accent)
                        .frame(width: 23,height: 5)
                        .rotationEffect(.degrees(-45))
                }
            }
        }
    }
}

#Preview {
    Arrow()
}

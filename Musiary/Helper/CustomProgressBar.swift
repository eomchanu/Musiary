//
//  CustomProgressBar.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/18/24.
//

import SwiftUI

struct CustomProgressBar: View {
    @Binding var currentTime: Int
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(height: 8)
                    .foregroundStyle(.gray)
                    .padding(.top, 10)
                HStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 170)
                        .frame(height: 8)
                        .foregroundStyle(.accent)
                        .padding(.top, 10)
                    Spacer()
                }
            }
            HStack {
                Text("1:31")
                Spacer()
                Text("3:18")
            }
            .foregroundStyle(.gray)
            .font(.caption)
            .padding(.top, 3)
        }
    }
}

#Preview {
    CustomProgressBar(currentTime: .constant(10))
}

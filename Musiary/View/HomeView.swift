//
//  HomeView.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/11/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dateManager: DateManager
    
    @State private var showDiary: Bool = false
    @State private var selectedDate = Date.now
    
    var body: some View {
        VStack {
            HStack {
                Text("기록하기")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding()
            NavigationLink(value: "write") {
                Arrow()
                    .padding(.horizontal, 25)
                    .padding(.top, 30)
            }
            Image("border")
                .padding(.vertical, -20)
            HStack {
                Spacer()
                Text("지난 기록")
                    .font(.largeTitle)
                    .bold()
            }
            .padding(.horizontal)
            DatePicker("지난 기록", selection: $dateManager.selectedDate, in: ...Date.now, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .padding(10)
                .background(Color(cgColor: .init(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)).opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal, 30)
                .padding(.vertical, 5.5)
            HStack {
                Spacer()
                Button {
                    showDiary.toggle()
                } label: {
                    HStack {
                        VStack(alignment: .trailing) {
                            Text("\(dateManager.getSelectedMonth())월 \(dateManager.getSelectedDay())일")
                            Text("보러 가기")
                        }
                        Image(systemName: "chevron.forward.circle.fill")
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .fullScreenCover(isPresented: $showDiary){
            DiaryView()
        }
        .navigationDestination(for: String.self) { string in
            WriteDiaryView()
        }
    }
}

#Preview {
    HomeView()
}

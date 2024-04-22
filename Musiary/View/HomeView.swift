//
//  HomeView.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/11/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dateManager: DateManager
    @EnvironmentObject var playerViewModel: PlayerViewModel
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @EnvironmentObject var musicManager: MusicManager
    
    @State private var selectedDate = Date.now
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 1) {
                HStack {
                    Text("기록하기")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
//                Text("화살표를 눌러 새로운 기록을\n음악과 함께 남겨보세요!")
//                    .foregroundStyle(.gray)
            }
            .padding()
            
//            Spacer()
//                .frame(height: 10)
//            NavigationLink(value: "write") {
//                Arrow()
//                    .padding(.horizontal, 26)
//            }
            
            HStack {
                Spacer()
                NavigationLink(value: "write") {
                        Image(systemName: "arrow.right.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, -18)
            
            Image("border")
                .padding(.vertical, -20)
            
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text("지난 기록")
                        .font(.largeTitle)
                        .bold()
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
            
//            DatePicker("지난 기록", selection: $dateManager.selectedDate, in: ...Date.now, displayedComponents: .date)
//                .datePickerStyle(.graphical)
//                .padding(10)
//                .background(Color.darkGray.opacity(0.8))
//                .clipShape(RoundedRectangle(cornerRadius: 15))
//                .padding(.horizontal, 30)
//                .padding(.vertical, 5.5)
            
            MusicCalendarView(month: Date.now, addedDates: $diaryViewModel.diary)
            
            if diaryViewModel.diary.map({ dateManager.formatter.string(from: $0.date) }).contains(dateManager.formatter.string(from: dateManager.selectedDate)) {
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            playerViewModel.height = 0
                            playerViewModel.floating = false
                        }
                        musicManager.setupAudio()
                        // TODO: 이전 곡 stop
                    } label: {
                        HStack {
                            Text("\(dateManager.getSelectedMonth())월 \(dateManager.getSelectedDay())일 보러 가기")
                            Image(systemName: "chevron.forward.circle.fill")
                        }
                    }
                }
                .padding(.top, -20)
                .padding(.horizontal)

            }
            Spacer()
        }
        
        .navigationDestination(for: String.self) { string in
            WriteDiaryView()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(DateManager())
        .environmentObject(PlayerViewModel())
        .environmentObject(MusicManager())
}

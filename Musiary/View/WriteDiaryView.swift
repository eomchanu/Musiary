//
//  WriteDiaryView.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/11/24.
//

import SwiftUI

struct WriteDiaryView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var keyboardListener: KeyboardListener
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    
    @State private var selectedDate: Date = .now
    @State private var caption: String = ""
    @State private var showMusicSearchSheet: Bool = false
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                DatePicker(selection: $selectedDate, displayedComponents: .date, label: {
                    Text("날짜")
                        .font(.largeTitle)
                        .bold()
                })
                .datePickerStyle(.compact)
                
                Divider()
                    .padding(.top)
                
                HStack {
                    Text("음악")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                
                // TODO: 선택 음악 존재 시 MusicInfo
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 300)
                    .foregroundStyle(Color.darkGray)
                    .overlay {
                        VStack {
                            Button {
                                showMusicSearchSheet.toggle()
                            } label: {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(.accent)
                                    .padding()
                            }
                            Text("기록할 음악을 선택해보세요!")
                                .foregroundStyle(.gray)
                                .bold()
                        }
                    }
                    .padding(.vertical)
                
//                MusicInfo(cover: "giriboy_cover1", title: "2000/90", artist: "기리보이")
//                .padding(.bottom)
                
                Divider()
                
                HStack {
                    Text("캡션")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                TextEditor(text: $caption)
                    .padding()
                    .frame(height: 100)
                    .scrollContentBackground(.hidden)
                    .background(Color.darkGray.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .focused($isFocused)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button {
                                isFocused = false
                            } label: {
                                Text("완료")
                            }
                            
                        }
                    }
                    .padding(.bottom, 70)
                
                Spacer()
            }
            .padding()
            .navigationTitle("기록하기")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("저장하기") {
//                        var tempDiary = diaryViewModel.diary
//                        tempDiary.append(.init(date: selectedDate, musics: [.init(caption: caption)]))
//                        diaryViewModel.diary = tempDiary
//                        print("complete")
                        diaryViewModel.diary.append(.init(date: selectedDate, musics: [.init(caption: caption)]))
                        print(diaryViewModel.diary)
                        dismiss()
                    }
                }
            }
            .onChange(of: isFocused, { oldValue, newValue in
                keyboardListener.isKeyboardOn = newValue
            })
            .fullScreenCover(isPresented: $showMusicSearchSheet){
                MusicSearchView()
            }
        }
    }
}

@ViewBuilder
func MusicInfo(cover: String, title: String, artist: String) -> some View {
        // TODO: 커버 이미지 AsyncImage로 변경
        VStack {
            Image(cover)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(title)
                .font(.title3)
                .bold()
            Text(artist)
                .font(.system(size: 16))
                .foregroundStyle(.gray)
        }
}

#Preview {
    WriteDiaryView()
        .environmentObject(KeyboardListener())
        .environmentObject(DiaryViewModel())
}

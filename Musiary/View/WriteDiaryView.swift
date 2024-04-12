//
//  WriteDiaryView.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/11/24.
//

import SwiftUI

struct WriteDiaryView: View {
    @EnvironmentObject var keyboardListener: KeyboardListener
    
    @State private var selectedDate: Date = .now
    @State private var caption: String = ""
    @State private var showMusicSearchSheet: Bool = false
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("날짜")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                DatePicker("날짜", selection: $selectedDate, in: ...Date.now, displayedComponents: .date)
                .padding(.horizontal)
                .background(Color(cgColor: .init(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)).opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                .datePickerStyle(.wheel)
                .padding(.bottom)
                HStack {
                    Text("음악")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Button {
                        showMusicSearchSheet.toggle()
                    } label: {
                        Image(systemName: "chevron.forward.circle.fill")
                            .imageScale(.large)
                    }
                }
                .padding(.bottom)
                HStack {
                    Text("캡션")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                TextEditor(text: $caption)
                    .padding()
                    .frame(height: 150)
                    .scrollContentBackground(.hidden)
                    .background(Color(cgColor: .init(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)).opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
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
                
                Spacer()
            }
            .padding()
            .navigationTitle("기록하기")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("저장하기") {
                        // TODO: 저장 로직 구현
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

#Preview {
    WriteDiaryView()
}

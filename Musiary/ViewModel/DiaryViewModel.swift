//
//  DiaryViewModel.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/16/24.
//

import SwiftUI

class DiaryViewModel: ObservableObject {
    @Published var diary: [DiaryModel] = [
        .init(date: .now, musics: [
            .init(caption: "떠나자 여행 ✈️")
        ])
    ]
    
    // TODO: 선택된 다이어리 -> diary 배열에서 선택
    @Published var selectedDiary: DiaryModel = .init(date: .now, musics: [.init(caption: "떠나자 여행 ✈️")])
    
//    init() {
//        self.selectedDiary = diary[0]
//    }
}

//
//  DiaryModel.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/16/24.
//

import SwiftUI

struct DiaryModel: Identifiable, Hashable {
    var id: UUID = UUID()
    let date: Date
    var musics: [MusicModel]
}

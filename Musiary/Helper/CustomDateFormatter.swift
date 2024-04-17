//
//  CustomDateFormatter.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/16/24.
//

import SwiftUI

class CustomDateFormatter: ObservableObject {
    let formatter = DateFormatter()
    
    init() {
        formatter.dateFormat = "M월 D일 YYYY년"
    }
}

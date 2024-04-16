//
//  PlayerViewModel.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/13/24.
//

import SwiftUI

class PlayerViewModel: ObservableObject {
    @Published var height: CGFloat = CGFloat(UIScreen.main.bounds.height - 168)
    @Published var opacity: Double = 1
    @Published var floating: Bool = true
    @Published var isMoving: Bool = false
}

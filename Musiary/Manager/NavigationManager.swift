//
//  NavigationManager.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/11/24.
//

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
}

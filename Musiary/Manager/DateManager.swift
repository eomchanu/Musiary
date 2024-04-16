//
//  DateManager.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/12/24.
//

import SwiftUI

class DateManager: ObservableObject {
    @Published var selectedDate: Date = .now
    
    func getSelectedMonth() -> Int {
        return Calendar.current.dateComponents([.month], from: selectedDate).month!
    }
    func getSelectedYear() -> Int {
        return Calendar.current.dateComponents([.year], from: selectedDate).year!
    }
    func getSelectedDay() -> Int {
        return Calendar.current.dateComponents([.day], from: selectedDate).day!
    }
}

extension Date {
    func getMonth() -> Int {
        return Calendar.current.dateComponents([.month], from: self).month!
    }
    func getYear() -> Int {
        return Calendar.current.dateComponents([.year], from: self).year!
    }
    func getDay() -> Int {
        return Calendar.current.dateComponents([.day], from: self).day!
    }
}

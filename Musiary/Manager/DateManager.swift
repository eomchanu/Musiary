//
//  DateManager.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/12/24.
//

import SwiftUI

class DateManager: ObservableObject {
    @Published var selectedDate: Date = .now
    let formatter = DateFormatter()
    
    init() {
        formatter.dateFormat = "M월 dd일 YYYY년"
    }
    
    func getSelectedMonth() -> Int {
        return Calendar.current.dateComponents([.month], from: selectedDate).month!
    }
    func getSelectedYear() -> Int {
        return Calendar.current.dateComponents([.year], from: selectedDate).year!
    }
    func getSelectedDay() -> Int {
        return Calendar.current.dateComponents([.day], from: selectedDate).day!
    }
    func isSameDate(date: Date, targetDate: Date) -> Bool {
        return formatter.string(from: date) == formatter.string(from: targetDate)
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

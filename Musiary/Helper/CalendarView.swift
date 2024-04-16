//
//  Calendar.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/15/24.
//

import SwiftUI
import UIKit

struct CalendarView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let calendarViewController = UIViewController()
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarViewController.view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: calendarViewController.view.topAnchor),
            calendarView.leadingAnchor.constraint(equalTo: calendarViewController.view.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: calendarViewController.view.trailingAnchor),
            calendarView.bottomAnchor.constraint(equalTo: calendarViewController.view.bottomAnchor)
        ])
        
        return calendarViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the calendar view if needed
    }
}

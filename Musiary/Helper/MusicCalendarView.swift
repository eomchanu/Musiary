//
//  MusicCalendarView.swift
//  Musiary
//
//  Created by Eom Chanwoo on 4/15/24.
//

import SwiftUI

struct MusicCalendarView: View {
    @EnvironmentObject var dateManager: DateManager
    
    @State var month: Date
    @State var clickedDates: Set<Date> = []
    
    var body: some View {
        VStack {
                headerView
                calendarGridView
        }
        .padding([.leading, .bottom, .trailing])
    }
    
    // MARK: - 헤더 뷰
    private var headerView: some View {
        VStack {
            HStack {
                Button(action: {
                    changeMonth(by: -1)
                }, label: {
                    Image(systemName: "chevron.left")
                })
                .foregroundStyle(.accent)
                .buttonStyle(PlainButtonStyle())
                Spacer()
                
                Text(month, formatter: Self.dateFormatter)
                    .font(.system(size: 18))
                    .bold()
//                    .padding(.vertical, 8)
                
                Spacer()
                Button(action: {
                    changeMonth(by: 1)
                }, label: {
                    Image(systemName: "chevron.right")
                })
                .foregroundStyle(.accent)
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            
            HStack {
                ForEach(Self.weekdaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .font(.system(size: 14))
                        .foregroundStyle(.white)
                        .bold()
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 5)
        }
    }
    
    // MARK: - 날짜 그리드 뷰
    private var calendarGridView: some View {
        let daysInMonth: Int = numberOfDays(in: month)
        let firstWeekday: Int = firstWeekdayOfMonth(in: month) - 1
        
        return VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
                    if index < firstWeekday { // 지난달
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.clear)
                    } else { // 이번 달
                        let date = getDate(for: index - firstWeekday)
//                        let day = index - firstWeekday + 1
                        let clicked = clickedDates.contains(date)
                        
                        CellView(date: date, clicked: clicked)
                            .onTapGesture {
                                dateManager.selectedDate = date
                                if clicked {
                                  clickedDates.remove(date)
                                } else {
                                  clickedDates.insert(date)
                                }
                            }
                    }
                }
            }
            Spacer()
        }
        .frame(height: 300)
    }
}

// MARK: - 일자 셀 뷰
private struct CellView: View {
    @EnvironmentObject var dateManager: DateManager
    
    var date: Date
    var clicked: Bool = false
    let formatter = DateFormatter()
    
    init(date: Date, clicked: Bool) {
//        self.date = date
        formatter.dateFormat = "M월 D일 YYYY년"
        self.date = date
        self.clicked = clicked
    }
    
    // TODO: 기록 있는 날짜 표시 (현재는 clicked..)
    var body: some View {
        ZStack {
             if clicked {
                Circle()
                    .size(CGSize(width: 40, height: 40))
                    .foregroundStyle(Color.darkGray)
            }
            
            Text(String(date.getDay()))
                .font(.system(size: 16))
                .foregroundStyle(clicked ? .accent : .white)
                .bold(isSameDate(date: date, targetDate: dateManager.selectedDate) || isSameDate(date: date, targetDate: Date.now) || clicked ? true : false)
                .foregroundStyle(isSameDate(date: date, targetDate: dateManager.selectedDate) ? .accent : .white)
        }
        .frame(width:40, height: 40)
        .padding(.vertical, 2)
    }
    
    func isSameDate(date: Date, targetDate: Date) -> Bool {
        return formatter.string(from: date) == formatter.string(from: targetDate)
    }
}

// MARK: - 내부 메서드
private extension MusicCalendarView {
    /// 특정 해당 날짜
    private func getDate(for day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }
    
    /// 해당 월의 시작 날짜
    func startOfMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: month)
        return Calendar.current.date(from: components)!
    }
    
    /// 해당 월에 존재하는 일자 수
    func numberOfDays(in date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    /// 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
    func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        
        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    /// 월 변경
    func changeMonth(by value: Int) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
            self.month = newMonth
        }
    }
}

// MARK: - Static 프로퍼티
extension MusicCalendarView {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 YYYY년"
        return formatter
    }()
    
    static var weekdaySymbols = Calendar.current.shortWeekdaySymbols
}



#Preview {
    MusicCalendarView(month: .now)
}

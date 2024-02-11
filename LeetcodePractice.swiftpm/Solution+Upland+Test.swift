//
//  Solution+Upland+Test.swift
//  LeetcodePractice
//
//  Created by Mohit Kumar on 07/02/24.
//

import Foundation

extension Solution {
//    func solve() {
//        
//        let date1 = "12 Dec 2018 22:15:00 CST".toDate()!
//        let date2 = "Sunday 26/April/2020".toDate()!
//        let date3 = "6(Mon).1(Jan).2020".toDate()!
//        
//        let df = DateFormatter()
//        df.locale = Locale(identifier: "en_US_POSIX")
//        df.dateStyle = .full
//        df.timeStyle = .full
//        
//        print(df.string(from: date1))
//        print(df.string(from: date2))
//        print(df.string(from: date3))
        
//        let previousMonthDate = Calendar(identifier: .gregorian).date(byAdding: .day, value: 5, to: Date())
//        
//        
//        let df = DateFormatter()
//        df.dateFormat = "dd.MM.yyyy"
//        df.locale = Locale(identifier: "en_US_POSIX")
//        
//        let firstDate = df.date(from: "25.01.2020")!
//        let secondDate = df.date(from: "25.01.2020")!
//        let todayDate = firstDate
//        previousMonthDate?.nameOfDay
        
//        print(Date.numberOfDaysBetween(todayDate, and: previousMonthDate!))
//        print(firstDate.day)
//        print(firstDate.nameOfDay)
//        print(firstDate.month)
//        print(firstDate.nameOfTheMonth)
//        print(firstDate.year)
        
//        print(Date.numberOfDaysBetween(firstDate, and: secondDate))
//    }
}


extension String {
    func toDate() -> Date? {
        /// Check if string is valid
        guard !self.isEmpty else {
            return nil
        }
        
        /// Check with first date format
        let df = DateFormatter()
        df.dateFormat = "dd MMM yyyy HH:mm:ss zzz"
        df.locale = Locale(identifier: "en_US_POSIX")
        
        if let date = df.date(from: self) {
            return date
        }
        
        /// If first date format did not worked
        /// Check with second date format
        df.dateFormat = "EEEE dd/MMMM/yyyy"
        if let date = df.date(from: self) {
            return date
        }
        
        /// If second date format also did not work
        /// Check for third one
        df.dateFormat = "d(E).M(MMM).yyyy"
        if let date = df.date(from: self) {
            return date
        }
        
        /// If date format is not from all three then return nil
        return nil
    }
}

extension Date {
    var locale: Locale {
        return Locale(identifier: "en_US_POSIX")
    }
    
    var day: Int? {
        getDataComponent(date: self, component: .day).day
    }

    var nameOfDay: String {
        let df = DateFormatter()
        df.locale = locale
        df.dateFormat = "EEEE"
        return df.string(from: self)
    }

    var month: Int? {
        getDataComponent(date: self, component: .month).month
    }

    var nameOfTheMonth: String {
        let df = DateFormatter()
        df.locale = locale
        df.dateFormat = "LLLL"
        return df.string(from: self)
    }

    var year: Int? {
        getDataComponent(date: self, component: .year).year
    }

    static func numberOfDaysBetween(_ date: Date, and date2: Date) -> Int? {
        var calendar = Calendar.current
        calendar.locale = date.locale
        return abs(calendar.dateComponents([.day], from: date, to: date2).day ?? 0)
    }
    
    private func getDataComponent(date: Date, component: Calendar.Component) -> DateComponents {
        var calendar = Calendar.current
        calendar.locale = locale
        return calendar.dateComponents([component], from: date)
    }
}

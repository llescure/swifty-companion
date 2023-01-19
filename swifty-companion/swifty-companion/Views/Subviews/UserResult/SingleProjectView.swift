//
//  SingleProjectView.swift
//  swifty-companion
//
//  Created by Léa Lescure on 19/01/2023.
//

import SwiftUI

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
}

struct SingleProjectView: View {
    var project: Project42
    
    var body: some View {
        HStack(spacing: 50) {
            HStack(spacing: 0) {
                Text(project.project.name)
                    .foregroundColor(isProjectValidated ? Color("GreenOkProject") : Color("RedFail"))
                    .bold()
                Text(" - " + durationSinceTheProjectWasDone)
            }
            Text(mark)
                .foregroundColor(isProjectValidated ? Color("GreenOkProject") : Color("RedFail"))
                .bold()
        }
    }
    
    var mark: String {
        guard let mark: Int = project.final_mark else {
            print("Error: This project was not marked")
            return ""
        }
        return String(mark)
    }
    
    var isProjectValidated: Bool {
        guard let projectMark: Int = project.final_mark else {
            print("Error: No status for this project")
            return false
        }
        if (projectMark >= 80) {
            return true
        }
        return false
    }
    
    var durationSinceTheProjectWasDone: String {
        guard let projectDateStr: String = project.marked_at else {
            print("Error: The project was not marked")
            return ""
        }
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let projectDate = dateFormatter.date(from:projectDateStr)
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour], from: projectDate!)
        let finalProjectDate = calendar.date(from:components)
        
        let years = currentDate.years(from: finalProjectDate!)
        let months = currentDate.months(from: finalProjectDate!)
        let weeks = currentDate.weeks(from: finalProjectDate!)
        let days = currentDate.days(from: finalProjectDate!)
        let hours = currentDate.hours(from: finalProjectDate!)
        let minutes = currentDate.minutes(from: finalProjectDate!)
        let seconds = currentDate.seconds(from: finalProjectDate!)
        
        if (years > 0) {
            let SingleOrMultipleyears = years == 1 ? " year ago" : " years ago"
            return String(years) + SingleOrMultipleyears
        }
        else if (months > 0) {
            let SingleOrMultiplemonths = months == 1 ? " month ago" : " months ago"
            return String(months) + SingleOrMultiplemonths
        }
        else if (weeks > 0) {
            let SingleOrMultipleWeeks = weeks == 1 ? " week ago" : " weeks ago"
            return String(weeks) + SingleOrMultipleWeeks
        }
        else if (days > 0) {
            let SingleOrMultipleDays = days == 1 ? " day ago" : " days ago"
            return String(days) + SingleOrMultipleDays
        }
        else if (hours > 0) {
            let SingleOrMultipleHours = hours == 1 ? " hour ago" : " hours ago"
            return String(hours) + SingleOrMultipleHours
        }
        else if (minutes > 0) {
            let SingleOrMultipleMinutes = minutes == 1 ? " minute ago" : " minutes ago"
            return String(minutes) + SingleOrMultipleMinutes
        }
        else {
            let SingleOrMultipleSeconds = seconds == 1 ? " second ago" : " secondes ago"
            return String(seconds) + SingleOrMultipleSeconds
        }
    }
}

struct SingleProjectView_Previews: PreviewProvider {
    static var previews: some View {
        SingleProjectView(project: Project42(id: 278708, final_mark: 100, status: "finished", project: ProjectName(name: "ft_transcendence"), cursus_ids: [21], marked_at: "2022-12-09T16:32:48.759Z"))
    }
}

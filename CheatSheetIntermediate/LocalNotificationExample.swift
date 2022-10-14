//
//  LocalNotificationExample.swift
//  CheatSheetIntermediate
//
//  Created by Zachary on 14/10/22.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    
    static let instance = NotificationManager() // singtleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "Notification Title"
        content.subtitle = "Here's the subtitle"
        content.sound = .default
        content.badge = 1
        
        // 3 types of trigger
        // time, calender, location
        
        // time
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        // calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 18
//        dateComponents.minute = 27
//        dateComponents.weekday = 1
//        dateComponents.weekOfYear = 1
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // location
        let coordinates = CLLocationCoordinate2D(
            latitude: 40.00,
            longitude: 50.00)
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}

struct LocalNotificationExample: View {
    var body: some View {
        VStack (spacing:40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule notifications") {
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel notifications") {
                NotificationManager.instance.cancelNotifications()
            }
        }
        .onAppear() {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationExample_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationExample()
    }
}

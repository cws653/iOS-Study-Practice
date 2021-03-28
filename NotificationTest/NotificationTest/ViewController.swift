//
//  ViewController.swift
//  NotificationTest
//
//  Created by 최원석 on 2021/03/28.
//

import UIKit
import NotificationCenter

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.addTarget(self, action: #selector(changedDatePicker), for: .valueChanged)

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert], completionHandler: { (didAllow, error) in

        })
        UNUserNotificationCenter.current().delegate = self
    }

    @objc func changedDatePicker() {
        let content = UNMutableNotificationContent()
        content.title = "This is title"
        content.subtitle = "This is Subtitle : UserNotifications tutorial"
        content.body = "This is Body : 블로그 글 쓰기"
        content.summaryArgument = "Alan Walker"
        content.summaryArgumentCount = 40

        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.calendar, .day, .hour, .minute], from: datePicker.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)

        let request = UNNotificationRequest(identifier: "timerdone", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

    @IBAction func notifcationButtonAction(_ sender: UIButton) {
        for index in 1...5 {

            //Setting content of the notification
            let content = UNMutableNotificationContent()
            content.title = "This is title"
            content.subtitle = "This is Subtitle : UserNotifications tutorial"
            content.body = "This is Body : 블로그 글 쓰기"
            content.summaryArgument = "Alan Walker"
            content.summaryArgumentCount = 40

            //Setting time for notification trigger
            //블로그 예제에서는 TimeIntervalNotificationTrigger을 사용했지만, UNCalendarNotificationTrigger사용법도 같이 올려놓을게요!

            //1. Use UNCalendarNotificationTrigger
//            let date = Date(timeIntervalSinceNow: 0.1)
//            var dateCompenents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//
//            let calendartrigger = UNCalendarNotificationTrigger(dateMatching: dateCompenents, repeats: true)


            //2. Use TimeIntervalNotificationTrigger
            let TimeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)

            //Adding Request
            // MARK: - identifier가 다 달라야만 Notification Grouping이 됩니닷..!!
            let request = UNNotificationRequest(identifier: "\(index)timerdone", content: content, trigger: TimeIntervalTrigger)

            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
}

extension ViewController : UNUserNotificationCenterDelegate {
    //To display notifications when app is running  inforeground

    //앱이 foreground에 있을 때. 즉 앱안에 있어도 push알림을 받게 해줍니다.
    //viewDidLoad()에 UNUserNotificationCenter.current().delegate = self를 추가해주는 것을 잊지마세요.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        let settingsViewController = UIViewController()
        settingsViewController.view.backgroundColor = .red
        self.present(settingsViewController, animated: true, completion: nil)

    }
}

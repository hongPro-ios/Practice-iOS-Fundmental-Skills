//
//  ViewController.swift
//  UserNotificationPratice
//
//  Created by JEONGSEOB HONG on 2021/05/19.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter
            .current()
            .requestAuthorization(
                options: [.alert, .sound, .badge],
                completionHandler: {didAllow, Error in })
        //completionHandler의 원형 : completionHandler: (Bool, Error?) -> Void)

    }

    @IBAction func pushPressed(_ sender: Any) {
        // 알림 구성
        let content = UNMutableNotificationContent()
        content.title = "Test push this is title"
        content.subtitle = "UserNotifications this is subtitle"
        content.body = "This is Body"
        content.badge = 1
        
        // 알림 트리거
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        // 알림요청
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        
        // 알림요청을 알림센터에 추가
        UNUserNotificationCenter.current().add(request,
                                               withCompletionHandler: nil)
        
        
    }
    
}


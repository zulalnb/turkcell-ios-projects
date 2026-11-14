//
//  ViewController.swift
//  NotificationCenterBasics
//
//  Created by Zülal Nebin on 14.11.2026.
//

import UIKit

class ViewController: UIViewController {
    
    // Uygulama içindeki olayları birçok bölüm dinleyebilir ve dinleyiciler kendi işlemlerini yapmak isteyebilir.
    // Buna NotificationCenter ile yapıyoruz.
    
    // Cihazlara bildirim göndermemizi sağlayan yapıya Push Notification denir.
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: Notification Observers
        
        // Custom Notification
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleCustomNotification),
                                               name: .didReceiveCustomNotification,
                                               object: nil)
        
        // TextField Notifications
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textFieldDidBeginEditing),
                                               name: UITextField.textDidBeginEditingNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textFieldDidChange),
                                               name: UITextField.textDidChangeNotification,
                                               object: nil)
        
        // Keyboard Notifications
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidHide),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    // MARK: - Custom Notification
    
    @objc func handleCustomNotification(_ notification: Notification) {
        print("Bildirim alındı.")

        if let message = notification.userInfo?["message"] as? String {
            print(message)
        }
    }
    
    
    @IBAction func dismissKeyboardButtonTapped(_ sender: Any) {
        textField.endEditing(true)
        
    }
    
    // MARK: - TextField Notifications
    
    @objc func textFieldDidBeginEditing() {
        statusLabel.text = "Metin alanında düzenleme başladı."
    }
    
    @objc func textFieldDidChange() {
        statusLabel.text = "Metin alanı içeriği değişti."
    }
    
    // MARK: - Keyboard Notifications
    
    @objc func keyboardDidShow() {
        statusLabel.text = "Klavye açıldı."
    }
    
    @objc func keyboardDidHide() {
        statusLabel.text = "Klavye kapandı."
    }
    
    // MARK: - Local Notifications
    
    @IBAction func scheduleLocalNotificationTapped(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Bildirim Başlığı"
        content.subtitle = "Bildirim Alt Başlığı"
        content.body = "Bildirim İçeriği"
        
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 5,
            repeats: false
        )
        
        let request = UNNotificationRequest(
            identifier: "localNotification",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
}


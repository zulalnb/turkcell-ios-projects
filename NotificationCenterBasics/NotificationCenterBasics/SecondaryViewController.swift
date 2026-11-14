//
//  SecondaryViewController.swift
//  NotificationCenterBasics
//
//  Created by Zülal Nebin on 14.11.2026.
//

import UIKit

class SecondaryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createNotificaitonButtonTapped(_ sender: Any) {
        
        let userInfo = ["message": "Gönderilen metin"]
        NotificationCenter.default.post(name: .didReceiveCustomNotification,
                                        object: nil,
                                        userInfo: userInfo)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

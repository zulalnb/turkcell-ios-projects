//
//  ViewController.swift
//  EventTimeTracker
//
//  Created by Zülal Nebin on 29.10.2026.
//

import UIKit

class ViewController: UIViewController {
    
    // Ekranın açılış zamanını ve ekranda bulunan butona tıklanma zamanının ekranda gösterilmesi
    @IBOutlet weak var lblScreenTime: UILabel!
    @IBOutlet weak var lblTapTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let str = getTime()
        lblScreenTime.text = str
    }
    
    @IBAction func btnTap_TUI(_ sender: Any) {
        lblTapTime.text = getTime()
    }
    
    func getTime() -> String {
        let time = Date()
        
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy HH:mm:ss"
        
        return df.string(from: time)
    }
    
}


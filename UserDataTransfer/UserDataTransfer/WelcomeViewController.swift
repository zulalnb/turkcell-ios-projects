//
//  WelcomeViewController.swift
//  UserDataTransfer
//
//  Created by Zülal Nebin on 30.10.2026.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var fullname: String?
    @IBOutlet weak var lblFullname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        lblFullname.text = fullname
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

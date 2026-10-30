//
//  ViewController.swift
//  UserDataTransfer
//
//  Created by Zülal Nebin on 30.10.2026.
//

import UIKit

class ViewController: UIViewController {
    
    // İlk ekranda ad, soyad ve kod alınacak. Girilen kod "123" ise ikinci ekrana girilen ad soyad bilgisi gönderilecek ve tasarlanacak olan üst barda gösterilecek.
    
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogin_TUI(_ sender: Any) {
        if tfCode.text == "123" {
            performSegue(withIdentifier: "sgPassUserData", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgPassUserData" {
            let welcomeVC = segue.destination as! WelcomeViewController
            welcomeVC.fullname = tfFirstName.text! + " " + tfLastName.text!
            
        }
    }
    
    
}


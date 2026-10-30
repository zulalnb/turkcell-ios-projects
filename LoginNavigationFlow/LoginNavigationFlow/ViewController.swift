//
//  ViewController.swift
//  LoginNavigationFlow
//
//  Created by Zülal Nebin on 30.10.2026.
//

import UIKit

class ViewController: UIViewController {
    
    // Kullanıcı adı ve şifre olan bir login ekranı tasarlanacak.
    // Kullanıcı adı ve şifreye a değeri girildiğinde uygulama anasayfa ekranına gidecek.
    // Anasayfadan login ekranına tekrar geri gelinemeyecek.
    // Kullanıcı adı ve şifre a'dan farklı ise üye ol ekranına gidecek.
    // Üye ol ekranından login ekranına geri gelinebilecek.
    
    
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnSignIn_TUI(_ sender: Any) {
        
        if tfUsername.text == "a" && tfPassword.text == "a" {
            performSegue(withIdentifier: "sgHome", sender: nil)
            navigationController?.viewControllers.remove(at: 0)
        } else {
            performSegue(withIdentifier: "sgSignUp", sender: nil)
        }
    }
    
}


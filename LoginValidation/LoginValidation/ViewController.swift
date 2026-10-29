//
//  ViewController.swift
//  LoginValidation
//
//  Created by Zülal Nebin on 29.10.2026.
//

import UIKit

class ViewController: UIViewController {
    
    // Kullanıcı adı ve şifrenin girilebileceği bir login ekranı tasarlanacak. giriş butonuna basıldığında alanlar kontrol edilecek
    
    // Alanlar boş ise print ile boş uyarısı verilecek
    // Dolu ise değer kontrolü yapılarak başarılı ya da başarısız yazdırılacak
    
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogin_TUI(_ sender: Any) {
        if tfUsername.text != "" && tfPassword.text != "" {
            if tfUsername.text == "a" && tfPassword.text == "s" {
                print("Giriş Başarılı")
            } else {
                print("Giriş Başarısız")
            }
        } else {
            print("Kullanıcı adı ve şifre boş olamaz")
        }
    }
    
}


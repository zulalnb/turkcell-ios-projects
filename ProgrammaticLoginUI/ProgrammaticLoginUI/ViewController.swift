//
//  ViewController.swift
//  AutoLayoutLoginLayout
//
//  Created by Zülal Nebin on 30.10.2026.
//

import UIKit

class ViewController: UIViewController {
    
    // Storyboard kullanılmaksızın ekranda kullanılan kullanıcı adı ve şifre text field'larının ve giriş yap butonunun bulunduğu login ekranının tasarlanması.
    // Tasarımda giriş için kullanılan alan ekranın ortasına yakın olacaktır.

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tfUsername = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tfUsername.placeholder = "Kullanıcı Adı"
        tfUsername.backgroundColor = .white
        tfUsername.borderStyle = .roundedRect
        tfUsername.textColor = .black
        tfUsername.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(tfUsername)
        
        let tfPassword = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tfPassword.placeholder = "Şifre"
        tfPassword.backgroundColor = .white
        tfPassword.borderStyle = .roundedRect
        tfPassword.textColor = .black
        tfPassword.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(tfPassword)
        
        let btnSignIn = UIButton()
        btnSignIn.setTitle("Giriş Yap", for: .normal)
        btnSignIn.backgroundColor = .blue
        btnSignIn.titleLabel?.textColor = .black
        btnSignIn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(btnSignIn)
        
        tfUsername.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tfUsername.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tfUsername.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            tfUsername.heightAnchor.constraint(equalToConstant: 50),
            tfUsername.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tfPassword.topAnchor.constraint(equalTo: tfUsername.bottomAnchor, constant: 10),
            tfPassword.leadingAnchor.constraint(equalTo: tfUsername.leadingAnchor, constant: 0),
            tfPassword.trailingAnchor.constraint(equalTo: tfUsername.trailingAnchor, constant: 0),
            tfPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        btnSignIn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            btnSignIn.topAnchor.constraint(equalTo: tfPassword.bottomAnchor, constant: 10),
            btnSignIn.leadingAnchor.constraint(equalTo: tfPassword.leadingAnchor, constant: 0),
            btnSignIn.trailingAnchor.constraint(equalTo: tfPassword.trailingAnchor, constant: 0),
            btnSignIn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}


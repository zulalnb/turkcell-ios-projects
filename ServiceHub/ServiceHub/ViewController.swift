//
//  ViewController.swift
//  ServiceHub
//
//  Created by Zülal Nebin on 10.11.2026.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Uygulama açılışında tüm hizmet veren kişilerin adı, soyadı ve hizmet konusu listelenecektir.
    // Eğer kullanıcı hizmet vermek isterse giriş yapması gerekecektir.
    // Ekranda giriş yap butonu bulunacaktır. Bu butona basıldığında kullanıcı giriş ekranı açılacaktır.
    // Giriş eposta ve şifre ile olacaktır.
    // Giriş ekranında kullanıcıdan ad, soyad ve hizmet bilgileri alınacaktır.
    // Giriş yaptıktan sonra ana ekrana geri dönülecek ve giriş yap butonu kaybolacaktır.
    // Uygulama açıldığında kullanıcı daha önce giriş yapmışsa otomatik giriş yapmış olacaktır.
    
    @IBOutlet weak var serviceProvidersTableView: UITableView!
    @IBOutlet weak var signInButton: UIButton!
    
    var users: [User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if Auth.auth().currentUser != nil {
            signInButton.isHidden = true
        }
        
        Database.database().reference().child("users").observe(.value) { snapshot in
            var user: User
            
            if self.users == nil {
                self.users = []
            } else {
                self.users?.removeAll()
            }
            
            for userSnapshot in snapshot.children {
                let value = (userSnapshot as! DataSnapshot).value as! NSDictionary
                
                user = User()
                user.firstName = value["firstName"] as? String
                user.lastName = value["lastName"] as? String
                user.serviceCategory = value["serviceCategory"] as? String
                
                self.users?.append(user)
            }
            self.serviceProvidersTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if users != nil {
            return users!.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ServiceProviderTableViewCell", owner: self, options: nil)?.first as! ServiceProviderTableViewCell
        
        let user = users![indexPath.row]
        
        cell.fullNameLabel.text = "\(user.firstName ?? "") \(user.lastName ?? "")"
        cell.serviceCategoryLabel.text = user.serviceCategory
        
        return cell
    }
    
    
}


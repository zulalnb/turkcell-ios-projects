//
//  SignInViewController.swift
//  ServiceHub
//
//  Created by Zülal Nebin on 10.11.2026.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var serviceCategoryTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard
            let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let serviceCategory = serviceCategoryTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            let password = passwordTextField.text,
            !firstName.isEmpty,
            !lastName.isEmpty,
            !serviceCategory.isEmpty,
            !email.isEmpty,
            !password.isEmpty
                else {
            showAlert(message: "Please fill in all fields.")
            return
        }
        
        createAccount(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName,
            serviceCategory: serviceCategory
        )
    }
    
    func createAccount(
        email: String,
        password: String,
        firstName: String,
        lastName: String,
        serviceCategory: String
    ) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let error {
                self.showAlert(message: error.localizedDescription)
                return
            }
            
            guard let userID = authResult?.user.uid else {
                self.showAlert(message: "User ID could not be retrieved.")
                return
            }
            
            self.saveService(
                userID: userID,
                firstName: firstName,
                lastName: lastName,
                serviceCategory: serviceCategory
            )
        }
    }
    
    func saveService(
        userID: String,
        firstName: String,
        lastName: String,
        serviceCategory: String
    ) {
        let userData: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "serviceCategory": serviceCategory
        ]
        
        let ref = Database.database()
            .reference()
            .child("users")
            .child(userID)
        
        ref.setValue(userData) { error, _ in
            
            if let error {
                self.showAlert(message: error.localizedDescription)
                return
            }
            
            self.dismiss(animated: true)
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(
            title: "ServiceHub",
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
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

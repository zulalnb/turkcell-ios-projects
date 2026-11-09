//
//  ContactFormViewController.swift
//  ContactManagerCoreData
//
//  Created by Zülal Nebin on 9.11.2026.
//

import UIKit
import CoreData

class ContactFormViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if contact != nil {
            firstNameTextField.text = contact!.firstName
            lastNameTextField.text = contact!.lastName
            emailTextField.text = contact!.email
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        guard !firstName.isEmpty,
              !lastName.isEmpty,
              !email.isEmpty else {
            let alert = UIAlertController(
                title: "Missing Information",
                message: "Please fill in all fields.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if let contact {
            // Update existing contact
            contact.firstName = firstName
            contact.lastName = lastName
            contact.email = email
        } else {
            // Create new contact
            let entity = NSEntityDescription.entity(forEntityName: "Contact", in: context)!
            let newContact = NSManagedObject(entity: entity, insertInto: context)
            
            newContact.setValue(firstName, forKey: "firstName")
            newContact.setValue(lastName, forKey: "lastName")
            newContact.setValue(email, forKey: "email")
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
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

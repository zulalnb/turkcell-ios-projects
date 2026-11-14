//
//  ViewController.swift
//  ContactsMVVM
//
//  Created by Zülal Nebin on 14.11.2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contacts = ContactsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts.populateContacts()
        
        contactsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return contacts.contactCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let contact = contacts.contactViewModel(at: indexPath.row)
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(contact.firstName) \(contact.lastName)"
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}


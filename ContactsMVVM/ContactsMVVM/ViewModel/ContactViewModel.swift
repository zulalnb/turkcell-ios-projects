//
//  ContactViewModel.swift
//  ContactsMVVM
//
//  Created by Zülal Nebin on 14.11.2026.
//

import Foundation

struct ContactViewModel {
    let contact: Contact

    var firstName: String { contact.firstName }
    var lastName: String { contact.lastName }
}

struct ContactsViewModel {
    private(set) var contacts = [Contact]()

    var contactCount: Int {
        contacts.count
    }

    func contactViewModel(at index: Int) -> ContactViewModel {
        let contact = contacts[index]
        return ContactViewModel(contact: contact)
    }

    mutating func populateContacts() {
        contacts.append(Contact(firstName: "Zülal", lastName: "Nebin"))
        contacts.append(Contact(firstName: "Ahmet", lastName: "Yılmaz"))
        contacts.append(Contact(firstName: "Ayşe", lastName: "Demir"))
    }
}

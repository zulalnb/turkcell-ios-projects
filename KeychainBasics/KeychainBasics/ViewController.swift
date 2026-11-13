//
//  ViewController.swift
//  KeychainBasics
//
//  Created by Zülal Nebin on 13.11.2026.
//

import UIKit
import Security

class ViewController: UIViewController {
    
    let account = "userPassword"
    let password = "123456"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createItem()
        readItem()
        updateItem()
        readItem()
        
        deleteItem()
        readItem()
    }
    
    func createItem() {
        let query = [
            kSecValueData: password.data(using: .utf8)!,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword
        ] as CFDictionary
        
        let status = SecItemAdd(query, nil)
        print(status)
    }
    
    func readItem() {
        let query = [
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)
        
        if status == errSecSuccess {
            let password = String(data: result as! Data, encoding: .utf8)
            print(password)
        }
    }
    
    func updateItem() {
        let query = [
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword
        ] as CFDictionary
        
        let data = [
            kSecValueData: "12345678".data(using: .utf8)!
        ] as CFDictionary
        
        let status = SecItemUpdate(query, data)
        print(status)
    }
    
    func deleteItem() {
        let query = [
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword
        ] as CFDictionary
        
        let status = SecItemDelete(query)
        print(status)
    }
    
    
}


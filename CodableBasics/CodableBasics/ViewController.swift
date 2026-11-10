//
//  ViewController.swift
//  CodableBasics
//
//  Created by Zülal Nebin on 10.11.2026.
//


import UIKit

class ViewController: UIViewController {
    
    // Codable, Swift nesneleri ile JSON verileri arasında dönüşüm yapmamızı sağlar.
    // Encodable: Swift nesnesini JSON verisine dönüştürür.
    // Decodable: JSON verisini Swift nesnesine dönüştürür.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let person = Person(firstName: "John", lastName: "Doe")
        
        // MARK: - Encoding (Object to JSON)
        
        let encoder = JSONEncoder()
        
        do {
            let jsonData = try encoder.encode(person)
            
            let jsonString = String(data: jsonData, encoding: .utf8)
            print("Encoded JSON:", jsonString ?? "")
            
            // MARK: - Decoding (JSON to Object)
            
            let decoder = JSONDecoder()
            let decodedPerson = try decoder.decode(Person.self, from: jsonData)
            
            print("Decoded first name:", decodedPerson.firstName)
            
        } catch {
            print("Codable error:", error.localizedDescription)
        }
    }
}

struct Person: Codable {
    var firstName: String
    var lastName: String
    
    /*
     // MARK: - Alternative: CodingKeys
     
     // JSON key isimleri Swift property isimlerinden farklıysa
     // CodingKeys kullanarak eşleştirme yapabiliriz.
     
     enum CodingKeys: String, CodingKey {
         case firstName = "name"
         case lastName = "surname"
     }
     */
}

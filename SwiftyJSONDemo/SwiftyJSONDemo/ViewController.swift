//
//  ViewController.swift
//  SwiftyJSONDemo
//
//  Created by Zülal Nebin on 10.11.2026.
//

import UIKit
import SwiftyJSON

// SwiftyJSON kütüphanesini kullanarak gerek internet kaynaklı
// gerekse başka kaynaklardan elde ettiğiniz JSON formatındaki değerlerinizi
// böylece nesnelerinize dönüştürebilirsiniz.
// SwiftyJSON dökümanlarını incelediğinizde çok daha farklı kullanımların olduğunu
// göreceksiniz. Bu kullanım farklılıkları bazen güvenlik kaynakları iken
// bazen de nesne farklılıklarından kaynaklanmaktadır.

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // "{\"firstName\": \"John\", \"lastName\": \"Doe\"}"
        // "[{\"firstName\": \"John\", \"lastName\": \"Doe\"}, {\"firstName\": \"James\", \"lastName\": \"Wick\"}]"
        
        let jsonStr = "{\"firstName\": \"John\", \"lastName\": \"Doe\"}"
        
        if let strData = jsonStr.data(using: .utf8) {
            let json = JSON(strData)
            
            let person = Person()
            person.firstName = json["firstName"].stringValue
            person.lastName = json["lastName"].stringValue
            
            print(person.firstName)
        }
        
        let strArrJson = "[{\"firstName\": \"John\", \"lastName\": \"Doe\"}, {\"firstName\": \"James\", \"lastName\": \"Wick\"}]"
        
        var personList = [Person]()
        
        if let strData = strArrJson.data(using: .utf8) {
            let json = JSON(strData)
            
            var person: Person
            for j in json.arrayValue {
                person = Person()
                person.firstName = j["firstName"].stringValue
                person.lastName = j["lastName"].stringValue
                personList.append(person)
            }
        }
        
        print(personList[0].firstName, personList[1].firstName)
    }
    
    
}

class Person {
    var firstName = ""
    var lastName = ""
}

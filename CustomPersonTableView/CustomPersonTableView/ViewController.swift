//
//  ViewController.swift
//  CustomPersonTableView
//
//  Created by Zülal Nebin on 1.11.2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Ad, soyad ve cinsiyet bilgilerini barındıran bir kişi listesini tableView içinde gösterilmesi
    

    @IBOutlet weak var peopleTableView: UITableView!
    var personList: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        personList.append(Person(firstName: "John", lastName: "Doe", gender: "M"))
        personList.append(Person(firstName: "Jane", lastName: "Smith", gender: "F"))
        personList.append(Person(firstName: "Michael", lastName: "Johnson", gender: "M"))
        
        peopleTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("PersonTableViewCell", owner: self, options: nil)?.first as! PersonTableViewCell
        
        let person = personList[indexPath.row]
        cell.fullnameLabel.text = person.firstName + " " + person.lastName
        
        if person.gender == "M" {
            cell.genderImageView.image = .male
        } else {
            cell.genderImageView.image = .female
        }
        
        return cell
    }


}


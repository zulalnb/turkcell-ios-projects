//
//  ViewController.swift
//  ContactManagerCoreData
//
//  Created by Zülal Nebin on 5.11.2026.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /*
     Giriş ekranında kişi listesi bulunacak.
     Ekranın sağ üst köşesindeki + butonuna basıldığında yeni kişi ekleme sayfası açılacak.
     Yeni ekleme sayfasında kişilerin ad, soyad, eposta bilgileri alınacak ve kaydet butonuna basıldığında bilgiler veritabanına kaydedilecek.
     Kayıt işlemi sonrası giriş ekranına geri dönülecek ve yeni kişi listeye eklenecek.
     Listede veriler alfabetik olarak sıralı gelecek.
     Listedeki elemana basıldığında düzenleme ekranına gidilecek ve kişiler güncellenecek. Düzenleme ekranı yeni ekrama ekranı ile aynı tasarıma sahip olacak.
     Listedeki eleman sola çekildiğinde silinebilecek.
     */
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contacts: [Contact]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchContacts()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if contacts != nil {
            return contacts!.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = contacts![indexPath.row].firstName! + " " + contacts![indexPath.row].lastName!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sgEditContact", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgEditContact" {
            let destinationViewController = segue.destination as! ContactFormViewController
            destinationViewController.contact = contacts![sender as! Int]
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.delete(contacts![indexPath.row])
            
            fetchContacts()
        }
    }
    
    
    func fetchContacts() {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "firstName", ascending: true)]
        
        do {
            contacts = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fetchRequest)
            
            contactsTableView.reloadData()
        } catch {
            
        }
    }
    
    
}


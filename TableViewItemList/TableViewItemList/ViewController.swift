//
//  ViewController.swift
//  TableViewItemList
//
//  Created by Zülal Nebin on 31.10.2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Ekranda bulunan metin alanından girilen değerin ekleme butonuna basıldığında alttaki listeye eklenmesi
    
    @IBOutlet weak var tfItem: UITextField!
    @IBOutlet weak var tvList: UITableView!
    
    var list: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAdd_TUI(_ sender: Any) {
        let item = tfItem.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        guard !item.isEmpty else {
            return
        }
        
        list.append(item)
        tvList.reloadData()
        
        tfItem.text = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tvList.reloadData()
        }
    }
    
}


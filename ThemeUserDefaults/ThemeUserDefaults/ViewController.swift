//
//  ViewController.swift
//  ThemeUserDefaults
//
//  Created by Zülal Nebin on 5.11.2026.
//

import UIKit

class ViewController: UIViewController {
    
    // UserDefaults kullanılarak kullanıcının seçtiği tema kaydedilecek.
    // Açık ve koyu tema seçenekleri olacak.
    // Kullanıcı tema seçimini değiştirdiğinde tercihi UserDefaults'a kaydedilecek.
    // Uygulama yeniden açıldığında kayıtlı temayı okuyarak ilgili temayı uygulanacak.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyTheme()
    }
    
    @IBAction func btnDarkMode_TUI(_ sender: Any) {
        saveTheme(theme: "dark")
    }
    
    
    @IBAction func btnLightMode_TUI(_ sender: Any) {
        saveTheme(theme: "light")
    }
    
    
    func saveTheme(theme: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(theme, forKey: "theme")
        
        applyTheme()
    }
    
    func applyTheme() {
        let userDefaults = UserDefaults.standard
        let selectedTheme = userDefaults.string(forKey: "theme") ?? "light"
        
        switch selectedTheme {
        case "dark":
            view.backgroundColor = .black
            
        case "light":
            view.backgroundColor = .white
            
        default:
            view.backgroundColor = .white
        }
    }
    
}


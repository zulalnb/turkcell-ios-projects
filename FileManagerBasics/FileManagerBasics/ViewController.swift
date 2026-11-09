//
//  ViewController.swift
//  FileManagerBasics
//
//  Created by Zülal Nebin on 9.11.2026.
//

import UIKit
import UniformTypeIdentifiers

class ViewController: UIViewController, UIDocumentPickerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Dosya Oluşturma Yazma Okuma
    // Dosya uygulama içinde oluşturulur ve okunur.
    @IBAction func fileOperationsButtonTapped(_ sender: Any) {
        if let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileName = "fileName.txt"
            let fileURL = directoryURL.appendingPathComponent(fileName)
            
            // let tempFileURL = URL(fileURLWithPath: "fileName", relativeTo: directoryURL).appendingPathExtension("txt")
            
            let text = "Dosya içeriği"
            
            do {
                // Write
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
                
                // let data = text.data(using: .utf8)!
                // try data?.write(to: fileURL)
                
                // Read
                let textToRead = try String(contentsOf: fileURL, encoding: .utf8)
                print(textToRead)
                
                // Delete
                try FileManager.default.removeItem(at: fileURL)
                
            } catch {
                print("File operation error: \(error.localizedDescription)")
            }
        }
    }
    
    // Dosya Erişimi
    // Dosyalara erişim adımlar halinde iOS sistemi üzerinden yapılır.
    // Bunun için DocumentPicker yapısı kullanılır.
    @IBAction func documentPickerButtonTapped(_ sender: Any) {
        let documentPickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: [.plainText], asCopy: true)
        
        documentPickerViewController.delegate = self
        
        documentPickerViewController.modalPresentationStyle = .formSheet
        present(documentPickerViewController, animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        do {
            let data = try Data(contentsOf: urls[0])
            
            guard let content = String(data: data, encoding: .utf8) else {
                print("File content could not be converted to UTF-8.")
                return
            }
            
            print(content)
            
        } catch {
            print("File reading error: \(error.localizedDescription)")
        }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("Vazgeçildi")
    }
    
    
    
}


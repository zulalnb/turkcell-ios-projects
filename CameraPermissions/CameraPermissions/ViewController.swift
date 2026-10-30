//
//  ViewController.swift
//  CameraPermissions
//
//  Created by Zülal Nebin on 31.10.2026.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Kameradan çekilen bir resmin ekranın arkaplanına eklenmesi.
    // Bu işlemler yapılırken gerekli izin kontrolleri de yapılacaktır.
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnOpenCamera_TUI(_ sender: Any) {
        checkCameraPermission()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        backgroundImageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func checkCameraPermission() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .notDetermined:
            openCamera()
        case .restricted:
            displayAlert()
        case .denied:
            displayAlert()
        case .authorized:
            openCamera()
        @unknown default:
            displayAlert()
        }
}

func displayAlert() {
    let title = "Kameraya erişilemiyor"
    let message = "Erişimi sağlamak için ayarlardan kamera erişimini açmalısınız"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
    
    alert.addAction(UIAlertAction(title: "Ayarlar", style: .default, handler: openAppSettings))
    
    present(alert, animated: true, completion: nil)
}

func openAppSettings(alert: UIAlertAction) {
    guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
    
    UIApplication.shared.open(settingsURL) { success in
        if !success {
            print("Ayarlar açılamadı.")
        }
    }
}

func openCamera() {
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
}

}


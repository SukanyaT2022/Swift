//
//  ViewController.swift
//  camera_gallery
//
//  Created by 2053384 on 16/06/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getImageAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose", message: "", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            // Open Camera
            self.openImageSource(source: .camera)
        }
        
        let photoLibrayAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
            // Open Photos
            self.openImageSource(source: .photoLibrary)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        alertController.addAction(cameraAction)
        alertController.addAction(photoLibrayAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true)
        
    }
    
    func openImageSource(source: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = source // Camera or PhotoLibrary
        imagePicker.delegate = self // setting up delegate
        self.present(imagePicker, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Gets called when image is selected or captured
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image selected")
        picker.dismiss(animated: true) {
            let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            self.myImageView.image = image
        }
    }
    
    // Gets called when tapped on cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
        print("Tapped on Cancel")
    }
}




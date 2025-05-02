//
//  AddViewController.swift
//  SimpleShopApp
//
//  Created by Ömer on 2.05.2025.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet weak var categoryLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func add(_ sender: Any) {
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPrdct = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
        newPrdct.setValue(nameLabel.text, forKey: "name")
        newPrdct.setValue(UUID(), forKey: "id")
        
        if let imageData = imageView.image?.jpegData(compressionQuality: 0.5) {
            newPrdct.setValue(imageData, forKey: "image")
        }
        
        do {
            try context.save()
        }catch {
            print("error")
        }
        
       
    }
    
}

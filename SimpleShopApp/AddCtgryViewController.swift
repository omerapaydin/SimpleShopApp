//
//  AddCtgryViewController.swift
//  SimpleShopApp
//
//  Created by Ömer on 3.05.2025.
//

import UIKit
import CoreData

class AddCtgryViewController: UIViewController {

    @IBOutlet weak var ctgryField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func save(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newCtgry = NSEntityDescription.insertNewObject(forEntityName: "Category", into: context)
        newCtgry.setValue(ctgryField.text, forKey: "name")
        newCtgry.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
        }catch {
            print("error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newPlace"), object: nil)
        navigationController?.popViewController(animated: true)
        
    }
    
}

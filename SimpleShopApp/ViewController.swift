//
//  ViewController.swift
//  SimpleShopApp
//
//  Created by Ömer on 1.05.2025.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var categoriesName: [String] = []
    var categoriesId: [UUID] = []
    
    var selectedCtgryId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("newPlace"), object: nil)
    }
    
    @objc func getData() {
        
        categoriesName.removeAll()
        categoriesId.removeAll()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Category")
        fetch.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(fetch)
            
            for result in results as! [NSManagedObject] {
                
                if let title = result.value(forKey: "name") as? String {
                    categoriesName.append(title)
                }
                
                if let id = result.value(forKey: "id") as? UUID {
                    categoriesId.append(id)
                    print(id)
                }
                
            }
            print("success")
            
        }catch{
            print("error")
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.adLabel.text = categoriesName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCtgryId = categoriesId[indexPath.row]
        performSegue(withIdentifier: "toList", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toList" {
            let desc = segue.destination as! DetailsViewController
            desc.geleId = selectedCtgryId
            
        }
    }

    @IBAction func addCtgry(_ sender: Any) {
        performSegue(withIdentifier: "addCtgr", sender: nil)
    }
    
    
    @IBAction func addItems(_ sender: Any) {
        performSegue(withIdentifier: "addItem", sender: nil)
    }
    
}


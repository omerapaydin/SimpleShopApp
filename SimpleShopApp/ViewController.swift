//
//  ViewController.swift
//  SimpleShopApp
//
//  Created by Ömer on 1.05.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.adLabel.text = categories[indexPath.row].name
        return cell
    }

    @IBAction func addCtgry(_ sender: Any) {
        performSegue(withIdentifier: "addCtgr", sender: nil)
    }
    
    
    @IBAction func addItems(_ sender: Any) {
        performSegue(withIdentifier: "addItem", sender: nil)
    }
    
}


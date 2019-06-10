//
//  ViewController.swift
//  Todoey
//
//  Created by Nabeel on 6/10/19.
//  Copyright © 2019 Nabeel. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    // Variable are declared here
    var itemARRAY = [String?]()
    var lastSelectedRow: NSIndexPath? = nil
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        if let item = defaults.array(forKey: "ToDoList") as? [String]{
            itemARRAY = item
            tableView.reloadData()
        }
        print(itemARRAY)
    }
    
    //MARK - TableviewDataSource Method
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemARRAY[indexPath.row]
        
        return cell
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemARRAY.count
    }
    
    //Mark - TableView Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //print item in index row
        print(itemARRAY[indexPath.row])
        
        //Check and uncheck
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func Add(_ sender: UIBarButtonItem) {
        var textField = UITextField()
                let alert = UIAlertController(title: "Add Todoey", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add New Todoey", style: .default) { (alert) in
            print("Sucesssul")
            
            if textField.text != nil{
                self.itemARRAY.append(textField.text!)
                self.tableView.reloadData()
                  self.defaults.set(self.itemARRAY, forKey: "ToDoList")
         
            }
          
        }
    
        
        
        
        //telling alert to show action
        alert.addAction(alertAction)
        
        
        // adding text to our alertAction
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Create new action"
            textField = alertTextfield
        
            
            
        }
    
        //Showing alert in view controller
        present(alert, animated: true, completion: nil)
        
        
        
        
    }
    

}



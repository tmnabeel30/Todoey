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
    let itemARRAY = ["Find mike", "Buy eggs","Distroy Demorgan"]
    var lastSelectedRow: NSIndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        
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
}



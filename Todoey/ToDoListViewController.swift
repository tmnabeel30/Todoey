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
    var itemARRAY = [ItemModel]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        let newItem = ItemModel()
        newItem.title = "mike"
        itemARRAY.append(newItem)
        
        let newItem2 = ItemModel()
        newItem2.title = "angela"
        itemARRAY.append(newItem2)

        
        let newItem3 = ItemModel()
        newItem3.title = "nabeel"
        itemARRAY.append(newItem3)
        
        
//        if let item = defaults.dictionaryWithValues(forKey: "ToDoList") as? [String]{
//            itemARRAY = item
//            tableView.reloadData()
//        }
//        print(itemARRAY)
//    }
////
    }
    //MARK - TableviewDataSource Method
    
    //This is function is first called
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let trueOrfalse = itemARRAY[indexPath.row].Done

        cell.textLabel?.text = itemARRAY[indexPath.row].title
        if trueOrfalse == true{
           cell.accessoryType = .checkmark
            
            print("clicked")
        }else{
     cell.accessoryType = .none
           
            print("clicked")
        }
       
        
        return cell
        
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemARRAY.count
    }
    

    
    //Mark - TableView Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //print item in index row
        print(itemARRAY[indexPath.row].title)
        
    
        //remove grey colour when selected or Deselects things
         tableView.deselectRow(at: indexPath, animated: true)
        
        //Check and uncheck
         itemARRAY[indexPath.row].Done = !(itemARRAY[indexPath.row].Done)
        print(itemARRAY[indexPath.row].Done,itemARRAY[indexPath.row].title)
   
        tableView.reloadData()
        

       
        
       
    }
    
    
    
    
    
    
    @IBAction func Add(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Todoey", message: "", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Add New Todoey", style: .default) { (alert) in
        
            print("Sucesssul")
           
            
            
            let nItem = ItemModel()
            
            nItem.title = textField.text!
         
            
            
            self.itemARRAY.append(nItem)
//            self.defaults.set(self.itemARRAY, forKey: "ToDoList")
            self.tableView.reloadData()
            
//            if textField.text != nil{
//                self.itemARRAY.append(newItem.title)
//                self.tableView.reloadData()
//                  self.defaults.set(self.itemARRAY, forKey: "ToDoList")
//
//            }
          
        }
    
        
        
  //Mark - UIAlert
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




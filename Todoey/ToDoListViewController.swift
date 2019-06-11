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
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
        loadUp()
        
        print(dataFilePath)
        
        
    }
    //MARK - TableviewDataSource Method
    
    //This is function is first called
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let trueOrfalse = itemARRAY[indexPath.row].Done

        cell.textLabel?.text = itemARRAY[indexPath.row].title
    
        cell.accessoryType = trueOrfalse ? .checkmark:.none
       
        
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
   createList()
        tableView.reloadData()
        

       
        
       
    }
    
    
    
    
    
    
    @IBAction func Add(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Todoey", message: "", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Add New Todoey", style: .default) { (alert) in
        
            print("Sucesssul")
           
            
            
            let nItem = ItemModel()
            
            nItem.title = textField.text!
         
            
//
//            self.itemARRAY.append(nItem)
//            self.defaults.set(self.itemARRAY, forKey: "ToDoList")
//            self.tableView.reloadData()
//
            if textField.text != nil{
                self.itemARRAY.append(nItem)
          
        

            }
           self.createList()
            self.loadUp() 
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
    
    func createList(){
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(itemARRAY)
            try data.write(to: dataFilePath!)
        print("!")
        }catch{
            print("Error 154 \(error)")
        }
        tableView.reloadData()
    }
    
    func loadUp(){
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do{
                itemARRAY = try decoder.decode([ItemModel].self, from: data)
            }catch{
                print("error in 165 \(error)")
            }
        }
    }
    
}




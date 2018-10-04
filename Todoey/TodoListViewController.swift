//
//  ViewController.swift
//  Todoey
//
//  Created by Justin Hernandez on 10/3/18.
//  Copyright © 2018 jHernandez. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemArray.append(Item(itemTitle: "Find Mike"))
        itemArray.append(Item(itemTitle: "Find Bike"))
        itemArray.append(Item(itemTitle: "Find Like"))
        itemArray.append(Item(itemTitle: "Find Kike"))
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        cell.accessoryType = itemArray[indexPath.row].done == true ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            textField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //Tap button handler
            self.itemArray.append(Item(itemTitle: textField.text!))
            
            self.defaults.set(self.itemArray, forKey: "todoArray")
            
            self.tableView.reloadData()
        }

        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}


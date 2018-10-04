//
//  ViewController.swift
//  Todoey
//
//  Created by Justin Hernandez on 10/3/18.
//  Copyright © 2018 jHernandez. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Take out garbage", "Buy Food", "Wash dishes"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        if selectedCell?.accessoryType == .checkmark {
            selectedCell?.accessoryType = .none
        } else {
            selectedCell?.accessoryType = .checkmark
        }
        
        
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
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}


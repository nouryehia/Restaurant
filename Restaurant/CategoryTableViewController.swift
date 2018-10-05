/* CategoryTableViewController.swift
 Restaurant
 Lets user place an order from a menu obtained from a local server.
 --------------------------------------------------------------------------
 OpenRestaurant (included in project file) MUST BE RUNNING FOR APP TO WORK.
 --------------------------------------------------------------------------
 Created by Nour Yehia on 9/5/18.
 Copyright © 2018 Nour Yehia. All rights reserved. */

import UIKit
import UserNotifications

// ADD COMMENTS!!!!!!
class CategoryTableViewController: UITableViewController {

    var categories = [String]()
    let priority = ["appetizers": 1, "pasta": 2, "pizzas": 3, "soup and salad": 4, "deserts": 5, "beverages": 6]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuController.shared.fetchCategories { (categories) in
            if let categories = categories {
                self.updateUI(with: categories)
            }
        }
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
    
    func updateUI(with categories: [String]) {
        DispatchQueue.main.async {
            self.categories = categories.sorted(by: { (string1, string2) -> Bool in
                return self.priority[string1]! < self.priority[string2]!
            })
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath){
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.capitalized
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menuSegue" {
            let menuTableViewController = segue.destination as! MenuTableViewController
            menuTableViewController.category = categories[tableView.indexPathForSelectedRow!.row]
        }
     }
}

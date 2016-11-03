//
//  UsersTableViewController.swift
//  FacesterGram
//
//  Created by Louis Tur on 10/21/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    // Describe what these three keywords indicate about UserTableViewCellIdentifier
    private static let UserTableViewCellIdentifier: String = "UserTableViewCellIdentifier"
    internal var randomUser = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.loadUsers()
        self.refreshControl?.addTarget(self, action: #selector(refreshRequested(_:)), for: .valueChanged)
        
        
    }
    let sm = SettingManager.manager
    func loadUsers() {
        APIRequestManager.manager.getRandom(user: sm.results, gender: sm.gender, nationality: sm.nationality) { (data: Data?) in
            if data != nil {
                if let users = User.users(from: data!) {
                    print("We've got users! \(users)")
                    self.randomUser = users
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.tableView.refreshControl?.endRefreshing()
                    }
                }
            }
        }
        
    }
    
    func refreshRequested(_ sender: UIRefreshControl) {
        self.loadUsers()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return randomUser.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCellIdentifier", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = self.randomUser[indexPath.row].firstName
        cell.detailTextLabel?.text = self.randomUser[indexPath.row].username
        return cell
    }
    
    
}

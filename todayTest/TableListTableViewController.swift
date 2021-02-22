//
//  TableListTableViewController.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit

class TableListTableViewController: UITableViewController {

    @IBOutlet var listTable: UITableView!
    
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        listTable.delegate = self
        listTable.dataSource = self
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfRowsInPersonTable()
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Person Table Data"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! tableListTableViewCell
        getEmailData()
        cell.emailLabel.text = emailData[indexPath.row]
        cell.index = indexPath.row
        cell.email = emailData[indexPath.row]
        //cell.cellDelegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            //YOUR_CODE_HERE
            
            let alert = UIAlertController(title: "Delete Data", message: "Are you sure you want to delete data?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {_ in
                //code for delete daa
                self.email = emailData[indexPath.row]
                deleteRowFormTable(email: self.email)
                tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                
            }))
            self.present(alert, animated: true, completion: nil)
            
            
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let vc = storyboard?.instantiateViewController(identifier: "ProfilePageViewController") as! ProfilePageViewController
        
        let editAction = UIContextualAction(style: .normal, title: "View") {(action, view, handler) in
            //code logic
            print("in view")
            vc.emailid = emailData[indexPath.row]
            self.present(vc, animated: true, completion: nil)
        }
        editAction.backgroundColor = .blue
        let configuration = UISwipeActionsConfiguration(actions: [editAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    
}



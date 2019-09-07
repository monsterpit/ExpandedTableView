//
//  TableViewController.swift
//  ExpandedTableView
//
//  Created by MB on 9/7/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit


struct cellData{
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class TableViewController: UITableViewController {
    
    
    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        tableViewData = [cellData(opened: false, title: "title1", sectionData: ["Cell1","Cell2","Cell3"]) , cellData(opened: false, title: "title2", sectionData: ["Cell1","Cell2","Cell3"]), cellData(opened: false, title: "title3", sectionData: ["Cell1","Cell2","Cell3"]),cellData(opened: false, title: "title4", sectionData: ["Cell1","Cell2","Cell3"]) ]
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if tableViewData[section].opened{
            return tableViewData[section].sectionData.count + 1
        }
        else{
            return 1
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        }
        else{
            let dataIndex = indexPath.row - 1
            //different Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            return cell
        }
        
        
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if tableViewData[indexPath.section].opened{
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
            else{
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
                
            }
        }
        else{
            let titlePressed = tableViewData[indexPath.section].title
            let cellPressed = tableViewData[indexPath.section].sectionData[(indexPath.row - 1)]
            let alertVC = UIAlertController(title: cellPressed , message: "Title is \(titlePressed) and Cell pressed is \(cellPressed)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alertVC.addAction(okAction)
            present(alertVC, animated: true)
        }
        
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//
//  ItemTablePgController.swift
//  ForeverShoppingApp
//
//  Created by Ralph on 3/3/18.
//  Copyright © 2018 Ralph. All rights reserved.
//

import UIKit

class ItemTablePgController: UITableViewController {

    var item : Item?
    
    @IBAction func backtToHomePg(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var count = girlTop.count

        if(isWoman){
            switch categoryIndex{
            case 0:
                count = girlTop.count
                break
            case 1:
                count = girlBottom.count
                break
            case 2:
                count = girlAcc.count
            default:
                break
            }
        }
        else{
            switch categoryIndex{
            case 0:
                count = guyTop.count
                break
            case 1:
                count = guyBottom.count
                break
            case 2:
                count = guyAcc.count
            default:
                break
            }
        }
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item = girlTop[indexPath.row]
        if(isWoman){
            switch categoryIndex{
            case 0:
                item = girlTop[indexPath.row]
                break
            case 1:
                item = girlBottom[indexPath.row]
                break
            case 2:
                item = girlAcc[indexPath.row]
                break
            default:
                break
            }
        }
        else{
            switch categoryIndex{
            case 0:
                item = guyTop[indexPath.row]
                break
            case 1:
                item = guyBottom[indexPath.row]
                break
            case 2:
                item = guyAcc[indexPath.row]
                break
            default:
                break
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemID", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = ("$\(item.price)")
        
        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let detailViewController = segue.destination as? ItemDetailPgController {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                if(isWoman){
                    switch categoryIndex{
                    case 0:
                        detailViewController.item = girlTop[indexPath.row]
                        break
                    case 1:
                        detailViewController.item = girlBottom[indexPath.row]
                        break
                    case 2:
                        detailViewController.item = girlAcc[indexPath.row]
                        break
                    default:
                        break
                    }
                }
                else{
                    switch categoryIndex{
                    case 0:
                        detailViewController.item = guyTop[indexPath.row]
                        break
                    case 1:
                        detailViewController.item = guyBottom[indexPath.row]
                        break
                    case 2:
                        detailViewController.item = guyAcc[indexPath.row]
                        break
                    default:
                        break
                    }
                }
            }
        }
    }
    

}

//
//  CartPgController.swift
//  ForeverShoppingApp
//
//  Created by Ralph on 3/3/18.
//  Copyright © 2018 Ralph. All rights reserved.
//

import UIKit

class CartPgController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cartTableView: UITableView!

    @IBOutlet weak var totalPriceLabel: UILabel!
    var price:Float = 0     //Variable to store the totalPrice temporarily
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Link delegator
        cartTableView.delegate = self
        cartTableView.dataSource = self
        updateTotalPrice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toCheckOutPg(_ sender: UIButton) {
        if (loggedIn) {
            //If logging in, process check out
            //Store computed total price to global
            totalPrice = price
            //Jump to checkout page
            self.performSegue(withIdentifier: "SeguetoCheckOutPg", sender: self)
        } else {
            //Pop up a warning msg asking for log in first
            let title = "Invalid user information"
            let message = "Please log in to check out."
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style:.cancel, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }

    }
    
    //Set tab index to 0 (jumo to homepage) if been checked out
    override func viewWillAppear(_ animated: Bool) {
        if (isCheckedOut) {
            self.tabBarController?.selectedIndex = 0
            isCheckedOut = false
        }
        self.cartTableView.reloadData()
        updateTotalPrice()
    }
    
    
    //Update total price function
    func updateTotalPrice(){
        price = 0
        for item in cart {
            if let p = Float(item.price) {
                price += p
            }
        }
        totalPriceLabel.text = "$"+String(price)
    }
    
    
    //Config cart table view
    //Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    //Config the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = cart[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$" + item.price
        //Add picture in front
        //cell.imageView = UIImage(named:item[0])
        return cell
    }

    //Add edit action to cell
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Delete action
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            cart.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        updateTotalPrice()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

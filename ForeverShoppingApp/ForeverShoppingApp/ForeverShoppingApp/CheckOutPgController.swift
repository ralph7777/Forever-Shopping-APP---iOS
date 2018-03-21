//
//  CheckOutPgController.swift
//  ForeverShoppingApp
//
//  Created by Ralph on 3/3/18.
//  Copyright © 2018 Ralph. All rights reserved.
//

import UIKit

class CheckOutPgController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var itemNumLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var mailAddressTextView: UITextView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Read in data
        usernameLabel.text = "\(userLName) \(userFName)"
        itemNumLabel.text = String(cart.count)
        totalPriceLabel.text = "$" + String(totalPrice)
        self.mailAddressTextView.layer.cornerRadius = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Dismiss keyboard
    @IBAction func editEnded(_ sender: UITextView) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder()
        }
        mailAddressTextView.resignFirstResponder()
    }
    
    //Handle pressing cancel
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //Handle pressing done
    @IBAction func donePressed(_ sender: UIButton) {
        
        let cardNum = textFields[0].text
        //Check if there is an input card number
        if (cardNum == nil || cardNum == "") {
            //Sending warning message
            let title = "Invalid card number"
            let message = "Please enter a valid card number for checking out."
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title:"OK", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            present(alertController,animated: true,completion: nil)
        }
        else {
            //Double check
            let title = "Almost there!"
            let message = "\(totalPriceLabel.text!) will be deducted from your credit card #\(cardNum!)."
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title:"Cancel", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title:"Confirm", style: .default, handler: confirmHandler)
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            present(alertController,animated: true,completion: nil)
        }
    }
    
    //Handle pressing 'confirm'
    func confirmHandler(_ act:UIAlertAction!) {
        let address = mailAddressTextView.text
        let title = "ALL SET"
        let message = "Your order is on the way to address \(address!). Receipt has been sent to your email \(userEmail)."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"Great!", style: .cancel, handler: greatHandler)
        alertController.addAction(okAction)
        present(alertController, animated: true,completion: nil)
    }
    
    //Handle pressing 'great'
    func greatHandler(_ act:UIAlertAction!) {
        isCheckedOut = true
        totalPrice = 0
        cart.removeAll()
        dismiss(animated: true, completion: nil)
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

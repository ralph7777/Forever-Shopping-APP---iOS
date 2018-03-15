//
//  AccountPgController.swift
//  ForeverShoppingApp
//
//  Created by Zhang, Kuangyi on 3/3/18.
//  Copyright © 2018 Zhang, Kuangyi. All rights reserved.
//

import UIKit

class AccountPgController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var newCustomerButton: UIButton!
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var logoffButton: UIButton!
    
    @IBOutlet weak var welcomeLable: UILabel!
    @IBOutlet weak var welcomeView: WelcomView!
    
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder()
        }
    }
    
    
    //Change the view display after logging in
    override func viewWillAppear(_ animated: Bool) {
        if (loggedIn) {
            afterLoggedIn()
        } else {
            afterLoggedOff()
        }
    }

    @IBAction func logInPressed(_ sender: UIButton) {
        let email:String = textFields[0].text ?? ""
        let password:String = textFields[1].text ?? ""
        for user in users {
            if (email == user.email && password == user.password) {
                userFName = user.firstName
                userLName = user.lastName
                userEmail = user.email
                loggedIn = true
                afterLoggedIn()
                return
            }
        }
        //No information match
        let title = "Oops!"
        let message = "Your email or password is incorrect. Please try it again."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController,animated: true,completion: nil)
    }
    
    @IBAction func logOffPressed(_ sender: UIButton) {
        loggedIn = false
        afterLoggedOff()
    }
    
    @IBAction func guestLogInPressed(_ sender: UIButton) {
        userFName = "Guest"
        userLName = ""
        userEmail = "guest@forevershopping.com"
        loggedIn = true
        afterLoggedIn()
    }
    
    //Routine of changing view display
    func afterLoggedIn() {
        
        //Set some widgets hidden and others display
        welcomeView.setNeedsDisplay()
        titleLable.isHidden = true
        loginButton.isHidden = true
        newCustomerButton.isHidden = true
        guestButton.isHidden = true
        for textField in textFields {
            textField.isHidden = true
        }
        
        logoffButton.isHidden = false
        welcomeView.isHidden = false
        welcomeLable.isHidden = false
    }
    
    func afterLoggedOff() {
        titleLable.isHidden = false
        loginButton.isHidden = false
        newCustomerButton.isHidden = false
        guestButton.isHidden = false
        for textField in textFields {
            textField.isHidden = false
        }
        logoffButton.isHidden = true
        welcomeView.isHidden = true
        welcomeLable.isHidden = true
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

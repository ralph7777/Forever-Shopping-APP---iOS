//
//  SignUpPgController.swift
//  ForeverShoppingApp
//
//  Created by Zhang, Kuangyi on 3/3/18.
//  Copyright © 2018 Zhang, Kuangyi. All rights reserved.
//

import UIKit

class SignUpPgController: UIViewController {
    
    @IBOutlet var signUpTextFields: [UITextField]!
    var invalidMsg = ""
    var counter = 0
    var emptyEnter = false
    var check = false

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
        for tf in signUpTextFields{
            tf.resignFirstResponder()
        }
    }
    
    func popup(){
        let title = "Invalid input: "
        let alertController =
            UIAlertController(title: title,
                              message: invalidMsg,
                              preferredStyle: .alert)
        
        // Create the action to cloase the pop up window
        let cancelAction =
            UIAlertAction(title: "OK",
                          style: .cancel,
                          handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController,
                animated: true,
                completion: nil)
        invalidMsg = ""
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if (sender.tag == 0 ) {
            //Press Cancel
            loggedIn = false
        } else {
            //Press Join
            //pop up warming message when textField input is empty
            for tf in signUpTextFields{
                check = true
                if let info = tf.text{
                    if info.isEmpty {
                        emptyEnter = true
                        switch counter{
                        case 0:
                            invalidMsg += "First Name is empty.\n"
                            break
                        case 1:
                            invalidMsg += "Last Name is empty.\n"
                            break
                        case 2:
                            invalidMsg += "Email is empty.\n"
                            break
                        case 3:
                            invalidMsg += "Password is empty.\n"
                            break
                        default:
                            break
                        }
                    }
                }
                counter += 1
            }
            if emptyEnter {
                popup()
            }
            
            
            userFName = signUpTextFields[0].text ?? ""
            userLName = signUpTextFields[1].text ?? ""
            userEmail = signUpTextFields[2].text ?? ""
            let password: String = signUpTextFields[3].text ?? ""
            let person : User = User(firstName: userFName, lastName: userLName, email: userEmail, password: password)
            users.append(person)
            loggedIn = true
        }
        //Back to previous page
        if emptyEnter == false{
            dismiss(animated: true, completion: nil)
        }
        //New start, the emptyEnter will reset to false
        emptyEnter = false
        counter = 0
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

//
//  ItemDetailPgController.swift
//  ForeverShoppingApp
//
//  Created by Ralph on 3/3/18.
//  Copyright © 2018 Ralph. All rights reserved.
//

import UIKit

class ItemDetailPgController: UIViewController {
    
    var item : Item?
    var addedMsg = ""
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var detail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let product = item{
            image.image = UIImage(named: product.picture)
            itemName.text = product.name
            price.text = "$ \(product.price)"
            detail.text = product.description
        }
    }
    
    func popup(){
        let title = "Item added"
        let alertController =
            UIAlertController(title: title,
                              message: addedMsg,
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
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        if let product = item{
            cart.append(product)
            addedMsg = "\(product.name) has been added to your cart."
            popup()
        }
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

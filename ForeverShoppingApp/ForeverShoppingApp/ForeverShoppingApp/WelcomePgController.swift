//
//  WelcomePgController.swift
//  ForeverShoppingApp
//
//  Created by Zhang, Kuangyi on 3/3/18.
//  Copyright © 2018 Zhang, Kuangyi. All rights reserved.
//

import UIKit


class WelcomePgController: UIViewController {

    @IBAction func womenCategory(_ sender: UIButton) {
        isWoman = true
    }
    @IBAction func menCategory(_ sender: UIButton) {
        isWoman = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toWomenIndexPg(_ sender: UIButton) {
        isWoman = true
        self.performSegue(withIdentifier: "segueToIndexPg", sender: self)
    }
    
    @IBAction func toMenIndexPg(_ sender: UIButton) {
        isWoman = false
        self.performSegue(withIdentifier: "segueToIndexPg", sender: self)
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

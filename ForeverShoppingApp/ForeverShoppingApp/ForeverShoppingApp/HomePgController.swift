//
//  FirstViewController.swift
//  ForeverShoppingApp
//
//  Created by Ralph on 3/3/18.
//  Copyright © 2018 Ralph. All rights reserved.
//

import UIKit

class HomePgController: UIViewController {
    @IBAction func womenCategory(_ sender: UIButton) {
        isWoman = true
        setImage()
    }
    
    @IBAction func menCategory(_ sender: UIButton) {
        isWoman = false
        setImage()
    }
    
    @IBOutlet weak var top: UIButton!
    @IBOutlet weak var bottom: UIButton!
    @IBOutlet weak var accessaries: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toCategoryPg(_ sender: UIButton) {
        categoryIndex = sender.tag
        self.performSegue(withIdentifier: "SegueToItemsPg", sender: self)
    }
    
    func setImage(){
        if(isWoman){
            top.setBackgroundImage(UIImage(named:"GirlsTop"), for: .normal)
            bottom.setBackgroundImage(UIImage(named: "GirlsBottom"), for: .normal)
            accessaries.setBackgroundImage(UIImage(named: "GirlsAcc"), for: .normal)
        }
        else{
            top.setBackgroundImage(UIImage(named: "GuysTop"), for: .normal)
            bottom.setBackgroundImage(UIImage(named: "GuysBottom"), for: .normal)
            accessaries.setBackgroundImage(UIImage(named: "GuysAcc"), for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setImage()
    }
    
    
}


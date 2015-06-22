//
//  DetailsViewController.swift
//  DribbleClient
//
//  Created by preetham uppu on 6/21/15.
//  Copyright (c) 2015 preetham uppu. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController{
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var shotImage: UIImageView!
    
    var shotObj : Shot!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Utils.asyncLoadShotImage(self.shotObj, imageView: shotImage)
        
    }
    
    @IBAction func goHome(sender: AnyObject) {
        performSegueWithIdentifier("backToHome", sender: sender)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "backToHome"){
            
            let controller = segue.destinationViewController as ViewController
        }
    }
    
    
    
}
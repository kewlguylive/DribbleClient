//
//  Utils.swift
//  DribbleClient
//
//  Created by preetham uppu on 6/21/15.
//  Copyright (c) 2015 preetham uppu. All rights reserved.
//

import Foundation
import UIKit

class Utils{
    class func asyncLoadShotImage(shot: Shot, imageView : UIImageView){
        
        let downloadQueue = dispatch_queue_create("com.iShots.processsdownload", nil)
        
        dispatch_async(downloadQueue) {
            
            var data = NSData(contentsOfURL: NSURL(string: shot.imageUrl)!)
            
            var image : UIImage?
            
            if data != nil {
                
                shot.imageData = data
                
                image = UIImage(data: data!)!
                
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                
                imageView.image = image
                
            }
            
        }
        
    }
    
}

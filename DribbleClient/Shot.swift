//
//  Shot.swift
//  DribbleClient
//
//  Created by preetham uppu on 6/21/15.
//  Copyright (c) 2015 preetham uppu. All rights reserved.
//

import Foundation

class Shot{
    
    var Id : Int!
    
    var imageUrl : String!
    
    var imageData : NSData?
    
    init(data: NSDictionary){
        
        self.Id = data["id"] as Int
        
        let images = data["images"] as NSDictionary
        
        self.imageUrl = getStringFromJSON(images,key: "normal")
        
    }
    
    func getStringFromJSON(data: NSDictionary, key: String) -> String{
        
        let info: AnyObject? = data[key]
        
        if let info = data[key] as? String{
            
            return info
            
        }
        
        return ""
        
    }
    
}
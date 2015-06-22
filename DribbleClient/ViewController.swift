//
//  ViewController.swift
//  DribbleClient
//
//  Created by preetham uppu on 6/21/15.
//  Copyright (c) 2015 preetham uppu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    var shots : [Shot]!
    var cellHeight : CGFloat = 180
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.clearColor()
        
        shots = [Shot]()
        let api = Dribble()
        
        api.loadShots("https://api.dribbble.com/v1/shots", completion: didLoadShots)
        
    }
    
    func didLoadShots(shots: [Shot]){
        
        self.shots = shots
        collectionView.reloadData()
        
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ShotCell", forIndexPath: indexPath) as ShotCell
        
        let shot = shots[indexPath.row]
        
        Utils.asyncLoadShotImage(shot,imageView: cell.coverImageView)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return shots.count
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("details", sender: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }

}


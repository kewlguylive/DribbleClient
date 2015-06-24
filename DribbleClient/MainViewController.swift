//
//  MainViewController.swift
//  DribbleClient
//
//  Created by preetham uppu on 6/23/15.
//  Copyright (c) 2015 preetham uppu. All rights reserved.
//

import Foundation
import UIKit

class MainViewController : UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    var shots : [Shot]!
    var cellHeight : CGFloat = 240
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shots"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        
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
        
        cell.titleLabel.text = shot.title
        cell.nameLabel.text = "Test"
        Utils.asyncLoadShotImage(shot, imageView: cell.coverImageView)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shots.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("details", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "details"){
            
            let selectedItems = collectionView.indexPathsForSelectedItems()
            
            let selectedIndexPath = selectedItems[0] as NSIndexPath
            let shot = shots[selectedIndexPath.row]
            
            let controller = segue.destinationViewController as DetailsViewController
            
            controller.shotObj = shot
            
        }
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        var cellWidth = calcCellWidth(size)
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
    }
    
    func calcCellWidth(size: CGSize) -> CGFloat {
        let transitionToWide = size.width > size.height
        var cellWidth = size.width / 2
        
        if transitionToWide {
            cellWidth = size.width / 3
        }
        
        return cellWidth
    }
}

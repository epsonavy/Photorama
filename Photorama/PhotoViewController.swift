//
//  PhotoViewController.swift
//  Photorama
//
//  Created by Pei Liu on 2016/10/29.
//  Copyright © 2016年 Pei Liu. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = photoDataSource
        
        store.fetchRecentPhotos() {
            (photosResult) -> Void in
            
            NSOperationQueue.mainQueue().addOperationWithBlock() {
                switch photosResult {
                case let .Success(photos):
                    print("Successfully found \(photos.count) recnet photos.\n")
                    self.photoDataSource.photos = photos
                case let .Failure(e):
                    self.photoDataSource.photos.removeAll()
                    print("Error: \(e)")
                }
                self.collectionView.reloadSections(NSIndexSet(index: 0))
            }
        }
    }
}

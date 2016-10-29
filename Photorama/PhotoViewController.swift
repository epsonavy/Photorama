//
//  PhotoViewController.swift
//  Photorama
//
//  Created by Pei Liu on 2016/10/29.
//  Copyright © 2016年 Pei Liu. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchRecentPhotos() {
            (photosResult) -> Void in
            
            switch photosResult {
            case let .Success(photos):
                print("Successfully found \(photos.count).")
                
                if let firstPhoto = photos.first {
                    self.store.fetchImageForPhoto(firstPhoto) {
                        (imageResult) -> Void in
                        switch imageResult {
                        case let .Success(image):
                            NSOperationQueue.mainQueue().addOperationWithBlock{
                                self.imageView.image = image
                            }
                        case let .Failure(e):
                            print("Error: \(e)")
                        }
                    }
                }
            case let .Failure(e):
                print("Error: \(e)")
            }
        }
    }
}

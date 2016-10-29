//
//  Photo.swift
//  Photorama
//
//  Created by Pei Liu on 2016/10/29.
//  Copyright © 2016年 Pei Liu. All rights reserved.
//

import UIKit

class Photo {
    let title: String
    let remoteURL: NSURL
    let photoID: String
    let dateTaken: NSDate
    var image: UIImage?
    
    init(title: String, photoID: String, remoteURL: NSURL, dateTaken: NSDate) {
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
    }

}

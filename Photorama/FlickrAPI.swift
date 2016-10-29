//
//  FlickerAPI.swift
//  Photorama
//
//  Created by Pei Liu on 2016/10/29.
//  Copyright © 2016年 Pei Liu. All rights reserved.
//

import Foundation

enum Method: String {
    case RecentPhotos = "flickr.photo.getRecent"
}

struct FlickrAPI {
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let APIkey = "a6d819499131071f158fd740860aa5a88"
    private static func flickrURL(method method: Method, parameters: [String:String]?) -> NSURL {
        let components = NSURLComponents(string: baseURLString)!
        
        var queryItems = [NSURLQueryItem]()
        
        let baseParams = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": APIkey
        ]
        
        for (key, value) in baseParams {
            let item = NSURLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let addtionalParams = parameters {
            for (key, value) in addtionalParams {
                let item = NSURLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.URL!
    }
    
    static func recentPhotoURL() -> NSURL {
        return flickrURL(method: .RecentPhotos, parameters: ["extras": "url_h,date_taken"])
    }

}





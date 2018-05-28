//
//  ImageModel.swift
//  Movies
//
//  Created by vika on 5/28/18.
//  Copyright © 2018 vika. All rights reserved.
//

import Foundation

class ImageModel {
    
    // MARK: -
    // MARK: Create URL and download picture
    
    static func imageUrl(currentPictureURL: String) -> String {
        return  Constants.URL_PICTURE + currentPictureURL
    }
    
    func loadPicture(pictureURL: String) -> Data{
        
        var data = Data()
        
        if let url = URL(string: pictureURL){
            
            do {
                data = try Data(contentsOf: url)
            }catch let err {
                print(" Error : \(err.localizedDescription)")
            }
            
        }
        
        return data
    }
    
}

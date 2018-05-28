//
//  ViewController.swift
//  Movies
//
//  Created by vika on 5/12/18.
//  Copyright © 2018 vika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let network = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.network.downloadGenre(URL_GENRE: Constants.URL_MOVIE)
        
    }

}


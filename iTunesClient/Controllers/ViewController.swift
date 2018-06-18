//
//  ViewController.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 5/30/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchEnpoint = Itunes.search(term: "John Mayer", mediaType: .music(entity: .musicArtist, attribute: .artistTerm))
        print(searchEnpoint.request)
        
        print("*********")
        
        let lookupEnpoint = Itunes.lookup(id: 159260351, entity: MusicEntity.album)
        print(lookupEnpoint.request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


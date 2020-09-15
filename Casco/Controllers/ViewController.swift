//
//  ViewController.swift
//  Casco
//
//  Created by Fuhrer_SS on 13.09.2020.
//  Copyright © 2020 myself. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = startButton.frame.width / 6
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }

}


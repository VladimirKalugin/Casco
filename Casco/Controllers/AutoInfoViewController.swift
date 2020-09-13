//
//  AutoInfoViewController.swift
//  Casco
//
//  Created by Vladimir on 13/09/2020.
//  Copyright © 2020 myself. All rights reserved.
//

import UIKit

class AutoInfoViewController: UIViewController {

    @IBOutlet weak var stepProgressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var brandPickerView: UIPickerView!
    @IBOutlet weak var modelPickerView: UIPickerView!
    @IBOutlet weak var yearPickerView: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func brandButtonPressed() {
    }
    @IBAction func modelButtonPressed() {
    }
    @IBAction func yearButtonPressed() {
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

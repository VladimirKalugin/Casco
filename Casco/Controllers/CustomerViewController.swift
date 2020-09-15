//
//  CustomerViewController.swift
//  Casco
//
//  Created by Vladimir on 13/09/2020.
//  Copyright © 2020 myself. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController {
    
    @IBOutlet weak var stepProgressView: UIProgressView!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var experienceTextField: UITextField!
    
    private let questions = Question.getQuestions()
    
    var questionIndex = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func calculateButtonPressed() {
    }
    
    //MARK: - Methods
    func updateUI() {
        // calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // set progress
        stepProgressView.setProgress(totalProgress, animated: true)
        
        // set navigation title
        title = "Вопрос № \(questionIndex) из \(questions.count)"
    }
    
    
}

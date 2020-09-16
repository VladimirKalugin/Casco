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
    @IBOutlet weak var calculateButton: UIButton!
    
    private let questions = Question.getQuestions()
    
    var questionIndex = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateButton.layer.cornerRadius = calculateButton.frame.width / 6
        
        updateUI()
    }
    
    @IBAction func calculateButtonPressed() {
        
        guard let customerAge = ageTextField.text else { return }
        car.age = Int(customerAge) ?? 0
        guard let customerExperience = experienceTextField.text else { return }
        car.experience = Int(customerExperience) ?? 0
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let resultVC = segue.destination as? CustomerViewController
//
//
//    }
    
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

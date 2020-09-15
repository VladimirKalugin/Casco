//
//  YearOfIssueViewController.swift
//  Casco
//
//  Created by Fuhrer_SS on 15.09.2020.
//  Copyright © 2020 myself. All rights reserved.
//

import UIKit

class YearOfIssueViewController: UIViewController {
    
    @IBOutlet weak var stepProgressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yearPickerView: UIPickerView!
    
    private let questions = Question.getQuestions()
    private let amountOfYearsForInsurance = 10
    
    var questionIndex = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func nextButtonPressed() {
        let index = yearPickerView.selectedRow(inComponent: 0)
        car.year = possibleYears[index]
        print(car.year)
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
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let customerVC = segue.destination as? YearOfIssueViewController
        customerVC?.questionIndex = questionIndex + 1
    }
}

extension YearOfIssueViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        amountOfYearsForInsurance
    }
}

extension YearOfIssueViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let year = possibleYears[row]
        return year
    }
}

//
//  ModelViewController.swift
//  Casco
//
//  Created by Fuhrer_SS on 15.09.2020.
//  Copyright © 2020 myself. All rights reserved.
//

import UIKit

class ModelViewController: UIViewController {
    
    @IBOutlet weak var stepProgressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var modelPickerView: UIPickerView!
    
    private let questions = Question.getQuestions()
    private var modelsOfBrand: [String] = []
    var questionIndex = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showModelsOption()
        
        updateUI()
    }
    
    @IBAction func nextButtonPressed() {
        //        performSegue(withIdentifier: "toModelVC", sender: nil)
        let index = modelPickerView.selectedRow(inComponent: 0)
        car.model = modelsOfBrand[index]
        print(car.model)
    }
    
    private func showModelsOption() {
        var modelsOfMark: [String] = []
        
        for (model, mark) in dataCar {
            if mark == car.mark {
                modelsOfMark.append(model)
            }
        }
        modelsOfBrand = modelsOfMark.sorted()
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
        let yearOfIssueVC = segue.destination as? ModelViewController
        yearOfIssueVC?.questionIndex = questionIndex + 1
    }
    
}

extension ModelViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        modelsOfBrand.count
    }
}

extension ModelViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let modelOfMark = modelsOfBrand[row]
        return modelOfMark
    }
}

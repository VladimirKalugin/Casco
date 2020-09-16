//
//  AutoInfoViewController.swift
//  Casco
//
//  Created by Vladimir on 13/09/2020.
//  Copyright © 2020 myself. All rights reserved.
//

import UIKit

class MarkViewController: UIViewController {
    
    @IBOutlet weak var stepProgressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var brandPickerView: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Private Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 1
    private var sortedMarksOfCars: [String] = []
    var modelsOfcars: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[0]
        
        nextButton.layer.cornerRadius = nextButton.frame.width / 6
        
        showMarkOptions()
        
        brandPickerView.delegate = self
        brandPickerView.dataSource = self
        
        updateUI()
    }
    
    //MARK: - IBActions
    @IBAction func brandButtonPressed() {
        let index = brandPickerView.selectedRow(inComponent: 0)
        car.mark = sortedMarksOfCars[index]
        print(car.mark)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let modelVC = segue.destination as? ModelViewController
        modelVC?.questionIndex = questionIndex + 1
        
    }
    
}

//MARK: - Methods
extension MarkViewController {
    func updateUI() {
        // calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // set progress
        stepProgressView.setProgress(totalProgress, animated: true)
        
        // set navigation title
        title = "Вопрос № \(questionIndex) из \(questions.count)"
    }
    
    private func showMarkOptions() {
        var marksOfCars = Set<String>()
        
        for (_, mark) in dataCar {
            marksOfCars.insert(mark)
        }
        sortedMarksOfCars = marksOfCars.sorted()
    }
}

//MARK:- PickerView DataSource
extension MarkViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        sortedMarksOfCars.count
    }
    
}

//MARK:- PickerView Delegate
extension MarkViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let markOfCar = sortedMarksOfCars[row]
        return markOfCar
    }
}

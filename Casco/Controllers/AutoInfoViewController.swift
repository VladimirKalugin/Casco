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
    @IBOutlet weak var modelPickerView: UIPickerView!
    @IBOutlet weak var yearPickerView: UIDatePicker!
    
    @IBOutlet var markStackView: UIStackView!
    @IBOutlet var modelStackView: UIStackView!
    @IBOutlet var yearStackView: UIStackView!
    
    // MARK: - Private Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var sortedMarksOfCars: [String] = []
    var modelsOfcars: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    //MARK: - IBActions
    @IBAction func brandButtonPressed() {
        let index = brandPickerView.selectedRow(inComponent: 0)
        car.mark = sortedMarksOfCars[index]
        nextQuestion()
    }
    
    @IBAction func modelButtonPressed() {
        
        nextQuestion()
    }
    
    @IBAction func yearButtonPressed() {
        
        nextQuestion()
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

//MARK: - Privates Methods
extension MarkViewController {
    private func updateUI() {
        // hide all of the stacks
        for stackView in [markStackView, modelStackView, yearStackView] {
            stackView?.isHidden = true
        }
        
        // get current question
        let currentQuestion = questions[questionIndex]
        
        //set current question for qestion label
        questionLabel.text = currentQuestion.text
        
        // calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // set progress
        stepProgressView.setProgress(totalProgress, animated: true)
        
        // set navigation title
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        // show stacks corresponding to respons type
        showCurrentAnswers(for: currentQuestion.type)
        
    }
    private func showCurrentAnswers(for type: TypesOfQuestion) {
        switch type {
        case .mark: showMarkOptions()
        case .model: showModelsOption()
        case .yearOfCreate: break
        case .age:
            break
        case .experience:
            break
        }
    }
    
    private func showMarkOptions() {
        markStackView.isHidden = false
        var marksOfCars = Set<String>()
        
        for (_, mark) in dataCar {
            marksOfCars.insert(mark)
        }
        sortedMarksOfCars = marksOfCars.sorted()
    }
    
    private func showModelsOption() {
        modelStackView.isHidden = false
        
        for (model, mark) in dataCar {
            if mark == car.mark {
                modelsOfcars.append(model)
            }
        }
        
//        private func showYearOfAuto() {
//                    let currentYear = Date(
//                    let possibleYearsForInsurans = 10
//            let yaersForInsurans = [2010...2020]
            
            //        for year in possibleYearsForInsurans {
            //            if year >= possibleYearsForInsurans {
            //                let addYear = currentYear.y
            //                yaersForInsurans.append(<#T##newElement: Int##Int#>)
            //            }
        }
        
        private func nextQuestion() {
            questionIndex += 1
            
            if questionIndex < questions.count {
                updateUI()
            } else {
                performSegue(withIdentifier: "ownerSegue", sender: nil)
            }
        }
    }
    
    
    //MARK:- PickerView DataSource
    extension MarkViewController: UIPickerViewDataSource {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if questionIndex == 1 {
                return sortedMarksOfCars.count
            } else if questionIndex == 2 {
                return modelsOfcars.count
            }
        }
        
    }
    
    //MARK:- PickerView Delegate
    extension MarkViewController: UIPickerViewDelegate {
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if questionIndex == 1 {
                let markOfCar = sortedMarksOfCars[row]
                return markOfCar
            } else if questionIndex == 2 {
                let models = modelsOfcars[row]
                return models
            }
        }
}

//MARK:- DataPicker Delegate



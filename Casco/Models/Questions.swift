//
//  Questions.swift
//  Casco
//
//  Created by fd on 13.09.2020.
//  Copyright © 2020 myself. All rights reserved.
//

import Foundation

enum TypesOfQuestion {
    case mark
    case model
    case yearOfCreate
    case age
    case experience
}

struct Question {
    let text: String
    let type: TypesOfQuestion
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Укажите марку автомобиля",
                type: .mark
            ),
            Question(
                text: "Укажите модель автомобиля",
                type: .model
            ),
            Question(
                text: "Укажите год выпуска автомобиля",
                type: .yearOfCreate
            ),
            Question(
                text: "Укажите ваш возвраст",
                type: .age
            ),
            Question(
                text: "Укажите ваш стаж",
                type: .experience
            )
        ]
    }
}

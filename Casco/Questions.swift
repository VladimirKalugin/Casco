//
//  Questions.swift
//  Casco
//
//  Created by Fuhrer_SS on 13.09.2020.
//  Copyright © 2020 myself. All rights reserved.
//

import Foundation

struct Question {
    let text: String
}

extension Question {
    static func getQuestions() -> [String] {
        return [
            "Укажите марку автомобиля",
            "Укажите модель автомобиля",
            "Укажите год выпуска автомобиля",
            "Укажите ваш возвраст",
            "Укажите ваш стаж"
            ]
    }
}

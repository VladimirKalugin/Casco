//
//  AllParameters.swift
//  Casco
//
//  Created by fd on 13.09.2020.
//  Copyright © 2020 myself. All rights reserved.
//

import Foundation

struct AllParameters {
    let mark: String
    let model: String
    let year: Int
    let age: Int
    let experience: Int
}

extension AllParameters {
    init(mark: String) {self.mark = mark}
    init(model: String) {self.model = model}
    init(year: Int) {self.year = year}
    init(age: Int) {self.age = age}
    init(experience: Int) {self.experience = experience}
}

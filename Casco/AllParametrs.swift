//
//  AllParametrs.swift
//  Casco
//
//  Created by Fuhrer_SS on 13.09.2020.
//  Copyright © 2020 myself. All rights reserved.
//

import Foundation

struct AllParameters {
    var mark = ""
    var model = ""
    var year = 0
    var age = 0
    var experience = 0
}

extension AllParameters {
    init(mark: String) {self.mark = mark}
    init(model: String) {self.model = model}
    init(year: Int) {self.year = year}
    init(age: Int) {self.age = age}
    init(experience: Int) {self.experience = experience}
    
}

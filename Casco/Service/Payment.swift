//
//  Payment.swift
//  Casco
//
//  Created by fd on 15.09.2020.
//  Copyright © 2020 myself. All rights reserved.
//

import Foundation

func getPrice(for yourCar: AllParameters) -> Int {
    var payment = 0
    
    switch yourCar.mark {
    case "Audi":
        payment += 40000
    case "BMW":
        payment += 50000
    case "Cadillac":
        payment += 30000
    case "Volvo":
        payment += 25000
    default:
        break
    }
    
    switch yourCar.year {
    case possibleYears[0]:
        payment += 5000
    case possibleYears[1]:
        payment += 10000
    case possibleYears[2]:
        payment += 15000
    case possibleYears[3]:
        payment += 20000
    case possibleYears[4]:
        payment += 25000
    case possibleYears[5]:
        payment += 30000
    case possibleYears[6]:
        payment += 35000
    case possibleYears[7]:
        payment += 40000
    case possibleYears[8]:
        payment += 45000
    case possibleYears[9]:
        payment += 50000
    case possibleYears[10]:
        payment += 55000
    default:
        break
    }
    
    switch yourCar.age {
    case 18...25:
        payment += 50000
    case 26...29:
        payment += 45000
    case 30...35:
        payment += 40000
    case 36...39:
        payment += 35000
    case 40...45:
        payment += 30000
    case 46...55:
        payment += 25000
    case 56...:
        payment += 20000
    default:
        break
    }
    
    switch yourCar.experience {
        case 0...1:
        payment += 40000
        case 2...4:
        payment += 35000
        case 5...9:
        payment += 30000
        case 10...15:
        payment += 25000
        case 16...20:
        payment += 20000
        case 21...30:
        payment += 15000
        case 31...:
        payment += 10000
      
    default:
        break
    }
    
    return payment
}

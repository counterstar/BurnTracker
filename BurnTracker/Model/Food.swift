//
//  Food.swift
//  BurnTracker
//
//  Created by Vyacheslav Bratukhin on 16.02.2018.
//  Copyright © 2018 Vyacheslav Bratukhin. All rights reserved.
//

import Foundation

struct Food {
    enum ServingAmount: String {
        case ml
        case grams
        //можно добавить oz и конвертацию
    }
    
    var name: String
    
    var servingSize: (Float, ServingAmount)
    var servingDescription: (number: Float, description: String) //String - описание порции пользователем
    
    var proteins: Float
    var carbohydrates: Float
    var fats: Float
    
    var calories: Int
}

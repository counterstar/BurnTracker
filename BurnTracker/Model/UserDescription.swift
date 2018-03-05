//
//  UserDescription.swift
//  BurnTracker
//
//  Created by Vyacheslav Bratukhin on 16.02.2018.
//  Copyright © 2018 Vyacheslav Bratukhin. All rights reserved.
//

import Foundation

struct UserDescription {
    enum Gender: String {
        case male
        case female
    }
    
    enum ActivityLevel: String {
        case easy
        case light
        case moderate
        case heavy
        case extreme
    }
    
    var gender: Gender
    var height: Int //пока что только в см
    var weight: Int //пока что только в кг
    var dateOfBirth: Date
    var activityLevel: ActivityLevel
}

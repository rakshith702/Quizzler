//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by rakshith .M on 01/11/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct Question{
    var answer:String
    var question:String
    init(q : String, a:String){
        answer = a
        question = q
    }
}

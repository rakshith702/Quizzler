//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
    }
    var quizBrain = QuizBrain()

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        if quizBrain.questionNumber < quizBrain.quiz.count-1{
            quizBrain.questionNumber+=1
        }else{
            quizBrain.questionNumber = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){ [self] in
            updateUI()
        }
       
    }
    
    func updateUI(){
        questionLabel.text = quizBrain.getQuestion()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(quizBrain.questionNumber+1) / Float(quizBrain.quiz.count)
    }
    
}

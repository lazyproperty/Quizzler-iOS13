//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!

    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // questionLabel.text = quiz[questionNumber][0]
        updateUI()
        print(quizBrain.questionNumber)

    }
    
    @IBAction func unswerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        
        let noBackgroundColor: () = DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            sender.backgroundColor = UIColor.clear
        }
        
        //
        if userGotItRight {
            sender.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            noBackgroundColor
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            noBackgroundColor
        }
        //
        quizBrain.nextQuestion()
        updateUI()
    }
    
   
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        firstAnswer.setTitle(quizBrain.getVariant(for: 0), for: .normal)
        secondAnswer.setTitle(quizBrain.getVariant(for: 1), for: .normal)
        thirdAnswer.setTitle(quizBrain.getVariant(for: 2), for: .normal)

        
        /*
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        */
        
    }
    
}


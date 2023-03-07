//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var flaseBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizeBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0.0
       questionUpdate()
    }

    @IBAction func answerBtnPresseed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle!
      let userGotAnswer = quizeBrain.CheckAnswer(userAnswer: userAnswer)
        
        if userGotAnswer {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        quizeBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(questionUpdate), userInfo: nil, repeats: false)
    }
    @objc func questionUpdate(){
        questionLbl.text = quizeBrain.getQuestionText()
        progressBar.progress = quizeBrain.getProgress()
        scoreLbl.text = "Score : \(quizeBrain.getScrore())"
          trueBtn.backgroundColor = UIColor.clear
          flaseBtn.backgroundColor = UIColor.clear
       
        
    }
    
}


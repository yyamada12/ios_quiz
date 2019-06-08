//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Yoshinobu Yamada on 2019/06/08.
//  Copyright © 2019 Yoshinobu Yamada. All rights reserved.
//

import AudioToolbox
import UIKit

class QuestionViewController: UIViewController {
    
    var questionData: QuestionData!
    
    @IBOutlet weak var questionNoLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var correctImageView: UIImageView!
    @IBOutlet weak var incorrectImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionNoLabel.text = "Q.\(questionData.questionNo)"
        questionTextView.text = questionData.question
        answer1Button.setTitle(questionData.answer1, for: .normal)
        answer2Button.setTitle(questionData.answer2, for: .normal)
        answer3Button.setTitle(questionData.answer3, for: .normal)
        answer4Button.setTitle(questionData.answer4, for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func tapAnswer1Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 1
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer2Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 2
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer3Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 3
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer4Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 4
        goNextQuestionWithAnimation()
    }
    
    // MARK: - Private Functions
    
    private func goNextQuestionWithAnimation() {
        let isCorrect = questionData.isCorrect()
        let soundNo = isCorrect ? 1025 : 1006
        AudioServicesPlayAlertSound(SystemSoundID(soundNo))
        
        UIView.animate(withDuration: 2.0, animations: { [weak self] in
            guard let self = self else { return }
            if(isCorrect) {
                self.correctImageView.alpha = 1.0
            } else {
                self.incorrectImageView.alpha = 1.0
            }
        }, completion: { [weak self] _ in
            guard let self = self else { return }
            self.goNextQuestion()
        })
    }
    
    private func goNextQuestion() {
        if let nextQuestion = QuestionDataManager.shardInstance.nextQuestion() {
            guard let nextQuestionViewController = storyboard?.instantiateViewController(withIdentifier: "question") as? QuestionViewController else { return }
            nextQuestionViewController.questionData = nextQuestion
            present(nextQuestionViewController, animated: true, completion: nil)
        } else {
            guard let resultViewController = storyboard?.instantiateViewController(withIdentifier: "result") as? ResultViewController else { return }
            present(resultViewController, animated: true, completion: nil)
        }
        
    }

}

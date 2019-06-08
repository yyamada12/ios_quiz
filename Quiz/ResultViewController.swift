//
//  ResultViewController.swift
//  Quiz
//
//  Created by Yoshinobu Yamada on 2019/06/08.
//  Copyright © 2019 Yoshinobu Yamada. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var correctPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let questionCount = QuestionDataManager.shardInstance.questionDataArray.count
        let correctCount = QuestionDataManager.shardInstance.questionDataArray.filter { questionData in
            questionData.isCorrect()
        }.count
        let correctPercent = Float(correctCount) / Float(questionCount) * 100
        correctPercentLabel.text = String(format: "%.1f ", correctPercent) + "%"
    }
    
}

//
//  StartViewController.swift
//  Quiz
//
//  Created by Yoshinobu Yamada on 2019/06/08.
//  Copyright © 2019 Yoshinobu Yamada. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func goToTitle(_ segue: UIStoryboardSegue) {}

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        QuestionDataManager.shardInstance.loadQuestion()
        
        guard let nextViewController = segue.destination as? QuestionViewController else {
            return
        }
        
        guard let questionData = QuestionDataManager.shardInstance.nextQuestion() else {
            return
        }
        
        nextViewController.questionData = questionData
    }

}

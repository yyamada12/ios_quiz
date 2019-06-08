//
//  QuestionDataManager.swift
//  Quiz
//
//  Created by Yoshinobu Yamada on 2019/06/07.
//  Copyright © 2019 Yoshinobu Yamada. All rights reserved.
//

import Foundation

class QuestionData {
    var question: String
    
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    
    var correctAnswerNumber: Int

    var userChoiceAnswerNumber: Int?
    
    var questionNo = 0
    
    init(questionSourceDataArray: [String]) {
        question = questionSourceDataArray[0]
        answer1 = questionSourceDataArray[1]
        answer2 = questionSourceDataArray[2]
        answer3 = questionSourceDataArray[3]
        answer4 = questionSourceDataArray[4]
        correctAnswerNumber = Int(questionSourceDataArray[5])!
    }
    
    func isCorrect() -> Bool {
        return userChoiceAnswerNumber == correctAnswerNumber
    }
    
}

class QuestionDataManager {
    static let shardInstance = QuestionDataManager()
    var questionDataArray = [QuestionData]()
    var nowQuestionIndex = 0
    private init() {
        
    }
    
    func loadQuestion() {
        questionDataArray.removeAll()
        nowQuestionIndex = 0
        guard let csvFilePath = Bundle.main.path(forResource: "question", ofType: "csv") else {
            print("csvファイルが存在しません")
            return
        }
        do {
            let csvStringData = try String(contentsOfFile: csvFilePath, encoding: .utf8)
            csvStringData.enumerateLines { [weak self] line, stop in
                guard let self = self else { return }
                let questionSourceDataArray = line.components(separatedBy: ",")
                let questionData  = QuestionData(questionSourceDataArray: questionSourceDataArray)
                self.questionDataArray.append(questionData)
                questionData.questionNo = self.questionDataArray.count
            }
        } catch let error {
            print("csvファイル読み込みエラーが発生しました: \(error)")
            return
        }
    }
    
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex >= questionDataArray.count {
           return nil
        }
        let nextQuestion = questionDataArray[nowQuestionIndex]
        nowQuestionIndex += 1
        return nextQuestion
    }
    
    
}

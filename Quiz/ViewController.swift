//
//  ViewController.swift
//  Quiz
//
//  Created by Yoshinobu Yamada on 2019/06/05.
//  Copyright © 2019 Yoshinobu Yamada. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func tapStartButton(_ sender: Any) {
        let animation = CABasicAnimation(keyPath: "cornerRedius")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        animation.fromValue = 0
        animation.toValue = 40
        animation.duration = 3
        targetView.layer.add(animation, forKey: "cornerRadius")
//        targetView.layer.cornerRadius = 40
    }
    
}


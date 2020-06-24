//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Prosper Evergreen on 24.06.2020.
//  Copyright © 2020 proSPEC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var queLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    var quizEngine = QuizEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func onAnsBtnPressed(_ sender: UIButton) {
        //check for clicked btn exit, try again, correct ans or wrong ans
        switch sender.currentTitle {
        case "Exit":
            exit(0)
            break
        case "Try Again":
            trueBtn.setTitle("True", for: UIControl.State.normal)
            falseBtn.setTitle("False", for: UIControl.State.normal)
            progressBar.progress = 0.0
            quizEngine.reset()
            break
        case quizEngine.getCurrent().ans:
            sender.backgroundColor = UIColor.green
            quizEngine.incScore()
            break
        default:
            sender.backgroundColor = UIColor.red
            break
        }
        
        //got to next que or restart
        if quizEngine.canGoToNext(){
            perform(#selector(updateUI), with: nil, afterDelay: 0.5)
        }else{
            perform(#selector(finalUI), with: nil, afterDelay: 0.5)
        }
        
    }
    
    //update on clicked btn
    @objc func updateUI(){
        queLabel.text = quizEngine.getCurrent().que
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        progressBar.progress = quizEngine.getProgress()
        scoreLabel.text = quizEngine.getScore()
    }
    
    //after question completed restart or exit
    @objc func finalUI(){
        queLabel.text = "The End"
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        trueBtn.setTitle("Try Again", for: UIControl.State.normal)
        falseBtn.setTitle("Exit", for: UIControl.State.normal)
    }
    
    

}


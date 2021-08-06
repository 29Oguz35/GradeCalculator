//
//  ViewController.swift
//  GradeCalculaterApp
//
//  Created by naruto kurama on 5.08.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var midtermText: UITextField!
    @IBOutlet weak var finalText: UITextField!
    @IBOutlet weak var resultText: UITextField!
    @IBOutlet weak var gradePointLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultText.isEnabled = false
    }
    @IBAction func gradeButtonClicked(_ sender: Any) {
        if midtermText.text! == "" || finalText.text! == "" {
            alertAction()
        }else {
            let midterm = Double(midtermText.text!)!
            let final = Double(finalText.text!)!
            let result = Double(((midterm * 0.3) + (final * 0.7 )))
            
            resultText.text = "\(result)"
            
            switch result {
            case 90...100:
                gradePointLabel.text = "AA"
                break
            case 85..<90:
                gradePointLabel.text = "BA"
                break
            case 76..<85:
                gradePointLabel.text = "BB"
                break
            case 70..<76:
                gradePointLabel.text = "CB"
                break
            case 60..<70:
                gradePointLabel.text = "CC"
                break
            case 50..<60:
                gradePointLabel.text = "DC"
                break
            case 40..<50:
                gradePointLabel.text = "DD"
                break
            default:
                gradePointLabel.text = "FF"
                break
            }
        }
    }
    @IBAction func resetButtonClicked(_ sender: Any) {
        let midterm = ""
        let final = ""
        let result = ""
        let gradeLabel = ""
        
        midtermText.text = "\(midterm)"
        finalText.text = "\(final)"
        resultText.text = "\(result)"
        gradePointLabel.text = "\(gradeLabel)"
        
    }
    @IBAction func exitButtonClicked(_ sender: Any) {
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
    }
    func alertAction() {
        let alert = UIAlertController(title: "Oops!", message: "Please Write Exam Grade", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
        }
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

}


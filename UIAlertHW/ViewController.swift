//
//  ViewController.swift
//  UIAlertHW
//
//  Created by Дмитрий Процак on 17.07.2022.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var addingLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: WelcomeLabel
        welcomeLabel.backgroundColor = UIColor.orange
        welcomeLabel.layer.cornerRadius = 10
        welcomeLabel.layer.borderWidth = 1
        
        
        
        //MARK: AddingLabel
        addingLabel.backgroundColor = UIColor.orange
        addingLabel.layer.cornerRadius = 10
        addingLabel.layer.borderWidth = 2
        
        //MARK: GuessLabel
        guessLabel.backgroundColor = UIColor.orange
        guessLabel.layer.cornerRadius = 10
        guessLabel.layer.borderWidth = 2
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
      playerName(title: "Здравствуйте", message: "Введите свое имя", style: .alert)
    }

    
  
    
    @IBAction func addingAction(_ sender: UIButton) {
        addingLabel.text = ""
        adding(title: "Сложение", message: "Введите 2 числа", style: .alert)
    }
    
    
    @IBAction func guessAction(_ sender: UIButton) {
        guessLabel.text = ""
        guess(title: "Угадай!", message: "Введите число от 1 до 10", style: .alert)
    }
    
    



//MARK: PlayerName Function
func playerName(title: String, message: String, style: UIAlertController.Style) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
    let alertAction = UIAlertAction(title: "Enter", style: .default) { (action) in
        let text = alertController.textFields?.first?.text
        self.welcomeLabel.text = "Привет, \(text ?? "незнакомец")!"
        
    }
    alertController.addTextField(configurationHandler: nil)
    alertController.addAction(alertAction)
    self.present(alertController, animated: true, completion: nil)
    
  }
    
  //MARK: Adding Function
func adding(title: String, message: String, style: UIAlertController.Style) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
    let alertAction = UIAlertAction(title: "Enter", style: .default, handler : {( action) in
        let first = alertController.textFields?.first
        let second = alertController.textFields?.last
        let sum = String((Int((first?.text)!) ?? 0) + (Int((second?.text)!) ?? 0))
        self.addingLabel?.text! = sum
    })
    
    alertController.addTextField(configurationHandler: nil)
    alertController.addTextField(configurationHandler: nil)
    alertController.addAction(alertAction)
    self.present(alertController, animated: true, completion: nil)
}
    
    func guess(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let alertAction = UIAlertAction(title: "Enter", style: .default, handler: { action in
            let number = alertController.textFields?.first
            let randomNumber = Int.random(in: 1...10)
          
            if number?.text == String(randomNumber) {
                self.guessLabel.text = "Correct"
            } else {
                self.guessLabel.text = "Wrong"
            }
            
        })
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}

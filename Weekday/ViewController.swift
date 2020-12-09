//
//  ViewController.swift
//  Weekday
//
//  Created by Илья Гайворонский on 08.12.2020.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextFiled: UITextField!
    
    @IBOutlet weak var resultTextField: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextFiled.text else { // Проверка опционального типа на nil
            return
        }
    
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" //вывод дня недели
        dateFormatter.locale = Locale(identifier: "ru_Ru") // локализация вывода на русский
        
        guard let date = calendar.date(from: dateComponents) else { return }  // Проверка опционального типа на nil
        let dayOfWeek = dateFormatter.string(from: date)
        let dayOfWeekCapital = dayOfWeek.capitalized //вывод с заглавной буквы
        
        resultTextField.text = dayOfWeekCapital
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // скрываем клавиатуру по тапу
    }
}


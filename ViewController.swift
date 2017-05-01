//
//  ViewController.swift
//  Below
//
//  Created by Emily Nguyen on 4/19/17.
//  Copyright © 2017 Emily Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {


    @IBOutlet weak var firstNameText: UITextField!
    
    @IBOutlet weak var textBoxBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.showKeyboard(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.replaceNameTextField(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure" {
            
            do {
                if let firstName = firstNameText.text {
                    if firstName == "" {
                        throw gameError.noFirstName
                    } else {
                        guard let pageController = segue.destination as? PageController else {return}
                        
                        pageController.page = Adventure.story(firstName: firstName)
                    }
                }
            } catch gameError.noFirstName {
                
                let alert = UIAlertController(title: "First Name Not Provided", message: "Enter a name to continue", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil)
            } catch let error {
                fatalError("\(error.localizedDescription)")
            }
        }
    }
    
    func showKeyboard(_ notification: Notification) {
        if let info = notification.userInfo, let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let frame = keyboardFrame.cgRectValue
            textBoxBottom.constant = frame.size.height + 5
            UIView.animate(withDuration: 0.8) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func replaceNameTextField(_ notification: Notification) {
        textBoxBottom.constant = 20
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



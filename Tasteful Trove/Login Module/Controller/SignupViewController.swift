//
//  SignupViewController.swift
//  Tasteful Trove
//
//  Created by Sanyam Koul on 29/05/23.
//

import Foundation
import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var gettingStartedLabel: UILabel!
    @IBOutlet weak var onboardingText: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func registerAction(_ sender: Any) {
        
        
    }
    
    let loginLabels = LoginLabels()
    let customFonts = CustomFonts()
    let colorConstants = ColorConstants()
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        initialize()
        self.view.layoutIfNeeded()
        layerUpdates()
        
    }
    
    func initialize(){
        
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        usernameTextField.setAttributedPlaceholder(loginLabels.usernamePlaceholder, textColor: colorConstants.SophisticatedSlatePrimary?.withAlphaComponent(0.5), font: customFonts.LatoRegular14)
        
        emailTextField.setAttributedPlaceholder(loginLabels.emailPlaceholder, textColor: colorConstants.SophisticatedSlatePrimary?.withAlphaComponent(0.5), font: customFonts.LatoRegular14)
        
        passwordTextField.setAttributedPlaceholder(loginLabels.passwordPlaceholder, textColor: colorConstants.SophisticatedSlatePrimary?.withAlphaComponent(0.5), font: customFonts.LatoRegular14)
        
    }
    
    func layerUpdates(){
        
        usernameTextField.layer.cornerRadius = 15
        usernameTextField.layer.borderColor = colorConstants.DelicatePearlAccent?.withAlphaComponent(0.6).cgColor
        usernameTextField.layer.borderWidth = 1
        
        emailTextField.layer.cornerRadius = 15
        emailTextField.layer.borderColor = colorConstants.DelicatePearlAccent?.withAlphaComponent(0.6).cgColor
        emailTextField.layer.borderWidth = 1
        
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.borderColor = colorConstants.DelicatePearlAccent?.withAlphaComponent(0.6).cgColor
        passwordTextField.layer.borderWidth = 1
        
        registerButton.layer.cornerRadius = 15
        registerButton.dropShadow(color: .black, opacity: 0.3, offSet: CGSize(width: 3, height: 20), radius: 15)
        
    }
    
}
extension SignupViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameTextField {
            
            emailTextField.becomeFirstResponder()
            
        }
        else if textField == emailTextField {
            
            passwordTextField.becomeFirstResponder()
            
        }
        else {
            
            textField.resignFirstResponder()
            
        }
        return true
        
    }
    
}

//
//  LoginViewController.swift
//  Tasteful Trove
//
//  Created by Sanyam Koul on 26/05/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var createAccountLabel: UILabel!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var loginElementsView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBAction func forgotPasswordAction(_ sender: Any) {
        
        closeKeyboard()
        
    }
    @IBAction func createAccountAction(_ sender: Any) {
        
        closeKeyboard()
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController else { return }
        navigationController?.pushViewController(vc, animated: true)    
        
    }
    @IBAction func signInAction(_ sender: Any) {
        
        closeKeyboard()
        
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
        
        initialize()
        self.view.layoutIfNeeded()
        layerUpdates()
        
    }
    
    func initialize(){
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        forgotPasswordLabel.setAttributedText(loginLabels.forgotPassword, with: loginLabels.forgotPassword, highlightColor: nil, textColor: colorConstants.SophisticatedSlatePrimary, font: customFonts.LatoBold15)
        
        welcomeText.setAttributedText(loginLabels.loginWelcome, with: loginLabels.loginWelcome, highlightColor: nil, textColor: colorConstants.SophisticatedSlatePrimary, font: customFonts.LatoRegular16)
        
        usernameTextField.setAttributedPlaceholder(loginLabels.usernamePlaceholder, textColor: colorConstants.SophisticatedSlatePrimary?.withAlphaComponent(0.5), font: customFonts.LatoRegular14)
        
        passwordTextField.setAttributedPlaceholder(loginLabels.passwordPlaceholder, textColor: colorConstants.SophisticatedSlatePrimary?.withAlphaComponent(0.5), font: customFonts.LatoRegular14)
    
        createAccountLabel.setAttributedText(loginLabels.createAccount, with: loginLabels.signUp, highlightColor: nil, textColor: colorConstants.SophisticatedSlatePrimary, font: customFonts.LatoBlack15)
        
        signInButton.setAttributedTitle( loginLabels.signin, with: loginLabels.signin, highlightColor: nil, textColor: colorConstants.ChicIvoryPrimary, font: customFonts.LatoRegular15, underline: false, underlineColor: colorConstants.ChicIvoryPrimary)
                                            
        loginElementsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeKeyboard)))
        
    }
    
    func layerUpdates(){
        
        usernameTextField.layer.cornerRadius = 15
        usernameTextField.layer.borderColor = colorConstants.DelicatePearlAccent?.withAlphaComponent(0.6).cgColor
        usernameTextField.layer.borderWidth = 1
        
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.borderColor = colorConstants.DelicatePearlAccent?.withAlphaComponent(0.6).cgColor
        passwordTextField.layer.borderWidth = 1
        
        signInButton.layer.cornerRadius = 15
        signInButton.dropShadow(color: .black, opacity: 0.3, offSet: CGSize(width: 3, height: 20), radius: 15)
        
    }
    
    @objc func closeKeyboard() {
        
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
    }
}
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameTextField {
            
            passwordTextField.becomeFirstResponder()
            
        }
        else {
            
            textField.resignFirstResponder()
            
        }
        return true
        
    }
    
}

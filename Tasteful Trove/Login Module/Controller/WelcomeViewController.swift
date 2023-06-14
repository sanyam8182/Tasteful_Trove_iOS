//
//  WelcomeViewController.swift
//  Tasteful Trove
//
//  Created by Sanyam Koul on 30/05/23.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var welcomeText2: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBAction func SignUpAction(_ sender: Any) {
        
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func SignInAction(_ sender: Any) {
     
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    let loginLabels = LoginLabels()
    let customFonts = CustomFonts()
    let colorConstants = ColorConstants()
    let storyBoard = UIStoryboard(name: "Login", bundle: nil)
   
    override func viewWillAppear (_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initialize()
        view.layoutIfNeeded()
        layerUpdates()
    }
    
    func initialize() {
        
        signUpButton.setAttributedTitle(loginLabels.signUp, with: loginLabels.signUp, highlightColor: nil, textColor: colorConstants.PastleGreen, font: customFonts.MulishBold(size: 15))
        
        signInButton.setAttributedTitle( loginLabels.signin, with: loginLabels.signin, highlightColor: nil, textColor: colorConstants.ChicIvoryPrimary, font: customFonts.MulishBold(size: 15))
        
    }
    func layerUpdates(){
        
        signUpButton.layer.cornerRadius = 15
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = colorConstants.DelicatePearlAccent?.cgColor
        
        signInButton.layer.cornerRadius = 15
        signInButton.dropShadow(color: .black, opacity: 0.3, offSet: CGSize(width: 3, height: 20), radius: 15)
        
    }
}

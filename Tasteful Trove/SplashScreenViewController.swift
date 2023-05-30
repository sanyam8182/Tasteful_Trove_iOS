//
//  SplashScreenViewController.swift
//  Tasteful Trove
//
//  Created by Sanyam Koul on 26/05/23.
//

import Foundation
import UIKit

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backgroundLayover: UIView!
    @IBOutlet weak var appNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            
            [weak self] in
            
            DispatchQueue.main.async {
                
                let storyBoard = UIStoryboard(name: "Login", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
                self?.navigationController?.pushViewController(vc, animated: true)
                
                
            }
            
        }
        
    }
    
}

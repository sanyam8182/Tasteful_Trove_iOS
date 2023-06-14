//
//  CustomFonts.swift
//  Tasteful Trove
//
//  Created by Sanyam Koul on 26/05/23.
//

import Foundation
import UIKit

class CustomFonts {
    
    //Mulish font
    func MulishBold(size: CGFloat) -> UIFont{
        UIFont(name: "Mulish-Bold", size: size)!
    }
    func MulishMedium(size: CGFloat) -> UIFont{
        UIFont(name: "Mulish-Medium", size: size)!
    }
    func MulishSemibold(size: CGFloat) -> UIFont{
        UIFont(name: "Mulish-SemiBold", size: size)!
    }
    
    //Playfair font
    func PlayfairBlack(size: CGFloat) -> UIFont{
        UIFont(name: "PlayfairDisplay-Black", size: size)!
    }
    
    //DM Sans font
    
    func DMSansMedium(size: CGFloat) -> UIFont{
        UIFont(name: "DMSans-Medium", size: size)!
    }
    
}

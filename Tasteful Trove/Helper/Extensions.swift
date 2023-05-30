//
//  Extensions.swift
//  Tasteful Trove
//
//  Created by Sanyam Koul on 26/05/23.
//

import Foundation
import UIKit

extension UIButton {
    
    func setAttributedTitle(_ text: String, with search: String, highlightColor: UIColor?, textColor: UIColor?, font: UIFont, letterSpacing: CGFloat? = nil, lineHeight: CGFloat? = nil, underline: Bool? = false, underlineColor: UIColor? = nil) {
        
        let attributedText = NSMutableAttributedString(string: text)
        let range = NSString(string: text).range(of: search, options: .caseInsensitive)
        var highlightedAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, ]
        
        if let _highlightColor = highlightColor {
            
            highlightedAttributes[NSAttributedString.Key.backgroundColor] = _highlightColor
            
        }
        if let _textColor = textColor {
            
            highlightedAttributes[NSAttributedString.Key.foregroundColor] = _textColor
            
        }
        if let _letterSpacing = letterSpacing {
            
            highlightedAttributes[NSAttributedString.Key.kern] = _letterSpacing
            
        }
        if let _underline = underline {
            
            if _underline {
                
                highlightedAttributes[NSAttributedString.Key.underlineStyle] = NSUnderlineStyle.single.rawValue
                highlightedAttributes[NSAttributedString.Key.underlineColor] = underlineColor?.cgColor
                
            }
            
        }
        if let _lineHeight = lineHeight {
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = _lineHeight
            paragraphStyle.hyphenationFactor = 1.0
            highlightedAttributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
            
        }
        // adding for language identifier
//            if #available(iOS 15.0, *) {
//                highlightedAttributes[NSAttributedString.Key.languageIdentifier] = "de"
//            }
        
        attributedText.addAttributes(highlightedAttributes, range: range)
        self.setAttributedTitle(attributedText, for: .normal)
    }
    
}

extension UILabel {
    
    func setAttributedText(_ text: String, with search: String, highlightColor: UIColor?, textColor: UIColor?, font: UIFont, letterSpacing: CGFloat? = nil, lineHeight: CGFloat? = nil, underline: Bool? = false, underlineColor: UIColor? = nil) {
        
        let attributedText = NSMutableAttributedString(string: text)
        let range = NSString(string: text).range(of: search, options: .caseInsensitive)
        var highlightedAttributes = [NSAttributedString.Key: Any] ()
        
        highlightedAttributes = [NSAttributedString.Key.foregroundColor: textColor ?? .clear, NSAttributedString.Key.font: font]
        
        if let _letterSpacing = letterSpacing {
            
            highlightedAttributes[NSAttributedString.Key.kern] = _letterSpacing
            
        }
        if let _lineHeight = lineHeight {
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = _lineHeight
            highlightedAttributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
            
        }
        if let _underline = underline {
            
            if _underline {
                
                highlightedAttributes[NSAttributedString.Key.underlineStyle] = NSUnderlineStyle.single.rawValue
                highlightedAttributes[NSAttributedString.Key.underlineColor] = underlineColor?.cgColor
                
            }
            
        }
        attributedText.addAttributes(highlightedAttributes, range: range)
        self.attributedText = attributedText
        
    }
    
}

extension UITextField {
    
    func setAttributedPlaceholder(_ text: String, textColor: UIColor?, font: UIFont) {
        
        var attributes = [NSAttributedString.Key: Any] ()
        
        attributes = [ NSAttributedString.Key.foregroundColor: textColor, NSAttributedString.Key.font: font]
        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        self.attributedPlaceholder = attributedText
        
    }
}

extension UIView {
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true){
        
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
    }
    
}

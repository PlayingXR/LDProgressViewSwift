//
//  UIColor+Extension.swift
//  Realibox
//
//  Created by 伍小华 on 2018/7/25.
//  Copyright © 2018年 伍小华. All rights reserved.
//

import UIKit
extension UIColor {
    class func RGBA(_ red: CGFloat,_ green: CGFloat,_ blue: CGFloat,_ alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    class func RGB(_ red: CGFloat,_ green: CGFloat,_ blue: CGFloat) -> UIColor {
        return self.RGBA(red, green, blue, 1.0)
    }
    class func hex(_ hexValue: Int) -> UIColor {
        return self.RGB(CGFloat((hexValue & 0xFF0000) >> 16), CGFloat((hexValue & 0xFF00) >> 8), CGFloat(hexValue & 0xFF))
    }
    
    class func hex(_ hexString: String) -> UIColor {
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if cString.count < 6 { return UIColor.black }
        
        let index = cString.index(cString.endIndex, offsetBy: -6)
        let subString = cString[index...]
        if cString.hasPrefix("0X") || cString.hasPrefix("0x") { cString = String(subString) }
        if cString.hasPrefix("#") { cString = String(subString) }
        
        if cString.count != 6 { return UIColor.black }
        
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var red: UInt32 = 0x0
        var green: UInt32 = 0x0
        var blue: UInt32 = 0x0
        
        Scanner(string: rString).scanHexInt32(&red)
        Scanner(string: gString).scanHexInt32(&green)
        Scanner(string: bString).scanHexInt32(&blue)
        
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    
    class var random: UIColor {
        return UIColor.RGB(CGFloat(arc4random_uniform(256)), CGFloat(arc4random_uniform(256)), CGFloat(arc4random_uniform(256)))
    }
    
    var r: Float {
        get {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            return Float(red)
        }
    }
    var g: Float {
        get {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            return Float(green)
        }
    }
    var b: Float {
        get {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            return Float(blue)
        }
    }
    var a: Float {
        get {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            return Float(alpha)
        }
    }
    var isClear: Bool {
        get {
            return self == UIColor.clear
        }
    }
    
    var isLighter: Bool {
        get {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            if (red + green + blue) / 3.0 >= 0.5 {
                return true
            } else {
                return false
            }
        }
    }
    
    var lighter: UIColor {
        get {
            if self == .white {
                return self
            }
            if self == .black {
                return UIColor(white: 0.01, alpha: 1.0)
            }
            
            var hue: CGFloat = 0
            var saturation: CGFloat = 0
            var brightness: CGFloat = 0
            var alpha: CGFloat = 0
            var white: CGFloat = 0
            
            if self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
                return UIColor(hue: hue,
                               saturation: saturation,
                               brightness: min(brightness * 1.3, 1.0),
                               alpha: alpha)
            }
            if self.getWhite(&white, alpha: &alpha) {
                return UIColor(white: min(white * 1.3, 1.0), alpha: alpha)
            }
            return UIColor.white
        }
    }
    var darker: UIColor {
        get {
            if self == .white {
                return UIColor(white: 0.99, alpha: 1.0)
            }
            if self == .black {
                return self
            }
            
            var hue: CGFloat = 0
            var saturation: CGFloat = 0
            var brightness: CGFloat = 0
            var alpha: CGFloat = 0
            var white: CGFloat = 0
            
            if self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
                return UIColor(hue: hue,
                               saturation: saturation,
                               brightness: brightness * 0.75,
                               alpha: alpha)
            }
            if self.getWhite(&white, alpha: &alpha) {
                return UIColor(white: white * 0.75, alpha: alpha)
            }
            return UIColor.black
        }
    }
}

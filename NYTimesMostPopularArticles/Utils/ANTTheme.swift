//
//  ANTTheme.swift
//  NYTimesMostPopularArticles
//
//  Created by ADMIN on 19/10/18.
//  Copyright © 2018 Anugrah Nath Tiwari. All rights reserved.
//

import UIKit

class ANTTheme: NSObject {

    static let shared = ANTTheme()
    
    // Date formate
    
    func date_monthDayYear(_ date: Date?) -> String? {
        var formatter: DateFormatter?
        
        var onceToken: Int = 0
        if (onceToken == 0) {
            formatter = DateFormatter()
            formatter?.dateStyle = .medium
        }
        onceToken = 1
        
        if let aDate = date {
            return formatter?.string(from: aDate)
        }
        return nil
    }
    
    // Ui Font
    
    func georgiaFontOfSize(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "Georgia", size: size)
    }
    
    func primaryFont() -> UIFont? {
        return UIFont(name: "Cheltenham", size: 20)
    }
    
    // Color
    
    func primaryGrayColor() -> UIColor? {
        return UIColor(red: 92.0 / 255.0, green: 92.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
    }
    
    func primaryLightGrayColor() -> UIColor? {
        return UIColor(red: 247.0 / 255.0, green: 247.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
    }
    
    func primaryDarkGrayColor() -> UIColor? {
        return UIColor(red: 92.0 / 255.0, green: 92.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
    }

}

//
//  ANTMapArray.swift
//  NYTimesMostPopularArticles
//
//  Created by ADMIN on 19/10/18.
//  Copyright © 2018 Anugrah Nath Tiwari. All rights reserved.
//

import UIKit

class ANTMapArray: NSArray {
    
    func mapwithBlock(withBlock block: @escaping (Any?) -> Any?) -> [AnyHashable]? {
        var result = [AnyHashable](repeating: 0, count: count)
        for obj: Any? in self {
            let mapped = block(obj)
            
            if mapped != nil {
                if let aMapped = mapped {
                    result.append(aMapped as! AnyHashable)
                }
            }
        }
        return result
    }
}

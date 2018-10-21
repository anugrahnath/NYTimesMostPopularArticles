//
//  ANTAlert.swift
//  NYTimesMostPopularArticles
//
//  Created by ADMIN on 19/10/18.
//  Copyright © 2018 Anugrah Nath Tiwari. All rights reserved.
//

import UIKit

class ANTAlert: NSObject {

    private override init() { }
    
    // MARK: Shared Instance
    static let shared = ANTAlert()
    
    
    func showAlertWith(_ title:String!, message:String!, onVC:UIViewController!) -> Void {
        let alertC = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction.init(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alertC.addAction(okAction)
        onVC.present(alertC, animated: true, completion: nil)
    }
}

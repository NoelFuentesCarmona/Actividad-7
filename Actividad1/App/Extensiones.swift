//
//  Extensiones.swift
//  Actividad1
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 gs. All rights reserved.
//

import Foundation
import  UIKit
extension String  {
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
}


extension UIColor {
    class var micolorrojo : UIColor {
        return UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 20/255)
    }
    
}

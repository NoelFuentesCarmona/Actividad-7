//
//  AdminViewController.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 gs. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
//var UsuarioLogeado : Persona? ;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("1. La vista cargo")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("2. La vista va aparecer")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("3. La vista aparecio")
//          let lbMessage = UILabel(frame: CGRect(x: 00, y:600, width: 400, height: 50))
//        lbMessage.textAlignment = .center
//        lbMessage.text=(UsuarioLogeado?.nombre)!
//        lbMessage.frame=CGRect(x: 50, y:150, width: 300, height: 50)
//       lbMessage.textColor = .green;
//        self.view.addSubview(lbMessage)
//
//
//        let lbEmail = UILabel(frame: CGRect(x: 00, y:600, width: 400, height: 50))
//        lbEmail.textAlignment = .center
//        lbEmail.text = (UsuarioLogeado?.correoelectronico)!;
//        lbEmail.frame=CGRect(x: 50, y:200, width: 300, height: 50)
//        lbEmail.textColor = UIColor.blue;
//        self.view.addSubview(lbEmail)
        
        
    
        
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("4. La  vista va a desaparecer")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("5. La vista desaparecio")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

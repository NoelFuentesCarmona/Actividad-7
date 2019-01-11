//
//  ViewController.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 gs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isloggin : Bool =  false;
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
        let lbMessage = UILabel(frame: CGRect(x: 00, y:600, width: 400, height: 50))
    var personalogeada : Usuario? ;
    
    
 
    
//    @IBAction func btnLgin(_ sender: UIButton) {
//
//        PersonaCore.init().IniciarSesioncallWs(txtUser.text!,txtPassword.text!) { (result) in
//
//            if result as! Bool {
//
//                self.isloggin = true;
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
//
//
//            }else{
//                self.isloggin =  false;
//                let alerta: UIAlertController = UIAlertController.init(title: "Mi aplicacion", message: "Usuario no registrado", preferredStyle: UIAlertController.Style.alert);
//                let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);
//
//                alerta.addAction(okAlerta)
//                self.present(alerta, animated: true, completion: nil);
//            }
//
//
//    }
//    }
    
    @IBAction func btnLgin(_ sender: UIButton) {

        
        var result = false
        var uriString="\(Constants.URL_DESA.apiWSLogin)?username=\(txtUser.text!)&password=\(txtPassword.text!.toBase64())";
        
        
        let request = URLRequest(url : URL(string: uriString)! )
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            
            if error != nil {
                print("Se produjo un error \(error)")
            }
            else{
                if let info = data {
                    do{
                        let jsonresult = try JSONSerialization.jsonObject(with: info)
                            as! [String:AnyObject]
                        print(jsonresult)
                        if  let estatuscode = jsonresult["status"]{
                             DispatchQueue.main.async {
                            if  estatuscode as! Int == 1{
                                
                                self.isloggin = true;
                                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                              
                                
                            }else
                            {
                               
                                    self.isloggin =  false;
                                    let alerta: UIAlertController = UIAlertController.init(title: "Mi aplicacion", message: "Usuario no registrado", preferredStyle: UIAlertController.Style.alert);
                                    let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);
                                    
                                    alerta.addAction(okAlerta)
                                    self.present(alerta, animated: true, completion: nil);
                                
                            }
                                  }
                            
                        }
                        
                    }
                    catch{}
                    
                }
            }
            
        }
        )
        task.resume();
        


    }
    @IBAction func btnLoginDecodable(_ sender: UIButton) {
        
        var result = false
        var uriString="\(Constants.URL_DESA.apiWSLogin)?username=\(txtUser.text!)&password=\(txtPassword.text!.toBase64())";
        
        
        let request = URLRequest(url : URL(string: uriString)! )
        
        _ = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            if error != nil {
                print("Se produjo un error \(error)")
            }
            else{
                if let info = data {
                    do{
                        var jsonresult = try JSONDecoder().decode(loginResult.self, from: info)
                        
                        print(jsonresult)
                        
                            DispatchQueue.main.async {
                                if  jsonresult.status {
                                    
                                    self.isloggin = true;
                                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                                    
                                    
                                }else
                                {
                                    
                                    self.isloggin =  false;
                                    let alerta: UIAlertController = UIAlertController.init(title: "Mi aplicacion", message: "Usuario no registrado \(jsonresult.message)", preferredStyle: UIAlertController.Style.alert);
                                    let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);
                                    
                                    alerta.addAction(okAlerta)
                                    self.present(alerta, animated: true, completion: nil);
                                    
                                }
                            }
                            
                        
                        
                    }
                    catch{}
                    
                }
            }
            
        }.resume();
        
        
    }
    override func viewDidLoad() {
        
        lbMessage.textAlignment = .center
        self.view.addSubview(lbMessage)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func txtUserAction(_ sender: UITextField) {
        clearMessage()
        if(!isValidEmail(string: sender.text!) && !(sender.text?.isEmpty)!){
            mostrarMenssage("Favor de colocar un correo valido", Int(sender.frame.origin.x), Int(sender.frame.origin.y)+Int(sender.frame.size.height))
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcd = segue.destination as? AdminViewController{
           // vcd.UsuarioLogeado = personalogeada
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "recoverPasswordSegue":
            print("Recuperando contraseña");
        case "loginSegue":
            if self.isloggin
            {return true}
            else
            {return false}
           
        default:
            print("cualquier") ;
        }
        return true;
    }
    
    
    
    @objc func isValidEmail(string: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: string)
    }
    
    @objc func onlyNummbers(_ cadena : String) -> Bool{
        if(!cadena.isEmpty)
        {let num = Int(cadena);
            if num != nil {
                return true;
            }
            else {
                return false;
            }}
        else{return true}
    }
    
    
    
    // MARK: - Message
    
    @objc func mostrarMenssage(_ mensaje : String , _ Xpx : Int , _ Ypx : Int , _ tipo : Bool = false)->Void{
        lbMessage.text=mensaje;
        lbMessage.frame=CGRect(x: 50, y:Ypx-10, width: 300, height: 50)
        if tipo {
            lbMessage.textColor = .green;
        }
        else{
            lbMessage.textColor = .red;
        }
        lbMessage.layer.cornerRadius = 5;
        
    }
    
    @objc func clearMessage()
    {
        lbMessage.text="";
        lbMessage.backgroundColor=UIColor.clear
    }
    
}


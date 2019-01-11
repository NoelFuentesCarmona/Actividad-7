//
//  RecoverPasswordViewController.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 gs. All rights reserved.
//

import UIKit

class RecoverPasswordViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    let lbMessage = UILabel(frame: CGRect(x: 00, y:600, width: 400, height: 50))
    
    
    @IBAction func btnRecoverPassword(_ sender: UIButton) {
        var loginResult = PersonaCore.init().ValidarUsuario(txtEmail.text!)
        var result = ( loginResult != nil) ? true  : false ;
        if result{
            //mandar correo
            let alerta: UIAlertController = UIAlertController.init(title: "Mensaje enviado", message: "Se envio un correo electronico a la cuenta " + loginResult!.correoelectronico + "con la contraseña " + loginResult!.password, preferredStyle: UIAlertController.Style.alert);
            
            let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);
            
            alerta.addAction(okAlerta)
            present(alerta, animated: true, completion: nil);
            
        }
        else{
            
            let alerta: UIAlertController = UIAlertController.init(title: "Usuario Invalido", message: "La dirección de correo no se encuentra registrada", preferredStyle: UIAlertController.Style.alert);
            
            let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);
            
            alerta.addAction(okAlerta)
            present(alerta, animated: true, completion: nil);
            
        }
        
    }
    override func viewDidLoad() {
        lbMessage.textAlignment = .center
        self.view.addSubview(lbMessage)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func txtEmailEditing(_ sender: UITextField) {
        
        clearMessage()
        if(!isValidEmail(string: sender.text!) && !(sender.text?.isEmpty)!){
            mostrarMenssage("Favor de colocar un correo valido", Int(sender.frame.origin.x), Int(sender.frame.origin.y)+Int(sender.frame.size.height))
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
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

//
//  RegistroViewController.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 gs. All rights reserved.
//

import UIKit

class RegistroViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRepeatPassword: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtNumeroEmpleado: UITextField!
    let lbMessage = UILabel(frame: CGRect(x: 00, y:600, width: 400, height: 50))
    override func viewDidLoad() {
        lbMessage.textAlignment = .center
        self.view.addSubview(lbMessage)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func txtEmailEdit(_ sender: UITextField) {
        clearMessage()
        if(!isValidEmail(string: sender.text!) && !(sender.text?.isEmpty)!){
            mostrarMenssage("Favor de colocar un correo valido", Int(sender.frame.origin.x), Int(sender.frame.origin.y)+Int(sender.frame.size.height))
        }
    }
    @IBAction func txtPasswordEdit(_ sender: UITextField) {
        
        clearMessage();
        if (txtPassword.text != txtRepeatPassword.text) && !(txtRepeatPassword.text!.isEmpty)   {
            mostrarMenssage("No coincide la contraseña", Int(sender.frame.origin.x), Int(sender.frame.origin.y)+Int(sender.frame.size.height))
        }
    }
    @IBAction func txtRepeatPasswordEdit(_ sender: UITextField) {
        
        clearMessage();
        if txtPassword.text != txtRepeatPassword.text {
            mostrarMenssage("No coincide la contraseña", Int(sender.frame.origin.x), Int(sender.frame.origin.y)+Int(sender.frame.size.height))
        }
    }
    @IBAction func txtTelefonoEdit(_ sender: UITextField) {
        clearMessage();
        if !onlyNummbers(sender.text!) {
            mostrarMenssage("Favor de introducir solo numeros", Int(sender.frame.origin.x), Int(sender.frame.origin.y)+Int(sender.frame.size.height))
        }
    }
    @IBAction func txtNumeroEmpleadoEdit(_ sender: UITextField) {
        clearMessage();
        if !onlyNummbers(sender.text!) {
            mostrarMenssage("Favor de introducir solo numeros", Int(sender.frame.origin.x), Int(sender.frame.origin.y)+Int(sender.frame.size.height))
        }
    }
    
    @IBAction func btnRegistrarUsuario(_ sender: UIButton) {
        
        if  (
            (txtName.text?.isEmpty)! || (txtEmail.text?.isEmpty)! || (txtPassword.text?.isEmpty)!  ||  (txtRepeatPassword.text?.isEmpty)! || (txtTelefono.text?.isEmpty)!  ||  (txtNumeroEmpleado.text?.isEmpty)!
           
            )
        {
             mostrarMenssage("Campos incompletos", Int(sender.frame.origin.x), Int(sender.frame.origin.y)+Int(sender.frame.size.height))
        }
        else{
            var loginResult = PersonaCore.init().ValidarUsuario(txtEmail.text!)
            var result = ( loginResult != nil) ? true  : false ;
            if result{
                //mandar correo
                let alerta: UIAlertController = UIAlertController.init(title: "Usuario ya regisrado", message: "El usuario ya se encuentra registrado", preferredStyle: UIAlertController.Style.alert);
                
                let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);
                
                alerta.addAction(okAlerta)
                present(alerta, animated: true, completion: nil);
                
            }
            else{
                
                let alerta: UIAlertController = UIAlertController.init(title: "Usuario Registrado correctamente", message: "El Usuario a sido registrado correctamente", preferredStyle: UIAlertController.Style.alert);
                
                let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);
                
                alerta.addAction(okAlerta)
                present(alerta, animated: true, completion: nil);
                
            }
        
        }
//        self.dismiss(animated: true) {
//            print("regresando al inicio")
//        }
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

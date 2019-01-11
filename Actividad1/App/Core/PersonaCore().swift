//
//  PersonaCore().swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 gs. All rights reserved.
//

import Foundation

class PersonaCore{
    
    
    func IniciarSesion(_ user: String, _ password: String )->Usuario?  {
        
     let request = URLRequest(url: NSURL(string: Constants.URL_DESA.apiWSLogin)! as URL)
    var userLogin : Usuario?

      var bdUsuarios =  GetInfoBD.init().GetDataBD();
        for usuario in bdUsuarios {

            if (usuario.correoelectronico == user && usuario.password == password)
            {
                userLogin=usuario;
                break;
            }


        }
        return userLogin;
    }
    

    func IniciarSesioncallWs(_ user: String, _ password: String, _ completion: @escaping (AnyObject) -> ()  ) {
        var result = false
        var uriString="\(Constants.URL_DESA.apiWSLogin)?username=\(user)&password=\(password.toBase64())";
        var bandera =  false;
        
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
                            if  estatuscode as! Int == 1{
                                print("welcome");
                               result = true
                                
                            }
                            
                        }
                        
                    }
                    catch{}
                    
                }
            }
               completion(result as NSObject)
        }
                    )
        task.resume();
    
    }
    
    
    
    func ValidarUsuario(_ user: String )->Usuario?  {
        var userLogin : Usuario?
        
        var bdUsuarios =  GetInfoBD.init().GetDataBD();
        for usuario in bdUsuarios {
            
            if (usuario.correoelectronico == user)
            {
                userLogin=usuario;
                break;
            }
            
        }
        return userLogin;
    }
    
}


/*
 
 https://stackoverflow.com/questions/38952420/swift-wait-until-datataskwithrequest-has-finished-to-call-the-return
 
 completion is the right and the best way in swift!
 
 func sendRequest (request: NSURLRequest,completion:(NSData?)->()){
 
 NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
 if error != nil{
 return completion(data)
 }else{
 return completion(nil)
 }
 }.resume()
 }
 and call:
 
 sendRequest( yourRequest ) { data in
 if let data = data {
 // do something
 }
 }}
 
 */

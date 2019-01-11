//
//  GetDataInfoPersistence.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 gs. All rights reserved.
//

import Foundation
import CoreData
import UIKit


/*Persistencia Data*/
class GetInfoBD{
    
    func GetDataBD()->[Usuario]{
        
       
        let Persona1=Usuario.init(idpersona: UUID(), nombre: "Jose Alberto",fechanacimiento: "19771006", correoelectronico: "josealberto@elektra.com.mx" , password: "1234", numeroempleado: "302020", telefono: "555522663377")
        let Persona2=Usuario.init(idpersona: UUID(), nombre: "Noel Fuentes",fechanacimiento: "19771006", correoelectronico: "nfuentes@elektra.com.mx" , password: "1234", numeroempleado: "302020", telefono: "555522663377")
  
        
    
      
        var arrayPersonasBD = [Usuario]();
        arrayPersonasBD.append(Persona1);
        arrayPersonasBD.append(Persona2);
       

        return arrayPersonasBD
    }

    
    func GetDataEmpleadosBD()->[Empleado]{
        
          var arrayEmpleados = [Empleado]();
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        
        let usersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TblEmpleado")
        
        do {
            let fetchedUsers = try context.fetch(usersFetch) as! [TblEmpleado]
            
            //print(type(of:fetchedUsers))
            for item in fetchedUsers{
             
                let formatter = DateFormatter()
                // initially set the format based on your datepicker date / server String
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                
                let myString = formatter.string(from: item.fechanacimiento!) // string purpose I add here
                // convert your string to date
                let yourDate = formatter.date(from: myString)
                //then again set the date format whhich type of output you need
                formatter.dateFormat = "dd-MMM-yyyy"
                // again convert your date to string
                let myStringafd = formatter.string(from: yourDate!)
                
                
                var empleadoadd =  Empleado.init(idpersona: item.idEmpleado!, nombre:item.nombre!,fechanacimiento: myString, correoelectronico: item.correoelectronico! ,numeroempleado: String(item.numeroempleado), telefono: String(item.telefono), cargo: item.cargoEmpleado!)
                arrayEmpleados.append(empleadoadd);
            }
            
            
        } catch {
            fatalError("Failed to fetch users: \(error)")
        }
        
        
        
        
      
        
      
        
       
        
        return arrayEmpleados
    }
    
    
    
    func GetDataRutas()->[Ubicacion]{
        
        
    
        
        
        
        var origen = coordenada.init(latitude: 19.4336523, longitude: -99.1454316)
        var destino = coordenada.init(latitude: 19.3948, longitude: -99.1454316)
       var ruta1 = Ubicacion.init(idUbicacion: 1, origen: origen, destino: destino, tiempoaproximado: 12, delegacion: "Puebla", direccion: "Calle crisantemo", codigopostal: 72229, pvisitar: "Vecina", adeudo: 5000, notas: "Casa blanca")
        
        
        var arrayRuta = [Ubicacion]();
       arrayRuta.append(ruta1);
        
        
        return arrayRuta
    }
    
    
}

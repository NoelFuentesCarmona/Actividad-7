//
//  PersonaModel.swift
//  Actividad1
//
//  Created by usuario on 1/7/19.
//  Copyright © 2019 gs. All rights reserved.
//

import Foundation

class Usuario {
    var idPersona: UUID
    var fechanacimiento: String
    var nombre: String
    var correoelectronico: String
    var password: String
    var numeroempleado: String
    var telefono: String
    
    init(idpersona: UUID
        , nombre: String,fechanacimiento: String, correoelectronico:String, password:String, numeroempleado:String,telefono:String) {
        self.idPersona=idpersona
        self.fechanacimiento = fechanacimiento;
        self.nombre=nombre;
        self.correoelectronico=correoelectronico;
        self.password=password;
        self.numeroempleado=numeroempleado;
        self.telefono=telefono;
        
    }
    
    
}


class Persona {
    var idPersona: UUID
    var fechanacimiento: String
    var nombre: String
    var correoelectronico: String
    var telefono: String
    
    init(idpersona: UUID, nombre: String,fechanacimiento: String, correoelectronico:String,telefono:String) {
        self.idPersona=idpersona
        self.fechanacimiento = fechanacimiento;
        self.nombre=nombre;
        self.correoelectronico=correoelectronico;
        self.telefono=telefono;
        
    }
    
    
}

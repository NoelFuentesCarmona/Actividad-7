//
//  empleadoModel.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 gs. All rights reserved.
//

import Foundation


class Empleado: Persona {
    var cargo: String
    var numeroempleado: String
    init( idpersona: UUID , nombre: String,fechanacimiento: String,correoelectronico : String,  numeroempleado:String, telefono:String, cargo: String) {
        self.cargo = cargo
       self.numeroempleado = numeroempleado
        super.init(idpersona: idpersona, nombre: nombre, fechanacimiento: fechanacimiento, correoelectronico: correoelectronico , telefono: telefono)
    }
}

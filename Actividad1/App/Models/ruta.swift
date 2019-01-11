//
//  coordenadas.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 gs. All rights reserved.
//

import Foundation

class coordenada: NSObject {
    var latitude : Double
    var longitude : Double
    
    
    init( latitude: Double , longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
       
    }
}


class Ubicacion: NSObject {
    var idUbicacion : Int
    var origen : coordenada
    var destino : coordenada
    var tiempoaproximado : Double
    var delegacion : String
    var direccion : String
    var codigopostal : Int
    var pvisitar : String
    var adeudo : Double
    var notas : String
    
    
    init(idUbicacion : Int , origen: coordenada , destino: coordenada, tiempoaproximado : Double , delegacion: String,  direccion : String, codigopostal : Int , pvisitar : String , adeudo : Double , notas : String ) {
        self.idUbicacion = idUbicacion
        self.origen = origen
        self.destino = destino
        self.tiempoaproximado = tiempoaproximado
        self.delegacion = delegacion
        self.direccion = direccion
        self.codigopostal =  codigopostal
        self.pvisitar = pvisitar
        self.adeudo = adeudo
        self.notas = notas
        
    }
}

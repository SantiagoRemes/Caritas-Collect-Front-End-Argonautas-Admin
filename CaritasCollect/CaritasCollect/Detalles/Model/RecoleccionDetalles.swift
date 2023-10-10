//
//  Detalles.swift
//  CaritasCollect
//
//  Created by Santiago Remes Inguanzo on 28/09/2023.
//

import Foundation

struct RecibosDetalles: Codable{
    var recoleccion: [RecoleccionDetalles]
    var success: Bool
}

struct RecoleccionDetalles: Codable {
    var _id_donador: Int
    var _id_recibo: Int
    var _id_recolector: Int
    var comentarios: String
    var direccion: String
    var estado_recogido: String
    var lnombre_donador: String
    var pnombre_donador: String
    var tel_casa: Int
    var tel_celular: Int
}

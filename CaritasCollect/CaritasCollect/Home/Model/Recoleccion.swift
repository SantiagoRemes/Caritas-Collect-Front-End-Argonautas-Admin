//
//  Recoleccion.swift
//  CaritasCollect
//
//  Created by Alumno on 06/09/23.
//

import Foundation

// MARK: - Recolecciones
struct Recolecciones: Codable {
    let recolecciones: [Detalles]
    let success: Bool
}

// MARK: - Detalles
struct Detalles: Codable, Identifiable {
    let id: Int
    let idRecolector: Int
    let direccion: String
    let estadoRecogido: EstadoRecogido

    enum CodingKeys: String, CodingKey {
        case id = "_id_recibo"
        case idRecolector = "_id_recolector"
        case direccion
        case estadoRecogido = "estado_recogido"
    }
}

enum EstadoRecogido: String, Codable {
    case pendiente = "Pendiente"
    case recogido = "Recogido"
}

//
//  Recolector.swift
//  CaritasCollect
//
//  Created by Alumno on 13/10/23.
//

import Foundation

// MARK: - Recolectores
struct RecolectoresGet: Codable {
    let recolectores: [DetallesRecolector]
    let success: Bool
}

// MARK: - Detalles
struct DetallesRecolector: Codable, Identifiable {
    let id: Int
    let idAdministrador: Int
    let usuario: String
    let contrasena: String

    enum CodingKeys: String, CodingKey {
        case id = "_id_recolector"
        case idAdministrador = "_id_adminisrador"
        case usuario = "usuario"
        case contrasena = "contrasena"
    }
}

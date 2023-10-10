//
//  RecoleccionRow.swift
//  CaritasCollect
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct RecoleccionRow: View {
    var recoleccion : Detalles
    
    
    var body: some View {
        HStack{
            Text("\(recoleccion.id)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            Text("\(recoleccion.direccion)")
                .font(.title)
        }
        .padding(.vertical, 3)
    }
}

struct RecoleccionRow_Previews: PreviewProvider {
    static var previews: some View {
        RecoleccionRow(recoleccion: Detalles(id: 1, idRecolector: 2, direccion: "Sample Address", estadoRecogido: .pendiente))
    }
}

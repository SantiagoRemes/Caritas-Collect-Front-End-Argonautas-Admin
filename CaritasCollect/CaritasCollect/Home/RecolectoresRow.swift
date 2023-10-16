//
//  RecolectorRow.swift
//  CaritasCollect
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct RecolectorRow: View {
    var Recolector : DetallesRecolector
    
    
    var body: some View {
        HStack{
            Text("\(Recolector.id)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            Text("\(Recolector.usuario)")
                .font(.title)
        }
        .padding(.vertical, 3)
    }
}

struct RecolectorRow_Previews: PreviewProvider {
    static var previews: some View {
        RecolectorRow(Recolector: DetallesRecolector(id: 1, idAdministrador: 1, usuario: "Rec2", contrasena: "-"))
    }
}

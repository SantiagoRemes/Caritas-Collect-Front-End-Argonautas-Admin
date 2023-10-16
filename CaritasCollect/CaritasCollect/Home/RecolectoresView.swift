//
//  RecolectoresView.swift
//  CaritasCollect
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI
import Charts

struct RecolectoresView: View {
    
    @State private var listaRecolectores : [DetallesRecolector] = []

    var body: some View {
        
        VStack {
            NavigationStack{
                
                ZStack{
                   
                    Text("Recolectores")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("302C"))

                }.offset(x:0,y:-9)
                
                VStack{
                    List(listaRecolectores) { RecolectorItem in
                        NavigationLink(
                            destination: RecoleccionesView(),
                            label: {
                                RecolectorRow(Recolector: RecolectorItem)
                            }
                        )
                    }.listStyle(.inset)
                    
                }
                .frame(height: 350.0)
                
                Image("logo-caritas")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .offset(x:0,y:30)
            }
            
        }
        .onAppear(){
            listaRecolectores = callAPIRecolectores(idAdministrador: idAdministrador).recolectores
        }
        .refreshable {
            listaRecolectores = callAPIRecolectores(idAdministrador: idAdministrador).recolectores
        }
    }
}

struct RecolectoresView_Previews: PreviewProvider {
    static var previews: some View {
        RecolectoresView()
    }
}

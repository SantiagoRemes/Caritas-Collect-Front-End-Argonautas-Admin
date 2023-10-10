//
//  RecoleccionesView.swift
//  CaritasCollect
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct RecoleccionesView: View {
    @State var seleccionRecolecciones : String = "Pendiente"

    let opcionesRecolecciones = ["Pendiente","Recogido"]
    
    @State private var listaRecolecciones : [Detalles] = []
    
    
    
    var body: some View {
        
        VStack {
            Banner().frame(height: 100.0).ignoresSafeArea()
            NavigationStack{
                
                ZStack{
                   
                    Text("Recolecciones")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("302C"))
                    
                    Picker("Opciones",selection: $seleccionRecolecciones){
                        ForEach(opcionesRecolecciones, id: \.self){
                            opcion in Text(opcion)
                                .tag(opcion)
                        }
                    }
                    .padding(.horizontal, 16)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .offset(x:0,y:40)
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: seleccionRecolecciones) {
                        value in
                        listaRecolecciones = callAPIRecolecciones(idRecolector: idRecolector, estado: seleccionRecolecciones).recolecciones
                    }
                        
                    
                }.offset(x:0,y:-9)
                VStack{
                    List(listaRecolecciones) { recoleccionItem in
                        NavigationLink(
                            destination: DetalleView(idRecibo: recoleccionItem.id),
                            label: {
                                RecoleccionRow(recoleccion: recoleccionItem)
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
            listaRecolecciones = callAPIRecolecciones(idRecolector: idRecolector, estado: seleccionRecolecciones).recolecciones
        }
        .refreshable {
            listaRecolecciones = callAPIRecolecciones(idRecolector: idRecolector, estado: seleccionRecolecciones).recolecciones
        }
    }
}

struct RecoleccionesView_Previews: PreviewProvider {
    static var previews: some View {
        RecoleccionesView()
    }
}

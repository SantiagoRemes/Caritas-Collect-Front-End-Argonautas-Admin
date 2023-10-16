//
//  RecoleccionesView.swift
//  CaritasCollect
//
//  Created by Santiago Remes Inguanzo on 15/10/2023.
//

import SwiftUI

struct RecoleccionesView: View {
    
    var idRecolector: Int = 1
    
    @State var seleccionRecolecciones : String = "NoCobrado"

    let opcionesRecolecciones = ["NoCobrado","Cobrado"]
    
    @State private var listaRecolecciones : [Detalles] = []
    
    @Environment(\.dismiss) private var dismiss
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "arrow.left.circle.fill").resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit).frame(height: 35.0).offset(y:-10).ignoresSafeArea().tint(Color ("1575C")) // Usa una imagen del sistema
        }
    }
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("1575C"))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color("1575C"))], for: .normal)
        UISegmentedControl.appearance().backgroundColor = .white
    }
    
    var body: some View {
        
        VStack {
            NavigationStack{
                
                ZStack{
                   
                    Text("Recolecciones")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("302C"))
                        .navigationBarItems(leading: backButton)
                    
                    Picker("Opciones",selection: $seleccionRecolecciones){
                        ForEach(opcionesRecolecciones, id: \.self){
                            opcion in Text(opcion)
                                .tag(opcion)
                        }
                    }
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("1575C"), lineWidth: 4))
                    .frame(height: 1)
                    .padding(.horizontal, 16)
                    .offset(x:0,y:35)
                    .pickerStyle(SegmentedPickerStyle()).foregroundColor(Color.orange)
                    .scaledToFit()
                    .scaleEffect(CGSize(width: 1.02, height: 1.3))
                    .onChange(of: seleccionRecolecciones) {
                        value in
                        listaRecolecciones = callAPIRecolecciones(idRecolector: idRecolector, estado: seleccionRecolecciones).recolecciones
                    }
                        
                    
                }.offset(x:0,y:-9)
                    .padding(.bottom, 30)
                
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
                .offset(y: 10)
                
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
        .navigationBarBackButtonHidden()
        
    }
}

struct RecoleccionesView_Previews: PreviewProvider {
    static var previews: some View {
        RecoleccionesView()
    }
}

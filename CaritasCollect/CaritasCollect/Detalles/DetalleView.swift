//
//  DetalleView.swift
//  CaritasCollect
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct DetalleView: View {
    @State private var recoleccion: RecoleccionDetalles = RecoleccionDetalles(_id_donador: 0, _id_recibo: 0, _id_recolector: 0, comentarios: "", direccion: "", estado_recogido: "", lnombre_donador: "", pnombre_donador: "", tel_casa: 0, tel_celular: 0)
    
    @Environment(\.dismiss) private var dismiss
    
    let idRecibo: Int
    
    init(idRecibo: Int) {
            self.idRecibo = idRecibo
        }
    
    var body: some View {
            VStack{
                
                NavigationStack{
                    
                    VStack{
                        Text("\(recoleccion.direccion)")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("302C"))
                        Text("Numero de Orden: \(recoleccion._id_recibo)")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("302C"))
                    }.offset(x:0 , y:70)
                    
                    VStack{
                        Image("mty2")
                            .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350.0, height: 350.0)
                    }.offset(x:0 , y:20)
                 
                    VStack{
                        Text("Estatus de Recoleccion")
                            .font(.title3)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("302C"))
                            
                        VStack{
                            
                            if(recoleccion.estado_recogido != "Cobrado"){
                                Button{
                                    PutEstado(id: idRecibo, estado: "Recogido", comentarios: "")
                                    dismiss()
                                }label: {
                                    Text("Cobrado")
                                        .font(.title)
                                        .fontWeight(.heavy)
                                        .frame(width: 300.0, height: 75.0)
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(Color("1575C"))
                                .offset()
                               
                                NavigationLink(destination: PendienteOpciones(recoleccion: recoleccion)) {
                                    Text("No cobrado")
                                        .foregroundColor(Color("1575C"))
                                        .font(.title)
                                        .fontWeight(.heavy)
                                        .frame(width: 300.0, height: 75.0)
                                        
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.white)
                                .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("1575C"), lineWidth: 4))
                                .offset(y:10)
                            }
                        }
                        
                    }
                    
                    Spacer()
                }
                .offset(x:0, y:-70)
                .onAppear(){
                    recoleccion = GetDetalles(id: idRecibo)
                }
            }
        }
    }

struct DetalleView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleView(idRecibo: 0)
    }
}

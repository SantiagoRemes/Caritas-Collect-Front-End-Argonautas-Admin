//
//  ModelDetalle.swift
//  CaritasCollect
//
//  Created by Santiago Remes Inguanzo on 28/09/2023.
//

import Foundation

func GetDetalles(id: Int) -> RecoleccionDetalles {
    var res : RecoleccionDetalles = RecoleccionDetalles(_id_donador: 0, _id_recibo: 0, _id_recolector: 0, comentarios: "", direccion: "", estado_recogido: "", lnombre_donador: "", pnombre_donador: "", tel_casa: 0, tel_celular: 0)
    
    guard let url = URL(string:"http://192.168.1.131:10206/detalles?id=\(id)") else {
        return res
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if (data != nil){
            do{
                let getItem = try jsonDecoder.decode(RecibosDetalles.self, from: data!)
                print("Debug: \(getItem.success)")
                if !getItem.recoleccion.isEmpty {
                    let Item = getItem.recoleccion[0]
                    res._id_donador = Item._id_donador
                    res._id_recibo = Item._id_recibo
                    res._id_recolector = Item._id_recolector
                    res.comentarios = Item.comentarios
                    res.direccion = Item.direccion
                    res.estado_recogido = Item.estado_recogido
                    res.lnombre_donador = Item.lnombre_donador
                    res.pnombre_donador = Item.pnombre_donador
                    res.tel_casa = Item.tel_casa
                    res.tel_celular = Item.tel_celular
                }
                
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    
    group.wait()
        
    return res
}

func PutEstado(id: Int, estado: String, comentarios: String){
    let body: [String: Any] = ["id": id,
                               "estado": estado, "comentarios": comentarios]
    
    let jsonData = try? JSONSerialization.data(withJSONObject: body)
    

    let url = URL(string: "http://192.168.1.131:10206/estado")!
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    
    request.httpBody = jsonData
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            return
        }
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        if let responseJSON = responseJSON as? [String: Any] {
            print(responseJSON)
        }
    }

    task.resume()
}

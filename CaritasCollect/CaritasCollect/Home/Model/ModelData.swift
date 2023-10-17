//
//  ModelData.swift
//  CaritasCollect
//
//  Created by Alumno on 13/10/23.
//

import Foundation

func callAPIRecolectores(idAdministrador: Int) -> RecolectoresGet {
    
    var lista : RecolectoresGet = RecolectoresGet(recolectores: [], success: false)
    
    guard let url = URL(string:"http://10.14.255.69:10206/recolectores?id=\(idAdministrador)") else{
        return lista
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if (data != nil){
            do{
                let getRecolecciones = try jsonDecoder.decode(RecolectoresGet.self, from: data!)
                lista = getRecolecciones
                print("success \(lista.success)")
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return lista
}

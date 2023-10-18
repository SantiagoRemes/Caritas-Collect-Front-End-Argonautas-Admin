//
//  ModelData.swift
//  CaritasCollect
//
//  Created by Santiago Remes Inguanzo on 15/10/2023.
//

import Foundation

func callAPIRecolecciones(idRecolector: Int, estado: String) -> Recolecciones {
    
    print(estado)
    var lista : Recolecciones = Recolecciones(recolecciones: [], success: false)
    
    guard let url = URL(string:"https://equipo05.tc2007b.tec.mx:10206/recolecciones?id=\(idRecolector)&estado=\(estado)") else{
        return lista
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if (data != nil){
            do{
                let getRecolecciones = try jsonDecoder.decode(Recolecciones.self, from: data!)
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

func callApiCuentaCobrado(idRecolector: Int) -> Int {
    
    var cantidadCobrado : Recolecciones = Recolecciones(recolecciones: [], success: false)
    
    guard let url = URL(string:"https://equipo05.tc2007b.tec.mx:10206/recolecciones?id=\(idRecolector)&estado=Cobrado") else{
        return cantidadCobrado.recolecciones.count
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if (data != nil){
            do{
                let getRecolecciones = try jsonDecoder.decode(Recolecciones.self, from: data!)
                cantidadCobrado = getRecolecciones
                print("Cantidad cobrado: \(cantidadCobrado.recolecciones.count)")
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return cantidadCobrado.recolecciones.count
}


func callApiCuentaNoCobrado(idRecolector: Int) -> Int {
    
    var cantidadCobrado : Recolecciones = Recolecciones(recolecciones: [], success: false)
    
    guard let url = URL(string:"https://equipo05.tc2007b.tec.mx:10206/recolecciones?id=\(idRecolector)&estado=NoCobrado") else{
        return cantidadCobrado.recolecciones.count
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if (data != nil){
            do{
                let getRecolecciones = try jsonDecoder.decode(Recolecciones.self, from: data!)
                cantidadCobrado = getRecolecciones
                print("Cantidad no cobrado: \(cantidadCobrado.recolecciones.count)")
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return cantidadCobrado.recolecciones.count
}

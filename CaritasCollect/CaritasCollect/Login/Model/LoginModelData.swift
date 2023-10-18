//
//  LoginModelData.swift
//  CaritasCollect
//
//  Created by Santiago Remes Inguanzo on 15/10/2023.
//

import Foundation

func login(username: String, password: String) -> Get {
    var res : Get = Get(id: 0, mensaje: "", success: false)
    
    guard let url = URL(string:"https://equipo05.tc2007b.tec.mx:10206/login?usuario=\(username)&contrasena=\(password)&usertype=Admin") else {
        return res
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if (data != nil){
            do{
                let getItem = try jsonDecoder.decode(Get.self, from: data!)
                print("Debug: \(getItem.mensaje)")
                res.id = getItem.id
                res.mensaje = getItem.mensaje
                res.success = getItem.success
                
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    
    group.wait()
    
    idAdministrador = res.id
    
    return res
}

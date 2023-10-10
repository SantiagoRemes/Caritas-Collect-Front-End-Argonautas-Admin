//
//  LoginModelData.swift
//  CaritasCollect
//
//  Created by Alumno on 07/09/23.
//

import Foundation

func login(username: String, password: String) -> Get {
    var res : Get = Get(_id_recolector: 0, mensaje: "", success: false)
    
    guard let url = URL(string:"http://192.168.1.131:10206/login?usuario=\(username)&contrasena=\(password)") else {
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
                res._id_recolector = getItem._id_recolector
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
    
    idRecolector = res._id_recolector
    
    return res
}

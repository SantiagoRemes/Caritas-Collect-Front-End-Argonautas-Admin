//
//  Fecha.swift
//  CaritasCollect
//
//  Created by Alumno on 07/09/23.
//

import Foundation



let date = Date()
let dateFormatter = DateFormatter()

func obternerfecha(){
    
    dateFormatter.dateFormat = "dd/MM/yyyy"
    
    let result = dateFormatter.string(from: date)
    
    print(result)
}


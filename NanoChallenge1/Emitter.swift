//
//  Emitter.swift
//  NanoChallenge1
//
//  Created by Mauldy Putra on 19/05/19.
//  Copyright © 2019 DeveloperAcademy. All rights reserved.
//

import UIKit

class Emitter{
    static func get(with image: UIImage) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterCells = generateEmitterCells(with: image)
        return emitter
    }
    
    static func generateEmitterCells(with image: UIImage) -> [CAEmitterCell]{
        var cells = [CAEmitterCell]()
        
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = 1
        cell.lifetime = 50
        cell.velocity = CGFloat(25)
        cell.emissionLongitude = (150 * (.pi/180))
        cell.emissionRange = (45 * (.pi/180))
        
        cell.scale = 0.4
        cell.scaleRange = 0.3
        
        cells.append(cell)
        
        return cells
    }
    
    static func getRain(with image: UIImage) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterCells = generateEmitterCells(with: image)
        return emitter
    }
    
    static func generateRainEmitterCells(with image: UIImage) -> [CAEmitterCell]{
        var cells = [CAEmitterCell]()
        
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = 1
        cell.lifetime = 50
        cell.velocity = CGFloat(5000)
        cell.emissionLongitude = (135 * (.pi/180))
        cell.emissionRange = (45 * (.pi/180))
        
        cell.scale = 0.4
        cell.scaleRange = 0.3
        
        cells.append(cell)
        
        return cells
    }
}

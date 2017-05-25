//
//  GameScene.swift
//  learningSpriteKit
//
//  Created by Aditya  on 25/05/17.
//  Copyright © 2017 Aditya Yadav. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "darkSpace")
    
   let player = SKSpriteNode(imageNamed: "Spaceship")
    
    override func didMove(to view: SKView) {
        
        
        self.backgroundColor = UIColor.clear
        player.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 5)
        player.size = CGSize(width: 100, height: 100)
        background.position = (CGPoint(x: frame.size.width / 2, y: frame.size.height / 2))
        addChild(background)
        addChild(player)
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addMonster),
                SKAction.wait(forDuration: 1.0)
                ])
        ))
        
    }
    
    func random() -> CGFloat {
        
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random( min : CGFloat , max : CGFloat) -> CGFloat{
        
        return random() * (max - min) + min
    }
    
    func addMonster(){
        
       let monster = SKSpriteNode(imageNamed: "alien")

          let actualX = random(min: frame.size.width - 50, max:  frame.size.width - 300)
        
        monster.size = CGSize(width: 50, height: 50)
        monster.position = CGPoint(x: actualX, y: frame.size.height)
        
        addChild(monster)
        
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        let actionMove = SKAction.move(to: CGPoint(x: actualX , y: frame.size.height / 4), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.run(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
}

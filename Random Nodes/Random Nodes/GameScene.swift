//
//  GameScene.swift
//  Random Nodes
//
//  Created by Анастасия Восколович on 04.02.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        //add
        constraints.append(view!.leadingAnchor.constraint(equalTo: view!.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(view!.trailingAnchor.constraint(equalTo: view!.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(view!.bottomAnchor.constraint(equalTo: view!.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(view!.topAnchor.constraint(equalTo: view!.safeAreaLayoutGuide.topAnchor))
        //activate
        NSLayoutConstraint.activate(constraints)
    }
    
    let circle = SKShapeNode(circleOfRadius: 40)
    
    override func didMove(to view: SKView) {
        
        let nameCircles: [String] = ["back", "back1", "back2", "back3", "back4", "back5", "back6", "back7", "back8"]
        
        circle.name = "circle"
        circle.fillTexture = SKTexture(imageNamed: nameCircles.randomElement()!)
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        circle.fillColor = .white
        circle.physicsBody?.allowsRotation = true
        circle.position = CGPoint(x: CGFloat.random(in: 0..<self.frame.width), y: CGFloat.random(in: 0..<self.frame.height))
        circle.physicsBody?.affectedByGravity = false
        circle.physicsBody?.restitution = 0.7
        circle.physicsBody?.friction = 0.7
        
        addChild(circle)
        
        let randomNumber = Int.random(in: 3..<12)
        for _ in 3..<randomNumber {
            let copy = circle.copy() as! SKShapeNode
            copy.name = "circle"
            copy.position = CGPoint(x: CGFloat.random(in: 0..<self.frame.width), y: CGFloat.random(in: 0..<self.frame.height))
            copy.fillTexture = SKTexture(imageNamed: nameCircles.randomElement()!)
            
            addChild(copy)
        }
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame.inset(by: .init(top: 0, left: 0, bottom: 0, right: 0)))
        
        circle.run(SKAction.run {
            self.applyRandomImpulse(toAllNodes: true)
        })
    }
    
    func applyRandomImpulse(toAllNodes: Bool) {
        let nodes = self.children.filter { $0.name == "circle" } 
        for node in nodes {
            let magnitude = CGFloat.random(in: 20..<50)
            let angle = CGFloat.random(in: 0..<CGFloat.pi*2)
            
            let dx = magnitude * cos(angle)
            let dy = magnitude * sin(angle)
            
            node.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        applyRandomImpulse(toAllNodes: true)
    }
    
    
    
    //func didBegin(_ contact: SKPhysicsContact) {
    //        guard let nodeA = contact.bodyA.node else { return }
    //        guard let nodeB = contact.bodyB.node else { return }
    //
    //        if nodeA.name == "ball" {
    //            collisionBetween(ball: nodeA, object: nodeB)
    //        } else if nodeB.name == "ball" {
    //            collisionBetween(ball: nodeB, object: nodeA)
    //        }
    //    }
    
}



//
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
//
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//

//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//    }


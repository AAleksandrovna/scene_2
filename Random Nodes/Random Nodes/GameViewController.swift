//
//  GameViewController.swift
//  Random Nodes
//
//  Created by Анастасия Восколович on 04.02.2023.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            let scene = GameScene(size: .zero)
            scene.backgroundColor = .systemBackground
             
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .resizeFill
            scene.anchorPoint = CGPoint(x: 0, y: 0)
            
            // Present the scene
            view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            
            view.showsNodeCount = true

        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

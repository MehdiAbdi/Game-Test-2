//
//  ViewController.swift
//  Game Test 2
//
//  Created by Mehdi Abdi on 12/13/20.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        let scene = SCNScene(named: "art.scnassets/ship.scn")
        
        // Camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 15, 15)
        scene?.rootNode.addChildNode(cameraNode)
        
        // Light
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(0, 0, 10)
        scene?.rootNode.addChildNode(lightNode)
        
        // AmbientLight
        let ambientLight = SCNNode()
        ambientLight.light = SCNLight()
        ambientLight.light?.type = .ambient
        ambientLight.light?.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLight)
        
        // Retrive Object
        let ship = scene?.rootNode.childNode(withName: "ship", recursively: true)
        ship?.position = SCNVector3(0, 15, -10)
        ship?.eulerAngles = SCNVector3(100, 0, 0)
        ship?.scale = SCNVector3(2, 2, 2)
        
        // Add Scene To View
        let scnView = SCNView(frame: CGRect(x: 0, y: 400, width: 400, height: 300))
        view.addSubview(scnView)
        
        scnView.scene = scene
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        
        let btn: UIButton = {
            let button = UIButton()
            button.backgroundColor = .black
            button.setTitle("WOOOW", for: .normal)
            return button
        }()
        
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
        view.addSubview(btn)
        btn.frame = CGRect(x: 150, y: 100, width: 300, height: 200)
        
    }
    
    @objc
    func btnAction() {
        print("Daaaaaaaamn")
    }
}


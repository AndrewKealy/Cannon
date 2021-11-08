//
//  ViewController.swift
//  Canon
//
//  Created by Andrew Kealy on 08/11/2021.
//

// The following demo is built from code and animations published on usdzshare.com

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Bang" scene from the "Experience" Reality File
        let cannonAnim = try! Experience.loadBang()
        
        let anchor = AnchorEntity(plane: .horizontal, classification: .any, minimumBounds: [0.2, 0.2])
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(anchor)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
        
        arView.addGestureRecognizer(tapGesture)
        
        //Add the cannon animation to arView

        arView.scene.anchors.append(cannonAnim)
        
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        
        let tapLocation = sender.location(in: arView)
        
        //Get the entity at the location we've tapped
        
        if let cannonFiring = arView.entity(at: tapLocation) {
            print(cannonFiring.name)
            print("Firing cannon")
        }
    }
}

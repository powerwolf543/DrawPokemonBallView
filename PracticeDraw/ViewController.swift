//
//  ViewController.swift
//  PracticeDraw
//
//  Created by NixonShih on 2016/8/11.
//  Copyright © 2016年 Nixon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pokemonView: DrawPokemonBallView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let rotationAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
        rotationAnimation.toValue = 2 * CGFloat(M_PI)
        rotationAnimation.duration = 2;
        rotationAnimation.repeatCount = MAXFLOAT;
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        pokemonView.layer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
    }
    
    
}


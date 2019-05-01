//
//  ViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 1/31/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var methodsButton: UIButton!
    @IBOutlet weak var listsButton: UIButton!
    @IBOutlet weak var tressButton: UIButton!
    @IBOutlet weak var mapsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButtons()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func roundButtons() {
    
        methodsButton.layer.cornerRadius = 20
        listsButton.layer.cornerRadius = 20
        tressButton.layer.cornerRadius = 20
        mapsButton.layer.cornerRadius = 20
        
        
    }
}


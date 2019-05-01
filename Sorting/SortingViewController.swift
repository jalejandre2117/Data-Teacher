//
//  SortingViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 4/29/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class SortingViewController: UIViewController {

    @IBOutlet weak var insertButton: UIButton!
    @IBOutlet weak var bubbleButton: UIButton!
    @IBOutlet weak var mergeButton: UIButton!
    @IBOutlet weak var quickButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var radixButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButtons()

        // Do any additional setup after loading the view.
    }
    
    func roundButtons() {
        
        insertButton.layer.cornerRadius = 20
        bubbleButton.layer.cornerRadius = 20
        mergeButton.layer.cornerRadius = 20
        quickButton.layer.cornerRadius = 20
        selectButton.layer.cornerRadius = 20
        radixButton.layer.cornerRadius = 20
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  InsertionViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 1/31/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class InsertionViewController: UIViewController {

    

    @IBOutlet weak var sortedlistLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func insertionSort(_ array: [Int]) -> [Int] {
        var arr = array
        for x in 1..<arr.count {
            var y = x
            while y > 0 && arr[y] < arr[y - 1] {
                arr.swapAt(y - 1, y)
                y -= 1
            }
        }
        return arr
    }

    @IBAction func onSort(_sender: Any) {
        let myArray = [2,7,3,1,21,17]
        let sorted = insertionSort(myArray)
        
        sortedlistLabel.text = "\(sorted)"
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


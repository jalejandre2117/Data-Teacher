//
//  SelectionViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 2/7/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    @IBOutlet weak var sortedlistLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func selectionSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        var arr = array
        
        for x in 0 ..< arr.count - 1 {
            var lowest = x
            for y in x + 1 ..< arr.count {
                if arr[y] < arr[lowest] {
                    lowest = y
                }
            }
            if x != lowest {
                arr.swapAt(x, lowest)
            }
        }
        return arr
    }
    
    @IBAction func onSort(_ sender: Any) {
        let myArray = [73,64,91,100,53,19]
        let sorted = selectionSort(myArray)
        
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

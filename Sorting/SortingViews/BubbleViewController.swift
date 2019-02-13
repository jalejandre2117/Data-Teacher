//
//  BubbleViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 2/7/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class BubbleViewController: UIViewController {

    @IBOutlet weak var sortedlistLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bubbleSort(_ array: [Int]) -> [Int] {
        var arr = array
        for _ in 0...arr.count {
            for value in 1...arr.count - 1 {
                if arr[value-1] > arr[value] {
                    let largerValue = arr[value-1]
                    arr[value-1] = arr[value]
                    arr[value] = largerValue
                }
            }
        }
        print("Sorted\(arr)")
        return arr
    }
    
    @IBAction func onSort(_ sender: Any) {
        let myArray = [15,7,21,3,8,1,0,12]
        let sorted = bubbleSort(myArray)
        
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

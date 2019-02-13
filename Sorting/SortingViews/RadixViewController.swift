//
//  RadixViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 2/7/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class RadixViewController: UIViewController {

    @IBOutlet weak var sortedlistLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func radixSort(_ array: [Int]) -> [Int] {
        var arr = array
        let radix = 10
        var done = false
        var index: Int
        var digit = 1
        while !done {
            done = true
            var buckets: [[Int]] = []
            for _ in 1...radix {
                buckets.append([])
            }
            
            for number in arr {
                index = number / digit
                buckets[index % radix].append(number)
                
                if done && index > 0 {
                    done = false
                }
            }
            
            var i = 0
            
            for j in 0..<radix {
                let bucket = buckets[j]
                for number in bucket {
                    arr[i] = number
                    i += 1
                }
            }
            
            digit *= radix
        }
        
        return arr
    }
    
    
    @IBAction func onSort(_ sender: Any) {
        let myArray = [62,78,7,104,82,9]
        let sorted = radixSort(myArray)
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

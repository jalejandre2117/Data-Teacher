//
//  QuickViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 2/7/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class QuickViewController: UIViewController {

    @IBOutlet weak var sortedlistLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func quickSort(_ input: [Int], startIndex:Int, endIndex: Int)-> [Int] {
        var inputArray = input
        if startIndex<endIndex {
            let pivot = inputArray[endIndex]
            var index = startIndex
            
            for demo in startIndex..<endIndex {
                if inputArray[demo] <= pivot {
                    (inputArray[index], inputArray[demo]) = (inputArray[demo], inputArray[index])
                    index += 1
                }
            }
            (inputArray[index], inputArray[endIndex]) = (inputArray[endIndex], inputArray[index])
            inputArray = quickSort(inputArray, startIndex: startIndex, endIndex: index-1)
            inputArray = quickSort(inputArray, startIndex: index+1, endIndex: endIndex)
        }
        return inputArray
    }

    @IBAction func onSort(_ sender: Any) {
        let myArray = [165,148,112,174,150,127]
        let sorted = quickSort(myArray, startIndex: 0, endIndex: 5)
        
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

//
//  MergeViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 2/7/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class MergeViewController: UIViewController {

    @IBOutlet weak var sortedlistLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func merge(arr1: [Int], arr2: [Int]) -> [Int] {
        var arr1Index = 0
        var arr2Index = 0
        
        var sortedArray = [Int]()
        
        while arr1Index < arr1.count && arr2Index < arr2.count {
            if arr1[arr1Index] < arr2[arr2Index] {
                sortedArray.append(arr1[arr1Index])
                arr1Index += 1
            } else if arr1[arr1Index] > arr2[arr2Index] {
                sortedArray.append(arr2[arr2Index])
                arr2Index += 1
            } else {
                sortedArray.append(arr1[arr1Index])
                arr1Index += 1
                sortedArray.append(arr2[arr2Index])
                arr2Index += 1
                
            }
        }
        
        while arr1Index < arr1.count {
            sortedArray.append(arr1[arr1Index])
            arr1Index += 1
        }
        while arr2Index < arr2.count {
            sortedArray.append(arr2[arr2Index])
            arr2Index += 1
        }
        
        return sortedArray
    }
    
    
    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let cutIndex = array.count / 2
        
        let arr1 = mergeSort(Array(array[0..<cutIndex]))
        let arr2 = mergeSort(Array(array[cutIndex..<array.count]))
        
        return merge(arr1: arr1, arr2: arr2)
    }
    
    
    @IBAction func onSort(_ sender: Any) {
        let myArray = [8,2,36,19,50,25]
        let sorted = mergeSort(myArray)
        
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

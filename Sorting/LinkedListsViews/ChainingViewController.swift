//
//  ChainingViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 4/5/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class ChainingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public struct HashTable<Key: Hashable, Value> {
        private typealias Element = (key: Key, value: Value)
        private typealias Bucket = [Element]
        private var buckets: [Bucket]
        
        private(set) public var count = 0
        public var isEmpty: Bool {
            return count == 0
        }
        
        public init(capacity: Int) {
            assert(capacity > 0)
            buckets = Array<Bucket>(repeating: [], count: capacity)
        }
    
    
    
    private func index(for key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
    
    
    // 1
    public subscript(key: Key) -> Value? {
        get {
            return value(for: key)
        }
    }
    
    // 2
    public func value(for key: Key) -> Value? {
        let index = self.index(for: key)
        return buckets[index].first { $0.key == key }?.value
    }
    
    
        public mutating func update(value: Value, for key: Key) -> Value? {
            let index = self.index(for: key)
            
            // 1
            if let (i, element) = buckets[index].enumerated().first(where: { $0.1.key == key }) {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
            
            // 2
            buckets[index].append((key: key, value: value))
            count += 1
            return nil
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
}

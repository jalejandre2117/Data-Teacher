//
//  HashViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 4/30/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class HashViewController: UIViewController {

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

//
//  SingleLinkedViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 3/1/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class SingleLinkedViewController: UIViewController {

    @IBOutlet weak var appendLabel: UILabel!
    @IBOutlet weak var removeLabel: UILabel!
    @IBOutlet weak var allLabel: UILabel!
    
    @IBOutlet weak var chainingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButtons()
        // Do any additional setup after loading the view.
    }
    
    func roundButtons() {
        chainingButton.layer.cornerRadius = 20
    }
    
    
    public class Node<T> {
        
        var value: T
        var next: Node<T>?
        weak var previous: Node<T>?
        
        
        init(value: T) {
            self.value = value
        }
    }

   
    public class LinkedList<T> {
        
       
        
        fileprivate var head: Node<T>?
        private var tail: Node<T>?
        
        public var isEmpty: Bool {
            return head == nil
        }
        
        
        
        public var first: Node<T>? {
            return head
        }
        
        
        
        public var last: Node<T>? {
            return tail
        }
        
        
        
        public func append(value: T) {
            let newNode = Node(value: value)
            if let tailNode = tail {
                newNode.previous = tailNode
                tailNode.next = newNode
            } else {
                head = newNode
            }
            tail = newNode
        }
        
        
        
        public func nodeAt(index: Int) -> Node<T>? {
            if index >= 0 {
                var node = head
                var i = index
                while node != nil {
                    if i == 0 { return node }
                    i -= 1
                    node = node!.next
                }
            }
            return nil
        }
        
        public func removeAll() {
            head = nil
            tail = nil
        }
        
   
        
        public func remove(node: Node<T>) -> T {
            let prev = node.previous
            let next = node.next
            
            if let prev = prev {
                prev.next = next
            } else {
                head = next
            }
            next?.previous = prev
            
            if next == nil {
                tail = prev
            }
            
            node.previous = nil
            node.next = nil
            
            return node.value
        }
    }
    
    
    // I AM STILL WORKING ON GETTING THESE FOLLOWING FUNCTIONS TO PRINT OUT THE LINKED LIST AND NOT A FIXED OUTPUT //
        
    @IBAction func onAppend(_ sender: Any) {
//        let list = LinkedList<String>()
//        list.append(value: "Hello")
//        list.append(value: "World")
//        list.append(value: "My")
//        list.append(value: "Name")
//        list.append(value: "Is")
//        list.append(value: "List")
        let myList = [10, 21, 11, 17, 7, 8, 18, 5]
        appendLabel.text = "\(myList)"
        
    }
    

    
    
    
    @IBAction func onRemove(_ sender: Any) {
        let myList = [10, 21, 11, 17, 7, 8]
        removeLabel.text = "\(myList)"
    }
    
    
    
    
    
    @IBAction func onRemoveAll(_ sender: Any) {
        allLabel.text = "[]"
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

//
//  TreesViewController.swift
//  Sorting
//
//  Created by Jorge Alejandre on 4/29/19.
//  Copyright © 2019 Jorge Alejandre. All rights reserved.
//

import UIKit

class TreesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    class TreeNode<T>: CustomStringConvertible {
        
        var description: String {return "\(data)"}
        var data: T
        var leftNode: TreeNode?
        var rightNode: TreeNode?
        
        init(data: T,
             leftNode: TreeNode? = nil,
             rightNode: TreeNode? = nil) {
            self.data = data
            self.leftNode = leftNode
            self.rightNode = rightNode
        }
        
    }
    
    class BinaryTree<T: Comparable & CustomStringConvertible> {
        
        var preOrderArray: [String] = []
        var inOrderArray: [String] = []
        var postOrderArray: [String] = []
        
        
        private var rootNode: TreeNode<T>?
        
        func insert(element: T) {
            let node = TreeNode(data: element)
            if let rootNode = self.rootNode {
                self.insert(rootNode, node)
            } else {
                self.rootNode = node
            }
        }
        
        // RECURSIVE FUNCTION
        private func insert(_ rootNode: TreeNode<T>, _ node: TreeNode<T>) {
            if rootNode.data > node.data {
                if let leftNode = rootNode.leftNode {
                    self.insert(leftNode, node)
                } else {
                    rootNode.leftNode = node
                }
            } else {
                if let rightNode = rootNode.rightNode {
                    self.insert(rightNode, node)
                } else {
                    rootNode.rightNode = node
                }
            }
        }
    
        
        func traverse() {
            print("\nPRE-ORDER TRAVERSE")
            self.preorder(self.rootNode)
            print("\n\nIN-ORDER TRAVERSE")
            self.inorder(self.rootNode)
            print("\n\nPOST-ORDER TRAVERSE")
            self.postorder(self.rootNode)
            print("\n")
        }
        
        // NOTE : LEFT IS ALWAYS LEFT OF RIGHT
        // NLR : NODE(i.e. Root/Parent Node) LEFT RIGHT
        
        // LNR : LEFT NODE RIGHT
        private func inorder(_ node: TreeNode<T>?) {
            guard let _ = node else { return }
            self.inorder(node?.leftNode)
            print("\(node!.data)", terminator: " ")
            inOrderArray.append((node?.description)!)
            self.inorder(node?.rightNode)
        }
        
        // NLR : NODE LEFT RIGHT
        private func preorder(_ node: TreeNode<T>?) {
            guard let _ = node else { return }
            print("\(node!.data)", terminator: " ")
            preOrderArray.append((node?.description)!)
            self.preorder(node?.leftNode)
            self.preorder(node?.rightNode)
        }
        
        // LRN :  LEFT RIGHT NODE
        private func postorder(_ node: TreeNode<T>?) {
            guard let _ = node else { return }
            self.postorder(node?.leftNode)
            self.postorder(node?.rightNode)
            postOrderArray.append((node?.description)!)
            print("\(node!.data)", terminator: " ")
        }
    }
    
    @IBOutlet weak var preOrderLabel: UILabel!
    @IBOutlet weak var inOrderLabel: UILabel!
    @IBOutlet weak var postOrderLabel: UILabel!
    
    @IBAction func onTraverse(_ sender: Any) {
    
        let tree = BinaryTree<String>()
        
        tree.insert(element: "8")
        tree.insert(element: "3")
        tree.insert(element: "1")
        tree.insert(element: "6")
        tree.insert(element: "4")
        tree.insert(element: "7")
        tree.insert(element: "10")
        tree.insert(element: "14")
        tree.insert(element: "13")
        
        tree.traverse()
        
        preOrderLabel.text = arrayToString(array: tree.preOrderArray)
        inOrderLabel.text = arrayToString(array: tree.inOrderArray)
        postOrderLabel.text = arrayToString(array: tree.postOrderArray)

            
    }
    
    func arrayToString(array: [String]) -> String {
        let text = array.map({ (String) -> String in
            return String
        }).joined(separator: ", ")
        return text
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

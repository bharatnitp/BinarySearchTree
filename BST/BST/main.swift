//
//  main.swift
//  BinarySearchTree
//
//  Created by Bharat Bhushan on 28/10/17.
//  Copyright © 2017 Bharat Bhushan. All rights reserved.
//

import Foundation

enum NodeType {
    case leaf
    case havingSingleChild
    case havingMultipleChild
}

class Node {
    
    var key: Int
    var leftChild: Node?
    var rightChild: Node?
    
    convenience init(key: Int) {
        self.init(key: key, leftChild: nil, rightChild: nil)
    }
    
    init(key: Int, leftChild: Node?, rightChild: Node?) {
        self.key = key
        self.rightChild = rightChild
        self.leftChild = leftChild
    }
    
    //MARK: Helper methods
    func type() -> NodeType {
        if self.leftChild == nil && self.rightChild == nil {
            return .leaf
        } else if self.leftChild != nil && self.rightChild != nil {
            return .havingSingleChild
        } else {
            return .havingMultipleChild
        }
    }
}

class BinarySearchTree {
    
    
    //MARK: Insert Node
    func insertNode(root: Node?, key: Int) -> Node {
        if root == nil {
            let newNode = Node(key: key)
            return newNode
        } else {
            var parentNode = root
            var rootNode = root
            while rootNode != nil {
                if key < rootNode?.key ?? 0  {
                    parentNode = rootNode
                    rootNode = rootNode?.leftChild
                } else if key > (rootNode?.key)! {
                    parentNode = rootNode
                    rootNode = rootNode?.rightChild
                } else {
                    print("Input already existing or not valid")
                    return root!
                }
            }
            
            if rootNode == nil {
                let newNode = Node(key: key)
                if newNode.key < parentNode?.key ?? 0 {
                    parentNode?.leftChild = newNode
                } else {
                    parentNode?.rightChild = newNode
                }
            }
            
            return root!
        }
    }
    
    
    //MARK: search Element in the tree
    func searchfor(key: Int, root: Node?) {
        var root = root
        var keyFound = false
        if root == nil {
            print("There is no node existing in the tree, search is not possible")
        } else {
            while root != nil && keyFound != true {
                if root?.key == key {
                    keyFound = true
                } else if key < (root?.key)! {
                    root = root?.leftChild
                } else if key > (root?.key)! {
                    root = root?.rightChild
                }
            }
            
            if keyFound {
                print("Search successfull!!!")
            } else {
                print("Couldn't find the key...")
            }
        }
    }
    
    //MARK: get height of a tree using recursion
    func heightUsingRecursion(root: Node?) -> Int {
        return 0
    }
    
    //MARK: get height of a tree
    func height(root: Node?)  -> Int {
        return 0
    }
    
    
    //MARK: tree traversal
    func inOrderTraversal(node: Node?) {
        let node = node
        guard let _ = node else { return }
        inOrderTraversal(node: node?.leftChild)
        print(node?.key ?? "")
        inOrderTraversal(node: node?.rightChild)
    }
    
    func preOrderTraversal(node: Node?) {
        let node = node
        guard let _ = node else {return}
        print(node?.key ?? "")
        preOrderTraversal(node: node?.leftChild)
        preOrderTraversal(node: node?.rightChild)
    }
    
    func postOrderTraversal(node: Node?) {
        let node = node
        guard let _ = node else {return}
        
        preOrderTraversal(node: node?.leftChild)
        preOrderTraversal(node: node?.rightChild)
        print(node?.key ?? "")
    }
    
    func levelOrderTraversalUsingRecursion(root: Node?) {
        let tempNode = root
        print(tempNode?.key ?? "")
        levelOrderTraversalUsingRecursion(root: root?.leftChild)
        levelOrderTraversalUsingRecursion(root: root?.rightChild)
    }
    
    
    //MARK: level order traversal *****Time Complexity O(n)*****
    func levelOrderTraversal(root: Node?) {
        
        if root == nil {
            print("Tree doesn't exists...")
        } else {
            var queue = [Node]()
            var tempNode = root
            
            while(tempNode != nil) {
                //Print the current node
                print(tempNode?.key ?? "")
                
                //Insert it's children into queue
                if let leftChild = tempNode?.leftChild {
                    queue.append(leftChild)
                }
                
                if let rightChild = tempNode?.rightChild {
                    queue.append(rightChild)
                }
                
                //update temp node
                if queue.isEmpty {
                    tempNode = nil
                } else {
                    tempNode = queue.removeFirst()
                }
                
            }
        }
    }
    
    
    //MARK: delete Node
    func deleteNode(key: Int) {
        
    }
}


//MARK: Insertion
var keyArray = [10, 20, 5, 21, 8, 4]
let tree = BinarySearchTree()
var root: Node!

for key in keyArray {
    root = tree.insertNode(root: root, key: key)
    
}

//MARK: Search
tree.searchfor(key: 1, root: root)

//MARK: Traversal
print("InOrder Traversal")
tree.inOrderTraversal(node: root)
print("PreOrder Traversal")
tree.preOrderTraversal(node: root)
print("PostOrder Traversal")
tree.postOrderTraversal(node: root)
print("LevelOrder Traversal")
tree.levelOrderTraversal(root: root)





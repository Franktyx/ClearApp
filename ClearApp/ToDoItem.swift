//
//  ToDoItem.swift
//  ClearApp
//
//  Created by Bingqing Xia on 5/20/15.
//  Copyright (c) 2015 TYX. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    
    var text: String
    var completed: Bool
    
    init(text: String){
        self.text = text
        self.completed = false
    }
   
}

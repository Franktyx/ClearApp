//
//  ViewController.swift
//  ClearApp
//
//  Created by Bingqing Xia on 5/15/15.
//  Copyright (c) 2015 TYX. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableViewCellDelegate {
    
    var table: UITableView!
    var header: UILabel!
    let myTableViewCellIdentifier1 = "cell1"
    let screenWidth = UIScreen.mainScreen().bounds.width
    let screenHeight = UIScreen.mainScreen().bounds.height
    var toDoItems = [ToDoItem]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.header = UILabel(frame: CGRectMake(self.screenWidth / 2 - 50.0, 20.0, 100.0, 20.0))
        self.header.text = "Personal List"
        self.header.backgroundColor = UIColor.whiteColor()
        
        self.table = UITableView(frame: CGRect(x: 0.0, y: 40.0, width: self.screenWidth, height: self.screenHeight - 10.0), style: UITableViewStyle.Plain)
        self.table.rowHeight = 60.0
        self.table.separatorStyle = .None
        self.table.backgroundColor = UIColor.blackColor()
        
        
        self.toDoItems.append(ToDoItem(text: "Monday"))
        self.toDoItems.append(ToDoItem(text: "Monday"))
        self.toDoItems.append(ToDoItem(text: "Monday"))
        self.toDoItems.append(ToDoItem(text: "Monday"))
        self.toDoItems.append(ToDoItem(text: "Monday"))
        self.toDoItems.append(ToDoItem(text: "Monday"))

        


        
        self.table.registerClass(myTableViewCell.classForCoder(), forCellReuseIdentifier: self.myTableViewCellIdentifier1)
        self.table.delegate = self
        self.table.dataSource = self
        
        self.view.addSubview(self.header)
        self.view.addSubview(self.table)
        
    }
    
    func toDoItemDeleted(toDoItem: ToDoItem){
        let index = (toDoItems as NSArray).indexOfObject(toDoItem)
        if index == NSNotFound { return }
        
        toDoItems.removeAtIndex(index)
        
        self.table.beginUpdates()
        let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
        self.table.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
        self.table.endUpdates()
        
    }
    
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = self.toDoItems.count - 1
        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.table.dequeueReusableCellWithIdentifier(self.myTableViewCellIdentifier1, forIndexPath: indexPath) as! myTableViewCell
        
        //cell.textLabel?.text = self.toDoItems[indexPath.row].text
        cell.selectionStyle = .None
        cell.delegate = self
        cell.toDoItem = self.toDoItems[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoItems.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var title = "Item"
        let alert = UIAlertController(title: self.title, message: "Selected", preferredStyle: UIAlertControllerStyle.Alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true, completion: {tableView.deselectRowAtIndexPath(indexPath, animated: true)})

    }

}


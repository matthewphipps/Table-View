//
//  ViewController.swift
//  TableView
//
//  Created by mphipps on 1/13/16.
//  Copyright © 2016 aHuesing. All rights reserved.
//

import UIKit
//Bring in data sourcee and delegate protocols for tableview
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    var superheroes = ["Batman", "Superman", "Aquaman:", "Wonder Woman", "The Flash", "Spiderman"]
    var realNames = ["Bruce Wayne", "Clark Kent", "Arther Curry", "Diana", "Barry Allen", "Peter Parker"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Set tableview datasource and delegate to view controller
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    //Required for tableview protocol - sends data to cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Creates the cell to be returned
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        //Inputs the given super hero and name at given cell position
        myCell.textLabel!.text = superheroes[indexPath.row]
        myCell.detailTextLabel!.text = realNames[indexPath.row]
        return myCell
    }
    //Required for tableview protocol - sets num of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superheroes.count
    }
}


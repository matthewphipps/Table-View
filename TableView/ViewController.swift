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
    @IBOutlet weak var editButton: UIBarButtonItem!
    var superheroes : [SuperHeroClass] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Set tableview datasource and delegate to view controller
        myTableView.dataSource = self
        myTableView.delegate = self
        
        superheroes.append(SuperHeroClass(Name: "Batman", Alias: "Bruce Wayne", Power: 70, Image: UIImage(named:"Batman")!))
        superheroes.append(SuperHeroClass(Name: "Superman", Alias: "Clark Kent", Power: 9000, Image: UIImage(named:"default")!))
        superheroes.append(SuperHeroClass(Name: "Aquaman", Alias: "Arthur Curry", Power: 25, Image: UIImage(named:"Aquaman")!))
        //superheroes.append(SuperHeroClass(Name: "Spiderman", Alias: "Peter Parker", Power: 150, Image: UIImage(named:"Spiderman")!))
        superheroes.append(SuperHeroClass(Name: "Wonderwoman", Alias: "?", Power: 200, Image: UIImage(named:"default")!))
        superheroes.append(SuperHeroClass(Name: "The Flash", Alias: "?", Power: 100, Image: UIImage(named:"default")!))
        
    }
    
    //Required for tableview protocol - sends data to cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Creates the cell to be returned
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        //Inputs the given super hero and name at given cell position
        myCell.textLabel!.text = superheroes[indexPath.row].name
        myCell.detailTextLabel!.text = superheroes[indexPath.row].alias
        return myCell
    }
    
    //Required for tableview protocol - sets num of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheroes.count
    }
    
    //Deletes cell
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superheroes.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        //Presents Alert view
        let myAlert = UIAlertController(title: "Add Super Hero", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler{(nameTextfield) -> Void in
            nameTextfield.placeholder = "Add Super Hero Name"
        }
        myAlert.addTextFieldWithConfigurationHandler{(aliasTextfield) -> Void in
            aliasTextfield.placeholder = "Add Super Hero Alias"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superHeroTF = myAlert.textFields![0] as UITextField
            let aliasTF = myAlert.textFields![1] as UITextField
            self.superheroes.append(SuperHeroClass(Name: superHeroTF.text!, Alias: aliasTF.text!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let superHero = superheroes[sourceIndexPath.row]
        superheroes.removeAtIndex(sourceIndexPath.row)
        superheroes.insert(superHero, atIndex: destinationIndexPath.row)
    }
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        if editButton.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            editButton.tag = 0
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow!.row
        detailView.superHero = superheroes[selectedRow]
        detailView.tableView = myTableView
        
    }
}


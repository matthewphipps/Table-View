//
//  DetailViewController.swift
//  TableView
//
//  Created by mphipps on 1/19/16.
//  Copyright © 2016 aHuesing. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var aliasTF: UITextField!
    @IBOutlet weak var powerTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var superHero : SuperHeroClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTF.text = superHero.name
        aliasTF.text = superHero.alias
        powerTF.text = String(superHero.power)
        myImageView.image = superHero.image
    }
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        superHero.name = nameTF.text!
        superHero.alias = aliasTF.text!
        superHero.power = Int(powerTF.text!)!
        tableView.reloadData()
    }
}

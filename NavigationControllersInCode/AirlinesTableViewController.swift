//
//  AirlinesTableViewController.swift
//  NavigationControllersInCode
//
//  Created by Mounika Ankam on 2/23/15.
//  Copyright (c) 2015 Mounika Ankam. All rights reserved.
//

import UIKit

class AirlinesTableViewController: UITableViewController {

    // An AirlinesTableViewController shows ... a bunch of airlines!
    
    var airlines:[Airline] = [
        Airline(name: "United", profits: 25.0, homebase: "Chicago",numEmployees: 2500,citiesFlown:["Chicago","New York","Toronto","London","Paris"]),
        Airline(name: "Delta", profits: 50.0, homebase: "Atlanta", numEmployees: 3500,citiesFlown:["Cairo","Tel Aviv","Ankara","Tokyo","Beijing"]),
        Airline(name: "British Air", profits:75.0,homebase: "London",numEmployees:1000,citiesFlown:["London","Rome","Munich","Johannesburg"])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The table view needs to know where it's cell is defined
        
        //Removing this as we transition to Storyboards
        self.tableView.registerNib(UINib(nibName: "AirlineCell", bundle: nil), forCellReuseIdentifier: "airline_cell")
        
        // Because the TVC is inside a Navigation Controller, its navigationItem is relevant:  the Navigation Controller will query it, and display its title
        
        // Removing this as we transition to Storyboards
//        self.navigationItem.title = "Airlines"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Bordered, target: self, action: Selector("handleAdd:"))


    }
    
    
    // This was the code that was tapped when a user clicked on the Add button
    // Since we are now doing this with a segue, we can lose this, too
/*
    func handleAdd(id:AnyObject){
        var storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var addNewAirlineVC:AddNewAirlineViewController = storyboard.instantiateViewControllerWithIdentifier("new_airline") as AddNewAirlineViewController
        addNewAirlineVC.airlinesTVC = self
        self.presentViewController(addNewAirlineVC, animated: true, completion: nil)
        
        
    }
*/
    
    // This method adds an Airline to airlines
    
    func airlineAdded(airline:Airline){
        // add airline to airlines
        airlines.append(airline)
        // tell our tableView to reloadData()
        self.tableView.reloadData()
        // dismissViewController()
        self.dismissViewControllerAnimated(true,
            completion: nil)
    }
    
    func cancel(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return airlines.count
    }

    // The usual method for populating the cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("airline_cell", forIndexPath: indexPath) as UITableViewCell

        var airline:Airline = airlines[indexPath.row]
        cell.textLabel?.text = airline.name
        cell.detailTextLabel?.text = airline.homebase

        return cell
    }
    
   

    // This method is now made redundant because of our push segue
    
    /*
    
     // We've tapped on a row ... now what?
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        // Now we instantiate a CitiesFlownTableViewController, where we will display a list of cities flown
        var citiesFlownTVC:CitiesFlownTableViewController = CitiesFlownTableViewController()
        
        // Examine CitiesFlownTableViewController -- you will see it defines 2 properties that we configure here
        // so that by the time that TVC becomes visible, those properties (title, and actual tableview content) will be displayed to the user
        
        citiesFlownTVC.citiesFlown = airlines[indexPath.row].citiesFlown
        citiesFlownTVC.airlineName = airlines[indexPath.row].name
        
        // Every UIViewController, if it is part of a UINavigationController stack, has a navigationController property that references that
        // UINavigationController.  This is quite handy, when we want to push a new view controller
        self.navigationController?.pushViewController(citiesFlownTVC, animated: true)
    }
*/
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "cities"{
            var citiesFlownTVC = segue.destinationViewController as CitiesFlownTableViewController
            var row = tableView.indexPathForSelectedRow()?.row
            citiesFlownTVC.citiesFlown = airlines[row!].citiesFlown
            citiesFlownTVC.airlineName = airlines[row!].name
        } else {
            
            var addNewAirlineVC = segue.destinationViewController as AddNewAirlineViewController
            addNewAirlineVC.airlinesTVC = self
        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}

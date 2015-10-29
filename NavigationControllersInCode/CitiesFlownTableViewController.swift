//
//  CitiesFlownTableViewController.swift
//  NavigationControllersInCode
//
//  Created by Mounika Ankam on 2/23/15.
//  Copyright (c) 2015 Mounika Ankam. All rights reserved.
//

import UIKit

class CitiesFlownTableViewController: UITableViewController {

    // By the time this table view controller is about to pushed on to the navigation controller's steack
    // these properties will be configured.
    
    var citiesFlown:[String]!
    var airlineName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "City", bundle: nil), forCellReuseIdentifier: "city_cell")
        self.navigationItem.title = airlineName // this will appear in the navigation bar: the user will be reminded of the airline, while perusing the list of cities flown

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
        return citiesFlown.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("city_cell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = citiesFlown[indexPath.row]

        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

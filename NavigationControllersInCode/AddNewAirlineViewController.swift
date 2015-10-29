//
//  AddNewAirlineViewController.swift
//  NavigationControllersInCode
//
//  Created by Mounika Ankam on 2/26/15.
//  Copyright (c) 2015 Mounika Ankam. All rights reserved.
//

import UIKit

class AddNewAirlineViewController: UIViewController {
    
    var airlinesTVC:AirlinesTableViewController!
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var citiesTF: UITextField!
   
    @IBAction func addNewAirline(sender: AnyObject) {
        // make an airline
        var airline:Airline = Airline(name: nameTF.text, profits: 100.0, homebase: "Maryville", numEmployees: 100, citiesFlown: citiesTF.text.componentsSeparatedByString(","))
        // tell airlinesTVC to add it
        airlinesTVC.airlineAdded(airline)
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

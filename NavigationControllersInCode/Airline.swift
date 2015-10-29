//
//  Airline.swift
//  NavigationControllersInCode
//
//  Created by Mounika Ankam on 2/23/15.
//  Copyright (c) 2015 Mounika Ankam. All rights reserved.
//

import Foundation

class Airline {
    
    var name:String
    var profits:Double
    var homebase:String
    var numEmployees:Int
    var citiesFlown:[String]
    
    init(name:String, profits:Double, homebase:String, numEmployees:Int, citiesFlown:[String]){
        self.name = name
        self.profits = profits
        self.homebase = homebase
        self.numEmployees = numEmployees
        self.citiesFlown = citiesFlown
    }
    
}
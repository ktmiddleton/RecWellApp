//
//  Sport.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import Foundation

class Sport: Decodable
{
    var sportName : String
    var startDate : String
    var cost : Int
    var teamNum : String
    
    init(startDate: String, cost: Int, teamNum: String, sportName: String)
    {
        self.startDate = startDate
        self.cost = cost
        self.teamNum = teamNum
        self.sportName = sportName
    }
}

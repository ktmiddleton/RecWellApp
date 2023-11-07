//
//  Class.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import Foundation

class `class`: Decodable
{
    var className : String
    var instructor : Instructor
    var duration : Int
    var startTime : String
    
    init(instructor: Instructor, duration: Int, startTime: String, className: String)
    {
        self.instructor = instructor
        self.duration = duration
        self.startTime = startTime
        self.className = className
    }
}

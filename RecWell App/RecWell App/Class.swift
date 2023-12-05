//
//  Class.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import Foundation
import FirebaseFirestoreSwift

class `class`: Codable, Identifiable
{
    @DocumentID var id: String?
    @ServerTimestamp var created: Date?
    var className : String
    var instructor : String
    var duration : Int
    var startTime : String
    var participants : [String]
    
    init(instructor: String, duration: Int, startTime: String, className: String, participants: [String])
    {
        self.instructor = instructor
        self.duration = duration
        self.startTime = startTime
        self.className = className
        self.participants = participants
    }
}

//
//  CardView.swift
//  RecWell App
//
//  Created by Student on 11/6/23.
//

import SwiftUI

struct ClassCardView: View {
    var classVar : `class`
    var body: some View {
        VStack(alignment:.leading)
        {
            Text(classVar.className)
                .font(.headline)
            Spacer()
            HStack
            {
                Label(classVar.instructor, systemImage: "person")
                Spacer()
                Label((String(classVar.duration) + " Minutes"), systemImage: "clock")
                Spacer()
                Label(classVar.startTime, systemImage:"calendar.badge.clock")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
        
    }
}

struct SportCardView: View
{
    var sport : Sport
    var body: some View
    {
        VStack(alignment:.leading)
        {
            Text(sport.sportName)
                .font(.headline)
            Spacer()
            HStack
            {
                Label(sport.startDate, systemImage: "rectangle.and.pencil.and.ellipsis")
                Spacer()
                Label(String(sport.cost), systemImage: "dollarsign")
                Spacer()
                Label((sport.teamNum + " Teams"), systemImage:"person.3.fill")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        SportCardView()
//            .previewLayout(.fixed(width: 400, height: 60))
//    }
//}

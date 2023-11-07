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
                Label(classVar.instructor.name, systemImage: "person")
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
    var gameVar : game
    var body: some View
    {
        VStack(alignment:.leading)
        {
            Text(gameVar.sportName)
                .font(.headline)
            Spacer()
            HStack
            {
                Label(gameVar.startDate, systemImage: "rectangle.and.pencil.and.ellipsis")
                Spacer()
                Label(String(gameVar.cost), systemImage: "dollarsign")
                Spacer()
                Label((gameVar.teamNum + " Teams"), systemImage:"person.3.fill")
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

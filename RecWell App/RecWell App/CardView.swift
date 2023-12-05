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
        VStack(alignment:.leading) {
            Text(classVar.className)
                .font(.headline)
                .padding()

            HStack
            {
                Label(classVar.instructor, systemImage: "person")
                Spacer()
                Label((String(classVar.duration) + " Minutes"), systemImage: "clock")
                Spacer()
                Label(classVar.startTime, systemImage:"calendar.badge.clock")
                    .padding(.trailing, 10)
            }
            .padding()
            .font(.caption)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.259, green: 0.259, blue: 0.259))
                .shadow(color:.black, radius: 2, x: 0, y: 2)
                .padding()
        ).foregroundColor(.white)
    }
}

struct SportCardView: View
{
    var sport : Sport
    var body: some View
    {
        VStack(alignment:.leading) {
            
            Text(sport.sportName)
                .font(.headline)
                .padding()
            
            HStack
            {
                Label(sport.startDate, systemImage: "rectangle.and.pencil.and.ellipsis")
                Spacer()
                Label(String(sport.cost), systemImage: "dollarsign")
                Spacer()
                Label((sport.teamNum + " Teams"), systemImage:"person.3.fill")
                    .padding(.trailing, 10)
            }
            .padding()
            .font(.caption)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.259, green: 0.259, blue: 0.259))
                .shadow(color:.black, radius: 5, x: 0, y: 2)
                .padding()
        ).foregroundColor(.white)
    }
}

//
//  PredicateView.swift
//  CoreDataProject
//
//  Created by Sergey Dolgikh on 05.01.2022.
//

import SwiftUI

struct PredicateView: View {
    
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(
        sortDescriptors: [],
        predicate:
//        NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"]) //все корабли которые входят в массив
//        NSPredicate(format: "name BEGINSWITH %@", "E") // Начинаются на "E"
//        NSPredicate(format: "name BEGINSWITH[c] %@", "e") // Начинаются на "e" не чувствителен к регистру
//        NSPredicate(format: "NOT name BEGINSWITH[c] %@", "D")
//        NSPredicate(format: "name BEGINSWITH[c] %@ AND universe == 'Star Trek'", "e")
        NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "name BEGINSWITH[c] %@", "e"),
            NSPredicate(format: "universe == %@", "Star Trek")
        ])
    )
    var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? moc.save()
            }
        }
    }
}

struct PredicateView_Previews: PreviewProvider {
    static var previews: some View {
        PredicateView()
    }
}

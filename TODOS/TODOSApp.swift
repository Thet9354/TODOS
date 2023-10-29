//
//  TODOSApp.swift
//  TODOS
//
//  Created by Phoon Thet Pine on 29/10/23.
//

import SwiftUI

@main
struct TODOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

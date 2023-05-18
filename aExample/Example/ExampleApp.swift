//
//  ExampleApp.swift
//  Example
//
//  Created by 林小鹏 on 2023/5/17.
//

import SwiftUI

@main
struct ExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

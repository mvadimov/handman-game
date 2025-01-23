//
//  HangManApp.swift
//  HangMan
//
//  Created by Mark Vadimov on 24.06.24.
//

import SwiftUI
import SwiftData

@main
struct HangManApp: App {
    @StateObject var viewModel = ViewModel()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            StartView().environmentObject(ViewModel())
        }
        .modelContainer(sharedModelContainer)
    }
}

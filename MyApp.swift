import SwiftUI

@available(iOS 17.0, *)
@main
struct MyApp: App {
   @State private var dataManager = AppData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataManager)
            
            
        }
    }
}

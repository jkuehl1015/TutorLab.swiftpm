import SwiftUI

@main
struct MyApp: App {
    @State var stuInfo = Save()
    var body: some Scene {
        WindowGroup {
            ContentView(stuInfo: $stuInfo)
        }
    }
}

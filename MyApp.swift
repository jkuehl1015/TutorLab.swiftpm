import SwiftUI

@main
struct MyApp: App {
    @State var stuInfo = Student()
    var body: some Scene {
        WindowGroup {
            ContentView(stuInfo: $stuInfo)
        }
    }
}

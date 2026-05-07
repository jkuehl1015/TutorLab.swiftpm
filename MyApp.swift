import SwiftUI

@main
struct MyApp: App {
    @State var stuInfo = Student()
    @State var teacherInfo = Teacher()
    @State var tutorInfo = Tutor()
    
    var body: some Scene {
        WindowGroup {
            ContentView(stuInfo: $stuInfo, teacherInfo: $teacherInfo, tutorInfo: $tutorInfo)
            
            
        }
    }
}

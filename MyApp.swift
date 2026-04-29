import SwiftUI

@main
struct MyApp: App {
    @State var stuInfo = Student()
   @State var teacherInfo = Teacher()
    var body: some Scene {
        WindowGroup {
            ContentView(stuInfo: $stuInfo, teacherInfo: $teacherInfo)
            TeacherSignInView(teacherInfo: $teacherInfo)
            
        }
    }
}

import SwiftUI
@available(iOS 17.0, *)
struct ContentView: View {
   @State var isPressed = false
    var body: some View {
        NavigationStack {
            ZStack{
                Color.purple.ignoresSafeArea()
                    .opacity(0.8)
                VStack {
                    Image(systemName: "graduationcap.circle")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 200, height: 200, alignment: .center)
                        .padding()
                    Text("Welcome To TutorLab")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .fontDesign(.serif)
                        .foregroundColor(.white)
                    
                    NavigationLink(destination: StudentSignInView()) {
                        Text("Student Sign-Up")
                            .frame(width: 175, height: 50, alignment: .center)
                            .foregroundStyle(.white)
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding()
                            .scaleEffect(isPressed ? 0.94 : 1)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                    }
                    
                    NavigationLink(destination: TeacherSignInView()) {
                        Text("Teacher Referral")
                            .frame(width: 175, height: 50, alignment: .center)
                            .foregroundStyle(.white)
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding()
                            .scaleEffect(isPressed ? 0.94 : 1)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                    }
                    
                    NavigationLink(destination: TutorSignInView()) {
                        Text("Tutor Sign-In")
                            .frame(width: 175, height: 50, alignment: .center)
                            .foregroundStyle(.white)
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding()
                            .scaleEffect(isPressed ? 0.94 : 1)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                    }
                    
                    Divider()
                    
                    NavigationLink(destination: AdminMainView()) {
                        Label("Admin Portal", systemImage: "lock.shield.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.secondary.opacity(0.2))
                            .cornerRadius(12)
                        
                    }
                    .padding()
                    
                    
                }
            }
            Spacer()
        }
    }
}

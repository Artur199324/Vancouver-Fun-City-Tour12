import SwiftUI

struct QuizMenuView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var set = false
    
    var body: some View {
        NavigationView {
            ZStack {
        
                Image("launch")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                     
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "arrow.left")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.black.opacity(0.6))
                                    .clipShape(Circle())
                            }
                            
                            Spacer()
                            
                            Text("Quiz")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                set.toggle()
                            }) {
                                Image(systemName: "gearshape.fill")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.black.opacity(0.6))
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 70)
                        
                        
                        VStack(spacing: 16) {
                            ForEach(QuizType.allCases, id: \.self) { quiz in
                                NavigationLink(destination: QuizGameView(type: quiz)) {
                                    HStack {
                                        Text(quiz.rawValue)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding()
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black.opacity(0.4))
                                    .cornerRadius(12)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $set) {
            SettingsScreen()
        }
    }
}

#Preview {
    QuizMenuView()
}

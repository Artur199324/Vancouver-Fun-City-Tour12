import SwiftUI

struct QuizGameView: View {
    @State private var set = false
    let type: QuizType
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var selectedAnswer: String? = nil
    @State private var isAnswerCorrect: Bool? = nil
    @Environment(\.dismiss) private var dismiss
    private var quizData: [Question] {
        switch type {
        case .casinos:
            return quizCasinosVancouver
        case .hotels:
            return quizHotelsVancouver
        case .restaurants:
            return quizRestaurantsVancouver
        case .attractions:
            return quizAttractionsVancouver
        }
    }

    var body: some View {
        ZStack {
           
            Image("launch")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
              
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding()
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
                        Image(systemName: "gearshape")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                }
                
                .padding(.horizontal)
                .padding(.top, 40)

            
                Text("Question \(currentQuestionIndex + 1) / \(quizData.count)")
                    .font(.headline)
                    .foregroundColor(.white)
                
                if currentQuestionIndex < quizData.count {
                    let question = quizData[currentQuestionIndex]

                    VStack(spacing: 16) {
                 
                        Text(question.question)
                            .font(Font.custom("Georgia", size: 34))
                            .foregroundColor(Color("tit1"))
                            .multilineTextAlignment(.center)
                            .padding()

                        
                        ForEach(question.answers, id: \.self) { answer in
                            Button(action: {
                               
                                selectedAnswer = answer
                                isAnswerCorrect = (answer == question.correct)
                                if isAnswerCorrect == true {
                                    score += 1
                                }

                               
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    currentQuestionIndex += 1
                                    selectedAnswer = nil
                                    isAnswerCorrect = nil
                                }
                            }) {
                                Text(answer)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        selectedAnswer == answer
                                            ? (isAnswerCorrect == true ? Color.green : Color.red)
                                            : Color.black.opacity(0.6)
                                    )
                                    .cornerRadius(12)
                                    .shadow(radius: 4)
                            }
                            .disabled(selectedAnswer != nil)
                        }
                    }
                    .padding(.horizontal)
                }else {
                    
                    VStack(spacing: 20) {
                       
                        Text("Results:")
                            .font(Font.custom("Georgia", size: 36))
                            .foregroundColor(Color("tit1"))
                            .padding(.top, 40)
                        
                        
                        HStack {
                            Text("Correct Answers")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("\(score)")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                       
                        HStack {
                            Text("Incorrect Answers")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("\(quizData.count - score)")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        Spacer()
                    
                    }
                    .padding()
                    .background(
                        Image("launch")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                    )
                }

                Spacer()
            }
            .padding()
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $set) {
            SettingsScreen()
        }
    }
}

#Preview {
    QuizGameView(type: .casinos)
}

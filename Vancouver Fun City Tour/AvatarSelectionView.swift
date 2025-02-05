import SwiftUI

struct AvatarSelectionView: View {
    @State private var selectedAvatar: Int = 0
    let avatars = ["avatar1", "avatar2"]
    @State private var menu = false

    var body: some View {
        VStack {
            Spacer()

            
          
            VStack{
                Text("SELECT USERPIC")
                    .font(Font.custom("Georgia", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color("tit1"))
                    .padding(.bottom, 2)
                    .padding(.top, 20)
                
               
                Text("Select an avatar to display in your app")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 16)
                    .padding()
               }
                .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.black.opacity(0.5))
                    .padding(.horizontal, 20)
            )
          
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<avatars.count, id: \.self) { index in
                        Image(avatars[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(selectedAvatar == index ? Color.white : Color.clear, lineWidth: 4)
                            )
                            .onTapGesture {
                                selectedAvatar = index
                                
                            }
                    }
                }
                .padding(.horizontal, 32)
            }
            .padding(.bottom, 16)

           
            HStack(spacing: 15) {
                         ForEach(0..<avatars.count, id: \.self) { index in
                             RoundedRectangle(cornerRadius: 4)
                                 .frame(width: 70, height: 8) 
                                 .foregroundColor(selectedAvatar == index ? Color("tit3") : Color.gray.opacity(0.5))
                         }
                     }
                     .padding(.bottom, 32)

           
            Spacer()
            Button(action: {
                saveSelectedAvatar(index: selectedAvatar)
                menu.toggle()
            }) {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("tit1"))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 12)

            Spacer()
        }
        .background(Image("launch").resizable().scaledToFill())
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $menu) {
            MainMenuView()
        }
    }
    
    private func saveSelectedAvatar(index: Int) {
          UserDefaults.standard.set(index, forKey: "SelectedAvatar")
      }
}

#Preview {
    AvatarSelectionView()
}

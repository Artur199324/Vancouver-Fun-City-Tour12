import SwiftUI

struct MainMenuView: View {
    @State private var selectedTab: Tab = .home
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    switch selectedTab {
                    case .home:
                        HomeView() 
                    case .map:
                        ListScreenView()
                    case .favorites:
                        FavoritesView()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .edgesIgnoringSafeArea(.all)
                    case .profile:
                        ProfileView()
                    }
                }
            }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                    
                    HStack {
                        Spacer()

                        TabButton(icon: "ic1", isSelected: selectedTab == .home, action: {
                            selectedTab = .home
                        })

                        Spacer()

                        TabButton(icon: "ic2", isSelected: selectedTab == .map, action: {
                            selectedTab = .map
                        })

                        Spacer()

                        TabButton(icon: "ic3", isSelected: selectedTab == .favorites, action: {
                            selectedTab = .favorites
                        })

                        Spacer()

                        TabButton(icon: "ic4", isSelected: selectedTab == .profile, action: {
                            selectedTab = .profile
                        })

                        Spacer()
                    }
                    .frame(height: 60)
                    .background(Color.black)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                }
                .ignoresSafeArea(edges: .bottom)
                .background(Image("launch").resizable().scaledToFill())
                .ignoresSafeArea()
            }
}
struct TabButton: View {
    let icon: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .padding(12)
                .background(
                    ZStack {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.red)
                                .blur(radius: 10)
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.black.opacity(0.2))
                        }
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 12)) 
                .foregroundColor(isSelected ? .white : .gray)
        }
    }
}
#Preview {
    MainMenuView()
}

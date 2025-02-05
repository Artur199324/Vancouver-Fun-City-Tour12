import SwiftUI

struct HomeView: View {
    @State private var qui = false
    @State private var set = false
    @State private var username: String = UserDefaults.standard.string(forKey: "SavedUsername") ?? "Guest"
    @State private var selectedAvatar: Int? = UserDefaults.standard.object(forKey: "SelectedAvatar") as? Int
    let avatars = ["avatar1", "avatar2"] 
    @State private var selectedCategory: Category = .hotels
    @State private var currentIndex = 0
      let items = [
          CarouselItem(image: "image1", title: "Fairmont Hotel Vancouver", subtitle: "Vancouver, Canada"),
          CarouselItem(image: "image2", title: "Hawksworth Restaurant", subtitle: "Vancouver, Canada"),
          CarouselItem(image: "image3", title: "Stanley Park", subtitle: "Vancouver, Canada")
      ]
      
    let places: [Place] = [
        Place(category: .hotels, image: "hotel1", title: "The Westin Bayshore", address: "1601 Bayshore Drive, Vancouver, BC V6G 2V4", rating: 4.9),
        Place(category: .hotels, image: "hotel2", title: "Pan Pacific Vancouver Hotel", address: "999 Canada Place, Vancouver, BC V6C 3B5", rating: 4.9),
        Place(category: .restaurants, image: "hotel3", title: "Miku Vancouver", address: "200 Granville St #70, Vancouver, BC V6C 1S4", rating: 4.9),
        Place(category: .restaurants, image: "hotel4", title: "L’Abattoir", address: "217 Carrall St, Vancouver, BC V6B 2J2", rating: 4.9),
        Place(category: .attractions, image: "hotel5", title: "Capilano Suspension Bridge Park", address: "3735 Capilano Rd, BC V7R 4J1", rating: 4.9),
        Place(category: .attractions, image: "hotel6", title: "Grouse Mountain", address: "6400 Nancy Greene Way, North Vancouver, BC V7R 4K9", rating: 4.9)
    ]

    var filteredPlaces: [Place] {
        places.filter { $0.category == selectedCategory }
    }
    @State private var selectedPlace: String? = nil
    var body: some View {
        VStack {
            ScrollView{
            Spacer()
            HStack {
             
                if let avatarIndex = selectedAvatar, avatarIndex < avatars.count {
                    Image(avatars[avatarIndex])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 1)
                        )
                }

               
                Text("Hello, \(username)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading, selectedAvatar != nil ? 8 : 0)

                Spacer()

             
                Button(action: {
                    qui.toggle()
                }) {
                    HStack {
                        Image("zap")
                            .foregroundColor(.white)
                        Text("Quiz")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.red)
                    .cornerRadius(8)
                }

              
                Button(action: {
                    set.toggle()
                }) {
                    Image("settings-01")
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                       
                }
            }
            
            .padding()
            .padding(.top,40)
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(0.6))
            
            

          
            HStack{
                Text("A SELECTION FOR YOU")
                    .font(Font.custom("Georgia", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color("tit1"))
                    .padding(.bottom, 8)
                    .padding(.leading, 18)
                Spacer()
            }
                       ZStack {
                           
                           Button(action: {
                           
                               selectedPlace = items[currentIndex].title
                               
                                         }) {
                                             Image(items[currentIndex].image)
                                                 .resizable()
                                                 .scaledToFill()
                                                 .frame(height: 250)
                                                 .clipped()
                                                 .overlay(
                                                     VStack(alignment: .leading, spacing: 4) {
                                                         Text(items[currentIndex].title)
                                                             .font(.title2)
                                                             .fontWeight(.bold)
                                                             .foregroundColor(.white)
                                                         Text(items[currentIndex].subtitle)
                                                             .font(.body)
                                                             .foregroundColor(.white.opacity(0.8))
                                                     }
                                                     .padding()
                                                     .background(
                                                         LinearGradient(colors: [.black.opacity(0.7), .clear], startPoint: .bottom, endPoint: .top)
                                                     )
                                                     .frame(maxWidth: .infinity, alignment: .leading),
                                                     alignment: .bottom
                                                 )
                                                 .cornerRadius(20)
                                                 .padding(.horizontal)
                                         }
                                         .buttonStyle(PlainButtonStyle())
                           
                      
                           HStack {
                               Button(action: {
                                   withAnimation {
                                       currentIndex = (currentIndex - 1 + items.count) % items.count
                                   }
                               }) {
                                   Image(systemName: "chevron.left")
                                       .foregroundColor(.white)
                                       .frame(width: 40, height: 40)
                                       .background(Color.black.opacity(0.5))
                                       .clipShape(Circle())
                               }
                               Spacer()
                               
                              
                               Button(action: {
                                   withAnimation {
                                       currentIndex = (currentIndex + 1) % items.count
                                   }
                               }) {
                                   Image(systemName: "chevron.right")
                                       .foregroundColor(.white)
                                       .frame(width: 40, height: 40)
                                       .background(Color.black.opacity(0.5))
                                       .clipShape(Circle())
                               }
                           }
                           .padding(.horizontal, 16)
                       }
                       
                      
                       HStack(spacing: 8) {
                           ForEach(0..<items.count, id: \.self) { index in
                               RoundedRectangle(cornerRadius: 4)
                                   .frame(width: 40, height: 8)
                                   .foregroundColor(currentIndex == index ? .red : .gray.opacity(0.5))
                           }
                       }
                       .padding(.top, 16)
            
            HStack{
                Text("POPULAR")
                    .font(Font.custom("Georgia", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color("tit1"))
                    .padding(.bottom, 8)
                    .padding(.leading, 18)
                Spacer()
            }
                     
                      HStack {
                          ForEach(Category.allCases, id: \.self) { category in
                              Button(action: {
                                  selectedCategory = category
                              }) {
                                  Text(category.rawValue)
                                      .padding(.horizontal, 16)
                                      .padding(.vertical, 8)
                                      .background(selectedCategory == category ?  Color("tit1"): Color.black.opacity(0.4))
                                      .foregroundColor(.white)
                                      .cornerRadius(20)
                              }
                          }
                      }
                      .padding(.bottom, 16)

           
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(filteredPlaces) { place in
                        Button(action: {
                            
                            print("Selected place: \(place.title)")
                            selectedPlace = place.title
                        }) {
                            HStack {
                                Image(place.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(place.title)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    HStack{
                                        Image("a1")
                                        Text(place.address)
                                            .font(.subheadline)
                                            .foregroundColor(Color("tit2"))
                                    }
                                    
                                    HStack(spacing: 4) {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                        Text(String(format: "%.1f", place.rating))
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                    }
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                            .shadow(radius: 2)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                }
                .padding(.horizontal)
                .fullScreenCover(item: $selectedPlace) { title in
                    if let place = placeDetailsArray.first(where: { $0.title == title }) {
                        PlaceDetailsView(place: place)
                    }
                    
                }
                .fullScreenCover(isPresented: $qui) {
                    QuizMenuView()
                }
                .fullScreenCover(isPresented: $set) {
                    SettingsScreen()
                }
            
            }
          
        }
        .background(Image("launch").resizable().scaledToFill())
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}

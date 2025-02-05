import SwiftUI

struct PlaceDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isFavorite: Bool = false
    let place: PlaceDetails

    var body: some View {
        VStack(spacing: 0) {
          
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

                Text("Details")
                    .font(.headline)
                    .foregroundColor(.white)

                Spacer()

                Button(action: {
                    isFavorite.toggle()
                    saveToFavorites()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .font(.title2)
                        .foregroundColor(isFavorite ? .red : .white)
                        .padding(8)
                        .background(Color.black.opacity(0.6))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)
            .padding(.top, 40)
            .padding(.bottom, 8)
            .background(Color("darkBackground"))

            ScrollView {
                VStack(spacing: 16) {
                  
                    Image(place.image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        
                        .padding(.top, 16)

                   
                    VStack(alignment: .leading, spacing: 16) {
                     
                        Text(place.title)
                            .font(Font.custom("Georgia", size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.black)

                      
                        HStack {
                            Text(place.type.uppercased())
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .background(Color.red.opacity(0.8))
                                .cornerRadius(8)
                                .foregroundColor(.white)

                           

                            HStack(spacing: 1) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                Text(String(format: "%.1f", place.rating))
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                  
                                
                            }
                            .padding(.horizontal,6)
                            .background(Color("tit1"))
                                .cornerRadius(8)
                        }

                   
                        HStack {
                            Image("a1")
                                .foregroundColor(.red)
                            Text(place.address)
                                .font(.subheadline)
                                .foregroundColor(Color("tit2"))
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(20)

                      
                        HStack {
                            Image("a2")
                                .foregroundColor(.gray)
                            Text("\(place.price)")
                                .font(.body)
                                .foregroundColor(Color("tit2"))
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(20)

                     
                        HStack {
                            Image("a3")
                                .foregroundColor(.gray)
                            Text(place.season)
                                .font(.caption)
                                .foregroundColor(Color("tit2"))
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(20)

                     
                        Text(place.description)
                            .font(.body)
                            .foregroundColor(.black)
                            .padding()
                            .cornerRadius(12)
                    }
                    
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    
                }
            }
            .background(Color("background"))
        }
        .background(Image("launch").resizable().scaledToFill())
        .ignoresSafeArea()
        .onAppear {
            loadFavoriteStatus()
        }
    }

   
    private func saveToFavorites() {
        var favorites = UserDefaults.standard.stringArray(forKey: "Favorites") ?? []
        if isFavorite {
            favorites.append(place.title)
        } else {
            favorites.removeAll { $0 == place.title }
        }
        UserDefaults.standard.set(favorites, forKey: "Favorites")
    }

 
    private func loadFavoriteStatus() {
        let favorites = UserDefaults.standard.stringArray(forKey: "Favorites") ?? []
        isFavorite = favorites.contains(place.title)
    }
}

#Preview {
    PlaceDetailsView(place: placeDetailsArray[0])
}

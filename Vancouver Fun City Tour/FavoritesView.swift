import SwiftUI

struct FavoritesView: View {
    @State private var selectedCategory: Category = .hotels
    @State private var favoritePlacesByCategory: [Category: [PlaceDetails]] = [:]
    @State private var selectedPlace: String? = nil

    var body: some View {
        ZStack {
          
            Image("launch")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 0) {
           
                VStack(alignment: .leading) {
                    Text("Favorites")
                        .font(Font.custom("Georgia", size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(Color("tit1"))
                        .padding(.top, 130)
                        .padding(.leading)

                   
                    HStack {
                        ForEach(Category.allCases, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category.rawValue.capitalized)
                                    .font(.headline)
                                    .foregroundColor(selectedCategory == category ? .white : .gray)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        selectedCategory == category
                                        ? Color("tit1")
                                        : Color.black.opacity(0.2)
                                    )
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

              
                ScrollView {
                    VStack(spacing: 16) {
                        if let places = favoritePlacesByCategory[selectedCategory], !places.isEmpty {
                            ForEach(places) { place in
                                Button(action: {
                                    print("Selected: \(place.title)")
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
                        } else {
                            VStack {
                                Spacer()
                                Text("No favorites yet.")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onAppear {
            loadFavorites()
        }
        .fullScreenCover(item: $selectedPlace) { title in
            if let place = placeDetailsArray.first(where: { $0.title == title }) {
                PlaceDetailsView(place: place)
            }
        }
    }

    private func loadFavorites() {
        let savedFavorites = UserDefaults.standard.stringArray(forKey: "Favorites") ?? []
        let favoritePlaces = placeDetailsArray.filter { savedFavorites.contains($0.title) }

        favoritePlacesByCategory = Dictionary(grouping: favoritePlaces) { place in
            getCategory(for: place.type)
        }
    }

    private func getCategory(for type: String) -> Category {
        switch type.lowercased() {
        case "hotel":
            return .hotels
        case "restaurant":
            return .restaurants
        case "attraction":
            return .attractions
        default:
            return .hotels
        }
    }
}

#Preview {
    FavoritesView()
}

import SwiftUI

struct ListScreenView: View {
    @State private var selectedCategory: Category = .hotels
    @State private var selectedPlace: String? = nil
    
    var filteredPlaces: [Place] {
          places.filter { $0.category == selectedCategory }
      }
    var body: some View {
        VStack(alignment: .leading) {
              
            Spacer()
                    Text("POPULAR")
                        .font(Font.custom("Georgia", size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color("tit1"))
                        .padding(.bottom, 8)
                        .padding(.top, 40)

                   
                    HStack {
                        ForEach(Category.allCases, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category.rawValue)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedCategory == category ? Color("tit1") : Color.black.opacity(0.2))
                                    .foregroundColor(selectedCategory == category ? .white : .gray)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.bottom, 16)

                   
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(filteredPlaces) { place in
                                Button(action: {
                                    selectedPlace = place.title
                                   
                                }) {
                                    HStack {
                                        Image(place.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                            .clipShape(RoundedRectangle(cornerRadius: 10)) .clipShape(RoundedRectangle(cornerRadius: 20))
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
                                .fullScreenCover(item: $selectedPlace) { title in
                                    if let place = placeDetailsArray.first(where: { $0.title == title }) {
                                        PlaceDetailsView(place: place)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding()
                .ignoresSafeArea(edges: .bottom)
                .background(Image("launch").resizable().scaledToFill())
                .ignoresSafeArea()
            }
}
extension String: @retroactive Identifiable {
    public var id: String { self }
}
#Preview {
    ListScreenView()
}

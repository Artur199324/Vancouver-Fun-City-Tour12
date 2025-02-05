import Foundation

struct Place: Identifiable {
    let id = UUID()
    let category: Category
    let image: String
    let title: String
    let address: String
    let rating: Double
}

let places: [Place] = [

    Place(category: .hotels, image: "ht1", title: "Fairmont Hotel Vancouver", address: "900 W Georgia Street, Vancouver, BC V6C 2W6", rating: 4.9),
    Place(category: .hotels, image: "ht2", title: "The Westin Bayshore", address: "1601 Bayshore Drive, Vancouver, BC V6G 2V4", rating: 4.9),
    Place(category: .hotels, image: "ht3", title: "Pan Pacific Vancouver Hotel", address: "999 Canada Place, Vancouver, BC V6C 3B5", rating: 4.9),
    Place(category: .hotels, image: "ht4", title: "The St. Regis Hotel", address: "602 Dunsmuir Street, Vancouver, BC V6B 1Y6", rating: 4.9),
    Place(category: .hotels, image: "ht5", title: "Rosewood Hotel Georgia", address: "801 W Georgia Street, Vancouver, BC V6C 1P7", rating: 4.9),
    Place(category: .hotels, image: "ht6", title: "Shangri-La Hotel Vancouver", address: "1128 W Georgia Street, Vancouver, BC V6E 0A8", rating: 4.9),
    Place(category: .hotels, image: "ht7", title: "Loden Hotel", address: "1177 Melville Street, Vancouver, BC V6E 0A3", rating: 4.9),
    Place(category: .hotels, image: "ht8", title: "Hyatt Regency Vancouver", address: "655 Burrard Street, Vancouver, BC V6C 2R7", rating: 4.9),
    Place(category: .hotels, image: "ht9", title: "Fairmont Pacific Rim", address: "1038 Canada Place, Vancouver, BC V6C 0B9", rating: 4.9),
    Place(category: .hotels, image: "ht10", title: "Wedgewood Hotel & Spa", address: "845 Hornby Street, Vancouver, BC V6Z 1V1", rating: 4.9),

  
    Place(category: .restaurants, image: "re1", title: "Hawksworth Restaurant", address: "801 W Georgia St, Vancouver, BC V6C 1P7", rating: 4.9),
    Place(category: .restaurants, image: "re2", title: "Miku Vancouver", address: "200 Granville St #70, Vancouver, BC V6C 1S4", rating: 4.9),
    Place(category: .restaurants, image: "re3", title: "L’Abattoir", address: "217 Carrall St, Vancouver, BC V6B 2J2", rating: 4.9),
    Place(category: .restaurants, image: "re4", title: "Blue Water Cafe", address: "1095 Hamilton St, Vancouver, BC V6B 5T4", rating: 4.9),
    Place(category: .restaurants, image: "re5", title: "St. Lawrence", address: "269 Powell St, Vancouver, BC V6A 1G3", rating: 4.9),
    Place(category: .restaurants, image: "re6", title: "Ancora Waterfront Dining & Patio", address: "1600 Howe St #2, Vancouver, BC V6Z 2L9", rating: 4.9),
    Place(category: .restaurants, image: "re7", title: "Botanist", address: "1038 Canada Place, Vancouver, BC V6C 0B9", rating: 4.9),
    Place(category: .restaurants, image: "re8", title: "The Acorn", address: "3995 Main St, Vancouver, BC V5V 3P3", rating: 4.9),
    Place(category: .restaurants, image: "re9", title: "Maenam", address: "1938 W 4th Ave, Vancouver, BC V6J 1M5", rating: 4.9),
    Place(category: .restaurants, image: "re10", title: "AnnaLena", address: "1809 W 1st Ave, Vancouver, BC V6J 5B8", rating: 4.9),

   
    Place(category: .attractions, image: "at1", title: "Stanley Park", address: "Vancouver, BC", rating: 4.9),
    Place(category: .attractions, image: "at2", title: "Capilano Suspension Bridge Park", address: "3735 Capilano Rd, BC V7R 4J1", rating: 4.9),
    Place(category: .attractions, image: "at3", title: "Grouse Mountain", address: "6400 Nancy Greene Way, North Vancouver, BC V7R 4K9", rating: 4.9),
    Place(category: .attractions, image: "at4", title: "Granville Island", address: "1669 Johnston St, Vancouver, BC V6H 3R9", rating: 4.9),
    Place(category: .attractions, image: "at5", title: "Vancouver Aquarium", address: "845 Avison Way, Vancouver, BC V6G 3E2", rating: 4.9),
    Place(category: .attractions, image: "at6", title: "Vancouver Art Gallery", address: "750 Hornby St, Vancouver, BC V6Z 2H7", rating: 4.9),
    Place(category: .attractions, image: "at7", title: "Museum of Anthropology", address: "6393 NW Marine Dr, Vancouver, BC V6T 1Z2", rating: 4.9),
    Place(category: .attractions, image: "at8", title: "Science World", address: "1455 Quebec St, Vancouver, BC V6A 3Z7", rating: 4.9),
    Place(category: .attractions, image: "at9", title: "Queen Elizabeth Park", address: "4600 Cambie St, Vancouver, BC V5Z 2Z1", rating: 4.9),
    Place(category: .attractions, image: "at10", title: "Vancouver Lookout", address: "555 W Hastings St, Vancouver, BC V6B 4N6", rating: 4.9)
]

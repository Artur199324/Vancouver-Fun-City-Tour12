import Foundation
struct PlaceDetails: Identifiable {
    let id = UUID()
    let type: String
    let image: String
    let title: String
    let address: String
    let rating: Double
    let price: String
    let season: String
    let description: String
}

let placeDetailsArray: [PlaceDetails] = [
    PlaceDetails(
        type: "Hotel",
        image: "ht1",
        title: "Fairmont Hotel Vancouver",
        address: "900 W Georgia Street, Vancouver, BC V6C 2W6",
        rating: 4.9,
        price: "Approximately $300 per night",
        season: "May — Sep or Oct",
        description: """
    Fairmont Hotel Vancouver, known as the 'Castle in the City,' is an iconic luxury hotel located in the heart of downtown Vancouver. It features elegant accommodations, a spa, and world-class dining, offering timeless charm and sophisticated amenities.

    The Notch8 Restaurant & Bar offers diverse menus for breakfast, lunch, and dinner, featuring signature cocktails and classic dishes.

    Guests enjoy convenient access to top attractions, shopping, and cultural experiences, including the Vancouver Art Gallery and Robson Street.

    The dedicated concierge team is available to assist with personalized itineraries, ensuring a memorable stay for travelers.
    """
    ),
    PlaceDetails(
        type: "Hotel",
        image: "ht2",
        title: "The Westin Bayshore",
        address: "1601 Bayshore Drive, Vancouver, BC V6G 2V4",
        rating: 4.9,
        price: "Approximately $250 per night",
        season: "Jun — Aug",
        description: """
    The Westin Bayshore offers a serene waterfront escape in downtown Vancouver. With stunning views, easy access to Stanley Park, and excellent dining, this hotel is perfect for relaxation and adventure.

    The onsite H2 Rotisserie & Bar serves fresh, locally inspired cuisine, while the signature Westin Heavenly Spa provides guests with rejuvenating treatments.

    The Westin Bayshore is pet-friendly, ensuring a comfortable stay for guests traveling with their furry friends. The hotel also features a fitness studio and outdoor pool for leisure and recreation.
    """
    ),
    PlaceDetails(
        type: "Hotel",
        image: "ht3",
        title: "Pan Pacific Vancouver Hotel",
        address: "999 Canada Place, Vancouver, BC V6C 3B5",
        rating: 4.9,
        price: "Approximately $400 per night",
        season: "May — Aug",
        description: """
    Pan Pacific Vancouver Hotel is a luxury waterfront hotel located atop Canada Place. Guests enjoy breathtaking harbor views, refined accommodations, and exceptional dining experiences.

    The hotel's central location offers easy access to top attractions like Stanley Park, Gastown, and the Vancouver Convention Centre.

    Guests can relax in the rooftop outdoor heated pool, savor gourmet meals at the Ocean's 999 restaurant, or enjoy a cocktail at the Coal Harbour Bar.
    """
    ),
    PlaceDetails(
        type: "Hotel",
        image: "ht4",
        title: "The St. Regis Hotel",
        address: "602 Dunsmuir Street, Vancouver, BC V6B 1Y6",
        rating: 4.9,
        price: "Approximately $290 per night",
        season: "Jun — Oct",
        description: """
    The St. Regis Hotel is a boutique property offering personalized service and elegant accommodations in downtown Vancouver. Each room includes complimentary breakfast, Wi-Fi, and a $20 business center credit.

    Guests can enjoy dining at Gotham Steakhouse, which offers premium steaks, cocktails, and a relaxing atmosphere.

    The hotel's convenient location provides easy access to shopping, dining, and cultural attractions such as the Orpheum Theatre and Pacific Centre.
    """
    ),
    PlaceDetails(
        type: "Hotel",
        image: "ht5",
        title: "Rosewood Hotel Georgia",
        address: "801 W Georgia St, Vancouver, BC V6C 1P7",
        rating: 4.9,
        price: "Approximately $429 per night",
        season: "May — Aug",
        description: """
    Rosewood Hotel Georgia, originally opened in 1927, offers timeless elegance and exceptional service. Guests can enjoy luxurious accommodations, the Sense Spa, and fine dining at Hawksworth Restaurant.

    The hotel's rooftop bar, Reflections, provides a chic outdoor space for cocktails and small plates, surrounded by lush greenery.

    This landmark property is an ideal base for exploring Vancouver's attractions, including the Vancouver Art Gallery and Granville Street.
    """
    ),
    PlaceDetails(
        type: "Hotel",
        image: "ht6",
        title: "Shangri-La Hotel Vancouver",
        address: "1128 W Georgia St, Vancouver, BC V6E 0A8",
        rating: 4.9,
        price: "Approximately $300 per night",
        season: "May — Aug",
        description: """
    Shangri-La Hotel Vancouver is a luxurious urban sanctuary offering sophisticated accommodations, an outdoor pool, and a world-class spa.

    The onsite CHI, The Spa at Shangri-La, offers a range of holistic treatments, while Market by Jean-Georges serves gourmet cuisine inspired by fresh, local ingredients.

    The hotel is conveniently located near Robson Street and Coal Harbour, offering easy access to shopping, dining, and scenic waterfront views.
    """
    ),
    PlaceDetails(
        type: "Hotel",
        image: "ht7",
        title: "Loden Hotel",
        address: "1177 Melville St, Vancouver, BC V6E 0A3",
        rating: 4.9,
        price: "Approximately $300 per night",
        season: "May — Jun",
        description: """
    Loden Hotel is a boutique property offering contemporary accommodations and personalized service. The hotel's stylish decor and tranquil atmosphere make it a top choice for discerning travelers.

    Guests can dine at Tableau Bar Bistro, which serves classic French dishes in a cozy setting.

    The hotel also offers a 24-hour fitness studio, complimentary cruiser bikes for exploring the city, and easy access to Coal Harbour and Stanley Park.
    """
    ),
    PlaceDetails(
        type: "Hotel",
        image: "ht8",
        title: "Hyatt Regency Vancouver",
        address: "655 Burrard Street, Vancouver, BC V6C 2R7",
        rating: 4.9,
        price: "Approximately $200 per night",
        season: "May — Sep",
        description: """
    Hyatt Regency Vancouver is a contemporary hotel located in the heart of downtown Vancouver. The spacious rooms offer modern amenities and stunning city views.

    The hotel's central location provides easy access to attractions like Canada Place, Robson Street, and Stanley Park.

    Guests can enjoy a relaxing swim in the outdoor heated pool or a cocktail at the Mosaic Grille & Bar.
    """
    ),
    PlaceDetails(
        type: "Hotel",
        image: "ht9",
        title: "Fairmont Pacific Rim",
        address: "1038 Canada Place, Vancouver, BC V6C 0B9",
        rating: 4.9,
        price: "Approximately $600 per night",
        season: "Jun — Aug",
        description: """
    Fairmont Pacific Rim is a luxurious waterfront hotel offering stunning harbor views, modern design, and world-class amenities.

    The hotel's rooftop pool provides a relaxing retreat, while the Botanist restaurant serves locally inspired dishes in a sophisticated setting.

    Complementary bikes are available throughout the stay for guests to explore the scenic areas of Vancouver.
    """
    ),
    PlaceDetails(
        type: "Hotel",
        image: "ht10",
        title: "Wedgewood Hotel & Spa",
        address: "845 Hornby Street, Vancouver, BC V6Z 1V1",
        rating: 4.9,
        price: "Approximately $400 per night",
        season: "May — Sep",
        description: """
    Wedgewood Hotel & Spa is a boutique luxury hotel offering European-inspired elegance in the heart of Vancouver.

    Guests can dine at the on-site Bacchus Restaurant & Lounge, known for its exquisite French cuisine and elegant atmosphere.

    The hotel also features a tranquil spa, offering a range of treatments and therapies, perfect for unwinding after a day of exploring the city.
    """
    ),
    PlaceDetails(
        type: "Restaurant",
        image: "re1",
        title: "Hawksworth Restaurant",
        address: "801 W Georgia St, Vancouver, BC V6C 1P7",
        rating: 4.9,
        price: "$120",
        season: "Year-round",
        description: """
    Hawksworth Restaurant is a sophisticated venue offering a modern Canadian menu in a stylish, art-filled space. Located in the heart of downtown Vancouver, this restaurant is perfect for both casual dining and special occasions.

    The menu features locally sourced ingredients, fresh seafood, and a curated wine list to complement the flavors.

    Known for exceptional service and a vibrant atmosphere, Hawksworth offers a unique fine dining experience for all guests.
    """
    ),
    PlaceDetails(
        type: "Restaurant",
        image: "re2",
        title: "Miku Vancouver",
        address: "200 Granville St #70, Vancouver, BC V6C 1S4",
        rating: 4.9,
        price: "$140",
        season: "Year-round",
        description: """
    Miku Vancouver is renowned for its Aburi-style sushi and innovative Japanese cuisine. Overlooking the beautiful waterfront, Miku provides a stunning dining experience.

    Signature dishes include flame-seared sushi, fresh sashimi, and exquisite desserts, all presented with artistic flair.

    The elegant interior and picturesque views make it a top choice for food enthusiasts and special occasions.
    """
    ),
    PlaceDetails(
        type: "Restaurant",
        image: "re3",
        title: "L’Abattoir",
        address: "217 Carrall St, Vancouver, BC V6B 2J2",
        rating: 4.9,
        price: "$90",
        season: "Year-round",
        description: """
    L’Abattoir is a chic restaurant located in Vancouver’s historic Gastown district. Combining French-inspired cuisine with a West Coast twist, the menu features fresh, locally sourced ingredients.

    Guests can enjoy a vibrant atmosphere, creative cocktails, and a carefully curated wine selection.

    The warm, industrial-chic decor creates an inviting space for romantic dinners, gatherings, and celebrations.
    """
    ),
    PlaceDetails(
        type: "Restaurant",
        image: "re4",
        title: "Blue Water Cafe",
        address: "1095 Hamilton St, Vancouver, BC V6B 5T4",
        rating: 4.9,
        price: "$150",
        season: "Year-round",
        description: """
    Blue Water Cafe is Vancouver’s premier seafood restaurant, located in the heart of Yaletown. Known for its fresh, sustainable seafood and award-winning service, it offers an unforgettable dining experience.

    The menu includes an extensive selection of oysters, sushi, and signature seafood dishes, paired with a world-class wine list.

    The elegant interior and outdoor patio make Blue Water Cafe a perfect spot for both casual and formal dining.
    """
    ),
    PlaceDetails(
        type: "Restaurant",
        image: "re5",
        title: "St. Lawrence",
        address: "269 Powell St, Vancouver, BC V6A 1G3",
        rating: 4.9,
        price: "$85",
        season: "Year-round",
        description: """
    St. Lawrence is a cozy French-Canadian bistro that combines Quebecois flavors with traditional French techniques. The intimate setting and rustic charm create a warm and inviting atmosphere.

    The menu features hearty dishes like tourtière, foie gras, and homemade pâtés, all made with locally sourced ingredients.

    St. Lawrence has received numerous awards for its exceptional cuisine and service, making it a must-visit in Vancouver.
    """
    ),
    PlaceDetails(
        type: "Restaurant",
        image: "re6",
        title: "Ancora Waterfront Dining & Patio",
        address: "1600 Howe St #2, Vancouver, BC V6Z 2L9",
        rating: 4.9,
        price: "$130",
        season: "Year-round",
        description: """
    Ancora Waterfront Dining & Patio blends Japanese and Peruvian flavors to create a unique culinary experience. Situated along False Creek, the restaurant offers stunning waterfront views.

    Guests can enjoy dishes like ceviche, sushi, and grilled seafood, paired with innovative cocktails and an extensive wine list.

    The modern decor and open patio make Ancora a favorite for both casual dining and special occasions.
    """
    ),
    PlaceDetails(
        type: "Restaurant",
        image: "re7",
        title: "Botanist",
        address: "1038 Canada Place, Vancouver, BC V6C 0B9",
        rating: 4.9,
        price: "$140",
        season: "Year-round",
        description: """
    Botanist is a fine dining restaurant located in the Fairmont Pacific Rim hotel. The menu highlights locally sourced ingredients, with an emphasis on seasonal produce and sustainable seafood.

    Signature dishes include handcrafted pasta, fresh seafood, and decadent desserts, complemented by expertly crafted cocktails.

    The lush greenery and contemporary design create a sophisticated and relaxing dining atmosphere.
    """
    ),
    PlaceDetails(
        type: "Restaurant",
        image: "re8",
        title: "The Acorn",
        address: "3995 Main St, Vancouver, BC V5V 3P3",
        rating: 4.9,
        price: "$100",
        season: "Year-round",
        description: """
    The Acorn is a vegetarian restaurant that offers innovative, plant-based dishes made from locally sourced ingredients. The creative menu appeals to both vegetarians and non-vegetarians alike.

    The cozy interior, artistic presentation, and flavorful dishes make it a standout dining destination.

    The Acorn is committed to sustainability and uses organic produce whenever possible.
    """
    ),
    PlaceDetails(
        type: "Restaurant",
        image: "re9",
        title: "Maenam",
        address: "1938 W 4th Ave, Vancouver, BC V6J 1M5",
        rating: 4.9,
        price: "$70",
        season: "Year-round",
        description: """
    Maenam is a contemporary Thai restaurant offering bold flavors and modern interpretations of traditional dishes. The menu features curries, noodles, and fresh seafood prepared with authentic Thai spices.

    Guests can enjoy a relaxed dining experience in a modern and stylish setting.
    """
    ),
    PlaceDetails(
        type: "Restaurant",
        image: "re10",
        title: "AnnaLena",
        address: "1809 W 1st Ave, Vancouver, BC V6J 5B8",
        rating: 4.9,
        price: "$120",
        season: "Year-round",
        description: """
    AnnaLena is a contemporary Canadian restaurant combining imaginative dishes with an artful, modern ambiance. The menu focuses on seasonal, locally sourced ingredients, creating a unique dining experience.

    Known for its innovative approach and friendly service, AnnaLena is a must-visit for food enthusiasts.
    """
    ),
    PlaceDetails(
           type: "Attraction",
           image: "at1",
           title: "Stanley Park",
           address: "Vancouver, BC",
           rating: 4.9,
           price: "Free",
           season: "Year-round",
           description: """
   Stanley Park is Vancouver's most iconic green space, offering stunning views of mountains, forests, and the Pacific Ocean. The park is home to a variety of wildlife, walking trails, and cultural landmarks.

   The Seawall, a paved path encircling the park, is perfect for cycling, jogging, and walking while enjoying breathtaking scenery.

   Highlights include the Vancouver Aquarium, Totem Poles, and the Rose Garden, which blooms beautifully in spring.

   Horse-drawn carriage tours provide a unique way to explore the park and learn about its history.
   """
       ),
       PlaceDetails(
           type: "Attraction",
           image: "at2",
           title: "Capilano Suspension Bridge Park",
           address: "3735 Capilano Rd, BC V7R 4J1",
           rating: 4.9,
           price: "$62",
           season: "May — Nov",
           description: """
   Capilano Suspension Bridge Park is a thrilling experience for visitors seeking adventure and natural beauty. The 137-meter-long suspension bridge spans a lush forested canyon.

   The Treetops Adventure offers a series of smaller suspension bridges, providing unique views of the forest canopy.

   The Cliffwalk, a glass-bottom walkway, is a must-see attraction that hugs the side of the granite cliff.

   Seasonal events, such as Canyon Lights, transform the park into a magical winter wonderland.
   """
       ),
       PlaceDetails(
           type: "Attraction",
           image: "at3",
           title: "Grouse Mountain",
           address: "6400 Nancy Greene Way, North Vancouver, BC V7R 4K9",
           rating: 4.9,
           price: "$65 (round-trip gondola ride)",
           season: "Year-round",
           description: """
   Grouse Mountain is a year-round destination offering outdoor activities and breathtaking views of Vancouver.

   The Skyride, a gondola ride to the summit, provides panoramic vistas of the city and surrounding mountains.

   In the winter, Grouse Mountain transforms into a ski resort with slopes for all skill levels, as well as snowshoeing and ice skating.

   Summer activities include hiking, zip-lining, and the Lumberjack Show, which entertains visitors with displays of strength and skill.
   """
       ),
       PlaceDetails(
           type: "Attraction",
           image: "at4",
           title: "Granville Island",
           address: "1669 Johnston St, Vancouver, BC V6H 3R9",
           rating: 4.9,
           price: "Free",
           season: "Year-round",
           description: """
   Granville Island is a popular cultural district with unique shops, art studios, and a bustling public market.

   Visitors can enjoy fresh seafood, artisan cheeses, and locally crafted goods at the market, which is a food lover's paradise.

   The island also hosts live performances, art galleries, and scenic waterfront views.

   Take a walk along the marina or hop on a ferry for a unique perspective of Vancouver's skyline.
   """
       ),
       PlaceDetails(
           type: "Attraction",
           image: "at5",
           title: "Vancouver Aquarium",
           address: "845 Avison Way, Vancouver, BC V6G 3E2",
           rating: 4.9,
           price: "$42",
           season: "Monday — Friday",
           description: """
   The Vancouver Aquarium is one of the largest aquariums in Canada and is located in Stanley Park.

   The aquarium exhibits include dolphins, sea otters, and tropical fish, with interactive displays and educational programs.

   The venue also offers behind-the-scenes tours, allowing visitors to learn about marine conservation efforts.

   It's a perfect destination for families and anyone interested in marine life.
   """
       ),
       PlaceDetails(
           type: "Attraction",
           image: "at6",
           title: "Vancouver Art Gallery",
           address: "750 Hornby St, Vancouver, BC V6Z 2H7",
           rating: 4.9,
           price: "$24",
           season: "Year-round",
           description: """
   The Vancouver Art Gallery is one of the largest art museums in Canada, featuring over 12,000 works of art.

   The gallery showcases both historical and contemporary art, with a focus on works by Indigenous artists and local talent.

   Visitors can enjoy rotating exhibitions, guided tours, and special events.

   The on-site café and gift shop offer a relaxing break during your visit.
   """
       ),
       PlaceDetails(
           type: "Attraction",
           image: "at7",
           title: "Museum of Anthropology",
           address: "6393 NW Marine Dr, Vancouver, BC V6T 1Z2",
           rating: 4.9,
           price: "$18",
           season: "Tuesday — Sunday",
           description: """
   The Museum of Anthropology (MOA) is located at the University of British Columbia and showcases an extensive collection of Indigenous artifacts and art.

   Highlights include the impressive totem poles, carvings, and historical items from Indigenous cultures of the Pacific Northwest.

   The museum also hosts educational programs, guided tours, and temporary exhibitions.

   Visitors can explore the outdoor exhibits and enjoy stunning views of the ocean and mountains.
   """
       ),
       PlaceDetails(
           type: "Attraction",
           image: "at8",
           title: "Science World",
           address: "1455 Quebec St, Vancouver, BC V6A 3Z7",
           rating: 4.9,
           price: "$25",
           season: "Year-round",
           description: """
   Science World is an interactive science museum that features hands-on exhibits, live demonstrations, and educational films.

   The museum's iconic geodesic dome houses galleries on physics, biology, and sustainability.

   Visitors of all ages can enjoy activities like building structures, exploring illusions, and watching live science shows.

   The Omnimax Theatre screens stunning nature and science documentaries on a massive dome screen.
   """
       ),
       PlaceDetails(
           type: "Attraction",
           image: "at9",
           title: "Queen Elizabeth Park",
           address: "4600 Cambie St, Vancouver, BC V5Z 2Z1",
           rating: 4.9,
           price: "Free",
           season: "Year-round",
           description: """
   Queen Elizabeth Park is a beautiful 130-acre park featuring gardens, sculptures, and stunning city views.

   The Quarry Garden and Bloedel Conservatory are highlights, offering a diverse range of plants and exotic birds.

   The park is perfect for a leisurely stroll, picnic, or photography, with plenty of scenic spots to enjoy.

   Visitors can also enjoy the Seasons in the Park restaurant for fine dining with panoramic views.
   """
       ),
       PlaceDetails(
           type: "Attraction",
           image: "at10",
           title: "Vancouver Lookout",
           address: "555 W Hastings St, Vancouver, BC V6B 4N6",
           rating: 4.9,
           price: "$18",
           season: "Year-round",
           description: """
   The Vancouver Lookout is an observation deck offering panoramic views of the city, mountains, and harbor.

   The elevator ride takes just 40 seconds to reach the top, where visitors can enjoy a 360-degree view.

   Informational panels provide details about the landmarks and history of Vancouver.

   It's a great spot to begin your visit to the city or enjoy a sunset view.
   """
       )
]

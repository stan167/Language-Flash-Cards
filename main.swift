import SwiftUI

struct ContentView: View {
    
    
    @State private var currentFlag = "england_flag"
    @State private var currentPhrase = ""
    @State private var englishPhrase = ""
    @State private var spanishPhrase = ""
    @State private var hotelPhrases = [
            "Good morning, Plaza hotel, how can I help?": "Buenos días, Hotel Plaza, ¿digame?",
            "For how many nights?": "Para cuántas noches?",
            "I would like to book": "Quisiera reservar",
            "a single room": "una habitación individual",
            "two single rooms": "dos habitaciones individuales",
            "a double room": "una habitación doble",
            "For 1,2,3,4... nights": "Una, dos, tres, cuatro...noche",
            "From the 3rd of August to the 9th of August": "Del tres de agosto al nueve de agosto",
            "air conditioning": "aire acondicionado",
            "free wifi": "wifi gratis",
            "a swimming pool": "piscina",
            "parking": "aparcamiento",
            "a gym": "gimnasio",
            "a sauna": "sauna"
    ]

    
    func getPhrases(_ dictionary: [String: String]) {
        let randomPhraseKey = dictionary.keys.randomElement() ?? ""
        englishPhrase = randomPhraseKey
        spanishPhrase = dictionary[randomPhraseKey] ?? ""
    }


    var body: some View {
        VStack {
            Text("Language Flash Cards")
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding()
            
            Spacer()
            
            Button(action: {
                if currentFlag == "england_flag" {
                    currentFlag = "spanish_flag"
                    currentPhrase = spanishPhrase
                }
                else {
                    currentFlag = "england_flag"
                    currentPhrase = englishPhrase
                }
            }) {
                Image(currentFlag)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 200)
            }
            
            Spacer()
            
            Text(currentPhrase)
                .font(.title)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button(action: {
                currentFlag = "england_flag"
                getPhrases(hotelPhrases)
                if currentFlag == "england_flag" {
                    currentFlag = "spanish_flag"
                    currentPhrase = spanishPhrase
                }
                else {
                    currentFlag = "england_flag"
                    currentPhrase = englishPhrase
                }
            }) {
                Text("New Card")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
     
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

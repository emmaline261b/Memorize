//
//  ContentView.swift
//  Memorize
//
//  Created by Malgorzata Lasota on 25/01/2023.
//

import SwiftUI

struct ContentView: View {
    var vehiclesEmojis = ["🚗", "✈️", "🚜", "🚂", "🚐", "🚲", "🛵", "🛳️", "🚃", "🚀", "⛵️", "🛸", "🚒", "🛻", "🛶", "🚤"]

    var animalsEmojis : [String] = ["🐶", "🐱", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🐷", "🐸", "🐵"]

    var foodEmojis : [String] = ["🍏", "🍐", "🍊", "🍋", "🍌", "🍓", "🫐", "🍒", "🍑", "🥝", "🥑", "🍍"]
    
    @State var emojis = ["🍏", "🍐", "🍊", "🍋", "🍌", "🍓", "🫐", "🍒", "🍑", "🥝", "🥑", "🍍"]
    @State var emojiCount = 12
   
    
    
    var body: some View {
        
        VStack {
            ScrollView{
                titleView()
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        cardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
                .foregroundColor(.red)
                Spacer()
                HStack{
                    themeVehicles
                    Spacer()
                    themeAnimals
                    Spacer()
                    themeFood
                }
                .font(.largeTitle)
                .padding(.horizontal)
            }
            .padding()
        }
    
    var themeVehicles : some View {
        Button {
            emojis = vehiclesEmojis.shuffled()
        } label: {
            VStack{
                Text("🚗")
                Text("vehicles")
                    .font(.title3)
                    
            }
        }
    }
    
    var themeAnimals : some View {
        Button {
            emojis = animalsEmojis.shuffled()
        } label: {
            VStack{
                Text("🐶")
                Text("animals")
                    .font(.title3)
            }
        }
    }
    
    var themeFood : some View {
        Button {
            emojis = foodEmojis.shuffled()
        } label: {
            VStack{
                Text("🍏")
                Text("food")
                    .font(.title3)
            }
        }
    }
}
        
//            var addCard : some View {
//                Button {
//                    if (emojiCount < emojis.count) {
//                        emojiCount += 1
//                    }
//                } label: {
//                    Image(systemName: "plus.circle")
//                }
//            }
//
//            var removeCard : some View {
//                Button{
//                    if (emojiCount > 1) {
//                        emojiCount -= 1
//                    }
//                } label: {
//                    Image(systemName: "minus.circle")
//                }
//            }
//
    
    
struct titleView: View {
    var body: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .foregroundColor(Color.black)
        }
    }
    
    struct cardView: View {
        @State
        var isFaceUp : Bool = true
        var content : String = ""
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20
                )
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(content)
                        .font(.largeTitle)
                } else {
                    shape.fill()
                }
            }
            .padding(1)
            .foregroundColor(.red)
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewInterfaceOrientation(.portrait)
                .previewLayout(.device)
                .preferredColorScheme(.light)
                .previewDevice("iPhone 14 Pro Max")
            
            ContentView()
                .previewLayout(.device)
                .preferredColorScheme(.light)
                .previewDevice("iPhone SE (3rd generation)")
        }
    }


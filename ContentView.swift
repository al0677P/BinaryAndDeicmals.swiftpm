import SwiftUI

struct ContentView: View {
    @State private var intnumbinary = ""
    var body: some View {
        NavigationView{
            VStack {
                
                Button (action: {
                    print( "Hello World tapped!")})
                {
                    Text ("Press me" )
                    
                }
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .font(.title)
                        .cornerRadius(40)
                
                
                TextField("Enter a number here", text: $intnumbinary)
                    .navigationTitle("Decimals to Binary")
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .offset(y:-300)
            }
            
           
                
                Button (action: {
                    print( "Hello World tapped!")})
                {Text ("Hello World" )}
                    .background(.purple)
                
                
                
            }
        }
    }


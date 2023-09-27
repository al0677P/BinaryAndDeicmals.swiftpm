//
//  decimalToHexadecimal.swift
//  BinaryAndDeicmals
//
//  Created by Glenn C. Joy on 9/22/23.
//

import SwiftUI

struct decimalToHexadecimal: View {
    @State private var decimalNumber = ""
    @State private var hexadecimalResult = ""

    var body: some View {
        VStack {
            Text("Decimal to Hexadecimal Converter")
                .font(.largeTitle)
                .padding()

            TextField("Enter Decimal Number", text: $decimalNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: convertToHexa) {
                Text("Convert")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Text("Hexadecimal Result: \(hexadecimalResult)")
                .font(.title)
                .padding()
        }
    }

    func convertToHexa() {
        if let decimalValue = Int(decimalNumber) {
            hexadecimalResult = String(format: "%X", decimalValue)
        } else {
            hexadecimalResult = "Invalid"
        }
    }
}

struct decimalToHexadecimal_Previews: PreviewProvider {
    static var previews: some View {
        decimalToHexadecimal()
    }
}

//
//  hexaToBinary.swift
//  BinaryAndDeicmals
//
//  Created by Glenn C. Joy on 9/22/23.
//


import SwiftUI

struct HexadecimalToDecimal: View {
    @State private var hexadecimalNumber = ""
    @State private var decimalResult = ""

    var body: some View {
        VStack {
            Text("Hexadecimal to Decimal Converter")
                .font(.largeTitle)
                .padding()

            TextField("Enter Hexadecimal Number", text: $hexadecimalNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: convertToDecimal) {
                Text("Convert")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Text("Decimal Result: \(decimalResult)")
                .font(.title)
                .padding()
        }
    }

    func convertToDecimal() {
        let scanner = Scanner(string: hexadecimalNumber)
        var decimalValue: UInt64 = 0
        if scanner.scanHexInt64(&decimalValue) {
            decimalResult = "\(decimalValue)"
        } else {
            decimalResult = "Invalid"
        }
    }
}

struct HexadecimalToDecimal_Previews: PreviewProvider {
    static var previews: some View {
        HexadecimalToDecimal()
    }
}



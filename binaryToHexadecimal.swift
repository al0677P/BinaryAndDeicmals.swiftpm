//
//  binaryToHexadecimal.swift
//  BinaryAndDeicmals
//
//  Created by Glenn C. Joy on 9/22/23.
//


import SwiftUI

struct BinaryToHexadecimal: View {
    @State private var binaryNumber = ""
    @State private var hexadecimalResult = ""

    var body: some View {
        VStack {
            Text("Binary to Hexadecimal Converter")
                .font(.largeTitle)
                .padding()

            TextField("Enter Binary Number", text: $binaryNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: convertToHexadecimal) {
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

    func convertToHexadecimal() {
        let binaryRegex = try! NSRegularExpression(pattern: "^[01]+$", options: [])
        let binaryRange = NSRange(location: 0, length: binaryNumber.utf16.count)

        if binaryRegex.firstMatch(in: binaryNumber, options: [], range: binaryRange) != nil {
            var binaryValue = binaryNumber
            var hexadecimalValue = ""

            // Ensure the binary string length is a multiple of 4 by adding leading zeros if necessary
            while binaryValue.count % 4 != 0 {
                binaryValue = "0" + binaryValue
            }

            let binaryToHexMap: [String: String] = [
                "0000": "0", "0001": "1", "0010": "2", "0011": "3",
                "0100": "4", "0101": "5", "0110": "6", "0111": "7",
                "1000": "8", "1001": "9", "1010": "A", "1011": "B",
                "1100": "C", "1101": "D", "1110": "E", "1111": "F"
            ]

            for i in stride(from: 0, to: binaryValue.count, by: 4) {
                let startIndex = binaryValue.index(binaryValue.startIndex, offsetBy: i)
                let endIndex = binaryValue.index(startIndex, offsetBy: 4)
                let binaryChunk = String(binaryValue[startIndex..<endIndex])
                let hexadecimalDigit = binaryToHexMap[binaryChunk]!
                hexadecimalValue += hexadecimalDigit
            }

            hexadecimalResult = hexadecimalValue
        } else {
            hexadecimalResult = "Invalid Binary Input"
        }
    }
}

struct BinaryToHexadecimal_Previews: PreviewProvider {
    static var previews: some View {
        BinaryToHexadecimal()
    }
}

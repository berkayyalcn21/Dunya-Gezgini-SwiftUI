//
//  ContentView.swift
//  DunyaGezgini
//
//  Created by Berkay on 13.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var fahrenheitValue: String = ""
    
    let numberFormatter: NumberFormatter = {
       
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func convertToCelsius() -> String {
        
        if let value = Double(fahrenheitValue) {
            let fahrenheit = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            
            let celsiusValue = fahrenheit.converted(to: .celsius)
            let formattedCelsiusValue = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
            return formattedCelsiusValue ?? "???"
            
        }else {
            return "???"
        }
    }
    
    var body: some View {
        VStack {
            TextField("CONVERSION_TEXT_FIELD_PLACEHOLDER", text: $fahrenheitValue)
                .keyboardType(.decimalPad)
                .font(Font.system(size: 64))
                .multilineTextAlignment(.center)
            Text("CONVERSION_FAHRENHEIT")
            Text("CONVERSION_IS_ACTUALLY")
                .foregroundColor(.gray)
            Text(convertToCelsius())
                .font(Font.system(size: 64))
            Text("CONVERSION_DEGREES_CELCIUS")
            Spacer()
        }
        .foregroundColor(.orange)
        .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

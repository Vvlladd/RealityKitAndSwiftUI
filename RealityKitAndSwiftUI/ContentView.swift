//
//  ContentView.swift
//  RealityKitAndSwiftUI
//
//  Created by Vlad Toma on 18.01.2022.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @EnvironmentObject var data : DataModel
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass
    var body: some View {
        
        if hSizeClass == .compact && vSizeClass == .regular { // these defines a Vertical orientation
        VStack {
            if data.enabled {
                ArDisplayView()
            }else{Spacer()}
        VStack {
            Toggle(isOn: $data.enabled) {
                Text("AR")
            }
            Stepper("X: \(data.xTranslation)", value: $data.xTranslation, in: -100...100)
            Stepper("Y: \(data.yTranslation)", value: $data.yTranslation, in: -100...100)
            Stepper("Z: \(data.zTranslation)", value: $data.zTranslation, in: -100...100)
            
        }.frame(height :200)
                .padding(.all)

        }
        }else {
            HStack {
                if data.enabled {
                    ArDisplayView()
                }else{
                    Spacer()
                }
            VStack {
                Toggle(isOn: $data.enabled) {
                    Text("AR")
                }
                Stepper("X: \(data.xTranslation)", value: $data.xTranslation, in: -100...100)
                Stepper("Y: \(data.yTranslation)", value: $data.yTranslation, in: -100...100)
                Stepper("Z: \(data.zTranslation)", value: $data.zTranslation, in: -100...100)
                
            }.frame(width:200)
                    .padding(.all)

            }
        }
    }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif



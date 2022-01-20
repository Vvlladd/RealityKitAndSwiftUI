//
//  ArDisplayView.swift
//  RealityKitAndSwiftUI
//
//  Created by Vlad Toma on 18.01.2022.
//

import SwiftUI
import RealityKit

struct ArDisplayView: View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}


struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        return DataModel.shared.arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ArDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ArDisplayView()
    }
}

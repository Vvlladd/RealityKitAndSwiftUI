//
//  DataModel.swift
//  RealityKitAndSwiftUI
//
//  Created by Vlad Toma on 18.01.2022.
//


import Combine
import RealityKit


final class DataModel : ObservableObject {
    
    // To prevent creating more instance of DataModel with their own properties. The class is a final one and the static shared will be the only instance that can be created
    static var shared = DataModel ()
    
    
    @Published var arView : ARView!
    @Published var enabled : Bool = false
    //x,y,z translation are stored in centimetres
    @Published var xTranslation : Float = 0 {
        didSet {translateObject()}
    }
    @Published var yTranslation : Float = 0 {
        didSet{translateObject()}
    }
    @Published var zTranslation : Float = 0 {
        didSet{translateObject()}
    }
    
    init () {
        arView = ARView(frame: .zero)
        //Add the scene from Experience Reality Composer file
        let boxAnchor = try! Experience.loadBall()
        //Add the anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
    }
    
    func translateObject() {
        //Try to find object Entity
        if let object = (arView.scene.anchors[0] as? Experience.Ball)?.rubberBall{
            //Transform floats in metres
            let xTrasnlationM = xTranslation / 100
            let yTranslationM = yTranslation / 100
            let zTranslationM = zTranslation / 100
            //Transform to a vector of float values
            let translation = SIMD3<Float>(xTrasnlationM,yTranslationM,zTranslationM)
            //Translate the object by this amount
            object.transform.translation = translation
        }
        
    }
    

    
}

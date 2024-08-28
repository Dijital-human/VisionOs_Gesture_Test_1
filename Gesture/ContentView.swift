//
//  ContentView.swift
//  Gesture
//
//  Created by Famil Mustafayev on 13.08.24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var daireninKonumu = CGPoint(x: 55, y: 55)
    @State private var lblDaire:String = "55.55"
    @GestureState private var suruklenir = false
    @State private var degerDurdu = true
    @State var test: String = "Test"
    var body: some View {
        VStack {
            Text("Drag Gesture Test - 1 | - \(test) - |")
                .modifier(ModifierText())
                .modifier(ModifierDragGesture(daireninKonumu: daireninKonumu, lblDaire: lblDaire, suruklenir: suruklenir))
            
            Text("Daire" + (suruklenir ? "Suruklenir \(Int(daireninKonumu.x))" : "Suruklenmir"))
                .foregroundStyle(suruklenir ? .red : .white.opacity(0.5))
                .modifier(ModifierText())
                .modifier(ModifierDragGesture())
            Circle().fill(suruklenir ? .red.opacity(0.3) : .blue)
                .padding()
                .frame(width: 250, height: 250)
                .overlay {
                    Text("\(lblDaire)").modifier(ModifierText()).multilineTextAlignment(.center)
                }
                .position(daireninKonumu)
                .gesture(DragGesture().onChanged({ deyer in
                    daireninKonumu = deyer.location
                    lblDaire = "\(Int(deyer.location.x)). \(Int(deyer.location.y))"
                    test = "\(Int(deyer.location.x))"
                }).updating($suruklenir, body: { deyer, durum, yapilanIsler in
                    durum = true
                    
                }).onEnded({ deger in
                    degerDurdu = deger.location.x > 200 || deger.location.y > 200 ? false : true
                })
                )
        }.background(degerDurdu ? .clear : .purple)
        .padding()
    }
        
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

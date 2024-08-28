//
//  ModifierText.swift
//  Gesture
//
//  Created by Famil Mustafayev on 13.08.24.
//

import Foundation
import SwiftUI

struct ModifierText: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.extraLargeTitle)
    }
}
struct ModifierDragGesture: ViewModifier{
    @State var daireninKonumu = CGPoint(x: 0, y: 0)
    @State var lblDaire:String = "55.55"
    @GestureState var suruklenir = false

    func body(content: Content) -> some View {
        content
            .position(daireninKonumu)
            .gesture(DragGesture().onChanged({ deyer in
                daireninKonumu = deyer.location
                lblDaire = "\(Int(deyer.location.x)). \(Int(deyer.location.y))"
            }).updating($suruklenir, body: { deyer, durum, yapilanIsler in
                durum = true
            })
            )
    }
}

//
//  SliderUIView.swift
//  GuessNumberApp
//
//  Created by Светлана Романенко on 06.04.2021.
//

import SwiftUI

struct SliderUIView: UIViewRepresentable {
    @Binding var sliderValue: Double
    @Binding var alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(red: 100, green: 0, blue: 0, alpha: CGFloat(alpha))
        uiView.value = Float(sliderValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue, alpha: $alpha)
    }
}

extension SliderUIView {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        @Binding var alpha: CGFloat
        
        init(sliderValue: Binding<Double>, alpha: Binding<CGFloat>) {
            self._sliderValue = sliderValue
            self._alpha = alpha
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            sliderValue = Double(sender.value)
            alpha = sender.alpha
        }
    }
}

struct SliderUIView_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIView(sliderValue: .constant(50), alpha: .constant(0.5))
    }
}

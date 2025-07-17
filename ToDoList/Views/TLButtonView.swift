//
//  TLButtonView.swift
//  ToDoList
//
//  Created by Anmol Mangat on 10/06/25.
//

import SwiftUI

struct TLButtonView: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
    
    struct TLButtonView_Previews: PreviewProvider {
        static var previews: some View {
            TLButtonView(title: "Value", backgroundColor: .pink){
                //action
            }
        }
    }
    
}

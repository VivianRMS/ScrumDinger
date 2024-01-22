//
//  ThemeView.swift
//  ScrumDinger
//
//  Created by Kunlin Ruan on 11/14/23.
//
 import SwiftUI

struct ThemeView : View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .foregroundColor(theme.accentColor)
    }
}

struct ThemeView_Preview : PreviewProvider{
    static var previews: some View{
        ThemeView(theme: .buttercup)
    }
}

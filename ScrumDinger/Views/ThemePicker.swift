//
//  ThemePicker.swift
//  ScrumDinger
//
//  Created by Kunlin Ruan on 11/14/23.
//

import SwiftUI

struct ThemePicker : View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection){
            ForEach(Theme.allCases){ theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Preview : PreviewProvider{
    static var previews: some View{
        ThemePicker(selection: .constant(.periwinkle))
    }
}

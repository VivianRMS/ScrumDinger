//
//  ErrorView.swift
//  ScrumDinger
//
//  Created by Kunlin Ruan on 11/15/23.
//

import SwiftUI

struct ErrorView : View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16.0)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Dismiss"){
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ErrorView_Preview : PreviewProvider{
    enum SampleError: Error{
        case errorRequired
    }
    
    static var errorWrapper: ErrorWrapper{
        ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error.")
    }
    
    static var previews: some View{
        ErrorView(errorWrapper: errorWrapper)
    }
}

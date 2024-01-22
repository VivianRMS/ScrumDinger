//
//  MeetingFooterView.swift
//  ScrumDinger
//
//  Created by Kunlin Ruan on 11/15/23.
//

import SwiftUI

struct MeetingFooterView : View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    private var speakerNum: Int? {
        guard let index = speakers.firstIndex(where: {!$0.isCompleted}) else {return nil}
        return index+1
    }
    
    private var isLastSpeaker: Bool{
        return speakers.dropLast().allSatisfy({$0.isCompleted})
    }
    
    private var speakerText: String{
        guard let speakerNum = speakerNum else {return "No more messages."}
        return "Speaker \(speakerNum) of \(speakers.count)"
    }
    
    var body: some View {
        VStack{
            HStack{
                if isLastSpeaker{
                    Text("Last Speaker")
                }else{
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction){
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Preview : PreviewProvider{
    static var previews: some View{
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}

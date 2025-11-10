//
//  MessageBubble.swift
//  iMessageStyleMessagingUI
//
//  Created by Athul Kurian on 25/10/24.
//

import SwiftUI

struct MessageBubble: View {
    @Environment(\.colorScheme) var colorScheme
  
    var isUserMessage: Bool
    var content: contentType
    var dateTime: (date: String, time: String)
    
    var geometry: GeometryProxy
    
    var body: some View {
        VStack{
            HStack {
                if isUserMessage {
                    Spacer()
                }
                createMessageDisplay(from: content)
                if !isUserMessage {
                    Spacer()
                }
            }
            timeDisplay
        }
    }
    
    private var timeDisplay: some View {
        HStack{
            if isUserMessage {
                Spacer()
            }
            Text(dateTime.time)
                .font(.caption2)
                .bold()
                .foregroundStyle(.secondary)
            if !isUserMessage {
                Spacer()
            }
        }
    }
    
    private var bubbleColor: Color {
        if isUserMessage {
            return .outgoingMessage
        } else {
            return colorScheme == .light ? .incomingMessageLight: .incomingMessageDark
        }
    }
    
    @ViewBuilder
    private func createMessageDisplay(from content: contentType) -> some View {
        switch(content) {
        case .text(let text):
            createTextMessageDisplay(from: text)
        case .image(let imageFileName):
            createImageMessageDisplay(from : imageFileName)
        }
    }
    
    private func createTextMessageDisplay(from text: String) -> some View {
        Text(text)
            .padding(.horizontal)
            .padding(.vertical, geometry.size.height * .textVerticalPaddingScalingFactor)
            .font(.body)
            .foregroundColor(isUserMessage ? .white : .primary)
            .background(bubbleColor)
            .cornerRadius(.imageCornerRadius)
            .frame(maxWidth: geometry.size.width * .textBubbleMaxWidthScalingFactor, alignment: isUserMessage ? .trailing : .leading)
            .padding(isUserMessage ? .trailing : .leading, geometry.size.width * .messagePaddingScalingFactor)
            .background(alignment: isUserMessage ? .bottomTrailing :.bottomLeading) {
                Image(isUserMessage ? "outgoingTail" : "incomingTail")
                    .renderingMode(.template)
                    .foregroundStyle(bubbleColor)
            }
    }
    
    private func createImageMessageDisplay(from imageFileName: String) -> some View {
        Image(imageFileName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: geometry.size.width * .imageFrameWidthScalingFactor, alignment: isUserMessage ? .trailing : .leading)
            .clipShape(RoundedRectangle(cornerRadius: .textBubbleCornerRadius))
            .padding(isUserMessage ? .trailing : .leading, geometry.size.width * .messagePaddingScalingFactor)
    }
}

#Preview {
    GeometryReader { geometry in
        ScrollView {
            VStack(alignment: .trailing) {
                MessageBubble(
                    isUserMessage: true,
                    content: .text("Hello, how are you today?"),
                    dateTime: ("", "10:10 AM"),
                    geometry: geometry
                ).border(.red)
                
                MessageBubble(
                    isUserMessage: false,
                    content: .text("I'm fine, thanks for asking."),
                    dateTime: ("", "10:10 AM"),
                    geometry: geometry
                ).border(.red)
                
                MessageBubble(
                    isUserMessage: true,
                    content: .image("1:1"),
                    dateTime: ("", "10:10 AM"),
                    geometry: geometry
                ).border(.red)
            }
        }
        .padding()
    }
}



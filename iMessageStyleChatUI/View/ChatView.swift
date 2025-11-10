//
//  ContentView.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 22/10/24.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatViewModel: ChatViewModel
    @State var scrollTrigger: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                VStack {
                    ScrollView {
                        ScrollViewReader { proxy in
                            LazyVStack {
                                Spacer(minLength: geometry.size.height * .chatViewTopSpacing)
                                let messages = chatViewModel.allMessages
                                ForEach(0..<messages.count, id: \.self) { index in
                                   let message = messages[index]

                                    if index == 0 || message.dateTime.date != messages[index - 1].dateTime.date {
                                        Text(message.dateTime.date)
                                            .foregroundStyle(.secondary)
                                            .font(.footnote)
                                            .padding(.vertical)
                                    }
                                    
                                    MessageBubble(
                                        isUserMessage: message.isUserMessage,
                                        content: message.content,
                                        dateTime: message.dateTime,
                                        geometry: geometry,
                                    )
                                    .id(index + 1)
                                }
                                .onChange(of: messages.count) { value in
                                    withAnimation {
                                        proxy.scrollTo(value, anchor: .bottom)
                                    }
                                }
                            }.padding(.horizontal)
                        }
                    }
                    MessageField(chatViewModel: chatViewModel, geometry: geometry)
                }
                ChatHeader(contactName: "John Doe")
            }
        }
    }
}

#Preview {
    let chatPreview = ChatViewModel()
    chatPreview.sendMessage(content: .text("Hey, How are you?"), timestamp: Date())
    return ChatView(chatViewModel: chatPreview)
}


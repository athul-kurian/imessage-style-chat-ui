//
//  Extensions.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 28/10/24.
//

import SwiftUI

extension Color {
    static let incomingMessageDark = Color(red: 38/255, green: 38/255, blue: 41/255)
    static let incomingMessageLight = Color(red: 233/255, green: 233/255, blue: 234/255)
    static let outgoingMessage = Color(.systemBlue)
}

extension CGFloat {
    //Chat View
    static let chatViewTopSpacing = 0.09
    
    
    //Message Bubble
    static let textBubbleCornerRadius: CGFloat = 25
    static let imageCornerRadius: CGFloat = 20
    static let messagePaddingScalingFactor: CGFloat = 0.0125
    static let textVerticalPaddingScalingFactor: CGFloat = 0.01
    static let imageFrameWidthScalingFactor: CGFloat = 0.65
    static let textBubbleMaxWidthScalingFactor: CGFloat = 0.72
    
    //Message Field
    static let messageFieldCornerRadius: CGFloat = 20
    static let messageFieldBottomPaddingScalingFactor: CGFloat = 0.01
    static let messageFieldHorizontalPaddingScalingFactor: CGFloat = 0.04
    static let messageFieldInnerPaddingScalingFactor: CGFloat = 0.003
    static let textFieldBottomPaddingScalingFactor: CGFloat = 0.006
    static let plusButtonPaddingScalingFactor: CGFloat = 0.025
}

extension Double {
    //Message Field
    static let messageFieldPlusButtonOpacity = 0.25
}

//
//  Story.swift
//  Below
//
//  Created by Emily Nguyen on 4/19/17.
//  Copyright © 2017 Emily Nguyen. All rights reserved.
//

import Foundation
import UIKit

enum Story {
    case start
    case hello
    case cont
    case ignore
    case here(name: String)
    case who
    case whatHappened
    case whatsHappened
    case aLName
    case sName
    case airLock
    case samples
    case sub
    case trench
    case illegal(name: String)
    case condition
    case move
    case breathing
    case panicked
    case basics
    case later
    case cont1
    case cont2
    case stole
    case backToCap
    case capOrDoc
    case getOut
    case keepInSuit
    case incision
    case careful
    case look
    case smell
    case getOff
    case distance
    case luck
    case medical
    case cont3
    case anti
    case bottles
    case directions
    case inject
    case cont4
    case minute
    case yeahRight
    case cont5(name: String)
    case somethingElse
    case killed(name: String)
}

extension Story {
    
    var artwork: UIImage {
         return #imageLiteral(resourceName: "TextBG")
    }
    
    var text: String {
        switch self {
            case .start:
                return "You're alone, manning your ship on a voyage through the Philippine Sea when you hear your radio:"
            case .hello:
                return "Hello? krckk-"
            case .cont:
                return "Hello? Can anyone hear me?"
            case .ignore:
                return "Please... Anyone."
            case .here(let name):
                return "Oh my god. Yes! \(name). Thank god."
            case .who:
                return "This is Jesse Harper. I'm a bioengineer currently training under Doctor Sloan Lee. But she's not doing very well. I'm not sure what's wrong with her."
            case .whatHappened:
                return "She- she's unconcious. She went out for samples, and it was only supposed to be 45 minutes, but she was gone for two hours. When she got back, she was weak and collapsed in the air lock."
            case .whatsHappened:
                return "I'm not entirely sure. My captain She- she's unconcious. She went out for samples, and it was only supposed to be 45 minutes, but she was gone for two hours. When she got back, she was weak and collapsed in the air lock."
            case .aLName:
                return "Yeah, sorry. I need to explain myself more. This is Jesse Harper. I'm a bioengineer and Doctor Sloane Lee's apprentice, but, obviously, she's not doing very well. We're in a submarine, and our entire expedition has been underwater. For the past two weeks, we've been researching and trying to find growth of the medicinal plant, Selca Lexorium, and we think- or, I guess, we THOUGHT we finally found some, but something went wrong."
            case .sName:
                return "Ah right. Ok, I need to explain myself a little better. Sorry. This is Jesse Harper. I'm a bioengineer and currently Doctor Sloane Lee's apprentice, but, obviously, she's not doing very well. We've been doing research and trying to find growth of the medicinal plant, Selca Lexorium, for the past 2 weeks. We think- or, I guess, we THOUGHT we finally found some, so Captain Lee left the sub to collect some samples, but something went wrong. "
            case .airLock:
                return "Yeah, sorry. I'm not explaining everything too clearly. We're in a submarine, and our entire expedition has been underwater. We've been researching and trying to find growth of the medicinal plant, Selca Lexorium, for the past 2 weeks, and we think- or, I guess, we THOUGHT we finally found some, but something went wrong. "
            case .samples:
                return "We've been doing research and trying to find growth of the medicinal plant, Selca Lexorium, for the past 2 weeks. We think- or, I guess, we THOUGHT we finally found some, so Captain Lee left the sub to collect some samples, but something went wrong."
            case .sub:
                return "Yeah. Like short for submarine. Our entire expedition has been underwater."
            case .trench:
                return "The Mariana Trench, actually... Our project is pretty huge and also, kind of, well-"
            case .illegal(let name):
                return "Kind of illegal. But listen \(name), you can ask me more questions later. Right now, I'm worried about Captain Lee."
            case .condition:
                return "She's still on the ground right now. I dragged her out of the airlock and removed her helmet. Once she was inside, I tried calling for help. We're lucky you responded."
            case .move:
                return "I can, but she's still in her pressurized suit. It's really heavy, so I'll need to remove it first."
            case .breathing:
                return "Of course she is! Don't you think I'd be more panicked if my only companion down here wasn't breathing? Well, I guess she's not my ONLY companion, because now you're helping me."
            case .panicked:
                return "Well this situation isn't particularly calming."
            case .basics:
                return "Alright, I think I'm going to try to get her out of the suit. She should be moved to the bed, but this suit's way to huge to lift her in. "
            case .later:
                return "The illegality makes our work seem worse than it actually is... Basically, exploration of this area of the trench is restricted. Only the government and the very specific researchers they select have access to this area."
            case .cont1:
                return "Also... We stole some things."
            case .cont2:
                return "From... the government."
            case .stole:
                return "Research."
            case .backToCap:
                return "I know! I know. But listen, someone's dig around in this place. What are they keeping from us down here? The rest of the Mariana's been relatively easy to get a permit for for decades. Especially for scientists with meaningful research like Doctor Lee! Once the Captain and I started our studies and realized that the Selcal Lexorium potentially originated from this area... Well, she's not really the type to let the law get in the way of scientific progress. Our research is for the greater good! We could help thousands."
            case .capOrDoc:
                return "Captian. And doctor. Both. She's very intelligent and diversely qualified, okay? And now we've been talking too long. I should get back to her."
            case .getOut:
                return "Let me see what I can do."
            case .keepInSuit:
                return "I'm not too sure... I think there might be something wrong with it. It's definitely not helping her. Trust me on this."
            case .incision:
                return "The suit’s so heavy! Agh! I might have to make an incision in order to peel this off her. Is it worth it?"
            case .careful:
                return "Alright. I’m going in from the side...but it smells kind of...odd. I think- shoot. I think she found exactly what we were tyring to avoid. The Selca Lexorium has some cousins with similar physical traits, and some are toxic. There's not a lot of reaserch on any of them given where they all grow. Oh god, this is gross."
            case .look:
                return "It looks dark and moldy, like something's been decaying on the inside of this suit for a really long time. It's not possible though, because she was only gone for two hours. This is bad. We need to hurry."
            case .smell:
                return "It smells like moldy death- like something's been decaying on the inside of this suit for a really long time. It's not possible though, because she was only gone for two hours. This is bad. We need to hurry."
        case .getOff:
            return "Oh god, you’re right. That must be it! I’m going to make an incision on the other side to peel off the entire front of her suit."
        case .distance:
            return "She’d be willing to risk her life for me, so I have to do the same. I’m going to pull the rest of her suit off by making an incision on the other side."
        case .luck:
            return "Finally got the front off. Man, she really looks and smells like death. I wonder how this growth got through her suit. Some of it's on her skin."
        case .medical:
            return "Yeah, let me grab it."
        case .cont3:
            return "Okay, so we have the standard first aid stuff. I think cleaning her skin with antiseptic wipes would be a good move. There's also some bottles in here that look like they were thrown in by the Cap. The labels are hand written."
        case .anti:
            return "So I got some surface grossness off, but the bacteria messed with her skin! The spots I cleaned are greenish and all bumpy. It's not something I can wipe off. Shit, and she’s getting paler. We need to try something else. Ugh, I wish I had more medical knowledge!"
        case .bottles:
            return "Wow. Doctor Lee always did- does- have a sense of humor. One bottle says IN CASE OF BAD PLANTS the other has some Chinese characters and a picture of a red X over plant images. One of these has to be an antidote, right? But these dumb labels. Why does she do this to me?"
        case .directions:
            return "The directions- Okay, wow there's directions but no proper label. Nice. It says to use a syringe to inject the liquid into her bloodstream around the affected area starting with 3mL. Increase dosage if needed? She wrote an acutal question mark in the directions."
        case .inject:
            return "Oh man. If she dies, it's on her. But also, I really, really hope she lives. Here goes nothing."
        case .cont4:
            return "Oh, shit. This stuff is making her worse! Her veins are popping out! The infected spots are so red! Hurry, what do I do?"
        case .minute:
            return "Wait, I think you’re right! The redness is reducing all the bumps. It's working!"
        case .yeahRight:
            return "Oh, please. I did all the work. You're just on the other side of the radio."
        case .cont5(let name):
            return "Yeah, yeah. But listen \(name), thank you. For everything. You've actually been pretty helpf- Oh my god! The captain! She's waking up!"
        case .somethingElse:
            return "Wait! Her veins are going back to normal. The redness is reducing all the bumps! It's working!"
        case .killed(let name):
            return "\(name) don't say that to me! She's going to live. Crap, crap, crap. What do I do!?"
        }
    }
}

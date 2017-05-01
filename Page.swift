//
//  Page.swift
//  Below
//
//  Created by Emily Nguyen on 4/19/17.
//  Copyright © 2017 Emily Nguyen. All rights reserved.
//

import Foundation

enum gameError: Error {
    case noFirstName
}

class Page {
    let story: Story
    
    typealias Option = (title: String, page: Page)
    
    var firstOp: Option?
    var secondOp: Option?
    
    init(story: Story) {
        self.story = story
    }
}

extension Page {
    
    func addOption(title: String, story: Story) -> Page {
        let page = Page(story: story)
        return addOption(title: title, page: page)
    }
    
    func addOption(title: String, page: Page) -> Page {
        switch(firstOp, secondOp) {
        case(.some, .some): return self
        case(.none, .none), (.none, .some): firstOp = (title, page)
        case(.some, .none): secondOp = (title,page)
        }
        return page
    }
    
    func addOp(title: String, page: Page) {
        switch(firstOp, secondOp) {
        case(.some, .some): break
        case(.none, .none), (.none, .some): firstOp = (title, page)
        case(.some, .none): secondOp = (title,page)
        }
    }
}

struct Adventure {
    static func story(firstName name: String)-> Page {
        let start = Page(story: .start)
        let hello = start.addOption(title: "Continue", story: .hello)
        let cont = hello.addOption(title: "...", story: .cont)
        let ignore = cont.addOption(title: "Ignore", story: .ignore)
        let here = cont.addOption(title: "This is \(name). I'm here. Hello?", story: .here(name: name))
        ignore.addOp(title: "This is \(name). I hear you. Hello?", page: here)
        let who = here.addOption(title: "Who are you?", story: .who)
        let whatHappened = who.addOption(title: "What happened?", story: .whatHappened)
        let whatsHappened = here.addOption(title: "What's happened?", story: .whatsHappened)
        let aLName = whatsHappened.addOption(title: "Air lock?", story: .aLName)
        let sName = whatsHappened.addOption(title: "Samples?", story: .sName)
        let airLock = whatHappened.addOption(title: "Air lock?", story: .airLock)
        let samples = whatHappened.addOption(title: "Samples?", story: .samples)
        let sub = sName.addOption(title: "Sub?", story: .sub)
        samples.addOp(title: "Sub?", page: sub)
        let trench = aLName.addOption(title: "Where are you?", story: .trench)
        airLock.addOp(title: "Where are you?", page: trench)
        sub.addOp(title: "Underwater! Where have you been exploring?", page: trench)
        sub.addOp(title: "Thats insane! How far under are you?", page: trench)
        let illegal = trench.addOption(title: "Kind of what?", story: .illegal(name: name))
        trench.addOp(title: "Yes...?", page: illegal)
        let later = illegal.addOption(title: "Later? Explain to me now! I'm not sure I want to help someone who's breaking the law.", story: .later)
        let condition = illegal.addOption(title: "Right. We need to take care of her first. Where is she now?", story: .condition)
        let breathing = condition.addOption(title: "Is she still breathing?", story: .breathing)
        let move = condition.addOption(title: "Can you move her to a bed or something?", story: .move)
        let panicked = breathing.addOption(title: "You already seem pretty panicked.", story: .panicked)
        let basics = breathing.addOption(title: "Sorry, sorry. Just making sure you checked the basics.", story: .basics)
        panicked.addOp(title: "Right.", page: basics)
        let cont1 = later.addOption(title: "...", story: .cont1)
        let cont2 = cont1.addOption(title: "Stole?! From who?", story: .cont2)
        let stole = cont1.addOption(title: "Stole?! Like what?", story: .stole)
        stole.addOp(title: "...", page: cont2)
        let backToCap = cont2.addOption(title: "Oh my god.", story: .backToCap)
        backToCap.addOp(title: "Okay. I'll help you. What's Lee's condition?", page: condition)
        let capOrDoc = backToCap.addOption(title: "Wait. So is she a captain or a doctor?", story: .capOrDoc)
        capOrDoc.addOp(title: "Alright. I'll help as much as I can.", page: condition)
        capOrDoc.addOp(title: "Good idea. Get back to me with how she's doing.", page: condition)
        let keepInSuit = move.addOption(title: "No, you don't want to move her too much. Keep her in the suit.", story: .keepInSuit)
        let getOut = move.addOption(title: "That's a good idea. Keeping her in the heavy suit probably isn't helping her circulation.", story: .getOut)
        basics.addOp(title: "That's a good idea. Keeping her in the heavy suit probably isn't helping her circulation.", page: getOut)
        basics.addOp(title: "No, you don't want to move her too much. Keep her in the suit.", page: keepInSuit)
        keepInSuit.addOp(title: "Let's get her out of it then.", page: getOut)
        let incision = getOut.addOption(title: "It shouldn't be too hard.", story: .incision)
        getOut.addOp(title: "Ok, let me know.", page: incision)
        let careful = incision.addOption(title: "I think so. Just be careful.", story: .careful)
        let smell = careful.addOption(title: "What does it smell like?", story: .smell)
        let look = careful.addOption(title: "What does it look like?", story: .look)
        let getOff = smell.addOption(title: "You need to get it off of her.", story: .getOff)
        let distance = smell.addOption(title: "Keep your distance. You don't want it to get you too.", story: .distance)
        look.addOp(title: "You need to get it off of her.", page: getOff)
        look.addOp(title: "Keep your distance. You don't want it to get you too.", page: distance)
        let luck = getOff.addOption(title: "Good luck.", story: .luck)
        distance.addOp(title: "Good luck.", page: luck)
        let medical = luck.addOption(title: "Do you have a medical kit?", story: .medical)
        let cont3 = medical.addOption(title: "...", story: .cont3)
        let anti = cont3.addOption(title: "Try the antiseptic. We can't sure what that other stuff is.", story: .anti)
        let bottles = anti.addOption(title: "Check out some of the bottles she put in herself. Maybe she prepared for this.", story: .bottles)
        let directions = bottles.addOption(title: "Go with IN CASE OF BAD PLANTS.", story: .directions)
        bottles.addOp(title: "Go with the one with pictures.", page: directions)
        let inject = directions.addOption(title: "Your boss seems pretty funny.", story: .inject)
        directions.addOp(title: "Go for it. Start with 3mL.", page: inject)
        let cont4 = inject.addOption(title: "...", story: .cont4)
        let killed = cont4.addOption(title: "Holy crap. We killed her.", story: .killed(name: name))
        let somethingElse = killed.addOption(title: "Kidding! Okay, calm down. Let's try something else.", story: .somethingElse)
        let minute = cont4.addOption(title: "Shoot. Okay, just calm down. Maybe it takes a minute?", story: .minute)
        killed.addOp(title: "I was kidding! It probably takes a bit to work properly.", page: minute)
        let yeahRight = minute.addOption(title: "Nice! I knew we could do it.", story: .yeahRight)
        minute.addOp(title: "Thanks to me.", page: yeahRight)
        somethingElse.addOp(title: "Nice! I knew we could do it.", page: yeahRight)
        somethingElse.addOp(title: "Thanks to me.", page: yeahRight)
        let cont5 = yeahRight.addOption(title: "Hey, I chose the bottle.", story: .cont5(name: name))
        yeahRight.addOp(title: "I could stop replying now.", page: cont5)
        
        return start
    }
}

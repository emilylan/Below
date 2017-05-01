//
//  PageController.swift
//  Below
//
//  Created by Emily Nguyen on 4/20/17.
//  Copyright © 2017 Emily Nguyen. All rights reserved.
//

import UIKit


extension Story {
    var attributedString : NSMutableAttributedString {
        let color = UIColor(red:0.96, green:0.95, blue:0.93, alpha:1.0)
        let attributedText = NSMutableAttributedString (
            string:  text,
            attributes: [NSFontAttributeName:UIFont(
                name: "Courier",
                size: 15.0)!,
                NSForegroundColorAttributeName : color]
        )
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
            
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: attributedText.range)
        
        return attributedText
    }
}

extension Page {
    func story(styled: Bool) -> NSAttributedString {
        if styled {
            return story.attributedString
        } else {
            return NSAttributedString(string: story.text)
        }
    }
}

extension NSAttributedString {
    var range: NSRange {
        return NSMakeRange(0, self.length)
    }
}

class PageController: UIViewController {

    var page: Page?
    var backgroundMusic = backgroundMusicPlayer.sharedInstance
    var time = Timer();
    
    //MARK: Views
    
    lazy var artworkView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = self.page?.story.artwork

        return view
    }()
    
    lazy var storyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.attributedText = self.page?.story(styled: true)
        return label
    }()
    
    lazy var firstOpButton: UIButton = {
        let firstButton = UIButton(type: .system)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.titleLabel!.lineBreakMode = .byWordWrapping
        firstButton.titleLabel!.numberOfLines = 0
        firstButton.titleLabel!.textAlignment = .center
        firstButton.titleLabel!.font =  UIFont(name: "Courier", size: 14)
        firstButton.setTitleColor(UIColor(red:0.37, green:0.59, blue:0.62, alpha:1.0), for: .normal)

        
        if let firstOp = self.page?.firstOp {
            firstButton.setTitle(firstOp.title, for: .normal)
            firstButton.addTarget(self, action: #selector(PageController.loadFirstOp), for: .touchUpInside)
        } else {
            firstButton.setTitle("Play Again", for: .normal)
            firstButton.addTarget(self, action: #selector(PageController.playAgain), for: .touchUpInside)
        }
        
        return firstButton
    }()
    
    lazy var secondOpButton: UIButton = {
        let secondButton = UIButton(type: .system)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.titleLabel!.lineBreakMode = .byWordWrapping
        secondButton.titleLabel!.numberOfLines = 0
        secondButton.titleLabel!.textAlignment = .center
        secondButton.titleLabel!.font =  UIFont(name: "Courier", size: 14)
        secondButton.setTitleColor(UIColor(red:0.37, green:0.59, blue:0.62, alpha:1.0), for: .normal)

        
        if let secondOp = self.page?.secondOp {
            secondButton.setTitle(secondOp.title, for: .normal)
            secondButton.addTarget(self, action: #selector(PageController.loadSecondOp), for: .touchUpInside)
        }
        return secondButton
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(page: Page) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(artworkView)
        
        NSLayoutConstraint.activate([
            artworkView.topAnchor.constraint(equalTo: view.topAnchor),
            artworkView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            artworkView.rightAnchor.constraint(equalTo: view.rightAnchor),
            artworkView.leftAnchor.constraint(equalTo: view.leftAnchor)

            ])
        
        view.addSubview(storyLabel)
        
        NSLayoutConstraint.activate(([
            storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            storyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 85.0)
            
        ]))
        
        view.addSubview(firstOpButton)
        
        NSLayoutConstraint.activate([
            firstOpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstOpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18.0),
            firstOpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18.0),
            firstOpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90.0)
            ])
        
        view.addSubview(secondOpButton)
        
        NSLayoutConstraint.activate([
            secondOpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondOpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18.0),
            secondOpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18.0),
            secondOpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
            ])
        
    }
    
    func loadFirstOp() {
        
        if let page = page, let firstOp = page.firstOp {
            
            let nextPage:Page = firstOp.page
            let pageController = PageController(page: nextPage)
            
            
            if firstOp.title == "Continue" {
                backgroundMusic.playMusic(for: page.story)
            } else if page.story.music != firstOp.page.story.music {
                backgroundMusic.stopMusic()
                backgroundMusic.playMusic(for: nextPage.story)
            }
            
            
            let transition: CATransition = CATransition()
            transition.duration = 0.8
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionFade
            self.navigationController!.view.layer.add(transition, forKey: nil)
            
            
            navigationController?.pushViewController(pageController, animated: false)
            
        }
    }
    
    func loadSecondOp() {
        if let page = page, let secondOp = page.secondOp {
            
            let nextPage:Page = secondOp.page
            let pageController = PageController(page: nextPage)
            
            if page.story.music != secondOp.page.story.music {
                backgroundMusic.stopMusic()
                backgroundMusic.playMusic(for: nextPage.story)
            }
            
            let transition: CATransition = CATransition()
            transition.duration = 0.8
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionFade
            self.navigationController!.view.layer.add(transition, forKey: nil)
            
            navigationController?.pushViewController(pageController, animated: false)
    
        }
    }
    
    func playAgain() {
        backgroundMusic.stopMusic()
        navigationController?.popToRootViewController(animated: true)
    }
    

}

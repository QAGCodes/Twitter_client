//
//  TweetCell.swift
//  Twitter
//
//  Created by csuser on 2/13/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var rtButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    var favorited: Bool = false
    var tweetID: Int = -1
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {
                self.setFavorited(true)
            }, failure: { (Error) in
                print("problem in favorited \(Error)")
            })
        }
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {
                self.setFavorited(false)
            }, failure: { (Error) in
                print("problem in unfavorited \(Error)")
            })
        }
    }
    
    @IBAction func retweetTweet(_ sender: Any) {
        TwitterAPICaller.client?.retweetTweet(tweetID: tweetID, success: {
            self.setRetweeted(true)
        }, failure: { (Error) in
            print("retweet not working \(Error)")
        })
    }
    
    
    func setRetweeted(_ isRetweeted: Bool) {
        if (isRetweeted) {
            rtButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            rtButton.isEnabled = false
        }
        else {
            rtButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            rtButton.isEnabled = true
        }
    }
   
    
    func setFavorited(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

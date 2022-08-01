//
//  CSDetailViewCell.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 01/08/22.
//

import UIKit
import SGImageCache

class CSDetailViewCell: UITableViewCell {

  static let cellIdentifier: String = "CSDetailViewCell"
  
  @IBOutlet weak var firstPlayerView: UIView!
  @IBOutlet weak var firstPlayerNickLabel: UILabel!
  @IBOutlet weak var firstPlayerNameLabel: UILabel!
  @IBOutlet weak var firstPlayerImageView: UIImageView!
  @IBOutlet weak var secondPlayerView: UIView!
  @IBOutlet weak var secondPlayerNickLabel: UILabel!
  @IBOutlet weak var secondPlayerNameLabel: UILabel!
  @IBOutlet weak var secondPlayerImageView: UIImageView!
  
  private func setup(firstPlayer: CSPlayerModel?, secondPlayer: CSPlayerModel?) {
    configBorders()
    
    if let player = firstPlayer {
      firstPlayerView.isHidden = false
      firstPlayerNickLabel.text = player.slug
      firstPlayerNameLabel.text = player.name
      firstPlayerImageView.setImageForURL(player.image_url)
    } else {
      firstPlayerView.isHidden = true
    }
    
    if let player = secondPlayer {
      secondPlayerView.isHidden = false
      secondPlayerNickLabel.text = player.slug
      secondPlayerNameLabel.text = player.name
      secondPlayerImageView.setImageForURL(player.image_url)
    } else {
      secondPlayerView.isHidden = true
    }
    
  }
  
  private func configBorders() {
    DispatchQueue.main.async {
      self.firstPlayerView.roundCorners(corners: .allCorners, radius: 8)
      self.secondPlayerView.roundCorners(corners: .allCorners, radius: 8)
    }
  }
}

//
//  MainViewCell.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit
import SGImageCache

class MainViewCell: UITableViewCell {

  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var team1ImageView: UIImageView!
  @IBOutlet weak var team1Label: UILabel!
  @IBOutlet weak var team2ImageView: UIImageView!
  @IBOutlet weak var team2Label: UILabel!
  @IBOutlet weak var leagueImageView: UIImageView!
  @IBOutlet weak var leagueLabel: UILabel!
  
  enum Strings {
    static let running = "AGORA"
    static let today = "HOJE"
    static let timeFormat = "%@, %@"
  }
  
  static let cellIdentifier: String = "MainViewCell"
  
  func setup(match: CSMatchModel) {
    configBorders()
    
    if match.status == .running {
      statusLabel.text = Strings.running
    } else {
      let date = match.begin_at.toDate() ?? .now
      let ismore = date.isMoreSevenDay
      
      if date.isInToday {
        statusLabel.text = String(format: Strings.timeFormat, Strings.today, date.hourAndMin())
      } else if date.isMoreSevenDay {
        statusLabel.text = String(format: Strings.timeFormat, date.dayAndMonth(), date.hourAndMin())
      } else {
        statusLabel.text = String(format: Strings.timeFormat, date.dayName().uppercased(), date.hourAndMin())
      }
    }
    
    leagueImageView.setImageForURL(match.league?.image_url ?? "")
    leagueLabel.text = match.league?.name
  }
  
  private func configBorders() {
    DispatchQueue.main.async {
      self.mainView.roundCorners(corners: .allCorners, radius: 16)
      self.team1ImageView.roundCorners(corners: .allCorners, radius: 30)
      self.team2ImageView.roundCorners(corners: .allCorners, radius: 30)
      self.leagueImageView.roundCorners(corners: .allCorners, radius: 8)
      self.statusView.roundCorners(corners: .bottomLeft, radius: 16)
    }
  }
}

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
    configStatus(match: match)
    configLeague(match: match)
    
    if let opponents = match.opponents, !opponents.isEmpty, opponents.count > 1 {
      configOpponents(opponents: opponents)
    } else {
      team1ImageView.setImageForURL("")
      team1Label.text = "--"
      
      team2ImageView.setImageForURL("")
      team2Label.text = "--"
    }
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
  
  private func configStatus(match: CSMatchModel) {
    if match.status == .running {
      statusView.backgroundColor = UIColor(red: 244.0/255, green: 42.0/255, blue: 53.0/255, alpha: 1.0)
      statusLabel.text = Strings.running
    } else {
      statusView.backgroundColor = UIColor(red: 250.0/255, green: 250.0/255, blue: 250.0/255, alpha: 0.2)
      let date = match.begin_at.toDate() ?? .now
      
      if date.isInToday {
        statusLabel.text = String(format: Strings.timeFormat, Strings.today, date.hourAndMin())
      } else if date.isMoreThanSevenDay {
        statusLabel.text = String(format: Strings.timeFormat, date.dayAndMonth(), date.hourAndMin())
      } else {
        statusLabel.text = String(format: Strings.timeFormat, date.dayName().uppercased(), date.hourAndMin())
      }
    }
  }
  
  private func configOpponents(opponents: [CSOpponentModel]) {
    let firstOpponent = opponents[0]
    let secondOpponent = opponents[1]
    
    team1ImageView.setImageForURL(firstOpponent.opponent?.image_url ?? "")
    team1Label.text = firstOpponent.opponent?.name
    
    team2ImageView.setImageForURL(secondOpponent.opponent?.image_url ?? "")
    team2Label.text = secondOpponent.opponent?.name
  }
  
  private func configLeague(match: CSMatchModel) {
    leagueImageView.setImageForURL(match.league?.image_url ?? "")
    leagueLabel.text = match.league?.name
  }
}

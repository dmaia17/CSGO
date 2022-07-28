//
//  MainViewCell.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 28/07/22.
//

import UIKit

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
  
  
  static let cellIdentifier: String = "MainViewCell"
    
}

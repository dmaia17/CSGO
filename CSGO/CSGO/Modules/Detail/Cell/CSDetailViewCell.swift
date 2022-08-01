//
//  CSDetailViewCell.swift
//  CSGO
//
//  Created by Daniel Maia dos Passos on 01/08/22.
//

import UIKit

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
  
  
  
}

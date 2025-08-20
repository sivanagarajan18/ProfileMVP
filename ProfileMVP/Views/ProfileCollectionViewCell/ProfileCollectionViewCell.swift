//
//  ProfileCollectionViewCell.swift
//  ProfileMVP
//
//  Created by Siva Nagarajan on 18/08/25.
//

import UIKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var sexContainer: UIView!
    @IBOutlet private weak var sexLabel: UILabel!
    @IBOutlet private weak var heightContainer: UIView!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var weightContainer: UIView!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet private weak var ageContainer: UIView!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var infoContainer: UIView!
    @IBOutlet private weak var closeContainer: UIView!
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var likeContainer: UIView!
    @IBOutlet private weak var likeImageView: UIImageView!
    @IBOutlet private weak var likeButton: UIButton!
    
    // MARK: - Handlers
    var closeTapHandler: ((Int) -> Void)?
    var likeTapHandler: ((Int, Bool) -> Void)?
    
    // MARK: - Properties
    private var profile: Profile?
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        styleUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        likeImageView.image = nil
        nameLabel.text = nil
        sexLabel.text = nil
        heightLabel.text = nil
        weightLabel.text = nil
        ageLabel.text = nil
        infoLabel.text = nil
    }
    
    // MARK: - Public
    func configure(with profile: Profile, isGridLayout: Bool, index: Int) {
        self.profile = profile
        
        profileImageView.image = UIImage(named: profile.imageName ?? "")
        nameLabel.text = profile.name
        nameLabel.font = UIFont(name: "Futura-Bold", size: isGridLayout ? 20 : 18)
        sexLabel.text = profile.sex
        likeImageView.image = UIImage(systemName: profile.isLiked ? "suit.heart.fill" : "suit.heart")
        heightLabel.text = profile.height
        weightLabel.text = profile.weight
        ageLabel.text = profile.age
        infoLabel.text = profile.info
        
        // Hide details in grid mode
        [sexContainer, heightContainer, weightContainer, ageContainer, infoContainer, closeContainer].forEach {
            $0?.isHidden = isGridLayout
        }
        
        // Buttons
        closeButton.tag = index
        likeButton.tag = index
        
        // Layout adjustments
        imageHeightConstraint.constant = isGridLayout ? 150 : 300
        profileImageView.layer.cornerRadius = isGridLayout ? 75 : 150
    }
    
    // MARK: - Actions
    @IBAction private func likeAction(_ sender: UIButton) {
        let currentLikeStatus = profile?.isLiked ?? false
        likeTapHandler?(sender.tag, !currentLikeStatus)
    }
    
    @IBAction private func closeAction(_ sender: UIButton) {
        closeTapHandler?(sender.tag)
    }
    
    // MARK: - Private
    private func styleUI() {
        mainView.layer.cornerRadius = 5
        mainView.layer.borderColor = UIColor.white.cgColor
        mainView.layer.borderWidth = 1
        
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.white.cgColor
    }
}


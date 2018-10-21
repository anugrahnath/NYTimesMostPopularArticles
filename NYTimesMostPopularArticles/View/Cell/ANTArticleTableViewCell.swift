//
//  ANTArticleTableViewCell.swift
//  NYTimesMostPopularArticles
//
//  Created by ADMIN on 19/10/18.
//  Copyright © 2018 Anugrah Nath Tiwari. All rights reserved.
//

import UIKit
import SDWebImage
import MBProgressHUD

class ANTArticleTableViewCell: UITableViewCell {

    var titleLabel: UILabel?
    var detailLabel: UILabel?
    var articleTypeLabel: UILabel?
    var dateLabel: UILabel?
    var thumbnailImageView: UIImageView?
    var calenderIcon : UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        applyTheme()
        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Apply theme on cell
    
    func applyTheme() {
        articleTypeLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        dateLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        titleLabel?.font = ANTTheme.shared.primaryFont()
        detailLabel?.font = ANTTheme.shared.georgiaFontOfSize(13.0)
        detailLabel?.textColor = ANTTheme.shared.primaryGrayColor()
        thumbnailImageView?.backgroundColor = ANTTheme.shared.primaryGrayColor()
        calenderIcon?.backgroundColor = ANTTheme.shared.primaryGrayColor()
    }
    
    func setupConstraints() {
        articleTypeLabel?.leadingAnchor.constraint(equalTo: (articleTypeLabel?.superview?.leadingAnchor)!, constant: 15.0).isActive = true
        articleTypeLabel?.topAnchor.constraint(equalTo: (articleTypeLabel?.superview?.topAnchor)!, constant: 2.0).isActive = true
        
        thumbnailImageView!.heightAnchor.constraint(equalToConstant: 75.0).isActive = true
        thumbnailImageView!.widthAnchor.constraint(equalToConstant: 75.0).isActive = true
        thumbnailImageView!.leadingAnchor.constraint(equalTo: thumbnailImageView!.superview!.leadingAnchor, constant: 6.0).isActive = true
        thumbnailImageView!.topAnchor.constraint(equalTo: articleTypeLabel!.bottomAnchor, constant: 5.0).isActive = true
        thumbnailImageView!.bottomAnchor.constraint(equalTo: thumbnailImageView!.superview!.bottomAnchor, constant: -12.0).isActive = true
        
        titleLabel?.topAnchor.constraint(equalTo: articleTypeLabel!.bottomAnchor, constant: 0.0).isActive = true
        titleLabel?.leadingAnchor.constraint(equalTo: thumbnailImageView!.trailingAnchor, constant: 12.0).isActive = true
        titleLabel?.trailingAnchor.constraint(equalTo: (titleLabel?.superview?.trailingAnchor)!).isActive = true
        
        detailLabel!.topAnchor.constraint(equalTo: (titleLabel?.bottomAnchor)!, constant: 2.0).isActive = true
        detailLabel!.leadingAnchor.constraint(equalTo: thumbnailImageView!.trailingAnchor, constant: 12.0).isActive = true
        detailLabel!.trailingAnchor.constraint(equalTo: (detailLabel!.superview?.trailingAnchor)!).isActive = true
        detailLabel!.bottomAnchor.constraint(greaterThanOrEqualTo: (detailLabel!.superview?.bottomAnchor)!, constant: -22.0).isActive = true
        
        calenderIcon!.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
        calenderIcon!.widthAnchor.constraint(equalToConstant: 15.0).isActive = true
        calenderIcon!.trailingAnchor.constraint(equalTo: calenderIcon!.superview!.trailingAnchor, constant: 105.0).isActive = true
        calenderIcon!.bottomAnchor.constraint(greaterThanOrEqualTo: (calenderIcon!.superview?.bottomAnchor)!, constant: -5.0).isActive = true
        
        dateLabel!.trailingAnchor.constraint(equalTo: dateLabel!.superview!.trailingAnchor, constant: 15.0).isActive = true
        dateLabel!.bottomAnchor.constraint(greaterThanOrEqualTo: (detailLabel!.superview?.bottomAnchor)!, constant: -5.0).isActive = true
        
    }
    
    func setup() {
        accessoryType = .disclosureIndicator
        
        articleTypeLabel = UILabel()
        contentView.addSubview(articleTypeLabel!)
        articleTypeLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        detailLabel = UILabel()
        detailLabel?.numberOfLines = 2
        contentView.addSubview(detailLabel!)
        detailLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel = UILabel()
        titleLabel?.numberOfLines = 2
        if let aLabel = titleLabel {
            contentView.addSubview(aLabel)
        }
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel = UILabel()
        contentView.addSubview(dateLabel!)
        dateLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        thumbnailImageView = UIImageView()
        contentView.addSubview(thumbnailImageView!)
        thumbnailImageView?.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView?.image = UIImage(named: "PlaceHolderImage_Table")
        
        calenderIcon = UIImageView()
        contentView.addSubview(calenderIcon!)
        calenderIcon?.translatesAutoresizingMaskIntoConstraints = false
        calenderIcon?.image = UIImage(named: "calendar")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel?.text = nil
        detailLabel?.text = nil
        articleTypeLabel?.text = nil
        dateLabel?.text = nil
        thumbnailImageView?.image = UIImage(named: "PlaceHolderImage_Table")
        calenderIcon?.image = UIImage(named: "calendar")
    }
    
    // MARK: - Public
    func configure(with viewModel: ANTArticleViewModel?) {
        articleTypeLabel?.text = viewModel?.articleType?.uppercased()
        dateLabel?.text = viewModel?.publishedDateString
        titleLabel?.text = viewModel?.titleText
        detailLabel?.text = viewModel?.detailText
        thumbnailImageView?.sd_setImage(with: viewModel?.thumbnailImageUrl)
    }
}

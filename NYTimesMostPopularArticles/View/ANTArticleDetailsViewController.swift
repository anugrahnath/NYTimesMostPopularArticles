//
//  ANTArticleDetailsViewController.swift
//  NYTimesMostPopularArticles
//
//  Created by ADMIN on 19/10/18.
//  Copyright © 2018 Anugrah Nath Tiwari. All rights reserved.
//

import UIKit
import SDWebImage

class ANTArticleDetailsViewController: UIViewController {

    var scrollView : UIScrollView?
    var stackView : UIStackView?
    var viewModel : ANTArticleViewModel?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupConstraints()
        
    }
    
    func setup() {
        
        title = NSLocalizedString("ArticleDetail.NavigationItem.Title", comment: "")
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(self.actionButtonTapped(_:)))
        navigationItem.rightBarButtonItem = shareButton
        view.backgroundColor = ANTTheme.shared.primaryLightGrayColor()
        
        scrollView = UIScrollView()
        scrollView?.alwaysBounceVertical = true
        scrollView?.translatesAutoresizingMaskIntoConstraints = false
        scrollView?.backgroundColor = UIColor.clear
        view.addSubview(scrollView!)
        
        stackView = UIStackView()
        stackView?.spacing = 7.0
        stackView?.axis = NSLayoutConstraint.Axis.vertical
        stackView?.translatesAutoresizingMaskIntoConstraints = false
        scrollView?.addSubview(stackView!)
        
        let articleTypeLabel = UILabel()
        articleTypeLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        
        stackView?.addArrangedSubview(articleTypeLabel)
        articleTypeLabel.text = viewModel?.articleType?.uppercased()
        
        let imageView = UIImageView(image: UIImage(named: "PlaceHolderImage_Detail"))
        imageView.contentMode = .scaleAspectFit
        imageView.sd_setImage(with: viewModel?.detailImageUrl)
        
        stackView?.addArrangedSubview(imageView)
        
        let dateLabel = UILabel()
        dateLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        dateLabel.text = viewModel?.publishedDateString
        dateLabel.textColor = ANTTheme.shared.primaryDarkGrayColor()
        stackView?.addArrangedSubview(dateLabel)
        
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = ANTTheme.shared.primaryFont()
        titleLabel.text = viewModel?.titleText
        stackView?.addArrangedSubview(titleLabel)
        
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.text = viewModel?.detailText
        detailLabel.font = ANTTheme.shared.georgiaFontOfSize(14.0)
        detailLabel.textColor = ANTTheme.shared.primaryGrayColor()
        stackView?.addArrangedSubview(detailLabel)
        
        if viewModel?.authorName != "" {
            let authorLabel = UILabel()
            authorLabel.text = "\(NSLocalizedString("AuthorPrefix.By", comment: ""))\(viewModel?.authorName)"
            authorLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
            authorLabel.textColor = ANTTheme.shared.primaryDarkGrayColor()
            stackView?.addArrangedSubview(authorLabel)
        }
        
        let safariButton = UIButton(type: .system)
        safariButton.titleLabel?.font = ANTTheme.shared.georgiaFontOfSize(14)
        safariButton.setTitle(NSLocalizedString("ArticleDetail.LinkToArticle.Text", comment: ""), for: .normal)
        safariButton.addTarget(self, action: #selector(self.link(toFullArticleTapped:)), for: .touchUpInside)
        stackView?.addArrangedSubview(safariButton)
        
        let footerStackView = UIStackView()
        footerStackView.alignment = .center
        footerStackView.axis = .vertical
        footerStackView.spacing = 3.0
        
        let footerLogoImageView = UIImageView(image: UIImage(named: "NYT_footer_logo"))
        footerLogoImageView.contentMode = .center
        footerStackView.addArrangedSubview(footerLogoImageView)
        
        let copyrightLabel = UILabel()
        copyrightLabel.textColor = ANTTheme.shared.primaryGrayColor()
        copyrightLabel.font = ANTTheme.shared.georgiaFontOfSize(10.0)
        copyrightLabel.text = NSLocalizedString("ArticleDetail.CopyrightLabel.Text", comment: "")
        footerStackView.addArrangedSubview(copyrightLabel)
        
        stackView?.addArrangedSubview(footerStackView)
    }

    func setupConstraints() {
        
        scrollView?.leadingAnchor.constraint(equalTo: (scrollView?.superview?.leadingAnchor)!).isActive = true
        scrollView?.trailingAnchor.constraint(equalTo: (scrollView?.superview?.trailingAnchor)!).isActive = true
        scrollView?.topAnchor.constraint(equalTo: (scrollView?.superview?.topAnchor)!).isActive = true
        scrollView?.bottomAnchor.constraint(equalTo: (scrollView?.superview?.bottomAnchor)!).isActive = true
        
        stackView?.topAnchor.constraint(equalTo: (stackView?.superview?.topAnchor)!, constant: 6.0).isActive = true
        stackView?.leadingAnchor.constraint(equalTo: (stackView?.superview?.leadingAnchor)!, constant: 6.0).isActive = true
        stackView?.trailingAnchor.constraint(equalTo: (stackView?.superview?.trailingAnchor)!, constant: 6.0).isActive = true
        stackView?.bottomAnchor.constraint(equalTo: (stackView?.superview?.bottomAnchor)!, constant: -12.0).isActive = true
        stackView?.centerXAnchor.constraint(equalTo: (stackView?.superview!.centerXAnchor)!).isActive = true
    }

    
    // MARK: - Actions
    @objc func actionButtonTapped(_ sender: UIBarButtonItem?) {
        
        let activityController = UIActivityViewController(activityItems: [viewModel?.webUrl], applicationActivities: nil)
        activityController.popoverPresentationController?.barButtonItem = sender
        activityController.popoverPresentationController?.permittedArrowDirections = .up
        present(activityController, animated: true)
    }
    
    @objc func link(toFullArticleTapped sender: UIButton?) {
        if UIApplication.shared.canOpenURL((viewModel?.webUrl)!) {
            UIApplication.shared.open((viewModel?.webUrl)!, options: [:], completionHandler: nil)
        }
    }
}

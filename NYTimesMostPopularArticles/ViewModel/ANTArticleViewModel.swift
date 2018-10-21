//
//  ANTArticleViewModel.swift
//  NYTimesMostPopularArticles
//
//  Created by ADMIN on 19/10/18.
//  Copyright © 2018 Anugrah Nath Tiwari. All rights reserved.
//

import UIKit

class ANTArticleViewModel: NSObject {

    var articleType : String?
    var titleText : String?
    var detailText : String?
    var publishedDateString : String?
    var authorName: String?
    var webUrl: URL?
    var thumbnailImageUrl: URL?
    var detailImageUrl: URL?
    
    
    init(featuredArticle article: FeaturedArticle?) {
        super.init()
        
        articleType = article?.articleType
        titleText = article?.title
        detailText = article?.abstract
        publishedDateString = ANTTheme.shared.date_monthDayYear(article?.publishDate)
        webUrl = article?.webUrl
        thumbnailImageUrl = article?.media.thumbnailImageUrl
        detailImageUrl = article?.media.detailImageUrl
        //        TODO: _authorName
        
    }
    
    init(searchArticle article: SearchArticle?) {
        super.init()
        
        articleType = article?.articleType
        titleText = article?.snippet
        detailText = article?.abstract
        publishedDateString = ANTTheme.shared.date_monthDayYear(article?.publishDate)
        webUrl = article?.webUrl
        thumbnailImageUrl = article?.media.thumbnailImageUrl
        detailImageUrl = article?.media.detailImageUrl
        
    }
 
    
    
}


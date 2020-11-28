//
//  HeadlineTableViewCell.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {

    // MARK: - Variables
    
    var headlines: [Headline]?
    var collectionFlowlayout = CenteredCollectionLayout()
    
    // MARK: - IBOutles
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var headlinesCollectionView: UICollectionView!
    @IBOutlet weak var pageControlLeadingConstraint: NSLayoutConstraint!
    
    // MARK: - Actions
    
    func scrollToNextheadline() {
        let visibleIndexPath = headlinesCollectionView.indexPathsForVisibleItems
       
        if let currentItem: IndexPath = visibleIndexPath.first {
            let nextIndex = (currentItem.item + 1) % (headlines?.count ?? 0)
            let nextItem: IndexPath = IndexPath(item: nextIndex, section: 0)
            headlinesCollectionView.scrollToItem(at: nextItem, at: .left, animated: true)
        }
    }
    
    // MARK: - Configure
    
    func configure(headlines: [Headline]?) {
        setup()
        pageControl.numberOfPages = headlines?.count ?? 0
        self.headlines = headlines
        headlinesCollectionView.reloadData()
    }
    
    // MARK: - Setup
    
    func setup() {
        if #available(iOS 14.0, *) {
            pageControlLeadingConstraint.constant = -22
        }
        let space = 0.0
        headlinesCollectionView.dataSource = self
        headlinesCollectionView.delegate = self
        headlinesCollectionView.isPagingEnabled = false
        headlinesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionFlowlayout.scrollDirection = .horizontal
        collectionFlowlayout.itemSize = CGSize(width: headlinesCollectionView.frame.size.width  , height: 80)
        collectionFlowlayout.minimumLineSpacing = CGFloat(space)
        headlinesCollectionView.collectionViewLayout = collectionFlowlayout
    }
    
}

// MARK: - UICollectionViewDataSource

extension HeadlineTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headlines?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeadlineCollectionViewCell.className, for: indexPath) as! HeadlineCollectionViewCell
        cell.configure(headline: headlines?[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension HeadlineTableViewCell: UICollectionViewDelegate {
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}



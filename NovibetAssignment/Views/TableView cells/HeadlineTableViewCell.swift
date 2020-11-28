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
    var collectionFlowlayout = YourCollectionLayoutSubclass()
    
    // MARK: - IBOutles
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var headlinesCollectionView: UICollectionView!
    @IBOutlet weak var pageControlLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
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
        addObserver()
        pageControl.numberOfPages = headlines?.count ?? 0
        self.headlines = headlines
        headlinesCollectionView.reloadData()
    }
    
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
        collectionFlowlayout.itemSize = CGSize(width: headlinesCollectionView.frame.size.width  , height: collectionViewHeightConstraint.constant)
        collectionFlowlayout.minimumLineSpacing = CGFloat(space)
        headlinesCollectionView.collectionViewLayout = collectionFlowlayout
    }
    
    // MARK: - Update
    
    func updateViewDimensions() {
        collectionViewHeightConstraint.constant = headlinesCollectionView.contentSize.height
    }
    
    func addObserver() {
        headlinesCollectionView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    // MARK: - Observers
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UICollectionView {
            if obj == headlinesCollectionView && keyPath == "contentSize" {
                updateViewDimensions()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

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

extension HeadlineTableViewCell: UICollectionViewDelegate {
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

class YourCollectionLayoutSubclass: UICollectionViewFlowLayout {
    
    private var previousOffset: CGFloat = 0
    private var currentPage: Int = 0
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        
        // Imitating paging behaviour
        // Check previous offset and scroll direction
        if previousOffset > collectionView.contentOffset.x && velocity.x < 0 {
            currentPage = max(currentPage - 1, 0)
        } else if previousOffset < collectionView.contentOffset.x && velocity.x > 0 {
            currentPage = min(currentPage + 1, itemsCount - 1)
        }
        
        // Update offset by using item size + spacing
        let updatedOffset = (itemSize.width + minimumInteritemSpacing) * CGFloat(currentPage)
        previousOffset = updatedOffset
        
        return CGPoint(x: updatedOffset, y: proposedContentOffset.y)
    }
}

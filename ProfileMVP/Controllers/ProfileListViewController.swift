//
//  ProfileListViewController.swift
//  ProfileMVP
//
//  Created by Siva Nagarajan on 18/08/25.
//
import UIKit

class ProfileViewController: UIViewController, ProfileView {
    
    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionTopToTop: NSLayoutConstraint!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionTopToCenterY: NSLayoutConstraint!
    private var presenter: ProfilePresenter!
    private var isGridLayout = true
    private var lastGridIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupCollectionView()
        presenter = ProfilePresenter(view: self)
        presenter.fetchProfiles()
    }
    
    // MARK: - initial collectionView setup
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionTopToTop.priority =  UILayoutPriority(250)
        collectionTopToCenterY.priority = UILayoutPriority(999)
        collectionView.setCollectionViewLayout(makeGridLayout(), animated: false)
        collectionView.alwaysBounceVertical = true
        collectionView.isPagingEnabled = false
        collectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCollectionViewCell")
    }
    
    // MARK: - makeGridLayout
    private func makeGridLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let spacing: CGFloat = 8
        let itemWidth = (collectionView.bounds.width - (spacing * 3)) / 2
        layout.itemSize = CGSize(width: itemWidth, height: 400)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        return layout
    }
    
    // MARK: - makeFullscreenLayout
    private func makeFullscreenLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = collectionView.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }
    
    // MARK: - toggleLayout
    func toggleLayout(toFullscreen: Bool, at indexPath: IndexPath?) {
        isGridLayout = !toFullscreen
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self else { return }
            topView.isHidden = toFullscreen
            collectionTopToTop.priority = toFullscreen ? .init(999) : .init(250)
            collectionTopToCenterY.priority = toFullscreen ? .init(250) : .init(999)
            self.view.layoutIfNeeded()
        }

        let newLayout = toFullscreen ? makeFullscreenLayout() : makeGridLayout()
        collectionView.setCollectionViewLayout(newLayout, animated: true) { _ in
            if let indexPath = indexPath {
                self.collectionView.isPagingEnabled = toFullscreen
                self.collectionView.reloadData()
                self.collectionView.scrollToItem(
                    at: indexPath,
                    at: toFullscreen ? .centeredHorizontally : .centeredVertically,
                    animated: false
                )
            }
        }
    }
    
    // MARK: - reloadProfiles
    func reloadProfiles() {
        collectionView.reloadData()
    }
    
    // MARK: - showMessage
    func showActionMessage(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            alert.dismiss(animated: true)
        }
    }
}
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfProfiles()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as! ProfileCollectionViewCell
        if let profile = presenter.profile(at: indexPath.item) {
            cell.configure(with: profile, isGridLayout: self.isGridLayout, index: indexPath.item)
        }
        cell.closeTapHandler = { [weak self] _ in
            self?.toggleLayout(toFullscreen: false, at: indexPath)
        }
        cell.likeTapHandler = { [weak self] index, isLiked in
            self?.presenter.updateLikeStatus(for: index, isLiked: isLiked)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Remember where we were in the grid to restore later
        lastGridIndexPath = collectionView.indexPathsForVisibleItems.sorted().first ?? indexPath
        toggleLayout(toFullscreen: true, at: indexPath)
    }
}


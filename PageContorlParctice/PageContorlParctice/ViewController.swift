//
//  ViewController.swift
//  PageContorlParctice
//
//  Created by jeongseob hong on 2021/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.backgroundColor = .black
        return pageControl
    }()
    
    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemPink,
        .systemTeal,
        .systemGray
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageControl.addTarget(
            self,
            action: #selector(pageControlDidChange),
            for: .valueChanged)
        view.addSubview(pageControl)
        view.addSubview(scrollView)
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width,
                                            y: 0), animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(
            x: 10,
            y: view.frame.size.height - 100,
            width: view.frame.size.width-20,
            height: 70)
        
        scrollView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: view.frame.size.height - 100)
        
        // 스크롤뷰에는 상하bar와 좌우bar가 기본으로 들어가 있어서 그 요소가 subview가 되기때문에 기본값이 2가된다!
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    private func configureScrollView() {
        scrollView.contentSize = CGSize(
            width: view.frame.size.width * 5,
            height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        
        for x in 0..<5 {
            let page = UIView(
                frame: CGRect(
                    x: CGFloat(x) * view.frame.size.width,
                    y: 0,
                    width: view.frame.size.width,
                    height: scrollView.frame.size.height))
            
            page.backgroundColor = colors[x]
            scrollView.addSubview(page)
        }
    }
}


extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}

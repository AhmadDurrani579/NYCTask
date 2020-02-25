//
//  NYCViewController.swift
//  TechECS

import UIKit

class NYCViewController: UIViewController , NYCPublicationProtocol {
    
    var presenter: NYCPublicationPresenterProtocol?
    
    private var itemList : [DocsNYTIME] = []
    @IBOutlet weak var tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.registerCells([
            NYCArticleCell.self
            ])
        tblView.rowHeight = UITableView.automaticDimension
        tblView.estimatedRowHeight = 44
        showProgressIndicator(view: self.view)
        
        //MARK: - API Call
        presenter?.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear(navigationController: self.navigationController!)
    }
    func showItems(list: [DocsNYTIME]) {
        itemList = list
    }
    func showError(_ message: String?) {
        hideProgressIndicator(view: self.view)
    }
    
    func success(_ message: String?) {
        hideProgressIndicator(view: self.view)
        tblView.delegate = self
        tblView.dataSource = self
        tblView.reloadData()
    }
}
//MARK: - TableViewDelegate And DataSource Methods

extension NYCViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
            return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(with: NYCArticleCell.self, for: indexPath)
        cell.config(obj: self.itemList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}




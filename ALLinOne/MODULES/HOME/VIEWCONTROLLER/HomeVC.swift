//
//  HomeVC.swift
//  ALLinOne
//
//  Created by Narendra Yadav on 8/28/21.
//

import UIKit
import MyContent
import DVConfiguration
import DVUtility

class HomeVC: UIViewController {

    @IBOutlet weak var tableCategory: UITableView!
    
    var listIpTvCategory:[IpTvCategory]?
    let myIPTV = MyIPTV(dbPath: DVSqlitePath.one.databasePath)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableCategory.dataSource = self
        tableCategory.dataSource = self
        if let category = myIPTV.getIndianIPTVCategory(FileName: "int.m3u", forLangLocale: "en"){
            print(category)
            listIpTvCategory = category
            tableCategory.reloadData()
        }
        
        tableCategory.register(UINib(nibName: "HomeTableViewCell1",
                                          bundle: nil),
                                    forCellReuseIdentifier:"HomeTableViewCell1")
        tableCategory.dataSource = self
        tableCategory.delegate = self
        
    }

}

extension HomeVC:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listIpTvCategory?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell1", for: indexPath)
            as? HomeTableViewCell1 else {return UITableViewCell()}
        
        if let title = listIpTvCategory?[indexPath.row].ChannelCategory {
            cell.labelCategory.text = title
        }
        cell.showChannels(fileName: listIpTvCategory?[indexPath.row].FileName ?? "", categoryName: listIpTvCategory?[indexPath.row].ChannelCategory ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return getBannerHeight()
        
    }
    
}

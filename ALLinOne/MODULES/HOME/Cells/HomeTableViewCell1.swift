//
//  HomeTableViewCell1.swift
//  ALLinOne
//
//  Created by Narendra Yadav on 8/28/21.
//

import UIKit

import DVConfiguration
import DVUtility
import MyContent
import SDWebImage
class HomeTableViewCell1: UITableViewCell {

    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var collectionViewChannels: UICollectionView!
    
    let myIPTV = MyIPTV(dbPath: DVSqlitePath.one.databasePath)
    var listIpTvChannel:[IpTvChannel]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        UIsetup()
    }

    func UIsetup() {
        
        collectionViewChannels.register(UINib(nibName: "HomeTvChannelCell",
                                                bundle: nil),
                                          forCellWithReuseIdentifier: "HomeTvChannelCell")
       
         let layout = UICollectionViewFlowLayout()
         layout.sectionInset = UIEdgeInsets(top: 0,left: 20,bottom: 20,right: 0)
         layout.minimumLineSpacing = 15
         layout.minimumInteritemSpacing = 15
         layout.scrollDirection = .horizontal
        collectionViewChannels.collectionViewLayout = layout
       
        collectionViewChannels.delegate = self
        collectionViewChannels.dataSource = self
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showChannels(fileName:String,categoryName:String){
        if let channels = myIPTV.getIndianIPTVChannels(FileName: fileName, ChannelCategory:categoryName, forLangLocale: "en"){
            print(channels)
            listIpTvChannel = channels
            collectionViewChannels.reloadData()
            
        }
    }
    
    
}
extension HomeTableViewCell1:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listIpTvChannel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeTvChannelCell", for: indexPath)
            as? HomeTvChannelCell else {return UICollectionViewCell()}
        
        if let title = listIpTvChannel?[indexPath.row].ChannelName {
            cell.labelChannelName.text = title
        }
        if let imgUrl = listIpTvChannel?[indexPath.row].ImgUrl {
            //let imageInfo = ImageInfo.init(fileUrl: imgUrl, fileType: .ignore)
          //  cell.imageViewChannel.downloadImage(imageInfo: imageInfo)
            let urlNew = imgUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""

            if let urls = URL(string: urlNew) {
                cell.imageView.sd_setImage(with: urls, placeholderImage: PLACEHOLDER_VIDEO)
            }
            
        }
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if let channel = listIpTvChannel?[indexPath.row] {
           // channelDelegate?.channelClicked(channel)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getPodcastContentSize(height: (self.collectionViewChannels.frame.height))
    }
}



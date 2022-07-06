//
//  ShopController.swift
//  PlantApp
//
//  Created by Cyrus on 30/7/2021.
//

import UIKit
import SceneKit//showScene

class ShopController: UIViewController{
    
//    var delegate:DataDelegate?//passingDataToPreviousPage
    
    //setItem
    @IBOutlet var collectionView:UICollectionView!//collectionView
    struct item {
        var collectionViewCellImages: [UIImage]!//make array by "[]", make it absolutely by "!"
        var title: [String]!
        var descriptions: [String]!
    }
    var items = [item()]
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    //setItem end
    
    //buy
    @IBOutlet weak var buyButton: UIButton!
    @IBAction func buyButtonPressed(_ sender: UIButton) {
        print(buyButton.tag)
        //passingDataToPreviousPage
//        if buyButton.tag == 0{
//            delegate?.printThisString(string: 0, sender: nil)
//        }else if buyButton.tag == 1{
//            delegate?.printThisString(string: 1, sender: nil)
//        }else if buyButton.tag == 2{
//            delegate?.printThisString(string: 2, sender: nil)
//        }else if buyButton.tag == 3{
//            delegate?.printThisString(string: 3, sender: nil)
//        }else if buyButton.tag == 4{
//            delegate?.printThisString(string: 4, sender: nil)
//        }
        //passingDataToPreviousPage end
    }
    //buy end
    
    //showScene
    @IBOutlet weak var sceneView: SCNView!
    // 1: Load .obj file
    var scene = SCNScene(named: "Flower3.usdz")
    // 5: Adding light to scene
    var lightNode = SCNNode()
    // 6: Creating and adding ambien light to scene
    var ambientLightNode = SCNNode()
    //showScene end
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setItem
        items = [item(collectionViewCellImages: [
            UIImage(named: "Flower2")!,
            UIImage(named: "Flower10")!,
            UIImage(named: "Flower6")!,
            UIImage(named: "Pot17")!,
            UIImage(named: "Pot01")!
        ], title: [
            "Flower 1",
            "Flower 2",
            "Flower 3",
            "Pot 1",
            "Pot 2",
        ], descriptions: [
            "The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. ",
            "The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. ",
            "The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. The description of flower. ",
            "The description of pot. The description of pot. The description of pot. The description of pot. The description of pot. The description of pot. The description of pot. The description of pot. ",
            "The description of pot. The description of pot. The description of pot. The description of pot. The description of pot. The description of pot. The description of pot. The description of pot. ",
        ])]
        //setItem end
        
        //collectionView:
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.sectionInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView end
        
        //showScene
        // 2: Add camera node
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        // 3: Place camera
        cameraNode.position = SCNVector3(x: 0, y: 10, z: 35)
        // 4: Set camera on scene
        scene?.rootNode.addChildNode(cameraNode)
        // 5: Adding light to scene
        lightNode.light = SCNLight()
        lightNode.light?.type = .ambient
        lightNode.position = SCNVector3(x: 0, y: 10, z: 35)
        scene?.rootNode.addChildNode(lightNode)
        // 6: Creating and adding ambien light to scene
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        // If you don't want to fix manually the lights
//        sceneView.autoenablesDefaultLighting = true
        // Allow user to manipulate camera
        sceneView.allowsCameraControl = true
        // Show FPS logs and timming
        // sceneView.showsStatistics = true
        // Set background color
        sceneView.backgroundColor = UIColor.white
        // Allow user translate image
        sceneView.cameraControlConfiguration.allowsTranslation = false
        // Set scene settings
        sceneView.scene = scene
        //showScene end
        
    }
    
}
//collectionView:
extension ShopController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int{// the output of this func is to(->) Int(Integer)
        return 5// the Int
    }
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.collectionViewCellButton.tag = indexPath.row
        cell.collectionViewCellButton.setImage(items[0].collectionViewCellImages[indexPath.row].withRenderingMode(.alwaysOriginal), for: .normal)
        cell.collectionViewCellButton.imageView?.contentMode = .scaleAspectFill
        cell.collectionViewCellButton.addTarget(self, action: #selector(self.collectionViewCellButtonTapped), for: .touchUpInside)
        return cell
    }
    @objc func collectionViewCellButtonTapped(_ sender:UIButton){
        print(sender.tag)
        if sender.tag == 0{
            //scene
            scene = SCNScene(named: "Flower2.usdz")
            scene?.rootNode.addChildNode(lightNode)
            sceneView.scene = scene
            //item
            itemTitle.text = items[0].title[0]
            itemDescription.text = items[0].descriptions[0]
            buyButton.tag = 0//buy
        }else if sender.tag == 1{
            //scene
            scene = SCNScene(named: "Flower3.usdz")
            scene?.rootNode.addChildNode(lightNode)
            sceneView.scene = scene
            //item
            itemTitle.text = items[0].title[1]
            itemDescription.text = items[0].descriptions[1]
            buyButton.tag = 1//buy
        }else if sender.tag == 2{
            //scene
            scene = SCNScene(named: "Flower1.usdz")
            scene?.rootNode.addChildNode(lightNode)
            sceneView.scene = scene
            //item
            itemTitle.text = items[0].title[2]
            itemDescription.text = items[0].descriptions[2]
            buyButton.tag = 2//buy
        }else if sender.tag == 3{
            //scene
            scene = SCNScene(named: "Pot2.usdz")
            scene?.rootNode.addChildNode(lightNode)
            sceneView.scene = scene
            //item
            itemTitle.text = items[0].title[3]
            itemDescription.text = items[0].descriptions[3]
            buyButton.tag = 3//buy
        }else{
            //scene
            scene = SCNScene(named: "Pot3.usdz")
            scene?.rootNode.addChildNode(lightNode)
            sceneView.scene = scene
            //item
            itemTitle.text = items[0].title[4]
            itemDescription.text = items[0].descriptions[4]
            buyButton.tag = 4//buy
        }
    }
}
extension ShopController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt index: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
//collectionView end

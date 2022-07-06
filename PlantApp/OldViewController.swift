//
//  ViewController.swift
//  PlantApp
//
//  Created by LAU Wing Yin and LAU Ka Pui.
//

//info.plist
//add "Privacy - Camera Usage Description", and its value is "$(PRODUCT_NAME) AR needs to use the camera"
//add value "arkit" of item1 under the "Required device capabilities"
//add "NSPhotoLibraryAddUsageDescription", and its value is "$(PRODUCT_NAME) would like to share image"
//info.plist end

import UIKit
import RealityKit
import AVFoundation

class OldViewController: UIViewController {
    
    @IBOutlet var arView: ARView!//showRCProject
    
    var bgPlayer:AVAudioPlayer = AVAudioPlayer()//bgm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //showRCProject
        //repeat:
//        Experience.loadSceneAsync { [weak self] result in//origin: loadBoxAsync
//            switch result {
//            case .failure(let error):
//                print(error.localizedDescription)
//            case .success(let theModelName):
//                self?.arView.scene.anchors.append(theModelName)
//            }
//        }
        //once:
        let modelAnchor = try! Experience.loadScene()// Load the "Box" scene from the "Experience" Reality File
        arView.scene.anchors.append(modelAnchor)// Add the box anchor to the scene
        //showRCProject end
        
        //bgm
        let soundFilePath:String = Bundle.main.path(forResource: "sean", ofType: "mp3")!
        let fileURL:URL = URL(fileURLWithPath: soundFilePath)
        do{
            bgPlayer = try AVAudioPlayer(contentsOf: fileURL)
            bgPlayer.volume = 0.5
            bgPlayer.numberOfLoops = -1
            bgPlayer.play()
        }catch {
            print("error rading mp3")
        }
        //bgm end
        
        //addButton
        //setButtonFrame
        let rect1 = CGRect(x: 250, y: 400, width: 50, height: 50)
        let rect2 = CGRect(x: 250, y: 475, width: 50, height: 50)
        //capScnButton
        let capScnButton = UIButton(frame: rect1)
        capScnButton.setTitle("capScn", for: .normal)
        capScnButton.addTarget(self, action: #selector(capScn), for: .touchUpInside)
        let capScnButtonImage = UIImage(named: "Camera")
        capScnButton.setImage(capScnButtonImage , for: .normal)
        //cartButton
        let cartButton = UIButton(frame: rect2)
        cartButton.setTitle("cart", for: .normal)
        cartButton.addTarget(self, action: #selector(cart), for: .touchUpInside)
        let cartButtonImage = UIImage(named: "Cart")
        cartButton.setImage(cartButtonImage , for: .normal)
        //addButtonToView
        self.view.addSubview(capScnButton)
        self.view.addSubview(cartButton)
        //addButton end
        
    }
    
    //addButton
    @objc func capScn(sender: UIButton!) {
        guard let screenshot = self.view.screenshot() else {return}//capScn
        shareImage(screenshot: screenshot)//capScn
    }
    //capScn
    func shareImage(screenshot: UIImage){
        // Save or share
        DispatchQueue.main.async {
            let sharesheet = UIActivityViewController(activityItems: [screenshot], applicationActivities: nil)
            self.present(sharesheet, animated: true, completion: nil)
        }
    }
    //capScn end
    @objc func cart(sender: UIButton!) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OldShopHome")
        self.present(vc, animated: true, completion: nil)
    }
    //addButton end
    
}

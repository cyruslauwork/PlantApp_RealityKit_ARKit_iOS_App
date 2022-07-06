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

//passingDataToPreviousPage
//protocol DataDelegate {
//    func printThisString(string: Int, sender: UIButton!)
//}
//passingDataToPreviousPage end

class ViewController: UIViewController{
//                      ,DataDelegate {//passingDataToPreviousPage
    
//    @IBOutlet weak var refresh: UIButton!//passingDataToPreviousPage
    
    @IBOutlet weak var emoji: UIButton!
    
    //addButton
    @IBOutlet weak var capScnButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    //addButton end
    
    //hiddenMenu
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    @IBAction func menuButtonPressed(_ sender: Any) {
        if(menuView.isHidden == true){
            menuView.isHidden = false
        }else{
            menuView.isHidden = true
        }
    }
    //hiddenMenu end
    
    @IBOutlet var arView: ARView!//showRCProject
    
    var bgPlayer:AVAudioPlayer = AVAudioPlayer()//bgm
    
    //music:
    var check = true
    @IBOutlet weak var music: UIButton!
    @IBAction func music(sender: AnyObject) {
    check = !check
    if check == true && position == 0{
        music.setImage(UIImage(named: "kissTheRain"), for: .normal)
        bgPlayer.play()
    } else if check == true && position == -1{
        music.setImage(UIImage(named: "sean"), for: .normal)
        bgPlayer.play()
    } else if check == true && position == 1{
        music.setImage(UIImage(named: "isThisLove"), for: .normal)
        bgPlayer.play()
    } else {
        music.setImage(UIImage(named: "musicStop.png"), for: .normal)
        bgPlayer.stop()
    }
    }
    //music end
    
    //removeRCProject
    @IBOutlet weak var removeButton: UIButton!
    @IBAction func removeButtonPressed(_ sender: Any) {
        let controller = UIAlertController(title: "Remove this plant?", message: "You can't undo this action.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Remove", style: .default) { (_) in
           print("Removed")
            self.arView.scene.removeAnchor(self.modelAnchor)
        }
        controller.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        present(controller, animated: true, completion: nil)
    }
    //removeRCProject end
    
    //goldAmount
    @IBOutlet weak var goldAmount: UILabel!
    var gold = 10
    //goldAmount end
    
    //sunPressed
    @IBOutlet weak var sunTask: UILabel!
    @IBOutlet weak var sunButtonAppend: UIButton!
    @IBOutlet weak var sunButton: UIButton!
    @IBAction func sunButtonPressed(_ sender: Any) {
        sunButtonAppend.setImage(UIImage(named: "Correct"), for: .normal)
        sunTask.isHidden = true
        gold = gold + 1
        goldAmount.text = "\(gold)"
//        let directionalLight = DirectionalLight()
//        directionalLight.light.color = .red
//        directionalLight.light.intensity = 20000
//        directionalLight.light.isRealWorldProxy = true
//        directionalLight.shadow?.maximumDistance = 10.0
//        directionalLight.shadow?.depthBias = 5.0
//        directionalLight.orientation = simd_quatf(angle: -.pi/1.5,
//                                                   axis: [0,1,0])
//        let pointLight = PointLight()
//        pointLight.light.color = .systemOrange
//        pointLight.light.intensity = 10000000
//        pointLight.light.attenuationRadius = 7.0
//        pointLight.position = [0,0,7]
//        let spotLight = SpotLight()
//        spotLight.light.color = .green
//        spotLight.light.intensity = 2500000
//        spotLight.light.innerAngleInDegrees = 70
//        spotLight.light.outerAngleInDegrees = 120
//        spotLight.light.attenuationRadius = 9.0
//        spotLight.shadow = SpotLightComponent.Shadow()
//        spotLight.position.y = 5.0
//        spotLight.orientation = simd_quatf(angle: -.pi/1.5,
//                                            axis: [1,0,0])
        self.arView.environment.lighting.intensityExponent = 1
        sunButton.isEnabled = false
    }
    //sunPressed end
    
    //wateringPressed
    @IBOutlet weak var wateringTask: UILabel!
    @IBOutlet weak var wateringButtonAppend: UIButton!
    @IBOutlet weak var wateringButton: UIButton!
    @IBAction func wateringButtonPressed(_ sender: Any) {
        wateringButtonAppend.setImage(UIImage(named: "24"), for: .normal)
        emoji.setImage(UIImage(named: "LaughEmoji"), for: .normal)
        wateringTask.isHidden = true
        gold = gold + 1
        goldAmount.text = "\(gold)"
        arView.scene.anchors.append(modelAnchor2)
//        //remove the old one from the scene
//        arView.scene.anchors.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.arView.scene.removeAnchor(self.modelAnchor2)
        }
        wateringButton.isEnabled = false
    }
    //wateringPressed end
    
    //showRCProject
    //once:
    var modelAnchor = try! Experience.loadScene()// Load the "Box" scene from the "Experience" Reality File
    var modelAnchor2 = try! Experience.loadScene2()
    //showRCProject end
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.isHidden = true//hiddenMenu
        
        //swipeView
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeRight.direction = .right
        self.music.addGestureRecognizer(swipeRight)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeLeft.direction = .left
        self.music.addGestureRecognizer(swipeLeft)
        //swipeView end
        
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
        arView.environment.lighting.intensityExponent = -1
        arView.scene.anchors.append(modelAnchor)// Add the box anchor to the scene
        //showRCProject end
        
        //bgm
        let soundFilePath:String = Bundle.main.path(forResource: "kissTheRain", ofType: "mp3")!
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
//        let rect1 = CGRect(x: 250, y: 350, width: 50, height: 50)
//        let rect2 = CGRect(x: 250, y: 425, width: 50, height: 50)
//        //capScnButton
//        let capScnButton = UIButton(frame: rect1)
        capScnButton.setTitle("capScn", for: .normal)
        capScnButton.addTarget(self, action: #selector(capScn), for: .touchUpInside)
        let capScnButtonImage = UIImage(named: "Camera")
        capScnButton.setImage(capScnButtonImage , for: .normal)
//        //cartButton
//        let cartButton = UIButton(frame: rect2)
        cartButton.setTitle("cart", for: .normal)
        cartButton.addTarget(self, action: #selector(cart), for: .touchUpInside)
        let cartButtonImage = UIImage(named: "Cart")
        cartButton.setImage(cartButtonImage , for: .normal)
//        //addButtonToView
//        self.view.addSubview(capScnButton)
//        self.view.addSubview(cartButton)
        //addButton end
        
        //passingDataToPreviousPage
//        refresh.addTarget(self, action: #selector(printThisString), for: .touchUpInside)
        //passingDataToPreviousPage
    }
    
    //passingDataToPreviousPage
//    @objc func printThisString(string: Int, sender: UIButton!) {
//        print(string)//error...abandoned...
//        self.arView.scene.removeAnchor(self.modelAnchor)
//        //add new 3d item...
//    }
    //passingDataToPreviousPage end
    
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
        let vc = storyboard.instantiateViewController(withIdentifier: "shopHome")
        self.present(vc, animated: true, completion: nil)
    }
    //addButton end
    
    //swipeView
    var position = 0
    @objc
    func swipeFunc(gesture: UISwipeGestureRecognizer){
        if gesture.direction == .right && position == 0{
            print("swiped right")
            music.setImage(UIImage(named: "isThisLove"), for: .normal)
            let soundFilePath:String = Bundle.main.path(forResource: "isThisLove", ofType: "mp3")!
            let fileURL:URL = URL(fileURLWithPath: soundFilePath)
            do{
                bgPlayer = try AVAudioPlayer(contentsOf: fileURL)
                bgPlayer.volume = 0.5
                bgPlayer.numberOfLoops = -1
                bgPlayer.play()
            }catch {
                print("error rading mp3")
            }
            position = 1
        } else if gesture.direction == .left && position == 0{
            print("swiped left")
            music.setImage(UIImage(named: "sean"), for: .normal)
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
            position = -1
        } else if gesture.direction == .left && position == 1{
            print("swiped left")
            music.setImage(UIImage(named: "kissTheRain"), for: .normal)
            let soundFilePath:String = Bundle.main.path(forResource: "kissTheRain", ofType: "mp3")!
            let fileURL:URL = URL(fileURLWithPath: soundFilePath)
            do{
                bgPlayer = try AVAudioPlayer(contentsOf: fileURL)
                bgPlayer.volume = 0.5
                bgPlayer.numberOfLoops = -1
                bgPlayer.play()
            }catch {
                print("error rading mp3")
            }
            position = 0
        } else if gesture.direction == .right && position == -1{
            print("swiped right")
            music.setImage(UIImage(named: "kissTheRain"), for: .normal)
            let soundFilePath:String = Bundle.main.path(forResource: "kissTheRain", ofType: "mp3")!
            let fileURL:URL = URL(fileURLWithPath: soundFilePath)
            do{
                bgPlayer = try AVAudioPlayer(contentsOf: fileURL)
                bgPlayer.volume = 0.5
                bgPlayer.numberOfLoops = -1
                bgPlayer.play()
            }catch {
                print("error rading mp3")
            }
            position = 0
        }
    }
    //swipeView end
    
}

//capScn
extension UIView{
    func screenshot() -> UIImage?{
        let scale = UIScreen.main.scale
        let bounds = self.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
        if let _ = UIGraphicsGetCurrentContext(){
            self.drawHierarchy(in: bounds, afterScreenUpdates: true)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return screenshot
        }
        return nil
    }
}
//capScn end

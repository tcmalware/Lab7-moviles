//
//  ViewController1.swift
//  ProjectMVVM
//
//  Created by MAC42 on 7/05/22.
//

import UIKit
class ViewController1: UIViewController{
    var profile : Profile? = nil
    let profileViewModel : ProfileViewModel = ProfileViewModel()
    
    @IBOutlet weak var IblPicture: UIImageView!
    @IBOutlet weak var IblName: UILabel!
    @IBOutlet weak var IblLastName: UILabel!
    @IBOutlet weak var IblFullName: UILabel!
    @IBOutlet weak var IblPhone: UILabel!
    @IBOutlet weak var IblEmail: UILabel!
    @IBOutlet weak var IblCountry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await setUpView()
        }
    }
    func setUpView() async {
        await profileViewModel.getDataFromAPI()
        profile = profileViewModel.profile
        setUpData()
        
    }
    func setUpData()   {
        IblPicture.layer.cornerRadius = IblPicture.frame.size.width/2
        IblFullName.text = (profile?.firstName)!+" "+(profile?.lastName)!
        IblEmail.text = profile?.email
        IblPhone.text = profile?.phone
        IblCountry.text=profile?.location.country
        IblPicture.image = HelperImage.setImageFromUrl(url:(profile?.picture)!)
        
    }
}

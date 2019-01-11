//
//  CeldaEmpleadosTableViewCell.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 gs. All rights reserved.
//

import UIKit

class CeldaEmpleadosTableViewCell: UITableViewCell {

    @IBOutlet weak var puestoCl: UILabel!
    @IBOutlet weak var nombreCl: UILabel!
    @IBOutlet weak var btnVerRutaOutlet: UIButton!
   
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  NuevoEmpleadoViewController.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 gs. All rights reserved.
//

import UIKit
import CoreData
class NuevoEmpleadoViewController: UIViewController {

    
    @IBOutlet weak var txtNombreEmpleado: UITextField!
    @IBOutlet weak var txtCargoEmpleado: UITextField!
    @IBOutlet weak var txtTelefonoEmpleado: UITextField!
    @IBOutlet weak var txtNumeroEmpleado: UITextField!
    @IBOutlet weak var txtEmailEmpleado: UITextField!
    @IBOutlet weak var dtvFechaNacimiento: UIDatePicker!
    
    @IBAction func btnGuardarEmpleado(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        
        
//                let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TblEmpleado")
//                let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
//        
//                do {
//                    try context.execute(deleteRequest)
//                    try context.save()
//                } catch {
//                    print ("There was an error")
//                }
//        
        
        
        let empleado = TblEmpleado(context: context)
        empleado.nombre = txtNombreEmpleado.text;
        empleado.cargoEmpleado = txtCargoEmpleado.text;
        empleado.telefono = Int64(txtTelefonoEmpleado.text!)!
        empleado.numeroempleado = Int64(txtTelefonoEmpleado.text!)!
        empleado.correoelectronico = txtEmailEmpleado.text;
        empleado.fechanacimiento = dtvFechaNacimiento.date
        empleado.idEmpleado = UUID()//.uuidString
        appDelegate.saveContext()
        
        let alerta: UIAlertController = UIAlertController.init(title: "Exito", message: "Empleado agregado", preferredStyle: UIAlertController.Style.alert);
        let okAlerta: UIAlertAction = UIAlertAction.init(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil);
        
        alerta.addAction(okAlerta)
        self.present(alerta, animated: true, completion: nil);
        
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

     
       
        

       
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

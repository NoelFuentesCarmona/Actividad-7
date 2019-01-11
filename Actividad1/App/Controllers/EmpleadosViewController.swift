//
//  EmpleadosViewController.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 gs. All rights reserved.
//

import UIKit

class EmpleadosViewController: UIViewController {

    var rowselected : Empleado?
    var isSelected : Bool = false;
    var arrayEmpledos : [Empleado]?
    var bandera : Bool = false ;
  
    @IBOutlet weak var tblEmpleado: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
            arrayEmpledos = GetInfoBD.init().GetDataEmpleadosBD()
       self.tblEmpleado.dataSource = self
      self.tblEmpleado.delegate = self

       
    }
    
    @IBAction func btnVerRuta(_ sender: UIButton) {
       
        
        guard let cell = sender.superview?.superview as? CeldaEmpleadosTableViewCell else {
            return // or fatalError() or whatever
        }
        
        let indexPath = tblEmpleado.indexPath(for: cell)
        
        rowselected = arrayEmpledos![indexPath!.row];
     //  print(indexPath)
     //   print(tblEmpleado.indexPathForSelectedRow)
        
               self.performSegue(withIdentifier: "detailsRuta", sender: nil)
      
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsRuta" {// print("prepare \(segue.identifier)")
            if let vcd = segue.destination as? RutaDetailsViewController{
                vcd.empleado = rowselected
                
                }
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        switch identifier {
        case "detailsRuta":
            
          //  print("shoult \(identifier) \(tblEmpleado.indexPathForSelectedRow)")
            rowselected  = arrayEmpledos![(tblEmpleado.indexPathForSelectedRow?.row)!];
            
            return (rowselected?.cargo == "Jefe de cobranza")

        default:
            return true
        }

    }
  
    
    override func viewWillAppear(_ animated: Bool) {
//        print("2. La vista va aparecer")
    }
    
    override func viewDidAppear(_ animated: Bool) {
         arrayEmpledos = GetInfoBD.init().GetDataEmpleadosBD()
        self.tblEmpleado.reloadData()
    }
    
}
extension EmpleadosViewController
: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //arrayContactos.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Empleados"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayEmpledos!.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CeldaEmpleado", for: indexPath) as! CeldaEmpleadosTableViewCell
        
      
        celda.nombreCl.text = arrayEmpledos![indexPath.row].nombre
        
        celda.puestoCl.text = arrayEmpledos![indexPath.row].cargo
        
        
       

        
        
        if arrayEmpledos![indexPath.row].cargo  == "Jefe de cobranza"
    {  celda.backgroundColor = .yellow;
        
       
    }else{
         celda.btnVerRutaOutlet.isHidden=true
        }
    return celda
    }
    
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        rowselected = arrayEmpledos![indexPath.row];
//// rowselected = arrayEmpledos![indexPath.row];
////performSegue(withIdentifier: "detailsRuta", sender: nil)
//        print("didselect")
//        print(indexPath)
//    }



    
    
    
}

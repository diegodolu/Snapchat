//
//  ViewController.swift
//  BejaranoSnapchat
//
//  Created by Diego Bejarano on 16/10/24.
//

import UIKit
import FirebaseAuth

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
//        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {
//            (user, error) in
//            print("Intentando Iniciar Sesión")
//            if error != nil {
//                print("Se presentó el siguiente error: \(error)")
//            } else {
//                print("Inicio de sesión exitoso")
//            }
//        }
        
        Auth.auth().signInAnonymously { authResult, error in
            if let error = error {
                // Maneja el error si ocurre
                print("Error al iniciar sesión anónima: \(error.localizedDescription)")
                return
            }
            
            // Si el inicio de sesión es exitoso, puedes acceder al usuario autenticado
            if let user = authResult?.user {
                guard let user = authResult?.user else { return } // true
                let uid = user.uid
                print("Inicio de sesión anónimo exitoso. ID del usuario: \(uid)")
                
                // Puedes guardar el ID del usuario, realizar otras acciones necesarias,
                // como navegar a otra pantalla o mostrar información al usuario.
            }
        }
    }

}


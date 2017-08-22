//: Playground - noun: a place where people can play

import UIKit
/*
var str = "Hello, playground"

//tratamento de erros

enum AccessError:Error{
    case wrongPassword
    case wrongLogin
    case wrongData
}

func login(userName:String,password:String) throws -> String{
    let validUser="alunofiap"
    let validPaddword="123456"
    
    if userName != validUser && password != validPaddword{
        throw AccessError.wrongData
    }else if userName != validUser{
        throw AccessError.wrongLogin
    }else if password != validPaddword{
        throw AccessError.wrongPassword
    }else{
        return "usuario logado com sucesso"
    }
}

do{
    let result=try login(userName: "alunofiap", password: "123456")
}catch AccessError.wrongData{
    print("Usuario e senha inválidos")
}catch AccessError.wrongPassword{
    print("Senha inválidos")
}catch AccessError.wrongLogin{
    print("Usuario inválidos")
}catch{
    print("Erro desconhecido")
}




do{
    let result=try login(userName: "alunofiap", password: "123456")
}catch{
    switch error as! AccessError {
    case .wrongData:
        print("Usuario e senha invalidos")
    case .wrongPassword:
        print("Senha invalidos")
    case .wrongLogin:
        print("Usuario invalidos")
    }
}


//Generics
let array=["Eric", "Brito"]

func swapInts(a: inout Int, b: inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}

var x = 10
var y = 20

swapInts(a: &x, b: &y)
print(x, y)

func swapValues<T>(a: inout T, b: inout T){ //trabalha com tip generic
    let temporaryA = a
    a = b
    b = temporaryA
}

var z = "Eu"
var w = "Voces"

swapValues(a: &z, b:&w)
print(z,w)


*/


//Orientacao a objetos
class Vehicle{

    //propriedade armazenada (stored property)
    var _speed:UInt=0
    var model:String
    var speed:UInt{
        get{return _speed}
        set{
            let finalSpeed = min(maxSpeed, newValue)
            _speed = finalSpeed
        }
    }
    
    //propriedade de classe **Acesso a essa let sem instanciar a classe
    static let speedUnit="km/h"
    
    //propriedade computada (computed property)
    var currentSpeed:String{
        //return "\(speed) km/h"
        return "\(speed) \(Vehicle.speedUnit)"
    }
    
    var maxSpeed: UInt{
        return 250
    }
    
    init(model:String){
        self.model = model
    }
    
    //metodo de instancia
    func descript() -> String {
        return "Veiculo: \(model), velocidade: \(speed)"
    }
    
    //metodo de classe
    func alert(){
        print("se beber, pode ate dirigir mas eu não vou junto")
    }
    
}


print("A unidade utilizada em vehicle é \(Vehicle.speedUnit)")

var vehicle=Vehicle(model: "ferrari")
vehicle.speed = 600
print(vehicle.speed)
print(vehicle.descript())
vehicle.alert()



/* controle de acessos
    open --> mae joana
    public --> pouco mais abaixo que open
    internal --> padrao, aberto
    private --> privado daquela classe, somente aquela classe tem acesso
    fileprivate --> qualquer classe q esteja no mesmo arquivo tem acesso
 */

/*
    designated initializer
    convenience initializer
 */


//carro herda de veiculo
class Car: Vehicle{
    var licensePlate:String
    var driver:String?
    
    subscript(index:Int)->String{
        get{
            let plateArray = Array(self.licensePlate.characters)
            return String (plateArray[index])
        }
        set{
            var plateArray = Array(self.licensePlate.characters)
            plateArray[index]=Character(newValue)
            self.licensePlate=String(plateArray)
        }
    }
    
    override var maxSpeed: UInt{
        return 150
    }
    
    init(model:String, licensePlate:String){
        self.licensePlate=licensePlate
        super.init(model: model)
    }
    convenience init(driver:String){
        self.init(model:"", licensePlate:"")
        self.driver=driver
    }
    
    override func descript() -> String {
        return "\(super.descript()), Placa: \(licensePlate)"
    }
}

var car = Car(model:"Fusca", licensePlate:"AMP7541")
car[6]="5"
print(car.licensePlate)

if car[6]=="1" || car[6]=="2" {
    print("Só depois das 20:00h")
}


//Extensoes e Protocolos
var name:String = "Patricia Alves"

extension String{
    var count:Int{
        return self.characters.count
    }
    func initials()->String{
        return self.components(separatedBy: " ").map({String($0.characters.first!)}).joined()
    }
}


print("O meu nome tem \(name.count) letras")
print("As minhas iniciais são \(name.initials())")


//protocol 
protocol ACCapable {
    var hasAC:Bool{get set}
    func turnAC(on: Bool)
}

extension Car:ACCapable{
    internal func turnAC(on: Bool) {
    
    }
    var hasAC:Bool {
        return true
    }
    
}



























class_protocol
该特性用于修饰一个协议表明该协议只能被类类型采用，如果你用objc特性修饰一个协议，class_protocol特性就会隐式地应用到该协议，因此无需显式地用class_protocol特性标记该协议。

exported

该特性用于修饰导入声明，以此来导出已导入的模块，子模块，或当前模块的声明。如果另一个模块导入了当前模块，那么那个模块可以访问当前模块的导出项。

final

该特性用于修饰一个类或类中的属性，方法，以及下标成员。如果用它修饰一个类，那么这个类则不能被继承。如果用它修饰类中的属性，方法或下标，则表示在子类中，它们不能被重写。

noreturn

该特性用于修饰函数或方法声明，表明该函数或方法的对应类型，T，是@noreturn T。你可以用这个特性修饰函数或方法的类型，这样一来，函数或方法就不会返回到它的调用者中去。

对于一个没有用noreturn特性标记的函数或方法，你可以将它重写(override)为用该特性标记的。相反，对于一个已经用noreturn特性标记的函数或方法，你则不可以将它重写为没使用该特性标记的。相同的规则试用于当你在一个comforming类型中实现一个协议方法时。

objc

该特性用于修饰任意可以在Objective-C中表示的声明，比如，非嵌套类，协议，类和协议中的属性和方法（包含getter和setter），初始化器，析构器，以下下标。objc特性告诉编译器该声明可以在Objective-C代码中使用。
如果你将objc特性应用于一个类或协议，它也会隐式地应用于那个类或协议的成员。对于标记了objc特性的类，编译器会隐式地为它的子类添加objc特性。标记了objc特性的协议不能继承自没有标记objc的协议。
objc特性有一个可选的参数，由标记符组成。当你想把objc所修饰的实体以一个不同的名字暴露给Objective-C，你就可以使用这个特性参数。你可以使用这个参数来命名类，协议，方法，getters，setters，以及初始化器。下面的例子把ExampleClass中enabled属性的getter暴露给Objective-C，名字是isEnabled，而不是它原来的属性名。

@objc
class ExampleClass {
    var enabled: Bool {
    @objc(isEnabled) get {
        // Return the appropriate value
    }
    }
}

auto_closure

这个特性通过自动地将表达式封闭到一个无参数闭包中来延迟表达式的求值。使用该特性修饰无参的函数或方法类型，返回表达式的类型。一个如何使用auto_closure特性的例子。

//你可以对函数类型应用带有参数类型()并返回表达式类型的auto_closure属性（见类型属性章节）。一个自动闭包函数捕获特定表达式上的隐式闭包而非表达式本身。下面的例子使用auto_closure属性来定义一个很简单的assert函数：
func simpleAssert(condition: @auto_closure () -> Bool, message: String){
    if !condition(){
        println(message)
    }
}
let testNumber = 5
simpleAssert(testNumber % 2 == 0, "testNumber isn't an even number.")
// prints "testNumber isn't an even number."

noreturn

该特性用于修饰函数或方法的类型，表明该函数或方法不会返回到它的调用者中去。你也可以用它标记函数或方法的声明，表示函数或方法的相应类型，T，是@noreturn T。
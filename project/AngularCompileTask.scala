import java.io.PrintWriter

class AngularCompileTask {

    def execute() {
        println("Je suis le compiler")
        val compiler: AngularCompiler = new AngularCompiler
        compiler.compile()
    }

}

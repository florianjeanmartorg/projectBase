import java.io.FileWriter
import java.util
import java.io.PrintWriter
import java.util.concurrent.{ExecutorService, Executors, TimeUnit}

import scalax.file.{Path, PathSet}

import de.neuland.jade4j.exceptions.JadeLexerException
import org.jcoffeescript._

class AngularCompiler {


    def compile() {

        val angular = Path.fromString("app/be/frontend")
        val folder = Path.fromString("public")

        val jades: PathSet[Path] = (angular / "js" ** "*.jade")
        val coffees: PathSet[Path] = (angular / "js" ** "*.coffee")

        List(jades, coffees).foreach { v =>
            compileFiles(v, folder)
        }
    }

    private def compileFiles(files: Iterable[Path], folder: Path): Unit = {
        val executor: ExecutorService = Executors.newFixedThreadPool(Runtime.getRuntime.availableProcessors() * 2 - 1)
        files.toList.foreach { v =>
            executor.execute(new Runnable {
                def run() {
                    compileFile(v, folder)
                }
            })
        }
        executor.shutdown()
        executor.awaitTermination(1, TimeUnit.HOURS)


    }

    private def compileFile(f: Path, folder: Path) {

        var targetExtension = ""
        val sourceExtension = f.path.split("\\.").last.toLowerCase

        if (sourceExtension == "coffee") {
            targetExtension = "js"
        }
        if (sourceExtension == "js") {
            targetExtension = "js"
        }
        if (sourceExtension == "jade") {
            targetExtension = "html"
        }
        if (sourceExtension == "html") {
            targetExtension = "html"
        }

        val targetPath = folder.path + f.path.replace("app/be/frontend", "").split("\\.")(0) + "." + targetExtension

        val tempFile = new java.io.File(targetPath)

        synchronized {
            tempFile.getParentFile.mkdirs()
        }


        if (tempFile.exists()) {
            println(" ====>> " + tempFile.exists() + " / " + tempFile.lastModified + "/" + f.lastModified)
        }
        else {
            println(" ====>> " + tempFile.exists())
        }
        if (tempFile.exists() && tempFile.lastModified >= f.lastModified) {
        } else {
            var result = ""
            println("[COMPILING] " + f.path)

            try {
                if (sourceExtension == "coffee") {
                    val source = scala.io.Source.fromFile(f.path).getLines().mkString("\n")
                    result = new JCoffeeScriptCompiler(util.Arrays.asList(Option.BARE)).compile(source)
                }

                if (sourceExtension == "js") {
                    val source = scala.io.Source.fromFile(f.path).getLines().mkString("\n")
                    result = source
                }

                if (sourceExtension == "jade") {
                    result = de.neuland.jade4j.Jade4J.render(f.path, null)
                }

                if (sourceExtension == "html") {
                    val source = scala.io.Source.fromFile(f.path).getLines().mkString("\n")
                    result = source
                }

                //write file
                val writer: PrintWriter = new PrintWriter(targetPath, "UTF-8")
                writer.print(result)
                writer.close

            } catch {
                case e: Exception =>
                    println("[ERROR] " + f.path + " : " + e.getClass.getName + " => " + e.getMessage + "\n" + e.getStackTraceString)
            }
        }
    }
}



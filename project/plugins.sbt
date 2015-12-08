// Comment to get more information during initialization
logLevel := Level.Warn

// The Typesafe repository
resolvers += "Typesafe repository" at "http://repo.typesafe.com/typesafe/releases/"

libraryDependencies += "com.google.code.maven-play-plugin.com.github.yeungda.jcoffeescript" % "jcoffeescript" % "1.0"

libraryDependencies += "de.neuland-bfi" % "jade4j" % "0.4.0"

// Use the Play sbt plugin for Play projects
addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.2.4")
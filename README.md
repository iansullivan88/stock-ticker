# Stock Ticker
A demonstration of using Haskell as a web socket server.

Accompanying blog post can be found [here](http://blog.scottlogic.com/2015/11/15/stock-ticker.html).

To compile and run the code, you will need a Haskell compiler. To make it simple, you would probably also want a package manager to manage dependencies. The [Haskell Platform](https://www.haskell.org/platform/) is a 'batteries included' download that contains the GHC compiler, cabal-install (the package manager) and various other libraries and tools.

Once installed, the code can be compiled and run with the following commands:

    cabal install --dependencies-only
    cabal run
  
To run the client, just open stock-ticker.html in a web browser that supports WebSockets.

(I've only tested this Ubuntu 14.04 and with GHC 7.8.3 although it *should* compile on other OSs with other versions of GHC).

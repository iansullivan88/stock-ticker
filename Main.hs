{-# LANGUAGE OverloadedStrings #-}

import System.Random
import Network.WebSockets
import Control.Concurrent
import Control.Monad
import Data.Text

type Price = (String, Double)

main :: IO ()
main = do
  chan <- newChan
  forkIO (notifyClients chan)
  runServer "127.0.0.1" 3000 $ \pc -> do
    conn <- acceptRequest pc
    c <- dupChan chan
    handleConnection conn c

notifyClients :: Chan Price -> IO ()
notifyClients chan = forever $ do
  prices <- getAllPrices
  forM_ prices (writeChan chan)
  threadDelay 1000000

handleConnection :: Connection -> Chan Price -> IO ()
handleConnection conn chan = forever $ do
  (symbol, price) <- readChan chan
  let message = pack (symbol ++ ":" ++ show price)
  sendTextData conn message

-- Just returns some random prices
getAllPrices :: IO [Price]
getAllPrices = mapM randomPrice ["IAN", "SUL", "BRAM", "CAT"] where
  randomPrice s = randomRIO (100, 200) >>= \p -> return (s, p)

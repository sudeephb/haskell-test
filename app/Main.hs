-- app/Main.hs
{-# LANGUAGE OverloadedStrings #-}

import Network.HTTP.Simple (httpLBS, parseRequest, getResponseBody)
import qualified Data.ByteString.Lazy as BL

main :: IO ()
main = do
    let url = "https://github.com/elm/bytes/zipball/1.0.8/"
    putStrLn $ "Downloading: " ++ url

    request  <- parseRequest url
    response <- httpLBS request

    let body   = getResponseBody response
        outFile = "elm-bytes-1.0.8.zip"

    BL.writeFile outFile body
    putStrLn $ "Saved to: " ++ outFile
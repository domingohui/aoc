import System.IO
import qualified Data.Map.Strict as Map
import Data.Set (Set)
import qualified Data.Set as Set

---------
-- part 1

existsToInt :: (Ord a) => a -> Set a -> Integer
existsToInt x xs =
  if Set.member x xs
  then 1
  else do 0

stringToCounts :: String -> (Integer, Integer)
stringToCounts str =
  let
    charToTuple c = (c, 1)
    char_counts = Map.fromListWith (+) (map charToTuple str)
    counts = Set.fromList (Map.elems char_counts)
  in
    ( (existsToInt 2 counts), (existsToInt 3 counts) )

process1 :: [String] -> Integer
process1 xs =
  let
    addTuple (a,b) (c,d) = (a+c, b+d)
    res = foldl addTuple (0, 0) (map stringToCounts xs)
  in
    (fst res) * (snd res)

---------
-- part 2

-- return duplicated elements in list
repeated :: Ord a => [a] -> [a]
repeated a =
  _repeated a Set.empty
  where _repeated xs seen =
          case xs of
            [] -> []
            x : rest ->
              if (Set.member x seen)
              then x : (_repeated rest seen)
              else do
                _repeated rest (Set.insert x seen)

process2 :: [(String, String)] -> String
process2 [] = error "No inputs"
process2 xs =
  -- Assume all strings have the same length
  if (length (snd (head xs))) == 0 then error "Shouldn't get here."
  else do
    case (repeated [ frt ++ (tail bk) | (frt, bk) <- xs ] ) of
      [] -> process2 [ ( frt ++ [head bk], tail bk ) | (frt, bk) <- xs ]
      res : _ -> res

------
readLines :: Handle -> IO [String]
readLines h = do
  s <- hGetContents h
  return $ lines s

main :: IO ()
main = do
  -- input: https://adventofcode.com/2018/day/2/input
  h <- openFile "day2.input" ReadMode
  xs <- readLines h
  print (process1 xs)
  print (process2 [(splitAt 0 x) | x <- xs ])

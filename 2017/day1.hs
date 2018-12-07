import Data.Char

captcha :: [(Int, Int)] -> Int
captcha xs = foldl takeIfEqual 0 xs
  where takeIfEqual acc (x, y) =
          case x `compare` y of
            EQ -> acc + x
            _ -> acc

shift :: [Int] -> Int -> [Int]
shift xs offset = second ++ first
  where (first, second) = splitAt offset xs

main :: IO ()
main = do
  input <- getLine
  let ints = map digitToInt input
  let offset = length ints `div` 2
  let shifted = shift ints offset
  print (captcha (zip ints shifted))

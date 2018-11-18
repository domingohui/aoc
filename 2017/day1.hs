import Data.Char

captcha :: [(Int, Int)] -> Int
captcha xs =
  let takeIfEqual x y =
        case x `compare` y of
          EQ -> x
          _ -> 0
  in
    case xs of
      (x, y) : rest -> takeIfEqual x y + captcha rest
      _ -> 0

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

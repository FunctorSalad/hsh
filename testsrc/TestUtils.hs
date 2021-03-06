{- 
Copyright (C) 2004-2007 John Goerzen <jgoerzen@complete.org>
Please see the COPYRIGHT file
-}

module TestUtils where
import Test.HUnit
import HSH

{- | Run each test three times in an attempt to check for race conditions
or nondeterministic behavior.  Not perfect, but it could help anyhow. -}

testcmd expected cmd =
    [tc "run1", tc "run2", tc "run3"]
    where tc runno = TestLabel runno $ TestCase $ do
                       r <- run cmd
                       assertEqual "run result" expected r

{-
testcmd expected cmd =
    do r <- run cmd
       r2 <- run cmd
       r3 <- run cmd
       assertEqual "expected" expected r
       assertEqual "run 2" expected r2
       assertEqual "run 3" expected r3
-}

cmdcase name expected cmd = TestLabel name $ TestList (testcmd expected cmd)

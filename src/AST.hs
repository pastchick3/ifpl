module AST where

data WithPos a = WithPos a Row Col deriving (Eq, Show)
newtype Row = Row Int deriving (Eq, Show)
newtype Col = Col Int deriving (Eq, Show)

data Token = TWord String
  | TInt Int
  | TFloat Double
  | TStr String
  | TIdent Int
  | TData
  | TPipe
  | T_
  | TLet
  | TIn
  | TCase
  | TOf
  | TArrow
  | TOr
  | TAnd
  | TEq
  | TNe
  | TLt
  | TGt
  | TLe
  | TGe
  | TAdd
  | TSub
  | TMul
  | TDiv
  | TNot
  | TLParen
  | TRParen
  | TLBracket
  | TRBracket
  | TComma
  deriving (Eq, Show)

newtype Prog = Prog [Def] deriving (Eq, Show)
data Def = Data UpperVar [[UpperVar]]
  | Func LowerVar [Pat] [(Maybe Expr, Expr)]
  deriving (Eq, Show)
newtype UpperVar = UpperVar String deriving (Eq, Show)
newtype LowerVar = LowerVar String deriving (Eq, Show)
data Pat = PVar LowerVar
  | PInt Int
  | PFloat Float
  | PStr String
  | PData UpperVar [Pat]
  | P_
  deriving (Eq, Show)
data Expr = EGroup Expr
  | ELet [(Pat, Expr)] Expr
  | ECase Expr [([Pat], [(Maybe Expr, Expr)])]
  | EInfix Expr Token Expr
  | EPrefix Token Expr
  | EApp Expr Expr
  | EVar LowerVar
  | EInt Int
  | EFloat Double
  | EStr String
  | EData UpperVar [Expr]
  | EList [Expr]
  | ETuple [Expr]
  deriving (Eq, Show)

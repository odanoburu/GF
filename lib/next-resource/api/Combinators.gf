--1 Combinators: a High-Level Syntax API

-- This module defines some "grammatical functions" that give shortcuts to
-- typical constructions. [``Constructors`` Constructors.html] and the
-- language-specific ``Paradigms`` modules are usually needed
-- to construct arguments of these functions.

incomplete resource Combinators = open Grammar in {

  oper

--2 Predication

    pred : overload {
      pred : V  -> NP -> Cl ;             -- x converges
      pred : V2 -> NP -> NP -> Cl ;       -- x intersects y
      pred : V3 -> NP -> NP -> NP -> Cl ; -- x intersects y at z
      pred : V  -> NP -> NP -> Cl ;       -- x and y intersect
      pred : A  -> NP -> Cl ;             -- x is even
      pred : A2 -> NP -> NP -> Cl ;       -- x is divisible by y
      pred : A  -> NP -> NP -> Cl ;       -- x and y are equal
      pred : N  -> NP -> Cl ;             -- x is a maximum
      pred : CN -> NP -> Cl ;             -- x is a local maximum
      pred : NP -> NP -> Cl ;             -- x is the neutral element
      pred : N  -> NP -> NP -> Cl ;       -- x and y are inverses 
      pred : Adv -> NP -> Cl ;            -- x is in scope
      pred : Prep -> NP -> NP -> Cl       -- x is outside y
      } ;

--2 Function application

    app : overload {
      app : N  -> NP ;
      app : N2 -> NP -> NP ; 
      app : N3 -> NP -> NP -> NP ;
      app : N2 -> NP -> NP -> NP ;
      app : N2 -> N  -> CN ;

      app : N2 -> NP -> CN ;         -- divisor of x
      app : N3 -> NP -> NP -> CN ;   -- path from x to y
      app : N2 -> NP -> NP -> CN ;   -- path between x and y
      } ;

--2 Coordination

    coord : overload {
      coord : Conj  -> Adv -> Adv -> Adv ;
      coord : Conj  -> AP -> AP -> AP ;
      coord : Conj  -> NP -> NP -> NP ;
      coord : Conj  -> S  -> S  -> S ;
      coord : Conj  -> ListAdv -> Adv ;
      coord : Conj  -> ListAP -> AP ;
      coord : Conj  -> ListNP -> NP ;
      coord : Conj  -> ListS  -> S ;

      } ;

--2 Modification

    mod : overload {
      mod : A -> N -> CN ;
      mod : AP -> CN -> CN ;
      mod : AdA -> A -> AP ;
      mod : Det -> N -> NP ;
      mod : Det -> CN -> NP ;
      mod : Quant -> N -> NP ;
      mod : Quant -> CN -> NP ;
      mod : Predet -> N -> NP ;
      mod : Numeral -> N -> NP


      } ;

--2 Negation

    neg : overload {
      neg : Imp -> Utt ;
      neg : Cl -> S ;
      neg : QCl -> QS ;
      neg : RCl -> RS 
    };

--2 Text append

-- This is not in ground API, because it would destroy parsing.

    appendText : Text -> Text -> Text ;

--.

    pred = overload {
      pred : V  -> NP -> Cl
                                       = \v,np -> PredVP np (UseV v) ;
      pred : V2 -> NP -> NP -> Cl
                                       = \v,np,ob -> PredVP np (ComplSlash (SlashV2a v) ob) ;
      pred : V3 -> NP -> NP -> NP -> Cl 
                                       = \v,np,ob,ob2 -> 
                                          PredVP np (ComplSlash (Slash2V3 v ob) ob2) ;
      pred : V  -> NP -> NP -> Cl
                                       = \v,x,y -> PredVP (ConjNP and_Conj (BaseNP x y)) (UseV v) ;
      pred : A  -> NP -> Cl 
                                       = \a,np -> PredVP np (UseComp (CompAP (PositA a))) ;
      pred : A2 -> NP -> NP -> Cl
                                       = \a,x,y -> PredVP x (UseComp (CompAP (ComplA2 a y))) ;
      pred : A  -> NP -> NP -> Cl      
                                       = \a,x,y -> PredVP (ConjNP and_Conj (BaseNP x y)) (UseComp (CompAP (PositA a))) ;
      pred : N -> NP -> Cl
                                       = \n,x -> PredVP x (UseComp (CompNP (DetArtSg (IndefArt) (UseN n)))) ;
      pred : CN -> NP -> Cl
                                       = \n,x -> PredVP x (UseComp (CompNP (DetArtSg (IndefArt) n))) ;
      pred : NP -> NP -> Cl
                                       = \n,x -> PredVP x (UseComp (CompNP n)) ;      pred : N2 -> NP -> NP -> Cl 
                                       = \n,x,y -> PredVP x (UseComp (CompNP (DetArtSg (IndefArt) (ComplN2 n y)))) ;
      pred : N -> NP -> NP -> Cl 
                                       = \n,x,y -> PredVP (ConjNP and_Conj (BaseNP x y)) (UseComp (CompNP (DetArtPl (IndefArt) (UseN n)))) ;
      pred : Adv -> NP -> Cl 
                                       = \a,x -> PredVP x (UseComp (CompAdv a)) ;
      pred : Prep -> NP -> NP -> Cl        
                                       = \p,x,y -> PredVP x (UseComp (CompAdv (PrepNP p y)))

      } ;

    app = overload {
      app : N  -> NP
                                       = \n -> (DetArtSg (DefArt) (UseN n)) ;
      app : N2 -> NP -> NP 
                                       = \n,x -> (DetArtSg (DefArt) (ComplN2 n x)) ;
      app : N3 -> NP -> NP -> NP
                                       = \n,x,y -> (DetArtSg (DefArt) (ComplN2 (ComplN3 n x) y)) ;
      app : N2 -> NP -> NP -> NP
                                       = \n,x,y -> (DetArtSg DefArt (ComplN2 n (ConjNP and_Conj (BaseNP x y)))) ;
      app : N2 -> N -> CN
                                       = \f,n -> ComplN2 f (DetArtPl (IndefArt) (UseN n)) ;

      app : N2 -> NP -> CN = ComplN2 ;
      app : N3 -> NP -> NP -> CN = \n,x,y -> ComplN2 (ComplN3 n x) y ; 
      app : N2 -> NP -> NP -> CN = \n,x,y -> 
        ComplN2 n (ConjNP and_Conj (BaseNP x y)) ;
      } ;

    coord = overload {
      coord : Conj -> Adv -> Adv -> Adv
                                        = \c,x,y -> ConjAdv c (BaseAdv x y) ;
      coord : Conj -> AP -> AP -> AP
                                        = \c,x,y -> ConjAP c (BaseAP x y) ;
      coord : Conj -> NP -> NP -> NP
                                        = \c,x,y -> ConjNP c (BaseNP x y) ;
      coord : Conj -> S  -> S  -> S  
                                        = \c,x,y -> ConjS c (BaseS x y) ;
      coord : Conj -> ListAdv -> Adv
                                        = \c,xy -> ConjAdv c xy ;
      coord : Conj -> ListAP -> AP
                                        = \c,xy -> ConjAP c xy ; 
      coord : Conj -> ListNP -> NP
                                        = \c,xy -> ConjNP c xy ;
      coord : Conj -> ListS  -> S  
                                        = \c,xy -> ConjS c xy
      } ;

    mod = overload {
      mod : A -> N -> CN
                                  = \a,n -> AdjCN (PositA a) (UseN n) ;
      mod : AP -> CN -> CN
                                  = \a,n -> AdjCN a n ;
      mod : AdA -> A -> AP
                                  = \m,a -> AdAP m (PositA a) ;

      mod : Det -> N -> NP 
	                          = \d,n -> DetCN d (UseN n) ;
      mod : Det -> CN -> NP 
	                          = \d,n -> DetCN d n ;
      mod : Quant -> N -> NP
                                  = \q,n -> DetCN (DetQuant (q) NumSg) (UseN n) ;
      mod : Quant -> CN -> NP
                                  = \q,n -> DetCN (DetQuant (q) NumSg) n ;
      mod : Predet -> N -> NP 
                                  = \q,n -> PredetNP q (DetArtPl (IndefArt)  (UseN n)) ;
      mod : Numeral -> N -> NP
                                  = \nu,n -> DetCN (DetArtCard (IndefArt) (NumNumeral nu)) (UseN n)

      } ;

    neg = overload {
      neg : Imp -> Utt 
	                 = UttImpSg PNeg ;
      neg : Cl -> S 
	                 = UseCl TPres ASimul PNeg;
      neg : QCl -> QS 
	                 = UseQCl TPres ASimul PNeg;
      neg : RCl -> RS 
	                 = UseRCl TPres ASimul PNeg
    };

-- This is not in ground API, because it would destroy parsing.

    appendText : Text -> Text -> Text 
                = \x,y -> {s = x.s ++ y.s ; lock_Text = <>} ;

}

# SPDX-License-Identifier: GPL-2.0-or-later
# DerivedCategories: Derived categories of Abelian categories
#
# Declarations
#
##
##  Functors
##
#############################################################################

DeclareAttribute( "HomFunctorAttr",
        IsExceptionalCollection );

#! @Description
#!  The argument is an exceptional collection <A>E</A> which is defined by some full
#!  subcategory generated by finite number of objects $(E_i)_i$ in some category $C$
#!  with homomorphism structure. The output is the functor
#!  $\mathrm{Hom}(\oplus_i E_i,-):C \to \mathrm{mod}\mbox{-}\mathrm{End}(\oplus_i E_i)$.
#! @Arguments collection
#! @Returns a functor
DeclareOperation( "HomFunctor",
        [ IsExceptionalCollection ] );

#! @Description
#!  The argument is an exceptional collection <A>E</A> which is defined by some full
#!  subcategory generated by finite number of objects $(E_i)_i$ in a category of quiver
#!  representations $C$. The output is the functor $\mathrm{Hom}(\oplus_i E_i,-)$:
#!  <C>FullSubcategoryGeneratedByIndecInjectiveObjects</C>$(C)
#!  \to \mathrm{mod}\mbox{-}\mathrm{End}(\oplus_i E_i)$.
#! @Arguments collection
#! @Returns a functor
DeclareAttribute( "HomFunctorOnIndecInjectiveObjects",
        IsExceptionalCollection );

#! @Description
#!  The argument is an exceptional collection <A>E</A> which is defined by some
#!  full subcategory generated by finite number of objects
#!  $(E_i)_i$ in a category of quiver representations $C$. The output is the functor
#!  $\mathrm{Hom}(\oplus_i E_i,-)$:<C>FullSubcategoryGeneratedByInjectiveObjects</C>$(C)
#!  \to \mathrm{mod}\mbox{-}\mathrm{End}(\oplus_i E_i)$.
#! @Arguments collection
#! @Returns a functor
DeclareAttribute( "HomFunctorOnInjectiveObjects",
        IsExceptionalCollection );


DeclareAttribute( "HomFunctorOnIndecProjectiveObjects",
        IsExceptionalCollection );

DeclareAttribute( "HomFunctorOnProjectiveObjects",
        IsExceptionalCollection );

DeclareAttribute( "HomFunctorOnDefiningCategory",
        IsExceptionalCollection );

DeclareAttribute( "HomFunctorOnBaseCategory",
        IsExceptionalCollection );


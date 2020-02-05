ReadPackage( "DerivedCategories", "examples/pre_settings.g" );
######################### start example #########################

S := GradedRing( HomalgFieldOfRationalsInSingular( ) * "x0,x1" );

BB := BeilinsonFunctor( S );

Ho_reps := AsCapCategory( Range( BB ) );
Ch_reps := UnderlyingCategory( Ho_reps );
reps := DefiningCategory( Ho_reps );

#################################

eq := EquivalenceFromFullSubcategoryGeneratedByProjectiveObjectsIntoAdditiveClosureOfIndecProjectiveObjects( reps );
eq := ExtendFunctorToHomotopyCategories( eq );
Loc := PreCompose( LocalizationFunctorByProjectiveObjects( HomotopyCategory( reps ) ), eq );

################ create the collection o(-2), o(-1) #####################

name_for_quiver := "quiver{𝓞 (-2) -{2}-> 𝓞 (-1)}";
name_for_algebra := "End(⊕ {𝓞 (i)|i=-2,-1})";
o := TwistedGradedFreeModule( S, 0 );
L := List( [ -2, -1 ], i -> ApplyFunctor( PreCompose( BB, Loc ), o[ i ] ) );
collection := CreateExceptionalCollection( L : name_for_underlying_quiver := name_for_quiver,
                                              name_for_endomorphism_algebra := name_for_algebra
                                          );
################################################################################


################# Hom #################################
HH := HomFunctor( collection );
HP := HomFunctorOnAdditiveClosure( collection );
homotopy_HH := ExtendFunctorToHomotopyCategories( HP : name_for_functor := "Extension of Hom(T,-) to homotopy categories" );
########################################################

Ho_C := AsCapCategory( Source( HH ) );
Ch_C := UnderlyingCategory( Ho_C );
C := DefiningCategory( Ho_C ); # or AsCapCategory( Source( HP ) );

indec_C := UnderlyingCategory( C ); # caching for this is crisp
DeactivateCachingForCertainOperations( indec_C, operations_to_deactivate );

D := AsCapCategory( Range( HH ) );
homotopy_D := HomotopyCategory( D );
chains_D := UnderlyingCategory( homotopy_D );

##########################################################
inc := InclusionFunctor( indec_C );
inc := ExtendFunctorToAdditiveClosureOfSource( inc );
inc := ExtendFunctorToHomotopyCategories( inc : name_for_functor := "Extension the inclusion functor to homotopy categories" );
##########################################################


################### Tensor ###############################
TP := TensorFunctorOnProjectiveObjects( collection );

homotopy_TT := PreCompose( LocalizationFunctorByProjectiveObjects( homotopy_D ), ExtendFunctorToHomotopyCategories( TP ) );

Conv := ConvolutionFunctor( collection );

##########################################################

# this can be applied on objects and morphisms
cell_func := cell -> PreCompose( [ homotopy_HH, homotopy_TT, Conv ] )( cell );


b := RANDOM_CHAIN_COMPLEX( Ch_reps, -4, 4, 3 );
b := ApplyFunctor( Loc, b/Ho_reps );

quit;

b;
conv_b := cell_func( b );

inc_b := inc( b );
inc_conv_b := inc( conv_b );

HomologySupport( inc_conv_b );
HomologySupport( inc_b );


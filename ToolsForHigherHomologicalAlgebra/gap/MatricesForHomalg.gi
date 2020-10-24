




##
InstallOtherMethod( RandomMatrix,
          [ IsInt, IsInt, IsHomalgRing ],
          -1,
  function( m, n, R )
    local bool;
    
    if IsBound( R!.random_matrix_func ) then
      
      return R!.random_matrix_func( m, n );
      
    else
      
      TryNextMethod( );
      
    fi;
    
end );

##
InstallMethod( EntriesOfHomalgMatrixAttr,
          [ IsHomalgMatrix ],
  EntriesOfHomalgMatrix
);

##
InstallMethod( EntriesOfHomalgMatrixAsListListAttr,
          [ IsHomalgMatrix ],
  EntriesOfHomalgMatrixAsListList
);


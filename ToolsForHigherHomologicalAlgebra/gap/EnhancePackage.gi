




InstallValue( LIST_OF_ENHANCED_PACKAGES, [ ] );
InstallValue( LIST_OF_ENHANCABLE_PACKAGES,
  [
    "MatricesForHomalg",
    "RingsForHomalg",
    "GradedRingForHomalg",
    "FreydCategoriesForCAP",
    "ModulePresentationsForCAP",
    "Algebroids"
  ]
);

##
InstallMethod( EnhancePackage,
          [ IsString, IsString ],
          
  function( name, version )
    local lower_case_name;
    
    if name in LIST_OF_ENHANCED_PACKAGES then
      
      return true;
      
    fi;
    
    lower_case_name := LowercaseString( name );
    
    if IsPackageLoaded( lower_case_name, version ) then
      
      ReadPackage( "ToolsForHigherHomologicalAlgebra", Concatenation( "gap/", name, ".gd" ) );
      
      ReadPackage( "ToolsForHigherHomologicalAlgebra", Concatenation( "gap/", name, ".gi" ) );
      
      Add( LIST_OF_ENHANCED_PACKAGES, name );
      
      return true;
      
    else
      
      Print( "The package ", name, " should be loaded first!\n" );
      
      return false;
      
    fi;
    
end );

##
InstallOtherMethod( EnhancePackage,
          [ IsString ],
          
  name -> EnhancePackage( name, "0" )
  
);

##
InstallOtherMethod( EnhancePackage,
          [ IsList ],
          
  function( list )
    
    if ForAll( list, IsString ) then
      
      list := List( list, l -> [ l, "0" ] );
      
    fi;
    
    return List( list, l -> CallFuncList( EnhancePackage, l ) );
    
end );
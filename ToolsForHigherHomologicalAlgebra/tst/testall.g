# SPDX-License-Identifier: GPL-2.0-or-later
# ToolsForHigherHomologicalAlgebra: Tools for the Higher Homological Algebra project
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
options := rec(
    exitGAP := true,
    testOptions := rec(
        compareFunction := "uptowhitespace",
    ),
);

LoadPackage( "FreydCategoriesForCAP" );

TestDirectory( DirectoriesPackageLibrary( "ToolsForHigherHomologicalAlgebra", "tst" ), options );

FORCE_QUIT_GAP( 1 ); # if we ever get here, there was an error

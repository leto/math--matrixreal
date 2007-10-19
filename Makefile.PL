use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Math::MatrixReal',
    'DISTNAME'		=> 'Math-MatrixReal',
    'VERSION_FROM'	=> 'MatrixReal.pm',
    ($] >= 5.005 ?    
      (ABSTRACT => 'Manipulate Matrices of Real Numbers',
       AUTHOR     => 'Jonathan Leto <jonathan@leto.net>') : ()),
    'dist'		=> { COMPRESS=>"gzip -9", SUFFIX=>"gz" },
    'LIBS'		=> [''],   
    'DEFINE'		=> '',    
    'INC'		=> ''    
);

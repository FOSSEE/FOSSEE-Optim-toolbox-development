// Copyright (C) 2015 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Author: Harpreet Singh
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in

mode(-1)
lines(0)

toolbox_title = "FOSSEE_Optimization_Toolbox";

Build_64Bits = %t;

path_builder = get_absolute_file_path('builder_gateway_cpp.sce');

//Name of All the Functions
Function_Names = [
	'inter_fminunc', 'cpp_intfminunc';
	'inter_fminbnd', 'cpp_intfminbnd';
	'inter_fmincon', 'cpp_intfmincon';
	'sci_intqpipopt', 'cpp_intqpipopt';
	'sci_matrix_intlinprog', 'matrix_cppintlinprog';
	'sci_mps_intlinprog','mps_cppintlinprog';
	];

//Name of all the files to be compiled
Files = [
		'sci_iofunc.cpp',
  		'sci_minuncTMINLP.cpp',
		'cpp_intfminunc.cpp',
		'sci_minbndTMINLP.cpp',
		'cpp_intfminbnd.cpp',		
		'sci_minconTMINLP.cpp',
		'cpp_intfmincon.cpp',
		'cbcintlinprog_matrixcpp.cpp',
		'sci_QuadTMINLP.cpp',
		'cpp_intqpipopt.cpp',
		'cbcintlinprog_mpscpp.cpp'
	]

[a, opt] = getversion();
Version = opt(2);

if getos()=="Windows" then
	third_dir = path_builder+filesep()+'..'+filesep()+'..'+filesep()+'thirdparty';
	lib_base_dir = third_dir + filesep() + 'windows' + filesep() + 'lib' + filesep() + Version + filesep();
	inc_base_dir = third_dir + filesep() + 'windows' + filesep() + 'include' + filesep() + 'coin';
//    C_Flags=['-D__USE_DEPRECATED_STACK_FUNCTIONS__ -w -I '+path_builder+' '+ '-I '+inc_base_dir+' ']
//    Linker_Flag  = [lib_base_dir+"libClp.lib "+lib_base_dir+"libCgl.lib "+lib_base_dir+"libOsi.lib "+lib_base_dir+"libOsiClp.lib "+lib_base_dir+"libCoinUtils.lib "+lib_base_dir+"libSymphony.lib "+lib_base_dir+"IpOptFSS.lib "+lib_base_dir+"IpOpt-vc10.lib "]

else
	third_dir = path_builder+filesep()+'..'+filesep()+'..'+filesep()+'thirdparty';
	lib_base_dir = third_dir + filesep() + 'linux' + filesep() + 'lib' + filesep() + Version + filesep();
	inc_base_dir = third_dir + filesep() + 'linux' + filesep() + 'include' + filesep() + 'coin';
    
    C_Flags=["-D__USE_DEPRECATED_STACK_FUNCTIONS__ -w -fpermissive -I"+path_builder+" -I"+inc_base_dir+" -Wl,-rpath="+lib_base_dir+" "]
    
    Linker_Flag = ["-L"+lib_base_dir+"libCoinUtils.so "+"-L"+lib_base_dir+"libClp.so "+"-L"+lib_base_dir+"libClpSolver.so "+"-L"+lib_base_dir+"libOsi.so "+"-L"+lib_base_dir+"libOsiClp.so "+"-L"+lib_base_dir+"libCgl.so "+"-L"+lib_base_dir+"libCbc.so "+"-L"+lib_base_dir+"libCbcSolver.so "+"-L"+lib_base_dir+"libOsiCbc.so "+"-L"+lib_base_dir+"libipopt.so "+"-L"+lib_base_dir+"libbonmin.so " ]    
end

tbx_build_gateway(toolbox_title,Function_Names,Files,get_absolute_file_path("builder_gateway_cpp.sce"), [], Linker_Flag, C_Flags);

clear toolbox_title Function_Names Files Linker_Flag C_Flags;

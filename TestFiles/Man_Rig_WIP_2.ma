//Maya ASCII 2018ff09 scene
//Name: Man_Rig_WIP_2.ma
//Last modified: Thu, Mar 21, 2019 04:02:49 PM
//Codeset: 936
requires maya "2018ff09";
requires "mtoa" "3.1.1.1";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2018";
fileInfo "version" "2018";
fileInfo "cutIdentifier" "201811122215-49253d42f6";
fileInfo "osv" "Microsoft Windows 7 Ultimate Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -s -n "persp";
	rename -uid "ED2C4544-4967-9CE8-B273-548F0559AA75";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -51.289591688223609 -54.1319155225058 178.96992673187299 ;
	setAttr ".r" -type "double3" 85.461647270634415 0 1033.7999999961166 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "BEA3B12F-4529-A829-605C-AEBA0A3FFEF0";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 64.923806028761845;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 2.5000591278076172 -8.7213592529296875 163.59750366210938 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "2D575D94-4020-F635-1A9A-A2B44FF8E877";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "269E4DCE-46E0-6DA9-6C8E-94A179AD43A1";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "AF7C6F12-4686-AE6A-AA23-D788C4210E3B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.6412343931329287 -1000.1 172.58985820869958 ;
	setAttr ".r" -type "double3" 89.999999999999986 0 0 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "E07D01C5-4A0A-4144-EB85-5DA1BF88F02B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 111.43104186835144;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "DB5242A6-49A1-5744-A027-998FE49960A1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 -18.288983375940504 170.6411614804617 ;
	setAttr ".r" -type "double3" 90 1.2722218725854067e-14 89.999999999999986 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "1E524563-451B-42A2-96A2-F08230388474";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 101.0342815723892;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode joint -n "C_DownBrow_SkinJnt";
	rename -uid "709D55B1-4A4F-1350-D589-0FA4BEE68FDA";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "C_DownBrow_SkinJnt_pointConstraint1" -p "C_DownBrow_SkinJnt";
	rename -uid "4DDE0A8C-4A8B-C63C-B22D-B2B2A376CBCF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_DownBrow_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -2.0159823243885935 -12.287944868300201 173.77847290039063 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "C_DownBrow_SkinJnt_orientConstraint1" -p "C_DownBrow_SkinJnt";
	rename -uid "BF0F2B4B-4067-E0EE-702E-5F92A8BBCBEA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_DownBrow_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_DownBrow_In_SkinJnt";
	rename -uid "A38B80EF-460C-D852-3A5A-3AA45C84CB46";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_DownBrow_In_SkinJnt_pointConstraint1" -p "L_DownBrow_In_SkinJnt";
	rename -uid "B918F364-448E-4537-6214-82A51EFCB263";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownBrow_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -0.44514459495940273 -12.243257300276127 173.81581369777618 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_DownBrow_In_SkinJnt_orientConstraint1" -p "L_DownBrow_In_SkinJnt";
	rename -uid "0089DF75-4075-D843-19CF-4687DAA08EEB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownBrow_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_DownBrow_Mid_SkinJnt";
	rename -uid "4F16B921-4801-EDA8-38AB-56A0D31FD49A";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_DownBrow_Mid_SkinJnt_pointConstraint1" -p "L_DownBrow_Mid_SkinJnt";
	rename -uid "3A971E11-4A18-4F9A-1774-40A88EA683CA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownBrow_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.5634675836549756 -11.646388008475469 174.20208527058662 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_DownBrow_Mid_SkinJnt_orientConstraint1" -p "L_DownBrow_Mid_SkinJnt";
	rename -uid "995C281A-4784-13EB-3EBD-579A4CD9737E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownBrow_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_DownBrow_Out_SkinJnt";
	rename -uid "F5A1AF16-4C50-53EA-CB5C-B4BCC7332371";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_DownBrow_Out_SkinJnt_pointConstraint1" -p "L_DownBrow_Out_SkinJnt";
	rename -uid "8E2733F1-47EF-3E13-C109-EAAA2141B89D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownBrow_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 3.3145653803957122 -10.304400282353299 173.66130506865198 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_DownBrow_Out_SkinJnt_orientConstraint1" -p "L_DownBrow_Out_SkinJnt";
	rename -uid "D27B2997-4253-AD7B-83D8-D8B662F18017";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownBrow_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_Nose_Coner_SkinJnt";
	rename -uid "EDAA8147-4C03-2E76-F048-0AB7E138E80D";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.61326880588507005;
createNode pointConstraint -n "L_Nose_Coner_SkinJnt_pointConstraint1" -p "L_Nose_Coner_SkinJnt";
	rename -uid "D12E8C1F-4F8B-E160-BEAD-BAB9642CDEFE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_Nose_Coner_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0.018381292413145678 -11.78803683329204 168.58827174574131 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_Nose_Coner_SkinJnt_orientConstraint1" -p "L_Nose_Coner_SkinJnt";
	rename -uid "3C729210-4FCF-147B-F51C-EA9809E6D657";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_Nose_Coner_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "C_Nose_Tip_SkinJnt";
	rename -uid "E2915C66-4891-5363-153F-1C9CE2767604";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "C_Nose_Tip_SkinJnt_pointConstraint1" -p "C_Nose_Tip_SkinJnt";
	rename -uid "324FA514-4DEB-9D63-592A-92BDC1DDB3FC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_Nose_Tip_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -1.759971022605896 -14.492462158203125 168.62040710449219 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "C_Nose_Tip_SkinJnt_orientConstraint1" -p "C_Nose_Tip_SkinJnt";
	rename -uid "12535A7B-452A-42ED-C473-5881570FF780";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_Nose_Tip_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "C_Nose_Up_SkinJnt";
	rename -uid "FF4C6C8C-4243-377B-5077-ECB3945793D5";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "C_Nose_Up_SkinJnt_pointConstraint1" -p "C_Nose_Up_SkinJnt";
	rename -uid "4DF526D5-4CF6-23E8-D174-44B194167092";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_Nose_Up_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -1.8973474502563477 -12.350418090820313 172.41670227050781 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "C_Nose_Up_SkinJnt_orientConstraint1" -p "C_Nose_Up_SkinJnt";
	rename -uid "220A2604-44FC-A700-DD45-8CA94A56EFF8";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_Nose_Up_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_Nose_Mid_SkinJnt";
	rename -uid "2B7AE042-4C15-B251-4264-CB881C2F586C";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_Nose_Mid_SkinJnt_pointConstraint1" -p "L_Nose_Mid_SkinJnt";
	rename -uid "5CC7BAC3-480E-C8F1-9EEF-CAA34BAECEEB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_Nose_Mid_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -0.70138211856338994 -12.066857159326446 171.04993744839365 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_Nose_Mid_SkinJnt_orientConstraint1" -p "L_Nose_Mid_SkinJnt";
	rename -uid "A47B931B-41F4-B862-52A1-5F980B1529FB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_Nose_Mid_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_UpCheek_In_SkinJnt";
	rename -uid "A1CE5F62-48A8-AAF3-32E4-6C9072E50976";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_UpCheek_In_SkinJnt_pointConstraint1" -p "L_UpCheek_In_SkinJnt";
	rename -uid "0101D6B4-4EBE-FAA9-581E-CC930E9F87F4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpCheek_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0.51043468713760376 -10.650772094726563 171.21058654785156 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_UpCheek_In_SkinJnt_orientConstraint1" -p "L_UpCheek_In_SkinJnt";
	rename -uid "7FD36932-4EE1-4593-F15B-55ABC3315F0E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpCheek_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_UpCheek_Mid_SkinJnt";
	rename -uid "792406FB-4F17-D5C7-8019-1696443D1F09";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_UpCheek_Mid_SkinJnt_pointConstraint1" -p "L_UpCheek_Mid_SkinJnt";
	rename -uid "BCE3D04C-44C4-149F-A836-0AB93418D6A2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpCheek_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 2.8883547782897949 -10.034027099609375 170.933837890625 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_UpCheek_Mid_SkinJnt_orientConstraint1" -p "L_UpCheek_Mid_SkinJnt";
	rename -uid "B5572813-4758-9589-9E79-68A441C79C3C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpCheek_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_UpCheek_Out_SkinJnt";
	rename -uid "84AE7D5E-4726-0145-CA7F-40968071BCAA";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_UpCheek_Out_SkinJnt_pointConstraint1" -p "L_UpCheek_Out_SkinJnt";
	rename -uid "8B990652-4B7F-530C-EE73-168CE0DB051C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpCheek_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 3.8177915821610728 -8.8071447176326565 172.19076538085938 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_UpCheek_Out_SkinJnt_orientConstraint1" -p "L_UpCheek_Out_SkinJnt";
	rename -uid "9BF25188-4D2E-D2AE-D752-28A96DDCDA77";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpCheek_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_MidCheek_In_SkinJnt";
	rename -uid "AC2B543B-4E37-1209-29B3-E08F23865790";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_MidCheek_In_SkinJnt_pointConstraint1" -p "L_MidCheek_In_SkinJnt";
	rename -uid "BB9736C8-40A4-FBBB-0D01-F3BF63F7358E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_MidCheek_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.0399677753448486 -10.809371948242188 169.37937927246094 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_MidCheek_In_SkinJnt_orientConstraint1" -p "L_MidCheek_In_SkinJnt";
	rename -uid "7C828D7B-4EF2-C77B-650C-EEBE565352C1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_MidCheek_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_MidCheek_Mid_SkinJnt";
	rename -uid "C147E3D1-47D4-5FF4-9DDF-53BE7E11CB8E";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_MidCheek_Mid_SkinJnt_pointConstraint1" -p "L_MidCheek_Mid_SkinJnt";
	rename -uid "346BD6A3-4A6C-0D6C-40F8-9191BCAEC8EE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_MidCheek_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 3.2847983837127686 -9.6688995361328125 169.37957763671875 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_MidCheek_Mid_SkinJnt_orientConstraint1" -p "L_MidCheek_Mid_SkinJnt";
	rename -uid "22AC36B8-4C30-2C82-DE0C-53BB71B17D04";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_MidCheek_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_MidCheek_Out_SkinJnt";
	rename -uid "A6FEA953-4822-DB93-0D02-60AF41BF92D1";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_MidCheek_Out_SkinJnt_pointConstraint1" -p "L_MidCheek_Out_SkinJnt";
	rename -uid "80809060-4AD1-B13F-D7E3-2BB4C9904BFA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_MidCheek_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 4.9927334785461426 -6.8156280517578125 170.50332641601563 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_MidCheek_Out_SkinJnt_orientConstraint1" -p "L_MidCheek_Out_SkinJnt";
	rename -uid "BFFE2464-47A0-C34C-ECA8-5CB6353E144C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_MidCheek_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_DownCheek_In_SkinJnt";
	rename -uid "6260DC78-4865-5E7A-C1AF-D286DCAE6C98";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_DownCheek_In_SkinJnt_pointConstraint1" -p "L_DownCheek_In_SkinJnt";
	rename -uid "DCF3C707-48EF-EC54-1BB1-C19F41067222";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownCheek_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 2.9240539073944092 -9.5840606689453125 166.81448364257813 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_DownCheek_In_SkinJnt_orientConstraint1" -p "L_DownCheek_In_SkinJnt";
	rename -uid "56DFB1EB-485B-F56C-7874-23AE08D02A7E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownCheek_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_DownCheek_Mid_SkinJnt";
	rename -uid "317321A1-4222-AFFC-DE78-D9893FC9017A";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_DownCheek_Mid_SkinJnt_pointConstraint1" -p "L_DownCheek_Mid_SkinJnt";
	rename -uid "1C974E7B-4D10-61AD-8E7B-4FB44DE56590";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownCheek_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 4.0006491952179317 -7.4992772171776831 167.06721144383675 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_DownCheek_Mid_SkinJnt_orientConstraint1" -p "L_DownCheek_Mid_SkinJnt";
	rename -uid "ABC3E439-4E46-C21D-56CE-FDA17800D53F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownCheek_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_DownCheek_Out_SkinJnt";
	rename -uid "F67F41D2-4E8F-8047-7EB7-859A0C74D4C7";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_DownCheek_Out_SkinJnt_pointConstraint1" -p "L_DownCheek_Out_SkinJnt";
	rename -uid "2DEF5E9D-42F8-6F89-DF84-D8A255393883";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownCheek_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 4.7107224464416504 -5.2182464599609375 166.21012878417969 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_DownCheek_Out_SkinJnt_orientConstraint1" -p "L_DownCheek_Out_SkinJnt";
	rename -uid "0E47B70B-43B9-6117-BFD3-07BEA327572B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownCheek_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "C_Chin_SkinJnt";
	rename -uid "903E1093-4509-74B6-D23F-98B3E10E84C0";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.61326880588507005;
createNode pointConstraint -n "C_Chin_SkinJnt_pointConstraint1" -p "C_Chin_SkinJnt";
	rename -uid "48E1C60C-44C8-BA90-C6E2-089CA626AA49";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_Chin_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -1.5662120580673218 -11.395660400390625 161.72740173339844 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "C_Chin_SkinJnt_orientConstraint1" -p "C_Chin_SkinJnt";
	rename -uid "81CE12D5-4253-0A7A-B527-F7B5788388CB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_Chin_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "C_UpLip_SkinJnt";
	rename -uid "D430E165-4C67-210D-4104-2CB31FC48AAD";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "C_UpLip_SkinJnt_pointConstraint1" -p "C_UpLip_SkinJnt";
	rename -uid "D0E37990-4E44-7507-EF8C-C18DB7F498B6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_UpLip_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -1.6149523258209229 -12.431228637695313 166.432373046875 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "C_UpLip_SkinJnt_orientConstraint1" -p "C_UpLip_SkinJnt";
	rename -uid "3DA26CBF-436E-433C-4EAC-478A75C5BAD3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_UpLip_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_UpLip_Mid_SkinJnt";
	rename -uid "92B1F095-402D-E886-48AC-9E9558EB71E2";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "L_UpLip_Mid_SkinJnt_pointConstraint1" -p "L_UpLip_Mid_SkinJnt";
	rename -uid "961FBDC8-451F-5E1D-6042-20A99D6C60E1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpLip_Mid_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -0.067921750247478485 -12.10040283203125 166.48872375488281 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_UpLip_Mid_SkinJnt_orientConstraint1" -p "L_UpLip_Mid_SkinJnt";
	rename -uid "9D5BD683-4268-B59A-8C1D-93A7D59BBE95";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpLip_Mid_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_UpLip_Out_SkinJnt";
	rename -uid "8AF456D2-4654-BFCC-A1C2-CBA977DC60CB";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "L_UpLip_Out_SkinJnt_pointConstraint1" -p "L_UpLip_Out_SkinJnt";
	rename -uid "58B2CAD7-4F4E-C308-7722-6AA6338ECFEC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpLip_Out_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.4837455749511719 -10.527435302734375 166.32308959960938 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_UpLip_Out_SkinJnt_orientConstraint1" -p "L_UpLip_Out_SkinJnt";
	rename -uid "AC4F112C-4440-5B6A-CB80-80A77714874A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpLip_Out_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "C_DownLip_SkinJnt";
	rename -uid "BA3C7790-4094-5116-FB06-D596ADD589E7";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "C_DownLip_SkinJnt_pointConstraint1" -p "C_DownLip_SkinJnt";
	rename -uid "D2E922D3-4CE3-9400-F2E9-4585F5E3927D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_DownLip_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -1.5785253047943115 -12.357467651367188 164.86618041992188 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "C_DownLip_SkinJnt_orientConstraint1" -p "C_DownLip_SkinJnt";
	rename -uid "32EAE9F8-4D10-1648-8A48-AD946233D8CC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_DownLip_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_DownLip_Mid_SkinJnt";
	rename -uid "220D7540-413F-8F2B-CC10-C980F7429DF3";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "L_DownLip_Mid_SkinJnt_pointConstraint1" -p "L_DownLip_Mid_SkinJnt";
	rename -uid "953ACA67-4938-F414-F0CB-09A1ACE812C3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownLip_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0.10377626121044159 -11.805794282793727 165.26633621957143 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_DownLip_Mid_SkinJnt_orientConstraint1" -p "L_DownLip_Mid_SkinJnt";
	rename -uid "98D1C51C-411F-19E3-5A4A-19BC034BC3F7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownLip_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_DownLip_Out_SkinJnt";
	rename -uid "0E77FAE6-4CB8-546B-99A9-04B9452E4868";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "L_DownLip_Out_SkinJnt_pointConstraint1" -p "L_DownLip_Out_SkinJnt";
	rename -uid "2C2673EC-4A28-A8ED-8FC0-DC881E7FEDF2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownLip_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.4242883920669556 -10.406356811523438 166.14872741699219 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_DownLip_Out_SkinJnt_orientConstraint1" -p "L_DownLip_Out_SkinJnt";
	rename -uid "998EFFB4-4D70-30AB-EC39-C2974C17B95B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownLip_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_BottomCheek_In_SkinJnt";
	rename -uid "441EF532-494C-8B2B-A8FC-26B8141F8EAD";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_BottomCheek_In_SkinJnt_pointConstraint1" -p "L_BottomCheek_In_SkinJnt";
	rename -uid "654B0038-4B53-0173-06C7-098254352F1D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_BottomCheek_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 2.5000591278076172 -8.7213592529296875 163.59750366210938 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_BottomCheek_In_SkinJnt_orientConstraint1" -p "L_BottomCheek_In_SkinJnt";
	rename -uid "51FE4078-4E16-578A-5D44-40B9FC3EAF27";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_BottomCheek_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_Temple_SkinJnt";
	rename -uid "25612396-4CD5-015F-3A5F-83B172E33874";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_Temple_SkinJnt_pointConstraint1" -p "L_Temple_SkinJnt";
	rename -uid "2E10D585-4391-8154-67A4-2D81109A5535";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_Temple_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 4.9377613067626953 -6.38330078125 173.16799926757813 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_Temple_SkinJnt_orientConstraint1" -p "L_Temple_SkinJnt";
	rename -uid "0C92A423-49CD-DB3B-BCE8-B9BD03B4FBF2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_Temple_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "C_UpBrow_SkinJnt";
	rename -uid "2E776B97-4396-49E6-7340-5A830B0ED724";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "C_UpBrow_SkinJnt_pointConstraint1" -p "C_UpBrow_SkinJnt";
	rename -uid "837A7A3C-48B3-64A8-1457-DF9D84D4BB01";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_UpBrow_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -2.0726361274719238 -12.010726928710938 176.80113220214844 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "C_UpBrow_SkinJnt_orientConstraint1" -p "C_UpBrow_SkinJnt";
	rename -uid "DA745D85-4B2E-FE83-4625-A5AD572ECD41";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_UpBrow_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_UpBrow_In_SkinJnt";
	rename -uid "2A2A441E-474A-B85C-822E-A78D79AEFA9B";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_UpBrow_In_SkinJnt_pointConstraint1" -p "L_UpBrow_In_SkinJnt";
	rename -uid "A430BA35-4021-0899-F6E0-11BBC7D2D885";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpBrow_In_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -0.38772135972976685 -11.99188232421875 176.73753356933594 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_UpBrow_In_SkinJnt_orientConstraint1" -p "L_UpBrow_In_SkinJnt";
	rename -uid "9D207A8E-444A-7C78-8B11-72B3394BE637";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpBrow_In_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_UpBrow_Mid_SkinJnt";
	rename -uid "0410EC6C-48BD-2616-D77E-8B8ACA125AB8";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_UpBrow_Mid_SkinJnt_pointConstraint1" -p "L_UpBrow_Mid_SkinJnt";
	rename -uid "A4B77AB6-42B7-01B2-2DD1-14903ABAA4E5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpBrow_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.7756061796615927 -11.238620561914562 176.62745899223364 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_UpBrow_Mid_SkinJnt_orientConstraint1" -p "L_UpBrow_Mid_SkinJnt";
	rename -uid "F6288F87-4B21-2002-1439-A0887BACDE03";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpBrow_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_UpBrow_Out_SkinJnt";
	rename -uid "313C0EAA-4424-163C-6E40-4390C0554AF5";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_UpBrow_Out_SkinJnt_pointConstraint1" -p "L_UpBrow_Out_SkinJnt";
	rename -uid "EDCA40BB-4CFE-A05F-DF01-CDA9F9C65942";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpBrow_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 3.6033354843608834 -9.4098321037420334 176.2821584385344 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_UpBrow_Out_SkinJnt_orientConstraint1" -p "L_UpBrow_Out_SkinJnt";
	rename -uid "0F33D977-4EE7-850C-F691-37A90DD115E8";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpBrow_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_Nose_Hole_SkinJnt";
	rename -uid "3463FB96-4038-C516-6E9F-9FABCDB21703";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "L_Nose_Hole_SkinJnt_pointConstraint1" -p "L_Nose_Hole_SkinJnt";
	rename -uid "39122E9F-416B-8EAC-BF6C-66A6075234FF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_Nose_Hole_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -1.0606168508529663 -12.809829711914063 168.6304931640625 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_Nose_Hole_SkinJnt_orientConstraint1" -p "L_Nose_Hole_SkinJnt";
	rename -uid "2D4C37EE-4E14-8921-B9D4-EB8271ADC47C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_Nose_Hole_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_Eye_SkinJnt";
	rename -uid "2460DB5E-44B0-FDDB-A1BB-52B199D5674F";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "L_Eye_SkinJnt_pointConstraint1" -p "L_Eye_SkinJnt";
	rename -uid "A57DB76D-4351-9A8F-BD01-EF833FCB842A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_Eye_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_Eye_SkinJnt_orientConstraint1" -p "L_Eye_SkinJnt";
	rename -uid "2F85C7E5-405E-20EC-D742-30B581870E79";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_Eye_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "polySurface2";
	rename -uid "7CF0F5C5-42F1-691B-6AFA-BC953C7327F1";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
	setAttr ".sp" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
createNode mesh -n "polySurfaceShape2" -p "polySurface2";
	rename -uid "466B4DE7-46B8-F523-531A-42B6CACE6F49";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 514 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.3908 0.67360002 0.38620001
		 0.67479998 0.38600001 0.67390001 0.38609999 0.67290002 0.3863 0.67199999 0.3867 0.67119998
		 0.3872 0.67040002 0.38789999 0.66979998 0.38870001 0.66930002 0.38960001 0.66900003
		 0.39050001 0.6688 0.39140001 0.66890001 0.39230001 0.66909999 0.39320001 0.66949999
		 0.39390001 0.67000002 0.3946 0.67070001 0.3951 0.67150003 0.39539999 0.6724 0.3955
		 0.67330003 0.3955 0.6742 0.3953 0.67510003 0.39489999 0.676 0.3944 0.6767 0.3937
		 0.67739999 0.39289999 0.6778 0.39199999 0.67820001 0.39109999 0.67830002 0.39019999
		 0.67830002 0.3892 0.67809999 0.38839999 0.67769998 0.3876 0.67720002 0.38699999 0.67650002
		 0.3865 0.67570001 0.38150001 0.676 0.38119999 0.6742 0.3813 0.67229998 0.38170001
		 0.67049998 0.38249999 0.6688 0.3836 0.66720003 0.38499999 0.66600001 0.38659999 0.66500002
		 0.3883 0.66430002 0.39019999 0.66399997 0.39210001 0.66409999 0.39390001 0.6645 0.39559999
		 0.66530001 0.3971 0.66640002 0.39840001 0.66780001 0.3994 0.66939998 0.40000001 0.67110002
		 0.4003 0.67299998 0.4003 0.67479998 0.3998 0.6767 0.39910001 0.67839998 0.398 0.67989999
		 0.39660001 0.68120003 0.39500001 0.68220001 0.39320001 0.68279999 0.39140001 0.68309999
		 0.38949999 0.68309999 0.38769999 0.68260002 0.38600001 0.68190002 0.3845 0.68080002
		 0.38319999 0.67940003 0.3822 0.6778 0.37670001 0.67729998 0.37619999 0.67449999 0.37630001
		 0.67159998 0.377 0.6688 0.37819999 0.66619998 0.37990001 0.66390002 0.382 0.662 0.38440001
		 0.66049999 0.38710001 0.6595 0.3899 0.65899998 0.39269999 0.65920001 0.3955 0.65979999
		 0.39809999 0.66100001 0.40040001 0.6627 0.40239999 0.66479999 0.40380001 0.66720003
		 0.40490001 0.6699 0.40529999 0.67269999 0.4052 0.67549998 0.40450001 0.67830002 0.4034
		 0.68089998 0.40169999 0.6832 0.3996 0.68519998 0.39719999 0.68669999 0.39449999 0.68760002
		 0.3917 0.68809998 0.38890001 0.68800002 0.38609999 0.68739998 0.38350001 0.68620002
		 0.38119999 0.68449998 0.37920001 0.68239999 0.3777 0.68000001 0.3716 0.67869997 0.37090001
		 0.67479998 0.37099999 0.67089999 0.37200001 0.66710001 0.37360001 0.66350001 0.3759
		 0.66039997 0.3788 0.65780002 0.38209999 0.65570003 0.3858 0.65439999 0.38960001 0.65380001
		 0.3935 0.65390003 0.39719999 0.6548 0.40079999 0.65649998 0.4039 0.65869999 0.4066
		 0.66149998 0.4086 0.6649 0.41 0.66850001 0.41060001 0.67229998 0.41049999 0.67619997
		 0.4095 0.68000001 0.40799999 0.68349999 0.4057 0.68669999 0.40290001 0.6893 0.3996
		 0.69139999 0.39590001 0.69279999 0.39210001 0.69340003 0.38820001 0.69330001 0.38440001
		 0.69239998 0.38080001 0.69080001 0.3777 0.68849999 0.375 0.6857 0.37290001 0.68229997
		 0.366 0.68010002 0.3651 0.67510003 0.36539999 0.67009997 0.36649999 0.6652 0.36860001
		 0.66060001 0.37169999 0.6566 0.37529999 0.65310001 0.37959999 0.6505 0.38429999 0.64889997
		 0.38929999 0.64810002 0.39430001 0.64819998 0.39910001 0.6494 0.40369999 0.65149999
		 0.4077 0.65450001 0.4111 0.65810001 0.41370001 0.66229999 0.41549999 0.667 0.4163
		 0.67199999 0.41620001 0.67699999 0.41499999 0.68180001 0.4129 0.6864 0.41 0.69050002
		 0.40630001 0.69389999 0.4021 0.69660002 0.39739999 0.6983 0.39250001 0.69910002 0.38749999
		 0.699 0.38260001 0.69779998 0.37799999 0.69580001 0.3739 0.6929 0.37040001 0.68919998
		 0.36770001 0.68489999 0.35960001 0.68180001 0.35870001 0.67549998 0.35890001 0.6692
		 0.36050001 0.66299999 0.36320001 0.6573 0.3669 0.65219998 0.37149999 0.648 0.37689999
		 0.64480001 0.3827 0.64270002 0.38890001 0.64179999 0.3951 0.6419 0.40110001 0.64340001
		 0.4068 0.64590001 0.41190001 0.64960003 0.4161 0.65420002 0.41949999 0.6595 0.4217
		 0.66540003 0.42269999 0.67159998 0.42250001 0.6778 0.421 0.6839 0.41839999 0.68959999
		 0.41479999 0.6947 0.4102 0.69889998 0.40490001 0.70230001 0.39910001 0.70450002 0.39289999
		 0.70550001 0.3867 0.70529997 0.38060001 0.70389998 0.3748 0.70139998 0.3696 0.69779998
		 0.3653 0.69309998 0.3619 0.68779999 0.35249999 0.68379998 0.3511 0.676 0.3515 0.6681
		 0.35339999 0.66039997 0.35679999 0.6534 0.36149999 0.64719999 0.3673 0.64219999 0.37380001
		 0.6383 0.3809 0.63569999 0.38839999 0.63450003 0.39610001 0.63480002 0.40349999 0.6365
		 0.41049999 0.63959998 0.41670001 0.64410001 0.42199999 0.64969999 0.42609999 0.65630001
		 0.4287 0.66350001 0.43000001 0.67110002 0.42969999 0.67879999 0.428 0.68620002 0.42480001
		 0.69330001 0.42030001 0.69959998 0.41460001 0.70480001 0.40810001 0.70880002 0.40099999
		 0.71149999 0.39340001 0.71280003 0.3858 0.71259999 0.37830001 0.71100003 0.3712 0.70779997
		 0.36480001 0.70340002 0.3594 0.69770002 0.35530001 0.6911 0.34400001 0.68620002 0.34220001
		 0.6767 0.34240001 0.66680002 0.345 0.65719998 0.34940001 0.64859998 0.35530001 0.64130002
		 0.3624 0.63529998 0.37020001 0.63080001 0.37869999 0.6275 0.38789999 0.62580001 0.39719999
		 0.62639999 0.40630001 0.62830001 0.4147 0.63230002 0.42230001 0.63749999 0.42899999
		 0.64429998 0.43380001 0.65249997 0.4373 0.6613 0.4386 0.67070001 0.43810001 0.67989999
		 0.43619999 0.68889999 0.43239999 0.69770002 0.4267 0.70520002 0.4199 0.71179998 0.4118
		 0.71649998 0.40310001 0.71960002;
	setAttr ".uvst[0].uvsp[250:499]" 0.39410001 0.72119999 0.3849 0.72109997 0.37560001
		 0.71929997 0.36680001 0.71560001 0.35910001 0.70990002 0.3524 0.70310003 0.34760001
		 0.69499999 0.45640001 0.2895 0.45570001 0.2933 0.4524 0.29300001 0.45230001 0.28929999
		 0.44909999 0.29339999 0.4483 0.2899 0.44600001 0.29449999 0.4445 0.2911 0.44310001
		 0.29620001 0.4409 0.2931 0.44069999 0.29840001 0.43779999 0.29589999 0.43869999 0.30109999
		 0.4355 0.2992 0.4373 0.30399999 0.4339 0.3028 0.43650001 0.3071 0.43290001 0.3066
		 0.43630001 0.31040001 0.43270001 0.3105 0.43669999 0.3136 0.4332 0.3143 0.4377 0.31659999
		 0.43430001 0.31810001 0.4393 0.3195 0.43619999 0.32159999 0.44139999 0.32210001 0.43880001
		 0.3247 0.44400001 0.32409999 0.442 0.32730001 0.44690001 0.3256 0.4456 0.329 0.4501
		 0.3265 0.44949999 0.33019999 0.4535 0.32679999 0.45359999 0.33059999 0.45680001 0.3263
		 0.45770001 0.3301 0.46000001 0.32519999 0.46169999 0.32870001 0.46290001 0.32350001
		 0.46520001 0.3265 0.46540001 0.32120001 0.46810001 0.32370001 0.4673 0.3186 0.47040001
		 0.3204 0.46869999 0.31569999 0.472 0.31690001 0.46950001 0.3125 0.47310001 0.31310001
		 0.46970001 0.30930001 0.47350001 0.3091 0.4693 0.30599999 0.4729 0.30520001 0.4682
		 0.30289999 0.4716 0.30140001 0.4666 0.3001 0.46959999 0.29800001 0.46450001 0.2976
		 0.46700001 0.2949 0.4619 0.2956 0.46380001 0.29249999 0.4589 0.29409999 0.4603 0.29069999
		 0.45519999 0.29629999 0.45249999 0.29620001 0.4499 0.2965 0.44729999 0.2974 0.44499999
		 0.29879999 0.44299999 0.30050001 0.4413 0.30270001 0.4402 0.30509999 0.4395 0.30759999
		 0.43939999 0.31029999 0.43970001 0.31290001 0.44049999 0.3154 0.4418 0.3177 0.4436
		 0.31979999 0.44569999 0.32139999 0.4481 0.32269999 0.45070001 0.32339999 0.45339999
		 0.32359999 0.45609999 0.32319999 0.4587 0.32229999 0.461 0.32089999 0.463 0.31920001
		 0.4646 0.317 0.46579999 0.31459999 0.46650001 0.31200001 0.4666 0.30939999 0.46630001
		 0.30669999 0.46540001 0.30419999 0.4641 0.3019 0.4623 0.2999 0.46020001 0.29820001
		 0.4578 0.29699999 0.45480001 0.29899999 0.4526 0.29890001 0.45050001 0.2992 0.44850001
		 0.2999 0.44659999 0.301 0.44499999 0.30239999 0.44369999 0.30410001 0.4427 0.30599999
		 0.44220001 0.30809999 0.44209999 0.31020001 0.44229999 0.3123 0.44299999 0.3143 0.44409999
		 0.31619999 0.44549999 0.31779999 0.4472 0.31909999 0.44909999 0.32010001 0.45120001
		 0.32069999 0.4533 0.32080001 0.45550001 0.32049999 0.45750001 0.31979999 0.4594 0.31869999
		 0.461 0.31729999 0.4623 0.31560001 0.4632 0.31369999 0.46380001 0.3116 0.4639 0.30950001
		 0.46360001 0.3073 0.46290001 0.3053 0.4619 0.3035 0.46039999 0.3019 0.45879999 0.30050001
		 0.45680001 0.29960001 0.4544 0.30149999 0.45269999 0.30140001 0.45100001 0.30160001
		 0.44949999 0.3021 0.44800001 0.30289999 0.44679999 0.30410001 0.44580001 0.30540001
		 0.44499999 0.30680001 0.44459999 0.30849999 0.4445 0.31009999 0.4447 0.3118 0.4452
		 0.31330001 0.4461 0.31479999 0.4472 0.31600001 0.44850001 0.31709999 0.44999999 0.31779999
		 0.45159999 0.31819999 0.4533 0.31830001 0.4549 0.31810001 0.45649999 0.31760001 0.45789999
		 0.31670001 0.45919999 0.31560001 0.46020001 0.3143 0.46090001 0.31279999 0.4614 0.31119999
		 0.4614 0.30950001 0.4612 0.30790001 0.46070001 0.30630001 0.45989999 0.30489999 0.45879999
		 0.30360001 0.45750001 0.3026 0.456 0.3019 0.454 0.3037 0.45280001 0.30360001 0.45159999
		 0.30379999 0.45039999 0.30419999 0.44929999 0.3048 0.44839999 0.30559999 0.44769999
		 0.3066 0.4472 0.30770001 0.44679999 0.30880001 0.44679999 0.31 0.44690001 0.31130001
		 0.44729999 0.31240001 0.4479 0.31349999 0.44870001 0.31439999 0.4497 0.31510001 0.4508
		 0.31569999 0.45199999 0.31600001 0.45320001 0.3161 0.4544 0.3159 0.45559999 0.31549999
		 0.45660001 0.31490001 0.45750001 0.3141 0.45829999 0.31310001 0.45879999 0.31200001
		 0.45910001 0.31079999 0.45919999 0.3096 0.45899999 0.30840001 0.45860001 0.3073 0.458
		 0.3062 0.45719999 0.3053 0.45629999 0.30450001 0.45519999 0.30399999 0.45359999 0.30579999
		 0.45280001 0.3057 0.45199999 0.30590001 0.4513 0.30610001 0.4506 0.30649999 0.44999999
		 0.30700001 0.44949999 0.30770001 0.4492 0.30840001 0.44890001 0.30919999 0.44890001
		 0.31 0.449 0.31079999 0.44929999 0.31150001 0.4497 0.31220001 0.45019999 0.31279999
		 0.4508 0.31330001 0.4515 0.31369999 0.45230001 0.31389999 0.4531 0.31389999 0.45390001
		 0.31380001 0.45469999 0.3136 0.45539999 0.3132 0.456 0.31259999 0.45649999 0.31200001
		 0.45680001 0.31130001 0.45699999 0.3105 0.4571 0.30970001 0.45699999 0.3089 0.4567
		 0.30809999 0.45629999 0.3075 0.4558 0.30680001 0.4551 0.3064 0.4544 0.30599999 0.4533
		 0.30779999 0.45289999 0.30779999 0.45249999 0.30790001 0.45210001 0.308 0.45179999
		 0.3082 0.4515 0.30840001 0.4513 0.30880001 0.45109999 0.3091 0.45100001 0.30950001
		 0.45089999 0.30989999 0.45100001 0.31029999 0.45109999 0.3107 0.4513 0.31099999 0.45159999
		 0.31130001 0.45190001 0.3116 0.45230001 0.31169999 0.45269999 0.3118 0.45300001 0.31189999
		 0.45339999 0.3118;
	setAttr ".uvst[0].uvsp[500:513]" 0.45379999 0.31169999 0.4542 0.31150001 0.45449999
		 0.31119999 0.45469999 0.3109 0.4549 0.3105 0.45500001 0.31020001 0.45500001 0.3098
		 0.45500001 0.30939999 0.45480001 0.30899999 0.45460001 0.30860001 0.4544 0.30840001
		 0.45410001 0.30809999 0.45370001 0.30790001 0.45300001 0.3098;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 482 ".vt";
	setAttr ".vt[0:165]"  1.099312186 -10.86599731 172.61933899 0.76605016 -10.80233765 172.61340332
		 0.77299982 -10.80680847 172.54766846 0.79252028 -10.81228638 172.48469543 0.82402015 -10.81854248 172.42672729
		 0.86619419 -10.82539368 172.37608337 0.91742975 -10.83248901 172.33486938 0.97580075 -10.83963013 172.30438232
		 1.038973212 -10.84649658 172.28590393 1.10460782 -10.85289001 172.28024292 1.17025828 -10.85848999 172.28753662
		 1.23316824 -10.86308289 172.30747986 1.29108632 -10.86650085 172.33930969 1.34175885 -10.86862183 172.38192749
		 1.38333249 -10.86946106 172.43345642 1.41395545 -10.86882019 172.49214172 1.43268847 -10.86683655 172.55561829
		 1.43869317 -10.86349487 172.62141418 1.43184543 -10.85902405 172.68714905 1.41222298 -10.85354614 172.75013733
		 1.3808254 -10.84729004 172.80810547 1.33865035 -10.84043884 172.85864258 1.28741574 -10.83334351 172.89997864
		 1.22904444 -10.82620239 172.93043518 1.16576958 -10.81933594 172.94883728 1.10013568 -10.8129425 172.9546051
		 1.034587145 -10.80734253 172.94729614 0.97157538 -10.80284119 172.92736816 0.91365725 -10.79933167 172.89552307
		 0.86298484 -10.79721069 172.85292053 0.821513 -10.79637146 172.80137634 0.79078799 -10.79701233 172.7427063
		 0.77205485 -10.79899597 172.67922974 0.45155436 -10.67495728 172.60368347 0.46517205 -10.68377686 172.47488403
		 0.50352013 -10.69450378 172.35125732 0.56521493 -10.70681763 172.2376709 0.64794928 -10.72029114 172.1383667
		 0.7484957 -10.73417664 172.057357788 0.8630054 -10.74824524 171.99765015 0.98701119 -10.76165771 171.96148682
		 1.11573172 -10.7741394 171.95028687 1.24437881 -10.78512573 171.96461487 1.36794734 -10.79412842 172.0037231445
		 1.48152828 -10.80085754 172.066177368 1.58102167 -10.80509949 172.14968872 1.66241813 -10.80659485 172.25083923
		 1.72262371 -10.80534363 172.36598206 1.75925136 -10.8014679 172.49046326 1.77113676 -10.79501343 172.61967468
		 1.75762093 -10.78619385 172.74845886 1.71917164 -10.77546692 172.87217712 1.65747619 -10.76313782 172.985672
		 1.57474172 -10.74967957 173.084976196 1.4741956 -10.73579407 173.16600037 1.35978794 -10.72172546 173.22567749
		 1.23578179 -10.70829773 173.2618103 1.10695922 -10.6958313 173.27302551 0.97831231 -10.68495178 173.25871277
		 0.85484582 -10.67584229 173.21960449 0.74116266 -10.66911316 173.15715027 0.64177155 -10.66485596 173.073669434
		 0.56037527 -10.66337585 172.97251892 0.50016916 -10.66462708 172.8573761 0.4634394 -10.66850281 172.73286438
		 0.16817027 -10.48886108 172.59080505 0.18778573 -10.50158691 172.4037323 0.2434756 -10.51724243 172.22428894
		 0.33305857 -10.53507996 172.059356689 0.45322645 -10.55453491 171.9152832 0.59913439 -10.57476807 171.79766846
		 0.7653144 -10.59513855 171.71087646 0.94537187 -10.61470032 171.65837097 1.13228774 -10.63272095 171.6421814
		 1.31902957 -10.64871216 171.66294861 1.49834752 -10.66181946 171.71974182 1.66338837 -10.67156982 171.81039429
		 1.80769539 -10.67776489 171.93164063 1.92592132 -10.67991638 172.078598022 2.013322353 -10.67816162 172.24557495
		 2.066577435 -10.67243958 172.42633057 2.08378768 -10.66299438 172.61392212 2.06407094 -10.65026855 172.80099487
		 2.0083808899 -10.63461304 172.98043823 1.91879761 -10.61677551 173.14533997 1.79873192 -10.59732056 173.28942871
		 1.6527226 -10.5770874 173.40711975 1.48654139 -10.55671692 173.49378967 1.30648422 -10.53715515 173.54632568
		 1.11956859 -10.51911926 173.56251526 0.9328264 -10.50325012 173.54174805 0.75350863 -10.49012756 173.48498535
		 0.58846784 -10.48028564 173.39428711 0.44416159 -10.47419739 173.27316284 0.32603788 -10.47193909 173.1262207
		 0.23853377 -10.47369385 172.9591217 0.18527868 -10.47940063 172.77838135 -0.073493451 -10.25108337 172.57516479
		 -0.048529427 -10.26727295 172.3369751 0.022422379 -10.28720093 172.10855103 0.13648349 -10.30989075 171.89863586
		 0.28934157 -10.33468628 171.71533203 0.47504205 -10.36042786 171.56556702 0.68660015 -10.38626099 171.4552002
		 0.91569006 -10.41123962 171.3883667 1.15366638 -10.43421936 171.36778259 1.39135551 -10.45446777 171.394104
		 1.61957061 -10.47117615 171.46652222 1.82961345 -10.48365784 171.58197021 2.013284922 -10.4914093 171.7361145
		 2.16369867 -10.4942627 171.92315674 2.27497411 -10.49195862 172.13572693 2.34275389 -10.48472595 172.36581421
		 2.36461091 -10.4727478 172.60452271 2.33964658 -10.45645142 172.84263611 2.2686944 -10.43663025 173.071044922
		 2.15463305 -10.41383362 173.28096008 2.0017755032 -10.38912964 173.46426392 1.81607473 -10.36328125 173.61401367
		 1.6045171 -10.33744812 173.72442627 1.37532508 -10.31257629 173.79124451 1.13745022 -10.28961182 173.81181335
		 0.8997612 -10.26934814 173.78547668 0.67154771 -10.25263977 173.71322632 0.46150473 -10.24015808 173.59776306
		 0.27772987 -10.23240662 173.4434967 0.12741892 -10.22955322 173.25654602 0.01614273 -10.2318573 173.043884277
		 -0.051636882 -10.23908997 172.813797 -0.26405272 -9.97079468 172.55731201 -0.23457362 -9.98988342 172.27726746
		 -0.15123779 -10.013214111 172.0086517334 -0.01711284 -10.040008545 171.76187134 0.16258234 -10.069091797 171.54623413
		 0.38098916 -10.099395752 171.370224 0.6297015 -10.12983704 171.24041748 0.89917719 -10.15908813 171.1618042
		 1.17904186 -10.18617249 171.13763428 1.45848989 -10.20988464 171.16856384 1.72690403 -10.22950745 171.25357056
		 1.97385108 -10.24423218 171.389328 2.18979764 -10.25337219 171.57073975 2.36662126 -10.25665283 171.79058838
		 2.4975152 -10.25404358 172.040618896 2.57718849 -10.24555969 172.31115723 2.60289502 -10.23138428 172.59176636
		 2.57351828 -10.21229553 172.87185669 2.49018192 -10.1889801 173.14041138 2.35595512 -10.16218567 173.38722229
		 2.17625904 -10.13310242 173.6027832 1.95785379 -10.10279846 173.77893066 1.70914137 -10.072341919 173.90870667
		 1.43966472 -10.043106079 173.98725891 1.15990269 -10.01600647 174.011489868 0.8803525 -9.99220276 173.98052979
		 0.61203998 -9.97257996 173.89552307 0.36509329 -9.95796204 173.75975037 0.14904477 -9.94882202 173.57839966
		 -0.027779223 -9.94552612 173.35850525 -0.15857068 -9.94815063 173.10847473 -0.2383465 -9.95663452 172.83790588
		 -0.39606082 -9.65873718 172.53791809 -0.363397 -9.6799469 172.22673035 -0.27074391 -9.7059021 171.92840576
		 -0.12177407 -9.73561096 171.65405273 0.078001626 -9.76789856 171.41456604;
	setAttr ".vt[166:331]" 0.32070854 -9.80169678 171.21885681 0.5970332 -9.83540344 171.074676514
		 0.89641702 -9.8679657 170.98738098 1.20736611 -9.89805603 170.96046448 1.51785314 -9.92451477 170.99491882
		 1.81603444 -9.94622803 171.08934021 2.09045434 -9.96261597 171.24026489 2.33055329 -9.97276306 171.44174194
		 2.52697873 -9.97644043 171.68598938 2.67230248 -9.97344971 171.96382141 2.76091933 -9.96398926 172.2644043
		 2.78946042 -9.94841003 172.57629395 2.75679612 -9.92710876 172.88737488 2.66414356 -9.90115356 173.18579102
		 2.51517272 -9.87142944 173.46006775 2.31539822 -9.83914185 173.69969177 2.072793007 -9.80545044 173.895401
		 1.79636645 -9.77165222 174.039581299 1.49698234 -9.73907471 174.12684631 1.18603373 -9.70898438 174.15377808
		 0.87554634 -9.68263245 174.11933899 0.57736492 -9.66081238 174.024887085 0.30294529 -9.64453125 173.87399292
		 0.062948525 -9.63427734 173.67251587 -0.13357905 -9.63061523 173.42822266 -0.27890348 -9.6335907 173.15036011
		 -0.36751986 -9.64305115 172.84979248 -0.46461952 -9.3269043 172.51785278 -0.42988527 -9.34945679 172.18760681
		 -0.33158708 -9.37704468 171.87072754 -0.17338607 -9.40859985 171.57958984 0.03859647 -9.44291687 171.32531738
		 0.29628924 -9.47862244 171.11752319 0.58966851 -9.51454163 170.96444702 0.90746504 -9.54908752 170.8717804
		 1.23757398 -9.58102417 170.84315491 1.56725693 -9.60900879 170.87982178 1.88384986 -9.63223267 170.98001099
		 2.17508149 -9.64949036 171.14016724 2.42987895 -9.66029358 171.35406494 2.63847804 -9.66427612 171.61351013
		 2.79283166 -9.66110229 171.90840149 2.88692021 -9.65101624 172.22747803 2.91716671 -9.63441467 172.55862427
		 2.88253427 -9.61187744 172.88890076 2.78413296 -9.58427429 173.20562744 2.6259315 -9.55271912 173.4967804
		 2.41394973 -9.5184021 173.75115967 2.15635824 -9.48269653 173.9588623 1.86287713 -9.4467926 174.11193848
		 1.54508042 -9.4122467 174.20458984 1.21497178 -9.38031006 174.23323059 0.88528967 -9.35232544 174.19665527
		 0.56879771 -9.32910156 174.096389771 0.27746433 -9.31184387 173.93623352 0.022666678 -9.30104065 173.72232056
		 -0.1859315 -9.29705811 173.46296692 -0.34018379 -9.30023193 173.16793823 -0.43427244 -9.31030273 172.84889221
		 -0.46697578 -8.9881897 172.49775696 -0.43158624 -9.011077881 172.16105652 -0.33130464 -9.039215088 171.83798218
		 -0.16999413 -9.071411133 171.54107666 0.046125602 -9.10638428 171.28186035 0.30888176 -9.14282227 171.070068359
		 0.60794538 -9.17936707 170.91397095 0.93204963 -9.21463013 170.81954956 1.26857889 -9.24719238 170.79031372
		 1.60469306 -9.27578735 170.82756042 1.92742467 -9.29940796 170.92979431 2.22449803 -9.31706238 171.093063354
		 2.48423076 -9.32804871 171.31124878 2.69695473 -9.33210754 171.57565308 2.85421705 -9.3289032 171.87632751
		 2.95019841 -9.318573 172.20172119 2.98111486 -9.30163574 172.53927612 2.94572663 -9.27864075 172.87606812
		 2.8454442 -9.25059509 173.1990509 2.68413305 -9.21839905 173.49594116 2.46801448 -9.18344116 173.75527954
		 2.20525813 -9.14689636 173.96705627 1.90619457 -9.11035156 174.12315369 1.58209062 -9.075180054 174.21759033
		 1.24556005 -9.042617798 174.24668884 0.90944636 -9.014022827 174.20947266 0.58661216 -8.99040222 174.10719299
		 0.28964064 -8.97276306 173.94393921 0.0298068 -8.96166992 173.72579956 -0.18281575 -8.95770264 173.46133423
		 -0.34017909 -8.96092224 173.16070557 -0.43605918 -8.97123718 172.83532715 -0.40302584 -8.65539551 172.47851563
		 -0.36839393 -8.677948 172.14823914 -0.26999331 -8.70544434 171.83140564 -0.11179271 -8.73698425 171.54023743
		 0.10019015 -8.77131653 171.28594971 0.35778093 -8.80711365 171.078186035 0.65116 -8.84301758 170.92507935
		 0.96905863 -8.87757874 170.83244324 1.29916835 -8.90940857 170.8039093 1.62874842 -8.9375 170.8404541
		 1.94534242 -8.96061707 170.94073486 2.23667574 -8.97796631 171.10090637 2.49147248 -8.98876953 171.31469727
		 2.70007181 -8.99266052 171.57417297 2.85432315 -8.98959351 171.86903381 2.94841123 -8.97950745 172.18812561
		 2.97875929 -8.96290588 172.51925659 2.94402552 -8.94035339 172.84954834 2.84572744 -8.9127655 173.16638184
		 2.68752623 -8.88121033 173.45753479 2.47544193 -8.84689331 173.71183777 2.21784973 -8.81109619 173.91947937
		 1.92447078 -8.77528381 174.07258606 1.60657191 -8.74073792 174.16522217 1.27656519 -8.70880127 174.19387817
		 0.94688326 -8.68070984 174.15731812 0.63028944 -8.65757751 174.057037354 0.33905795 -8.64022827 173.8968811
		 0.084158398 -8.62942505 173.6829834 -0.12433811 -8.62553406 173.42359924 -0.27869111 -8.62872314 173.1287384
		 -0.37278086 -8.63879395 172.80953979 -0.27532119 -8.34140015 172.46070862 -0.24265629 -8.36260986 172.1496582
		 -0.15010633 -8.38867188 171.85121155 -0.0010334648 -8.41838074 171.57696533 0.19863914 -8.45066833 171.33734131
		 0.441347 -8.48435974 171.14173889 0.71767181 -8.51817322 170.99757385 1.017157674 -8.55064392 170.91026306
		 1.32810628 -8.58071899 170.8833313 1.63859284 -8.60717773 170.91769409 1.93677485 -8.6289978 171.012207031
		 2.21119404 -8.64527893 171.16304016 2.45119071 -8.65544128 171.36451721 2.64771938 -8.65921021 171.60891724
		 2.7930429 -8.65621948 171.88665771 2.88165998 -8.64675903 172.18731689 2.91020107 -8.63108826 172.49919128
		 2.87753606 -8.60987854 172.81025696 2.78488421 -8.58392334 173.10871887 2.63581109 -8.55419922 173.38294983
		 2.43613863 -8.52180481 173.62257385 2.19343042 -8.48812866 173.81816101 1.91710591 -8.45431519 173.96234131
		 1.61772215 -8.42184448 174.0496521 1.3067733 -8.39176941 174.076583862 0.99618375 -8.36531067 174.042114258
		 0.6980027 -8.34347534 173.94769287 0.42368573 -8.32720947 173.796875 0.18358657 -8.31704712 173.59536743
		 -0.012839753 -8.3132782 173.35098267 -0.15816374 -8.31626892 173.073181152 -0.24688219 -8.32582092 172.77261353
		 -0.088755801 -8.058319092 172.44526672 -0.059377875 -8.077407837 172.16529846 0.02395816 -8.10084534 171.89672852
		 0.15808228 -8.12753296 171.64981079 0.3378801 -8.15672302 171.43424988 0.55628556 -8.18701172 171.25808716
		 0.80499822 -8.21736145 171.12831116 1.074373245 -8.2467041 171.049880981 1.35423672 -8.2736969 171.025558472
		 1.63368487 -8.29751587 171.056488037 1.90210009 -8.31713867 171.14160156;
	setAttr ".vt[332:481]" 2.14904642 -8.3318634 171.27735901 2.36509442 -8.34100342 171.45863342
		 2.54191828 -8.34428406 171.67851257 2.6727097 -8.34165955 171.92854309 2.75248575 -8.33308411 172.19911194
		 2.77819324 -8.3190155 172.47982788 2.74871302 -8.29992676 172.75978088 2.6653769 -8.27659607 173.02835083
		 2.53125286 -8.24980164 173.27523804 2.35155678 -8.22071838 173.49078369 2.13315082 -8.19042969 173.66691589
		 1.88443887 -8.15997314 173.79672241 1.61496174 -8.1307373 173.87519836 1.33509827 -8.1036377 173.89950562
		 1.055648923 -8.079818726 173.86843872 0.78723484 -8.060211182 173.78344727 0.54028809 -8.045593262 173.64768982
		 0.32424042 -8.036346436 173.46640015 0.14751759 -8.033050537 173.24642944 0.016624285 -8.035675049 172.99641418
		 -0.063150585 -8.044250488 172.72595215 0.14952882 -7.81707764 172.43258667 0.17449258 -7.83326721 172.19436646
		 0.24544466 -7.85319519 171.9659729 0.35950586 -7.87588501 171.756073 0.51236373 -7.9006958 171.57275391
		 0.69806427 -7.92643738 171.42300415 0.90962219 -7.95227051 171.31260681 1.13871241 -7.97723389 171.24580383
		 1.37668884 -8.00021362305 171.22521973 1.61437821 -8.020462036 171.25154114 1.84259224 -8.037185669 171.32389832
		 2.052635431 -8.049560547 171.43939209 2.23630738 -8.057418823 171.59353638 2.3867209 -8.060272217 171.78057861
		 2.49799609 -8.057952881 171.9931488 2.56577611 -8.050735474 172.22322083 2.58763361 -8.038742065 172.46194458
		 2.5626688 -8.022445679 172.70004272 2.49171638 -8.0026245117 172.92845154 2.37765551 -7.97982788 173.13835144
		 2.22479749 -7.9551239 173.32170105 2.039097071 -7.92927551 173.47143555 1.82753897 -7.90345764 173.58184814
		 1.59844923 -7.87858582 173.64865112 1.36037076 -7.85560608 173.66923523 1.12278342 -7.83535767 173.64291382
		 0.89456987 -7.81863403 173.57063293 0.68452668 -7.80615234 173.45516968 0.50075209 -7.79840088 173.30090332
		 0.35044134 -7.79554749 173.11398315 0.23916517 -7.79776001 172.90130615 0.17138551 -7.80508423 172.67121887
		 0.43035129 -7.62672424 172.42311096 0.45006847 -7.63955688 172.23603821 0.50575852 -7.65510559 172.056610107
		 0.59534156 -7.67303467 171.89169312 0.71540731 -7.69250488 171.74760437 0.86141765 -7.71273804 171.63000488
		 1.027597785 -7.73300171 171.54324341 1.20765603 -7.75256348 171.49081421 1.39457071 -7.77069092 171.47451782
		 1.58131289 -7.78657532 171.49528503 1.76063049 -7.79968262 171.55206299 1.92567241 -7.80943298 171.64285278
		 2.069978237 -7.81562805 171.76396179 2.18810225 -7.81788635 171.91090393 2.2755034 -7.81602478 172.077911377
		 2.32886076 -7.81030273 172.25865173 2.34596896 -7.80096436 172.44622803 2.32635379 -7.78813171 172.63331604
		 2.27066469 -7.77258301 172.81286621 2.18097878 -7.75474548 172.97769165 2.060912609 -7.73518372 173.12174988
		 1.91500556 -7.71495056 173.23944092 1.74882424 -7.69468689 173.32611084 1.56876731 -7.67512512 173.37864685
		 1.38174927 -7.65698242 173.39483643 1.19500744 -7.64111328 173.37406921 1.015689373 -7.62800598 173.317276
		 0.85075116 -7.61825562 173.22665405 0.70634276 -7.61206055 173.10549927 0.58821869 -7.60990906 172.95854187
		 0.50081664 -7.61164856 172.79144287 0.44756159 -7.61737061 172.61070251 0.74300331 -7.49481201 172.41746521
		 0.75651801 -7.50361633 172.28857422 0.79496849 -7.51435852 172.16496277 0.85666305 -7.52667236 172.051345825
		 0.93939829 -7.54003906 171.95213318 1.039841771 -7.55403137 171.87104797 1.15435135 -7.56799316 171.81134033
		 1.27835727 -7.58151245 171.77519226 1.40718007 -7.59397888 171.76400757 1.53582692 -7.60487366 171.77830505
		 1.65929341 -7.61387634 171.81741333 1.77297664 -7.62071228 171.87986755 1.87236762 -7.62486267 171.96334839
		 1.95376408 -7.62644958 172.064529419 2.013969898 -7.62518311 172.17962646 2.050699472 -7.62132263 172.30415344
		 2.062482595 -7.61476135 172.43334961 2.0489676 -7.60594177 172.5622406 2.01061964 -7.59521484 172.68583679
		 1.94892526 -7.58288574 172.79945374 1.86619008 -7.56951904 172.89868164 1.76564336 -7.55554199 172.97967529
		 1.65113413 -7.5415802 173.039382935 1.52712893 -7.52815247 173.075622559 1.39830506 -7.51568604 173.086715698
		 1.26976144 -7.50469971 173.072525024 1.14619279 -7.49568176 173.033401489 1.032508492 -7.4889679 172.9708252
		 0.93311852 -7.48471069 172.88745117 0.85172105 -7.48312378 172.78616333 0.7915163 -7.484375 172.67115784
		 0.7547856 -7.48834229 172.54653931 1.075445771 -7.42622375 172.41560364 1.082293391 -7.43078613 172.34986877
		 1.10181391 -7.43626404 172.28688049 1.13331449 -7.4425354 172.22901917 1.17548883 -7.44937134 172.17837524
		 1.22672355 -7.45648193 172.13705444 1.2850945 -7.46360779 172.10656738 1.34836972 -7.4704895 172.088180542
		 1.41400409 -7.47686768 172.082519531 1.47955287 -7.48236084 172.089813232 1.54256415 -7.48696899 172.10968018
		 1.60048318 -7.49047852 172.14160156 1.65115452 -7.49259949 172.18409729 1.69262707 -7.49334717 172.23574829
		 1.72335231 -7.4927063 172.29444885 1.74208426 -7.4907074 172.3578186 1.74808979 -7.48747253 172.42373657
		 1.74114025 -7.48291016 172.48945618 1.72161961 -7.47743225 172.5524292 1.69011927 -7.47116089 172.6103363
		 1.64794517 -7.46443176 172.66094971 1.59671032 -7.45722961 172.70227051 1.53833914 -7.4500885 172.73272705
		 1.47516632 -7.44322205 172.75112915 1.40953112 -7.43693542 172.7567749 1.34388065 -7.43133545 172.74946594
		 1.28097081 -7.42672729 172.72953796 1.22305274 -7.42321777 172.69770813 1.17227948 -7.4210968 172.6552124
		 1.13080657 -7.42036438 172.6035614 1.10018361 -7.42098999 172.54489136 1.081450582 -7.42298889 172.48143005
		 1.41482687 -7.42381287 172.41769409;
	setAttr -s 992 ".ed";
	setAttr ".ed[0:165]"  0 1 1 1 2 1 2 0 1 2 3 1 3 0 1 3 4 1 4 0 1 4 5 1 5 0 1
		 5 6 1 6 0 1 6 7 1 7 0 1 7 8 1 8 0 1 8 9 1 9 0 1 9 10 1 10 0 1 10 11 1 11 0 1 11 12 1
		 12 0 1 12 13 1 13 0 1 13 14 1 14 0 1 14 15 1 15 0 1 15 16 1 16 0 1 16 17 1 17 0 1
		 17 18 1 18 0 1 18 19 1 19 0 1 19 20 1 20 0 1 20 21 1 21 0 1 21 22 1 22 0 1 22 23 1
		 23 0 1 23 24 1 24 0 1 24 25 1 25 0 1 25 26 1 26 0 1 26 27 1 27 0 1 27 28 1 28 0 1
		 28 29 1 29 0 1 29 30 1 30 0 1 30 31 1 31 0 1 31 32 1 32 0 1 32 1 1 1 33 1 33 34 1
		 34 2 1 34 35 1 35 3 1 35 36 1 36 4 1 36 37 1 37 5 1 37 38 1 38 6 1 38 39 1 39 7 1
		 39 40 1 40 8 1 40 41 1 41 9 1 41 42 1 42 10 1 42 43 1 43 11 1 43 44 1 44 12 1 44 45 1
		 45 13 1 45 46 1 46 14 1 46 47 1 47 15 1 47 48 1 48 16 1 48 49 1 49 17 1 49 50 1 50 18 1
		 50 51 1 51 19 1 51 52 1 52 20 1 52 53 1 53 21 1 53 54 1 54 22 1 54 55 1 55 23 1 55 56 1
		 56 24 1 56 57 1 57 25 1 57 58 1 58 26 1 58 59 1 59 27 1 59 60 1 60 28 1 60 61 1 61 29 1
		 61 62 1 62 30 1 62 63 1 63 31 1 63 64 1 64 32 1 64 33 1 33 65 1 65 66 1 66 34 1 66 67 1
		 67 35 1 67 68 1 68 36 1 68 69 1 69 37 1 69 70 1 70 38 1 70 71 1 71 39 1 71 72 1 72 40 1
		 72 73 1 73 41 1 73 74 1 74 42 1 74 75 1 75 43 1 75 76 1 76 44 1 76 77 1 77 45 1 77 78 1
		 78 46 1 78 79 1 79 47 1 79 80 1 80 48 1 80 81 1 81 49 1 81 82 1 82 50 1 82 83 1 83 51 1
		 83 84 1;
	setAttr ".ed[166:331]" 84 52 1 84 85 1 85 53 1 85 86 1 86 54 1 86 87 1 87 55 1
		 87 88 1 88 56 1 88 89 1 89 57 1 89 90 1 90 58 1 90 91 1 91 59 1 91 92 1 92 60 1 92 93 1
		 93 61 1 93 94 1 94 62 1 94 95 1 95 63 1 95 96 1 96 64 1 96 65 1 65 97 1 97 98 1 98 66 1
		 98 99 1 99 67 1 99 100 1 100 68 1 100 101 1 101 69 1 101 102 1 102 70 1 102 103 1
		 103 71 1 103 104 1 104 72 1 104 105 1 105 73 1 105 106 1 106 74 1 106 107 1 107 75 1
		 107 108 1 108 76 1 108 109 1 109 77 1 109 110 1 110 78 1 110 111 1 111 79 1 111 112 1
		 112 80 1 112 113 1 113 81 1 113 114 1 114 82 1 114 115 1 115 83 1 115 116 1 116 84 1
		 116 117 1 117 85 1 117 118 1 118 86 1 118 119 1 119 87 1 119 120 1 120 88 1 120 121 1
		 121 89 1 121 122 1 122 90 1 122 123 1 123 91 1 123 124 1 124 92 1 124 125 1 125 93 1
		 125 126 1 126 94 1 126 127 1 127 95 1 127 128 1 128 96 1 128 97 1 97 129 1 129 130 1
		 130 98 1 130 131 1 131 99 1 131 132 1 132 100 1 132 133 1 133 101 1 133 134 1 134 102 1
		 134 135 1 135 103 1 135 136 1 136 104 1 136 137 1 137 105 1 137 138 1 138 106 1 138 139 1
		 139 107 1 139 140 1 140 108 1 140 141 1 141 109 1 141 142 1 142 110 1 142 143 1 143 111 1
		 143 144 1 144 112 1 144 145 1 145 113 1 145 146 1 146 114 1 146 147 1 147 115 1 147 148 1
		 148 116 1 148 149 1 149 117 1 149 150 1 150 118 1 150 151 1 151 119 1 151 152 1 152 120 1
		 152 153 1 153 121 1 153 154 1 154 122 1 154 155 1 155 123 1 155 156 1 156 124 1 156 157 1
		 157 125 1 157 158 1 158 126 1 158 159 1 159 127 1 159 160 1 160 128 1 160 129 1 129 161 1
		 161 162 1 162 130 1 162 163 1 163 131 1 163 164 1 164 132 1 164 165 1 165 133 1 165 166 1
		 166 134 1 166 167 1;
	setAttr ".ed[332:497]" 167 135 1 167 168 1 168 136 1 168 169 1 169 137 1 169 170 1
		 170 138 1 170 171 1 171 139 1 171 172 1 172 140 1 172 173 1 173 141 1 173 174 1 174 142 1
		 174 175 1 175 143 1 175 176 1 176 144 1 176 177 1 177 145 1 177 178 1 178 146 1 178 179 1
		 179 147 1 179 180 1 180 148 1 180 181 1 181 149 1 181 182 1 182 150 1 182 183 1 183 151 1
		 183 184 1 184 152 1 184 185 1 185 153 1 185 186 1 186 154 1 186 187 1 187 155 1 187 188 1
		 188 156 1 188 189 1 189 157 1 189 190 1 190 158 1 190 191 1 191 159 1 191 192 1 192 160 1
		 192 161 1 161 193 1 193 194 1 194 162 1 194 195 1 195 163 1 195 196 1 196 164 1 196 197 1
		 197 165 1 197 198 1 198 166 1 198 199 1 199 167 1 199 200 1 200 168 1 200 201 1 201 169 1
		 201 202 1 202 170 1 202 203 1 203 171 1 203 204 1 204 172 1 204 205 1 205 173 1 205 206 1
		 206 174 1 206 207 1 207 175 1 207 208 1 208 176 1 208 209 1 209 177 1 209 210 1 210 178 1
		 210 211 1 211 179 1 211 212 1 212 180 1 212 213 1 213 181 1 213 214 1 214 182 1 214 215 1
		 215 183 1 215 216 1 216 184 1 216 217 1 217 185 1 217 218 1 218 186 1 218 219 1 219 187 1
		 219 220 1 220 188 1 220 221 1 221 189 1 221 222 1 222 190 1 222 223 1 223 191 1 223 224 1
		 224 192 1 224 193 1 193 225 1 225 226 1 226 194 1 226 227 1 227 195 1 227 228 1 228 196 1
		 228 229 1 229 197 1 229 230 1 230 198 1 230 231 1 231 199 1 231 232 1 232 200 1 232 233 1
		 233 201 1 233 234 1 234 202 1 234 235 1 235 203 1 235 236 1 236 204 1 236 237 1 237 205 1
		 237 238 1 238 206 1 238 239 1 239 207 1 239 240 1 240 208 1 240 241 1 241 209 1 241 242 1
		 242 210 1 242 243 1 243 211 1 243 244 1 244 212 1 244 245 1 245 213 1 245 246 1 246 214 1
		 246 247 1 247 215 1 247 248 1 248 216 1 248 249 1 249 217 1 249 250 1;
	setAttr ".ed[498:663]" 250 218 1 250 251 1 251 219 1 251 252 1 252 220 1 252 253 1
		 253 221 1 253 254 1 254 222 1 254 255 1 255 223 1 255 256 1 256 224 1 256 225 1 225 257 1
		 257 258 1 258 226 1 258 259 1 259 227 1 259 260 1 260 228 1 260 261 1 261 229 1 261 262 1
		 262 230 1 262 263 1 263 231 1 263 264 1 264 232 1 264 265 1 265 233 1 265 266 1 266 234 1
		 266 267 1 267 235 1 267 268 1 268 236 1 268 269 1 269 237 1 269 270 1 270 238 1 270 271 1
		 271 239 1 271 272 1 272 240 1 272 273 1 273 241 1 273 274 1 274 242 1 274 275 1 275 243 1
		 275 276 1 276 244 1 276 277 1 277 245 1 277 278 1 278 246 1 278 279 1 279 247 1 279 280 1
		 280 248 1 280 281 1 281 249 1 281 282 1 282 250 1 282 283 1 283 251 1 283 284 1 284 252 1
		 284 285 1 285 253 1 285 286 1 286 254 1 286 287 1 287 255 1 287 288 1 288 256 1 288 257 1
		 257 289 1 289 290 1 290 258 1 290 291 1 291 259 1 291 292 1 292 260 1 292 293 1 293 261 1
		 293 294 1 294 262 1 294 295 1 295 263 1 295 296 1 296 264 1 296 297 1 297 265 1 297 298 1
		 298 266 1 298 299 1 299 267 1 299 300 1 300 268 1 300 301 1 301 269 1 301 302 1 302 270 1
		 302 303 1 303 271 1 303 304 1 304 272 1 304 305 1 305 273 1 305 306 1 306 274 1 306 307 1
		 307 275 1 307 308 1 308 276 1 308 309 1 309 277 1 309 310 1 310 278 1 310 311 1 311 279 1
		 311 312 1 312 280 1 312 313 1 313 281 1 313 314 1 314 282 1 314 315 1 315 283 1 315 316 1
		 316 284 1 316 317 1 317 285 1 317 318 1 318 286 1 318 319 1 319 287 1 319 320 1 320 288 1
		 320 289 1 289 321 1 321 322 1 322 290 1 322 323 1 323 291 1 323 324 1 324 292 1 324 325 1
		 325 293 1 325 326 1 326 294 1 326 327 1 327 295 1 327 328 1 328 296 1 328 329 1 329 297 1
		 329 330 1 330 298 1 330 331 1 331 299 1 331 332 1 332 300 1 332 333 1;
	setAttr ".ed[664:829]" 333 301 1 333 334 1 334 302 1 334 335 1 335 303 1 335 336 1
		 336 304 1 336 337 1 337 305 1 337 338 1 338 306 1 338 339 1 339 307 1 339 340 1 340 308 1
		 340 341 1 341 309 1 341 342 1 342 310 1 342 343 1 343 311 1 343 344 1 344 312 1 344 345 1
		 345 313 1 345 346 1 346 314 1 346 347 1 347 315 1 347 348 1 348 316 1 348 349 1 349 317 1
		 349 350 1 350 318 1 350 351 1 351 319 1 351 352 1 352 320 1 352 321 1 321 353 1 353 354 1
		 354 322 1 354 355 1 355 323 1 355 356 1 356 324 1 356 357 1 357 325 1 357 358 1 358 326 1
		 358 359 1 359 327 1 359 360 1 360 328 1 360 361 1 361 329 1 361 362 1 362 330 1 362 363 1
		 363 331 1 363 364 1 364 332 1 364 365 1 365 333 1 365 366 1 366 334 1 366 367 1 367 335 1
		 367 368 1 368 336 1 368 369 1 369 337 1 369 370 1 370 338 1 370 371 1 371 339 1 371 372 1
		 372 340 1 372 373 1 373 341 1 373 374 1 374 342 1 374 375 1 375 343 1 375 376 1 376 344 1
		 376 377 1 377 345 1 377 378 1 378 346 1 378 379 1 379 347 1 379 380 1 380 348 1 380 381 1
		 381 349 1 381 382 1 382 350 1 382 383 1 383 351 1 383 384 1 384 352 1 384 353 1 353 385 1
		 385 386 1 386 354 1 386 387 1 387 355 1 387 388 1 388 356 1 388 389 1 389 357 1 389 390 1
		 390 358 1 390 391 1 391 359 1 391 392 1 392 360 1 392 393 1 393 361 1 393 394 1 394 362 1
		 394 395 1 395 363 1 395 396 1 396 364 1 396 397 1 397 365 1 397 398 1 398 366 1 398 399 1
		 399 367 1 399 400 1 400 368 1 400 401 1 401 369 1 401 402 1 402 370 1 402 403 1 403 371 1
		 403 404 1 404 372 1 404 405 1 405 373 1 405 406 1 406 374 1 406 407 1 407 375 1 407 408 1
		 408 376 1 408 409 1 409 377 1 409 410 1 410 378 1 410 411 1 411 379 1 411 412 1 412 380 1
		 412 413 1 413 381 1 413 414 1 414 382 1 414 415 1 415 383 1 415 416 1;
	setAttr ".ed[830:991]" 416 384 1 416 385 1 385 417 1 417 418 1 418 386 1 418 419 1
		 419 387 1 419 420 1 420 388 1 420 421 1 421 389 1 421 422 1 422 390 1 422 423 1 423 391 1
		 423 424 1 424 392 1 424 425 1 425 393 1 425 426 1 426 394 1 426 427 1 427 395 1 427 428 1
		 428 396 1 428 429 1 429 397 1 429 430 1 430 398 1 430 431 1 431 399 1 431 432 1 432 400 1
		 432 433 1 433 401 1 433 434 1 434 402 1 434 435 1 435 403 1 435 436 1 436 404 1 436 437 1
		 437 405 1 437 438 1 438 406 1 438 439 1 439 407 1 439 440 1 440 408 1 440 441 1 441 409 1
		 441 442 1 442 410 1 442 443 1 443 411 1 443 444 1 444 412 1 444 445 1 445 413 1 445 446 1
		 446 414 1 446 447 1 447 415 1 447 448 1 448 416 1 448 417 1 417 449 1 449 450 1 450 418 1
		 450 451 1 451 419 1 451 452 1 452 420 1 452 453 1 453 421 1 453 454 1 454 422 1 454 455 1
		 455 423 1 455 456 1 456 424 1 456 457 1 457 425 1 457 458 1 458 426 1 458 459 1 459 427 1
		 459 460 1 460 428 1 460 461 1 461 429 1 461 462 1 462 430 1 462 463 1 463 431 1 463 464 1
		 464 432 1 464 465 1 465 433 1 465 466 1 466 434 1 466 467 1 467 435 1 467 468 1 468 436 1
		 468 469 1 469 437 1 469 470 1 470 438 1 470 471 1 471 439 1 471 472 1 472 440 1 472 473 1
		 473 441 1 473 474 1 474 442 1 474 475 1 475 443 1 475 476 1 476 444 1 476 477 1 477 445 1
		 477 478 1 478 446 1 478 479 1 479 447 1 479 480 1 480 448 1 480 449 1 481 450 1 449 481 1
		 481 451 1 481 452 1 481 453 1 481 454 1 481 455 1 481 456 1 481 457 1 481 458 1 481 459 1
		 481 460 1 481 461 1 481 462 1 481 463 1 481 464 1 481 465 1 481 466 1 481 467 1 481 468 1
		 481 469 1 481 470 1 481 471 1 481 472 1 481 473 1 481 474 1 481 475 1 481 476 1 481 477 1
		 481 478 1 481 479 1 481 480 1;
	setAttr -s 512 -ch 1984 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 0 1 2
		f 3 -3 3 4
		mu 0 3 0 2 3
		f 3 -5 5 6
		mu 0 3 0 3 4
		f 3 -7 7 8
		mu 0 3 0 4 5
		f 3 -9 9 10
		mu 0 3 0 5 6
		f 3 -11 11 12
		mu 0 3 0 6 7
		f 3 -13 13 14
		mu 0 3 0 7 8
		f 3 -15 15 16
		mu 0 3 0 8 9
		f 3 -17 17 18
		mu 0 3 0 9 10
		f 3 -19 19 20
		mu 0 3 0 10 11
		f 3 -21 21 22
		mu 0 3 0 11 12
		f 3 -23 23 24
		mu 0 3 0 12 13
		f 3 -25 25 26
		mu 0 3 0 13 14
		f 3 -27 27 28
		mu 0 3 0 14 15
		f 3 -29 29 30
		mu 0 3 0 15 16
		f 3 -31 31 32
		mu 0 3 0 16 17
		f 3 -33 33 34
		mu 0 3 0 17 18
		f 3 -35 35 36
		mu 0 3 0 18 19
		f 3 -37 37 38
		mu 0 3 0 19 20
		f 3 -39 39 40
		mu 0 3 0 20 21
		f 3 -41 41 42
		mu 0 3 0 21 22
		f 3 -43 43 44
		mu 0 3 0 22 23
		f 3 -45 45 46
		mu 0 3 0 23 24
		f 3 -47 47 48
		mu 0 3 0 24 25
		f 3 -49 49 50
		mu 0 3 0 25 26
		f 3 -51 51 52
		mu 0 3 0 26 27
		f 3 -53 53 54
		mu 0 3 0 27 28
		f 3 -55 55 56
		mu 0 3 0 28 29
		f 3 -57 57 58
		mu 0 3 0 29 30
		f 3 -59 59 60
		mu 0 3 0 30 31
		f 3 -61 61 62
		mu 0 3 0 31 32
		f 3 -63 63 -1
		mu 0 3 0 32 1
		f 4 64 65 66 -2
		mu 0 4 1 33 34 2
		f 4 -67 67 68 -4
		mu 0 4 2 34 35 3
		f 4 -69 69 70 -6
		mu 0 4 3 35 36 4
		f 4 -71 71 72 -8
		mu 0 4 4 36 37 5
		f 4 -73 73 74 -10
		mu 0 4 5 37 38 6
		f 4 -75 75 76 -12
		mu 0 4 6 38 39 7
		f 4 -77 77 78 -14
		mu 0 4 7 39 40 8
		f 4 -79 79 80 -16
		mu 0 4 8 40 41 9
		f 4 -81 81 82 -18
		mu 0 4 9 41 42 10
		f 4 -83 83 84 -20
		mu 0 4 10 42 43 11
		f 4 -85 85 86 -22
		mu 0 4 11 43 44 12
		f 4 -87 87 88 -24
		mu 0 4 12 44 45 13
		f 4 -89 89 90 -26
		mu 0 4 13 45 46 14
		f 4 -91 91 92 -28
		mu 0 4 14 46 47 15
		f 4 -93 93 94 -30
		mu 0 4 15 47 48 16
		f 4 -95 95 96 -32
		mu 0 4 16 48 49 17
		f 4 -97 97 98 -34
		mu 0 4 17 49 50 18
		f 4 -99 99 100 -36
		mu 0 4 18 50 51 19
		f 4 -101 101 102 -38
		mu 0 4 19 51 52 20
		f 4 -103 103 104 -40
		mu 0 4 20 52 53 21
		f 4 -105 105 106 -42
		mu 0 4 21 53 54 22
		f 4 -107 107 108 -44
		mu 0 4 22 54 55 23
		f 4 -109 109 110 -46
		mu 0 4 23 55 56 24
		f 4 -111 111 112 -48
		mu 0 4 24 56 57 25
		f 4 -113 113 114 -50
		mu 0 4 25 57 58 26
		f 4 -115 115 116 -52
		mu 0 4 26 58 59 27
		f 4 -117 117 118 -54
		mu 0 4 27 59 60 28
		f 4 -119 119 120 -56
		mu 0 4 28 60 61 29
		f 4 -121 121 122 -58
		mu 0 4 29 61 62 30
		f 4 -123 123 124 -60
		mu 0 4 30 62 63 31
		f 4 -125 125 126 -62
		mu 0 4 31 63 64 32
		f 4 -127 127 -65 -64
		mu 0 4 32 64 33 1
		f 4 128 129 130 -66
		mu 0 4 33 65 66 34
		f 4 -131 131 132 -68
		mu 0 4 34 66 67 35
		f 4 -133 133 134 -70
		mu 0 4 35 67 68 36
		f 4 -135 135 136 -72
		mu 0 4 36 68 69 37
		f 4 -137 137 138 -74
		mu 0 4 37 69 70 38
		f 4 -139 139 140 -76
		mu 0 4 38 70 71 39
		f 4 -141 141 142 -78
		mu 0 4 39 71 72 40
		f 4 -143 143 144 -80
		mu 0 4 40 72 73 41
		f 4 -145 145 146 -82
		mu 0 4 41 73 74 42
		f 4 -147 147 148 -84
		mu 0 4 42 74 75 43
		f 4 -149 149 150 -86
		mu 0 4 43 75 76 44
		f 4 -151 151 152 -88
		mu 0 4 44 76 77 45
		f 4 -153 153 154 -90
		mu 0 4 45 77 78 46
		f 4 -155 155 156 -92
		mu 0 4 46 78 79 47
		f 4 -157 157 158 -94
		mu 0 4 47 79 80 48
		f 4 -159 159 160 -96
		mu 0 4 48 80 81 49
		f 4 -161 161 162 -98
		mu 0 4 49 81 82 50
		f 4 -163 163 164 -100
		mu 0 4 50 82 83 51
		f 4 -165 165 166 -102
		mu 0 4 51 83 84 52
		f 4 -167 167 168 -104
		mu 0 4 52 84 85 53
		f 4 -169 169 170 -106
		mu 0 4 53 85 86 54
		f 4 -171 171 172 -108
		mu 0 4 54 86 87 55
		f 4 -173 173 174 -110
		mu 0 4 55 87 88 56
		f 4 -175 175 176 -112
		mu 0 4 56 88 89 57
		f 4 -177 177 178 -114
		mu 0 4 57 89 90 58
		f 4 -179 179 180 -116
		mu 0 4 58 90 91 59
		f 4 -181 181 182 -118
		mu 0 4 59 91 92 60
		f 4 -183 183 184 -120
		mu 0 4 60 92 93 61
		f 4 -185 185 186 -122
		mu 0 4 61 93 94 62
		f 4 -187 187 188 -124
		mu 0 4 62 94 95 63
		f 4 -189 189 190 -126
		mu 0 4 63 95 96 64
		f 4 -191 191 -129 -128
		mu 0 4 64 96 65 33
		f 4 192 193 194 -130
		mu 0 4 65 97 98 66
		f 4 -195 195 196 -132
		mu 0 4 66 98 99 67
		f 4 -197 197 198 -134
		mu 0 4 67 99 100 68
		f 4 -199 199 200 -136
		mu 0 4 68 100 101 69
		f 4 -201 201 202 -138
		mu 0 4 69 101 102 70
		f 4 -203 203 204 -140
		mu 0 4 70 102 103 71
		f 4 -205 205 206 -142
		mu 0 4 71 103 104 72
		f 4 -207 207 208 -144
		mu 0 4 72 104 105 73
		f 4 -209 209 210 -146
		mu 0 4 73 105 106 74
		f 4 -211 211 212 -148
		mu 0 4 74 106 107 75
		f 4 -213 213 214 -150
		mu 0 4 75 107 108 76
		f 4 -215 215 216 -152
		mu 0 4 76 108 109 77
		f 4 -217 217 218 -154
		mu 0 4 77 109 110 78
		f 4 -219 219 220 -156
		mu 0 4 78 110 111 79
		f 4 -221 221 222 -158
		mu 0 4 79 111 112 80
		f 4 -223 223 224 -160
		mu 0 4 80 112 113 81
		f 4 -225 225 226 -162
		mu 0 4 81 113 114 82
		f 4 -227 227 228 -164
		mu 0 4 82 114 115 83
		f 4 -229 229 230 -166
		mu 0 4 83 115 116 84
		f 4 -231 231 232 -168
		mu 0 4 84 116 117 85
		f 4 -233 233 234 -170
		mu 0 4 85 117 118 86
		f 4 -235 235 236 -172
		mu 0 4 86 118 119 87
		f 4 -237 237 238 -174
		mu 0 4 87 119 120 88
		f 4 -239 239 240 -176
		mu 0 4 88 120 121 89
		f 4 -241 241 242 -178
		mu 0 4 89 121 122 90
		f 4 -243 243 244 -180
		mu 0 4 90 122 123 91
		f 4 -245 245 246 -182
		mu 0 4 91 123 124 92
		f 4 -247 247 248 -184
		mu 0 4 92 124 125 93
		f 4 -249 249 250 -186
		mu 0 4 93 125 126 94
		f 4 -251 251 252 -188
		mu 0 4 94 126 127 95
		f 4 -253 253 254 -190
		mu 0 4 95 127 128 96
		f 4 -255 255 -193 -192
		mu 0 4 96 128 97 65
		f 4 256 257 258 -194
		mu 0 4 97 129 130 98
		f 4 -259 259 260 -196
		mu 0 4 98 130 131 99
		f 4 -261 261 262 -198
		mu 0 4 99 131 132 100
		f 4 -263 263 264 -200
		mu 0 4 100 132 133 101
		f 4 -265 265 266 -202
		mu 0 4 101 133 134 102
		f 4 -267 267 268 -204
		mu 0 4 102 134 135 103
		f 4 -269 269 270 -206
		mu 0 4 103 135 136 104
		f 4 -271 271 272 -208
		mu 0 4 104 136 137 105
		f 4 -273 273 274 -210
		mu 0 4 105 137 138 106
		f 4 -275 275 276 -212
		mu 0 4 106 138 139 107
		f 4 -277 277 278 -214
		mu 0 4 107 139 140 108
		f 4 -279 279 280 -216
		mu 0 4 108 140 141 109
		f 4 -281 281 282 -218
		mu 0 4 109 141 142 110
		f 4 -283 283 284 -220
		mu 0 4 110 142 143 111
		f 4 -285 285 286 -222
		mu 0 4 111 143 144 112
		f 4 -287 287 288 -224
		mu 0 4 112 144 145 113
		f 4 -289 289 290 -226
		mu 0 4 113 145 146 114
		f 4 -291 291 292 -228
		mu 0 4 114 146 147 115
		f 4 -293 293 294 -230
		mu 0 4 115 147 148 116
		f 4 -295 295 296 -232
		mu 0 4 116 148 149 117
		f 4 -297 297 298 -234
		mu 0 4 117 149 150 118
		f 4 -299 299 300 -236
		mu 0 4 118 150 151 119
		f 4 -301 301 302 -238
		mu 0 4 119 151 152 120
		f 4 -303 303 304 -240
		mu 0 4 120 152 153 121
		f 4 -305 305 306 -242
		mu 0 4 121 153 154 122
		f 4 -307 307 308 -244
		mu 0 4 122 154 155 123
		f 4 -309 309 310 -246
		mu 0 4 123 155 156 124
		f 4 -311 311 312 -248
		mu 0 4 124 156 157 125
		f 4 -313 313 314 -250
		mu 0 4 125 157 158 126
		f 4 -315 315 316 -252
		mu 0 4 126 158 159 127
		f 4 -317 317 318 -254
		mu 0 4 127 159 160 128
		f 4 -319 319 -257 -256
		mu 0 4 128 160 129 97
		f 4 320 321 322 -258
		mu 0 4 129 161 162 130
		f 4 -323 323 324 -260
		mu 0 4 130 162 163 131
		f 4 -325 325 326 -262
		mu 0 4 131 163 164 132
		f 4 -327 327 328 -264
		mu 0 4 132 164 165 133
		f 4 -329 329 330 -266
		mu 0 4 133 165 166 134
		f 4 -331 331 332 -268
		mu 0 4 134 166 167 135
		f 4 -333 333 334 -270
		mu 0 4 135 167 168 136
		f 4 -335 335 336 -272
		mu 0 4 136 168 169 137
		f 4 -337 337 338 -274
		mu 0 4 137 169 170 138
		f 4 -339 339 340 -276
		mu 0 4 138 170 171 139
		f 4 -341 341 342 -278
		mu 0 4 139 171 172 140
		f 4 -343 343 344 -280
		mu 0 4 140 172 173 141
		f 4 -345 345 346 -282
		mu 0 4 141 173 174 142
		f 4 -347 347 348 -284
		mu 0 4 142 174 175 143
		f 4 -349 349 350 -286
		mu 0 4 143 175 176 144
		f 4 -351 351 352 -288
		mu 0 4 144 176 177 145
		f 4 -353 353 354 -290
		mu 0 4 145 177 178 146
		f 4 -355 355 356 -292
		mu 0 4 146 178 179 147
		f 4 -357 357 358 -294
		mu 0 4 147 179 180 148
		f 4 -359 359 360 -296
		mu 0 4 148 180 181 149
		f 4 -361 361 362 -298
		mu 0 4 149 181 182 150
		f 4 -363 363 364 -300
		mu 0 4 150 182 183 151
		f 4 -365 365 366 -302
		mu 0 4 151 183 184 152
		f 4 -367 367 368 -304
		mu 0 4 152 184 185 153
		f 4 -369 369 370 -306
		mu 0 4 153 185 186 154
		f 4 -371 371 372 -308
		mu 0 4 154 186 187 155
		f 4 -373 373 374 -310
		mu 0 4 155 187 188 156
		f 4 -375 375 376 -312
		mu 0 4 156 188 189 157
		f 4 -377 377 378 -314
		mu 0 4 157 189 190 158
		f 4 -379 379 380 -316
		mu 0 4 158 190 191 159
		f 4 -381 381 382 -318
		mu 0 4 159 191 192 160
		f 4 -383 383 -321 -320
		mu 0 4 160 192 161 129
		f 4 384 385 386 -322
		mu 0 4 161 193 194 162
		f 4 -387 387 388 -324
		mu 0 4 162 194 195 163
		f 4 -389 389 390 -326
		mu 0 4 163 195 196 164
		f 4 -391 391 392 -328
		mu 0 4 164 196 197 165
		f 4 -393 393 394 -330
		mu 0 4 165 197 198 166
		f 4 -395 395 396 -332
		mu 0 4 166 198 199 167
		f 4 -397 397 398 -334
		mu 0 4 167 199 200 168
		f 4 -399 399 400 -336
		mu 0 4 168 200 201 169
		f 4 -401 401 402 -338
		mu 0 4 169 201 202 170
		f 4 -403 403 404 -340
		mu 0 4 170 202 203 171
		f 4 -405 405 406 -342
		mu 0 4 171 203 204 172
		f 4 -407 407 408 -344
		mu 0 4 172 204 205 173
		f 4 -409 409 410 -346
		mu 0 4 173 205 206 174
		f 4 -411 411 412 -348
		mu 0 4 174 206 207 175
		f 4 -413 413 414 -350
		mu 0 4 175 207 208 176
		f 4 -415 415 416 -352
		mu 0 4 176 208 209 177
		f 4 -417 417 418 -354
		mu 0 4 177 209 210 178
		f 4 -419 419 420 -356
		mu 0 4 178 210 211 179
		f 4 -421 421 422 -358
		mu 0 4 179 211 212 180
		f 4 -423 423 424 -360
		mu 0 4 180 212 213 181
		f 4 -425 425 426 -362
		mu 0 4 181 213 214 182
		f 4 -427 427 428 -364
		mu 0 4 182 214 215 183
		f 4 -429 429 430 -366
		mu 0 4 183 215 216 184
		f 4 -431 431 432 -368
		mu 0 4 184 216 217 185
		f 4 -433 433 434 -370
		mu 0 4 185 217 218 186
		f 4 -435 435 436 -372
		mu 0 4 186 218 219 187
		f 4 -437 437 438 -374
		mu 0 4 187 219 220 188
		f 4 -439 439 440 -376
		mu 0 4 188 220 221 189
		f 4 -441 441 442 -378
		mu 0 4 189 221 222 190
		f 4 -443 443 444 -380
		mu 0 4 190 222 223 191
		f 4 -445 445 446 -382
		mu 0 4 191 223 224 192
		f 4 -447 447 -385 -384
		mu 0 4 192 224 193 161
		f 4 448 449 450 -386
		mu 0 4 193 225 226 194
		f 4 -451 451 452 -388
		mu 0 4 194 226 227 195
		f 4 -453 453 454 -390
		mu 0 4 195 227 228 196
		f 4 -455 455 456 -392
		mu 0 4 196 228 229 197
		f 4 -457 457 458 -394
		mu 0 4 197 229 230 198
		f 4 -459 459 460 -396
		mu 0 4 198 230 231 199
		f 4 -461 461 462 -398
		mu 0 4 199 231 232 200
		f 4 -463 463 464 -400
		mu 0 4 200 232 233 201
		f 4 -465 465 466 -402
		mu 0 4 201 233 234 202
		f 4 -467 467 468 -404
		mu 0 4 202 234 235 203
		f 4 -469 469 470 -406
		mu 0 4 203 235 236 204
		f 4 -471 471 472 -408
		mu 0 4 204 236 237 205
		f 4 -473 473 474 -410
		mu 0 4 205 237 238 206
		f 4 -475 475 476 -412
		mu 0 4 206 238 239 207
		f 4 -477 477 478 -414
		mu 0 4 207 239 240 208
		f 4 -479 479 480 -416
		mu 0 4 208 240 241 209
		f 4 -481 481 482 -418
		mu 0 4 209 241 242 210
		f 4 -483 483 484 -420
		mu 0 4 210 242 243 211
		f 4 -485 485 486 -422
		mu 0 4 211 243 244 212
		f 4 -487 487 488 -424
		mu 0 4 212 244 245 213
		f 4 -489 489 490 -426
		mu 0 4 213 245 246 214
		f 4 -491 491 492 -428
		mu 0 4 214 246 247 215
		f 4 -493 493 494 -430
		mu 0 4 215 247 248 216
		f 4 -495 495 496 -432
		mu 0 4 216 248 249 217
		f 4 -497 497 498 -434
		mu 0 4 217 249 250 218
		f 4 -499 499 500 -436
		mu 0 4 218 250 251 219
		f 4 -501 501 502 -438
		mu 0 4 219 251 252 220
		f 4 -503 503 504 -440
		mu 0 4 220 252 253 221
		f 4 -505 505 506 -442
		mu 0 4 221 253 254 222
		f 4 -507 507 508 -444
		mu 0 4 222 254 255 223
		f 4 -509 509 510 -446
		mu 0 4 223 255 256 224
		f 4 -511 511 -449 -448
		mu 0 4 224 256 225 193
		f 4 512 513 514 -450
		mu 0 4 257 258 259 260
		f 4 -515 515 516 -452
		mu 0 4 260 259 261 262
		f 4 -517 517 518 -454
		mu 0 4 262 261 263 264
		f 4 -519 519 520 -456
		mu 0 4 264 263 265 266
		f 4 -521 521 522 -458
		mu 0 4 266 265 267 268
		f 4 -523 523 524 -460
		mu 0 4 268 267 269 270
		f 4 -525 525 526 -462
		mu 0 4 270 269 271 272
		f 4 -527 527 528 -464
		mu 0 4 272 271 273 274
		f 4 -529 529 530 -466
		mu 0 4 274 273 275 276
		f 4 -531 531 532 -468
		mu 0 4 276 275 277 278
		f 4 -533 533 534 -470
		mu 0 4 278 277 279 280
		f 4 -535 535 536 -472
		mu 0 4 280 279 281 282
		f 4 -537 537 538 -474
		mu 0 4 282 281 283 284
		f 4 -539 539 540 -476
		mu 0 4 284 283 285 286
		f 4 -541 541 542 -478
		mu 0 4 286 285 287 288
		f 4 -543 543 544 -480
		mu 0 4 288 287 289 290
		f 4 -545 545 546 -482
		mu 0 4 290 289 291 292
		f 4 -547 547 548 -484
		mu 0 4 292 291 293 294
		f 4 -549 549 550 -486
		mu 0 4 294 293 295 296
		f 4 -551 551 552 -488
		mu 0 4 296 295 297 298
		f 4 -553 553 554 -490
		mu 0 4 298 297 299 300
		f 4 -555 555 556 -492
		mu 0 4 300 299 301 302
		f 4 -557 557 558 -494
		mu 0 4 302 301 303 304
		f 4 -559 559 560 -496
		mu 0 4 304 303 305 306
		f 4 -561 561 562 -498
		mu 0 4 306 305 307 308
		f 4 -563 563 564 -500
		mu 0 4 308 307 309 310
		f 4 -565 565 566 -502
		mu 0 4 310 309 311 312
		f 4 -567 567 568 -504
		mu 0 4 312 311 313 314
		f 4 -569 569 570 -506
		mu 0 4 314 313 315 316
		f 4 -571 571 572 -508
		mu 0 4 316 315 317 318
		f 4 -573 573 574 -510
		mu 0 4 318 317 319 320
		f 4 -575 575 -513 -512
		mu 0 4 320 319 258 257
		f 4 576 577 578 -514
		mu 0 4 258 321 322 259
		f 4 -579 579 580 -516
		mu 0 4 259 322 323 261
		f 4 -581 581 582 -518
		mu 0 4 261 323 324 263
		f 4 -583 583 584 -520
		mu 0 4 263 324 325 265
		f 4 -585 585 586 -522
		mu 0 4 265 325 326 267
		f 4 -587 587 588 -524
		mu 0 4 267 326 327 269
		f 4 -589 589 590 -526
		mu 0 4 269 327 328 271
		f 4 -591 591 592 -528
		mu 0 4 271 328 329 273
		f 4 -593 593 594 -530
		mu 0 4 273 329 330 275
		f 4 -595 595 596 -532
		mu 0 4 275 330 331 277
		f 4 -597 597 598 -534
		mu 0 4 277 331 332 279
		f 4 -599 599 600 -536
		mu 0 4 279 332 333 281
		f 4 -601 601 602 -538
		mu 0 4 281 333 334 283
		f 4 -603 603 604 -540
		mu 0 4 283 334 335 285
		f 4 -605 605 606 -542
		mu 0 4 285 335 336 287
		f 4 -607 607 608 -544
		mu 0 4 287 336 337 289
		f 4 -609 609 610 -546
		mu 0 4 289 337 338 291
		f 4 -611 611 612 -548
		mu 0 4 291 338 339 293
		f 4 -613 613 614 -550
		mu 0 4 293 339 340 295
		f 4 -615 615 616 -552
		mu 0 4 295 340 341 297
		f 4 -617 617 618 -554
		mu 0 4 297 341 342 299
		f 4 -619 619 620 -556
		mu 0 4 299 342 343 301
		f 4 -621 621 622 -558
		mu 0 4 301 343 344 303
		f 4 -623 623 624 -560
		mu 0 4 303 344 345 305
		f 4 -625 625 626 -562
		mu 0 4 305 345 346 307
		f 4 -627 627 628 -564
		mu 0 4 307 346 347 309
		f 4 -629 629 630 -566
		mu 0 4 309 347 348 311
		f 4 -631 631 632 -568
		mu 0 4 311 348 349 313
		f 4 -633 633 634 -570
		mu 0 4 313 349 350 315
		f 4 -635 635 636 -572
		mu 0 4 315 350 351 317
		f 4 -637 637 638 -574
		mu 0 4 317 351 352 319
		f 4 -639 639 -577 -576
		mu 0 4 319 352 321 258
		f 4 640 641 642 -578
		mu 0 4 321 353 354 322
		f 4 -643 643 644 -580
		mu 0 4 322 354 355 323
		f 4 -645 645 646 -582
		mu 0 4 323 355 356 324
		f 4 -647 647 648 -584
		mu 0 4 324 356 357 325
		f 4 -649 649 650 -586
		mu 0 4 325 357 358 326
		f 4 -651 651 652 -588
		mu 0 4 326 358 359 327
		f 4 -653 653 654 -590
		mu 0 4 327 359 360 328
		f 4 -655 655 656 -592
		mu 0 4 328 360 361 329
		f 4 -657 657 658 -594
		mu 0 4 329 361 362 330
		f 4 -659 659 660 -596
		mu 0 4 330 362 363 331
		f 4 -661 661 662 -598
		mu 0 4 331 363 364 332
		f 4 -663 663 664 -600
		mu 0 4 332 364 365 333
		f 4 -665 665 666 -602
		mu 0 4 333 365 366 334
		f 4 -667 667 668 -604
		mu 0 4 334 366 367 335
		f 4 -669 669 670 -606
		mu 0 4 335 367 368 336
		f 4 -671 671 672 -608
		mu 0 4 336 368 369 337
		f 4 -673 673 674 -610
		mu 0 4 337 369 370 338
		f 4 -675 675 676 -612
		mu 0 4 338 370 371 339
		f 4 -677 677 678 -614
		mu 0 4 339 371 372 340
		f 4 -679 679 680 -616
		mu 0 4 340 372 373 341
		f 4 -681 681 682 -618
		mu 0 4 341 373 374 342
		f 4 -683 683 684 -620
		mu 0 4 342 374 375 343
		f 4 -685 685 686 -622
		mu 0 4 343 375 376 344
		f 4 -687 687 688 -624
		mu 0 4 344 376 377 345
		f 4 -689 689 690 -626
		mu 0 4 345 377 378 346
		f 4 -691 691 692 -628
		mu 0 4 346 378 379 347
		f 4 -693 693 694 -630
		mu 0 4 347 379 380 348
		f 4 -695 695 696 -632
		mu 0 4 348 380 381 349
		f 4 -697 697 698 -634
		mu 0 4 349 381 382 350
		f 4 -699 699 700 -636
		mu 0 4 350 382 383 351
		f 4 -701 701 702 -638
		mu 0 4 351 383 384 352
		f 4 -703 703 -641 -640
		mu 0 4 352 384 353 321
		f 4 704 705 706 -642
		mu 0 4 353 385 386 354
		f 4 -707 707 708 -644
		mu 0 4 354 386 387 355
		f 4 -709 709 710 -646
		mu 0 4 355 387 388 356
		f 4 -711 711 712 -648
		mu 0 4 356 388 389 357
		f 4 -713 713 714 -650
		mu 0 4 357 389 390 358
		f 4 -715 715 716 -652
		mu 0 4 358 390 391 359
		f 4 -717 717 718 -654
		mu 0 4 359 391 392 360
		f 4 -719 719 720 -656
		mu 0 4 360 392 393 361
		f 4 -721 721 722 -658
		mu 0 4 361 393 394 362
		f 4 -723 723 724 -660
		mu 0 4 362 394 395 363
		f 4 -725 725 726 -662
		mu 0 4 363 395 396 364
		f 4 -727 727 728 -664
		mu 0 4 364 396 397 365
		f 4 -729 729 730 -666
		mu 0 4 365 397 398 366
		f 4 -731 731 732 -668
		mu 0 4 366 398 399 367
		f 4 -733 733 734 -670
		mu 0 4 367 399 400 368
		f 4 -735 735 736 -672
		mu 0 4 368 400 401 369
		f 4 -737 737 738 -674
		mu 0 4 369 401 402 370
		f 4 -739 739 740 -676
		mu 0 4 370 402 403 371
		f 4 -741 741 742 -678
		mu 0 4 371 403 404 372
		f 4 -743 743 744 -680
		mu 0 4 372 404 405 373
		f 4 -745 745 746 -682
		mu 0 4 373 405 406 374
		f 4 -747 747 748 -684
		mu 0 4 374 406 407 375
		f 4 -749 749 750 -686
		mu 0 4 375 407 408 376
		f 4 -751 751 752 -688
		mu 0 4 376 408 409 377
		f 4 -753 753 754 -690
		mu 0 4 377 409 410 378
		f 4 -755 755 756 -692
		mu 0 4 378 410 411 379
		f 4 -757 757 758 -694
		mu 0 4 379 411 412 380
		f 4 -759 759 760 -696
		mu 0 4 380 412 413 381
		f 4 -761 761 762 -698
		mu 0 4 381 413 414 382
		f 4 -763 763 764 -700
		mu 0 4 382 414 415 383
		f 4 -765 765 766 -702
		mu 0 4 383 415 416 384
		f 4 -767 767 -705 -704
		mu 0 4 384 416 385 353
		f 4 768 769 770 -706
		mu 0 4 385 417 418 386
		f 4 -771 771 772 -708
		mu 0 4 386 418 419 387
		f 4 -773 773 774 -710
		mu 0 4 387 419 420 388
		f 4 -775 775 776 -712
		mu 0 4 388 420 421 389
		f 4 -777 777 778 -714
		mu 0 4 389 421 422 390
		f 4 -779 779 780 -716
		mu 0 4 390 422 423 391
		f 4 -781 781 782 -718
		mu 0 4 391 423 424 392
		f 4 -783 783 784 -720
		mu 0 4 392 424 425 393
		f 4 -785 785 786 -722
		mu 0 4 393 425 426 394
		f 4 -787 787 788 -724
		mu 0 4 394 426 427 395
		f 4 -789 789 790 -726
		mu 0 4 395 427 428 396
		f 4 -791 791 792 -728
		mu 0 4 396 428 429 397
		f 4 -793 793 794 -730
		mu 0 4 397 429 430 398
		f 4 -795 795 796 -732
		mu 0 4 398 430 431 399
		f 4 -797 797 798 -734
		mu 0 4 399 431 432 400
		f 4 -799 799 800 -736
		mu 0 4 400 432 433 401
		f 4 -801 801 802 -738
		mu 0 4 401 433 434 402
		f 4 -803 803 804 -740
		mu 0 4 402 434 435 403
		f 4 -805 805 806 -742
		mu 0 4 403 435 436 404
		f 4 -807 807 808 -744
		mu 0 4 404 436 437 405
		f 4 -809 809 810 -746
		mu 0 4 405 437 438 406
		f 4 -811 811 812 -748
		mu 0 4 406 438 439 407
		f 4 -813 813 814 -750
		mu 0 4 407 439 440 408
		f 4 -815 815 816 -752
		mu 0 4 408 440 441 409
		f 4 -817 817 818 -754
		mu 0 4 409 441 442 410
		f 4 -819 819 820 -756
		mu 0 4 410 442 443 411
		f 4 -821 821 822 -758
		mu 0 4 411 443 444 412
		f 4 -823 823 824 -760
		mu 0 4 412 444 445 413
		f 4 -825 825 826 -762
		mu 0 4 413 445 446 414
		f 4 -827 827 828 -764
		mu 0 4 414 446 447 415
		f 4 -829 829 830 -766
		mu 0 4 415 447 448 416
		f 4 -831 831 -769 -768
		mu 0 4 416 448 417 385
		f 4 832 833 834 -770
		mu 0 4 417 449 450 418
		f 4 -835 835 836 -772
		mu 0 4 418 450 451 419
		f 4 -837 837 838 -774
		mu 0 4 419 451 452 420
		f 4 -839 839 840 -776
		mu 0 4 420 452 453 421
		f 4 -841 841 842 -778
		mu 0 4 421 453 454 422
		f 4 -843 843 844 -780
		mu 0 4 422 454 455 423
		f 4 -845 845 846 -782
		mu 0 4 423 455 456 424
		f 4 -847 847 848 -784
		mu 0 4 424 456 457 425
		f 4 -849 849 850 -786
		mu 0 4 425 457 458 426
		f 4 -851 851 852 -788
		mu 0 4 426 458 459 427
		f 4 -853 853 854 -790
		mu 0 4 427 459 460 428
		f 4 -855 855 856 -792
		mu 0 4 428 460 461 429
		f 4 -857 857 858 -794
		mu 0 4 429 461 462 430
		f 4 -859 859 860 -796
		mu 0 4 430 462 463 431
		f 4 -861 861 862 -798
		mu 0 4 431 463 464 432
		f 4 -863 863 864 -800
		mu 0 4 432 464 465 433
		f 4 -865 865 866 -802
		mu 0 4 433 465 466 434
		f 4 -867 867 868 -804
		mu 0 4 434 466 467 435
		f 4 -869 869 870 -806
		mu 0 4 435 467 468 436
		f 4 -871 871 872 -808
		mu 0 4 436 468 469 437
		f 4 -873 873 874 -810
		mu 0 4 437 469 470 438
		f 4 -875 875 876 -812
		mu 0 4 438 470 471 439
		f 4 -877 877 878 -814
		mu 0 4 439 471 472 440
		f 4 -879 879 880 -816
		mu 0 4 440 472 473 441
		f 4 -881 881 882 -818
		mu 0 4 441 473 474 442
		f 4 -883 883 884 -820
		mu 0 4 442 474 475 443
		f 4 -885 885 886 -822
		mu 0 4 443 475 476 444
		f 4 -887 887 888 -824
		mu 0 4 444 476 477 445
		f 4 -889 889 890 -826
		mu 0 4 445 477 478 446
		f 4 -891 891 892 -828
		mu 0 4 446 478 479 447
		f 4 -893 893 894 -830
		mu 0 4 447 479 480 448
		f 4 -895 895 -833 -832
		mu 0 4 448 480 449 417
		f 4 896 897 898 -834
		mu 0 4 449 481 482 450
		f 4 -899 899 900 -836
		mu 0 4 450 482 483 451
		f 4 -901 901 902 -838
		mu 0 4 451 483 484 452
		f 4 -903 903 904 -840
		mu 0 4 452 484 485 453
		f 4 -905 905 906 -842
		mu 0 4 453 485 486 454
		f 4 -907 907 908 -844
		mu 0 4 454 486 487 455
		f 4 -909 909 910 -846
		mu 0 4 455 487 488 456
		f 4 -911 911 912 -848
		mu 0 4 456 488 489 457
		f 4 -913 913 914 -850
		mu 0 4 457 489 490 458
		f 4 -915 915 916 -852
		mu 0 4 458 490 491 459
		f 4 -917 917 918 -854
		mu 0 4 459 491 492 460
		f 4 -919 919 920 -856
		mu 0 4 460 492 493 461
		f 4 -921 921 922 -858
		mu 0 4 461 493 494 462
		f 4 -923 923 924 -860
		mu 0 4 462 494 495 463
		f 4 -925 925 926 -862
		mu 0 4 463 495 496 464
		f 4 -927 927 928 -864
		mu 0 4 464 496 497 465
		f 4 -929 929 930 -866
		mu 0 4 465 497 498 466
		f 4 -931 931 932 -868
		mu 0 4 466 498 499 467
		f 4 -933 933 934 -870
		mu 0 4 467 499 500 468
		f 4 -935 935 936 -872
		mu 0 4 468 500 501 469
		f 4 -937 937 938 -874
		mu 0 4 469 501 502 470
		f 4 -939 939 940 -876
		mu 0 4 470 502 503 471
		f 4 -941 941 942 -878
		mu 0 4 471 503 504 472
		f 4 -943 943 944 -880
		mu 0 4 472 504 505 473
		f 4 -945 945 946 -882
		mu 0 4 473 505 506 474
		f 4 -947 947 948 -884
		mu 0 4 474 506 507 475
		f 4 -949 949 950 -886
		mu 0 4 475 507 508 476
		f 4 -951 951 952 -888
		mu 0 4 476 508 509 477
		f 4 -953 953 954 -890
		mu 0 4 477 509 510 478
		f 4 -955 955 956 -892
		mu 0 4 478 510 511 479
		f 4 -957 957 958 -894
		mu 0 4 479 511 512 480
		f 4 -959 959 -897 -896
		mu 0 4 480 512 481 449
		f 3 960 -898 961
		mu 0 3 513 482 481
		f 3 962 -900 -961
		mu 0 3 513 483 482
		f 3 963 -902 -963
		mu 0 3 513 484 483
		f 3 964 -904 -964
		mu 0 3 513 485 484
		f 3 965 -906 -965
		mu 0 3 513 486 485
		f 3 966 -908 -966
		mu 0 3 513 487 486
		f 3 967 -910 -967
		mu 0 3 513 488 487
		f 3 968 -912 -968
		mu 0 3 513 489 488
		f 3 969 -914 -969
		mu 0 3 513 490 489
		f 3 970 -916 -970
		mu 0 3 513 491 490
		f 3 971 -918 -971
		mu 0 3 513 492 491
		f 3 972 -920 -972
		mu 0 3 513 493 492
		f 3 973 -922 -973
		mu 0 3 513 494 493
		f 3 974 -924 -974
		mu 0 3 513 495 494
		f 3 975 -926 -975
		mu 0 3 513 496 495
		f 3 976 -928 -976
		mu 0 3 513 497 496
		f 3 977 -930 -977
		mu 0 3 513 498 497
		f 3 978 -932 -978
		mu 0 3 513 499 498
		f 3 979 -934 -979
		mu 0 3 513 500 499
		f 3 980 -936 -980
		mu 0 3 513 501 500;
	setAttr ".fc[500:511]"
		f 3 981 -938 -981
		mu 0 3 513 502 501
		f 3 982 -940 -982
		mu 0 3 513 503 502
		f 3 983 -942 -983
		mu 0 3 513 504 503
		f 3 984 -944 -984
		mu 0 3 513 505 504
		f 3 985 -946 -985
		mu 0 3 513 506 505
		f 3 986 -948 -986
		mu 0 3 513 507 506
		f 3 987 -950 -987
		mu 0 3 513 508 507
		f 3 988 -952 -988
		mu 0 3 513 509 508
		f 3 989 -954 -989
		mu 0 3 513 510 509
		f 3 990 -956 -990
		mu 0 3 513 511 510
		f 3 991 -958 -991
		mu 0 3 513 512 511
		f 3 -962 -960 -992
		mu 0 3 513 481 512;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "polySurface1";
	rename -uid "AE85EA26-462C-4049-7F9E-7F929020E088";
	setAttr ".v" no;
	setAttr ".rp" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr ".sp" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
createNode mesh -n "polySurfaceShape1" -p "polySurface1";
	rename -uid "27A6193A-4FF4-0A0B-E63A-D4AA5B7F9011";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 514 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.29170001 0.71689999 0.2872
		 0.71850002 0.287 0.71759999 0.287 0.71670002 0.28709999 0.71569997 0.28740001 0.71490002
		 0.2879 0.7141 0.28850001 0.71340001 0.28929999 0.71280003 0.29010001 0.71240002 0.29100001
		 0.71219999 0.292 0.71210003 0.2929 0.7123 0.2938 0.71259999 0.29460001 0.71310002
		 0.29530001 0.7137 0.2958 0.71450001 0.29620001 0.71530002 0.29640001 0.71619999 0.2965
		 0.71710002 0.29629999 0.71810001 0.296 0.71890002 0.29550001 0.71969998 0.2949 0.72039998
		 0.2942 0.72100002 0.2933 0.72140002 0.2924 0.7216 0.2915 0.72170001 0.2906 0.72149998
		 0.2897 0.72119999 0.28889999 0.72070003 0.28819999 0.72009999 0.28760001 0.71929997
		 0.2827 0.72009999 0.28220001 0.71829998 0.28209999 0.71640003 0.28240001 0.71460003
		 0.28310001 0.71280003 0.28400001 0.7112 0.28529999 0.7098 0.2868 0.7087 0.28850001
		 0.70789999 0.29030001 0.70740002 0.2922 0.70730001 0.29409999 0.7076 0.2958 0.70829999
		 0.2974 0.70920002 0.29879999 0.7105 0.2999 0.71200001 0.30070001 0.7137 0.3012 0.7155
		 0.30129999 0.71740001 0.301 0.71920002 0.30039999 0.72100002 0.2994 0.72259998 0.29809999
		 0.72399998 0.29660001 0.72509998 0.2949 0.72589999 0.2931 0.72640002 0.29120001 0.72649997
		 0.28940001 0.72619998 0.28760001 0.7256 0.28600001 0.72460002 0.28459999 0.72329998
		 0.28349999 0.72180003 0.278 0.72180003 0.2773 0.71899998 0.2771 0.71619999 0.27759999
		 0.71329999 0.27860001 0.71060002 0.28 0.70819998 0.28200001 0.70609999 0.2843 0.7044
		 0.2868 0.70319998 0.28960001 0.70249999 0.29249999 0.70240003 0.29530001 0.70279998
		 0.29800001 0.70370001 0.30039999 0.70520002 0.30250001 0.70719999 0.30419999 0.7094
		 0.30540001 0.71200001 0.30610001 0.7148 0.3062 0.71759999 0.30579999 0.72039998 0.30489999
		 0.72310001 0.30340001 0.7256 0.30149999 0.7277 0.2992 0.72939998 0.29660001 0.7306
		 0.29390001 0.7313 0.29100001 0.73150003 0.28819999 0.73100001 0.28549999 0.73009998
		 0.28299999 0.72860003 0.2809 0.72670001 0.27919999 0.72439998 0.273 0.72359997 0.27200001
		 0.7198 0.27180001 0.7159 0.27239999 0.71200001 0.27379999 0.70840001 0.27579999 0.70499998
		 0.2784 0.7022 0.2816 0.69980001 0.28510001 0.69819999 0.28889999 0.69730002 0.29280001
		 0.69709998 0.29660001 0.69770002 0.3003 0.699 0.30360001 0.70099998 0.3064 0.70359999
		 0.3087 0.70670003 0.31040001 0.71020001 0.31130001 0.71399999 0.31150001 0.71789998
		 0.31099999 0.72170001 0.3096 0.72539997 0.30759999 0.72869998 0.30500001 0.73159999
		 0.3019 0.73390001 0.29840001 0.73559999 0.29460001 0.73659998 0.29069999 0.7367 0.28690001
		 0.73619998 0.2832 0.7349 0.27990001 0.73290002 0.27700001 0.73030001 0.27469999 0.72710001
		 0.26750001 0.72549999 0.26629999 0.72060001 0.26609999 0.71560001 0.2669 0.71060002
		 0.26859999 0.70590001 0.2712 0.70160002 0.2746 0.6979 0.27860001 0.69489998 0.2832
		 0.69279999 0.2881 0.69160002 0.2931 0.69129997 0.29800001 0.69209999 0.30270001 0.69379997
		 0.30700001 0.69639999 0.3107 0.69980001 0.3136 0.70380002 0.31580001 0.70829999 0.317
		 0.71319997 0.31729999 0.71820003 0.31650001 0.72310001 0.31479999 0.72780001 0.3123
		 0.73210001 0.30899999 0.73589998 0.30489999 0.73890001 0.30039999 0.741 0.29550001
		 0.74229997 0.29049999 0.74250001 0.28549999 0.74169999 0.28080001 0.74010003 0.2764
		 0.73750001 0.27270001 0.73409998 0.26969999 0.73009998 0.2615 0.7277 0.25999999 0.7216
		 0.2597 0.71530002 0.2606 0.70899999 0.26269999 0.70310003 0.26609999 0.69770002 0.2703
		 0.69300002 0.27540001 0.68940002 0.28099999 0.68669999 0.28709999 0.68529999 0.29339999
		 0.685 0.29960001 0.68589997 0.3055 0.68800002 0.31079999 0.69129997 0.31549999 0.69550002
		 0.31909999 0.70050001 0.32179999 0.7062 0.3233 0.7123 0.32359999 0.71850002 0.32269999
		 0.72469997 0.3206 0.73049998 0.31740001 0.73589998 0.31330001 0.74059999 0.3082 0.74430001
		 0.3026 0.74699998 0.2965 0.74860001 0.2902 0.7489 0.28400001 0.74800003 0.278 0.74589998
		 0.27250001 0.74269998 0.26800001 0.73839998 0.2642 0.73339999 0.25459999 0.73009998
		 0.25260001 0.7227 0.25229999 0.71490002 0.25350001 0.70719999 0.25619999 0.69989997
		 0.26019999 0.69330001 0.26539999 0.68760002 0.27160001 0.68309999 0.27860001 0.67979997
		 0.2861 0.67799997 0.2938 0.67760003 0.30149999 0.67879999 0.30860001 0.68150002 0.3152
		 0.68540001 0.32089999 0.69059998 0.32539999 0.69679999 0.32870001 0.70370001 0.33050001
		 0.7112 0.33090001 0.71890002 0.32969999 0.72640002 0.32730001 0.73360002 0.3233 0.74019998
		 0.31810001 0.74580002 0.31209999 0.75059998 0.30509999 0.75389999 0.29769999 0.75590003
		 0.2899 0.75629997 0.28220001 0.75520003 0.2748 0.75260001 0.26809999 0.74860001 0.26249999
		 0.74330002 0.25780001 0.73710001 0.2463 0.7331 0.24420001 0.72390002 0.24349999 0.71450001
		 0.2448 0.70499998 0.2483 0.69599998 0.25330001 0.68800002 0.2597 0.68129998 0.26710001
		 0.67549998 0.2757 0.6717 0.28490001 0.6692 0.29440001 0.66900003 0.30360001 0.6706
		 0.31240001 0.67360002 0.3204 0.67860001 0.32710001 0.68489999 0.33289999 0.69230002
		 0.33669999 0.70090002 0.33919999 0.70990002 0.33950001 0.71939999 0.338 0.72860003
		 0.3348 0.73720002 0.3303 0.74519998 0.32409999 0.75230002 0.31659999 0.7579 0.3082
		 0.76209998;
	setAttr ".uvst[0].uvsp[250:499]" 0.29899999 0.76429999 0.2897 0.7651 0.28 0.764
		 0.27090001 0.76050001 0.26300001 0.7554 0.2559 0.74919999 0.25049999 0.74150002 0.44999999
		 0.3416 0.4497 0.34529999 0.4465 0.34540001 0.44600001 0.3416 0.44330001 0.3461 0.44209999
		 0.34259999 0.44029999 0.34740001 0.43849999 0.3443 0.43759999 0.34920001 0.43529999
		 0.34650001 0.43540001 0.35159999 0.4325 0.3493 0.43360001 0.35429999 0.4303 0.35260001
		 0.4323 0.3574 0.42879999 0.35640001 0.43180001 0.36059999 0.428 0.3603 0.43180001
		 0.36390001 0.42820001 0.36430001 0.4325 0.3671 0.4289 0.3682 0.43380001 0.37020001
		 0.4305 0.37200001 0.43560001 0.37290001 0.43290001 0.37529999 0.43799999 0.3752 0.4357
		 0.37810001 0.44080001 0.377 0.4391 0.3804 0.44389999 0.37819999 0.4429 0.38170001
		 0.4472 0.37869999 0.44690001 0.38249999 0.45050001 0.37869999 0.45089999 0.38240001
		 0.45370001 0.37799999 0.4549 0.38159999 0.45680001 0.37670001 0.45860001 0.37990001
		 0.45950001 0.37470001 0.46200001 0.37760001 0.46180001 0.37239999 0.46470001 0.37459999
		 0.46360001 0.3696 0.4668 0.3712 0.46470001 0.36649999 0.4684 0.36750001 0.46529999
		 0.36320001 0.46900001 0.3635 0.46520001 0.3599 0.46900001 0.3594 0.46439999 0.35659999
		 0.46799999 0.3554 0.46309999 0.3536 0.46619999 0.35179999 0.46110001 0.35100001 0.46399999
		 0.34850001 0.45879999 0.34869999 0.461 0.34580001 0.456 0.347 0.4576 0.34380001 0.45289999
		 0.34580001 0.45390001 0.34220001 0.44949999 0.3484 0.44679999 0.3484 0.44420001 0.34900001
		 0.4418 0.35010001 0.43959999 0.35159999 0.43779999 0.35350001 0.43630001 0.3558 0.43529999
		 0.35820001 0.43489999 0.36090001 0.43489999 0.36359999 0.4355 0.3662 0.4366 0.36860001
		 0.43810001 0.37090001 0.44 0.37270001 0.44229999 0.37419999 0.44479999 0.3752 0.4474
		 0.3757 0.4501 0.37560001 0.45269999 0.375 0.45519999 0.3739 0.45739999 0.37239999
		 0.45930001 0.37040001 0.46079999 0.36809999 0.46169999 0.36559999 0.46219999 0.36300001
		 0.4621 0.3603 0.46149999 0.35769999 0.46039999 0.35519999 0.45879999 0.35299999 0.4569
		 0.35120001 0.45460001 0.34979999 0.45210001 0.3488 0.44929999 0.3511 0.4472 0.3511
		 0.44510001 0.35159999 0.44310001 0.3524 0.44139999 0.35370001 0.43990001 0.35519999
		 0.43869999 0.35699999 0.43799999 0.359 0.43759999 0.36109999 0.43759999 0.36320001
		 0.43810001 0.3653 0.43900001 0.3673 0.4402 0.3691 0.44170001 0.37059999 0.44350001
		 0.37169999 0.44549999 0.3725 0.44760001 0.37290001 0.44980001 0.37290001 0.45190001
		 0.37239999 0.45390001 0.37149999 0.45559999 0.37029999 0.4571 0.3687 0.45829999 0.3669
		 0.45910001 0.36489999 0.4594 0.3628 0.45930001 0.36059999 0.4589 0.3585 0.458 0.35659999
		 0.45680001 0.35479999 0.45519999 0.35330001 0.45339999 0.3522 0.45140001 0.3515 0.44909999
		 0.35350001 0.44749999 0.3536 0.44589999 0.35389999 0.4443 0.35460001 0.44299999 0.35550001
		 0.4418 0.3567 0.4409 0.3581 0.44029999 0.35969999 0.44 0.36129999 0.44010001 0.36300001
		 0.4404 0.3646 0.4411 0.36610001 0.442 0.36750001 0.44319999 0.36860001 0.44459999
		 0.36950001 0.44620001 0.37009999 0.44780001 0.3705 0.44949999 0.37040001 0.45109999
		 0.37009999 0.45269999 0.36939999 0.454 0.36840001 0.45519999 0.36719999 0.45609999
		 0.36579999 0.4567 0.3642 0.45699999 0.3626 0.4569 0.36090001 0.45649999 0.35929999
		 0.45590001 0.35780001 0.4549 0.35640001 0.45370001 0.35530001 0.45230001 0.35440001
		 0.4508 0.3538 0.449 0.3558 0.44769999 0.3558 0.44659999 0.35609999 0.4454 0.3565
		 0.44440001 0.3572 0.4436 0.3581 0.4429 0.35910001 0.4425 0.3603 0.44229999 0.36149999
		 0.44229999 0.36269999 0.44260001 0.36390001 0.44299999 0.36500001 0.4438 0.366 0.44459999
		 0.3669 0.44569999 0.36750001 0.44679999 0.368 0.44800001 0.3682 0.4492 0.3682 0.45039999
		 0.36790001 0.4515 0.36739999 0.45249999 0.36669999 0.45339999 0.36579999 0.454 0.36480001
		 0.45449999 0.36359999 0.45469999 0.3624 0.45469999 0.3612 0.4544 0.36000001 0.45390001
		 0.35890001 0.45320001 0.35789999 0.45230001 0.35710001 0.4513 0.35640001 0.45019999
		 0.35600001 0.4488 0.35789999 0.44800001 0.35789999 0.4472 0.3581 0.4465 0.35839999
		 0.44580001 0.35890001 0.44530001 0.3594 0.44479999 0.3601 0.44459999 0.36090001 0.44440001
		 0.36160001 0.44440001 0.3624 0.44459999 0.36320001 0.44490001 0.36399999 0.4454 0.3646
		 0.44600001 0.36520001 0.44659999 0.36559999 0.4474 0.36590001 0.44819999 0.366 0.449
		 0.366 0.44980001 0.36590001 0.45050001 0.3655 0.45120001 0.3651 0.4517 0.36449999
		 0.45210001 0.36379999 0.4524 0.36309999 0.4526 0.36230001 0.45249999 0.36149999 0.4524
		 0.36070001 0.45199999 0.36000001 0.45159999 0.35929999 0.45100001 0.35870001 0.45030001
		 0.3583 0.44960001 0.35800001 0.44859999 0.3599 0.44819999 0.3599 0.4479 0.36000001
		 0.44749999 0.36019999 0.4472 0.36039999 0.44690001 0.36070001 0.44670001 0.361 0.4465
		 0.36140001 0.4465 0.36179999 0.4465 0.36219999 0.44659999 0.3626 0.44670001 0.36300001
		 0.44690001 0.3633 0.4472 0.36359999 0.44760001 0.36379999 0.4479 0.36390001 0.4483
		 0.36399999 0.44870001 0.36399999 0.44909999 0.36390001;
	setAttr ".uvst[0].uvsp[500:513]" 0.44949999 0.3637 0.44980001 0.3635 0.4501
		 0.36320001 0.45030001 0.36289999 0.45039999 0.36250001 0.45050001 0.36210001 0.45050001
		 0.3617 0.45039999 0.36129999 0.45030001 0.361 0.44999999 0.36059999 0.4497 0.36039999
		 0.44940001 0.3601 0.449 0.36000001 0.44850001 0.36199999;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 482 ".vt";
	setAttr ".vt[0:165]"  -4.85552502 -10.54545593 172.39250183 -5.18364525 -10.45852661 172.38987732
		 -5.17618322 -10.45777893 172.3241272 -5.15625381 -10.45907593 172.26100159 -5.12454987 -10.4624939 172.20288086
		 -5.08227253 -10.46780396 172.1522522 -5.031140804 -10.47480774 172.11083984 -4.97307873 -10.48327637 172.080154419
		 -4.91021347 -10.4928894 172.061691284 -4.8450923 -10.50326538 172.055847168 -4.780159 -10.51396179 172.063079834
		 -4.71786451 -10.52458191 172.082977295 -4.66076612 -10.53482056 172.11476135 -4.61081219 -10.54418945 172.1572876
		 -4.57015944 -10.55226135 172.20887756 -4.54025507 -10.55886841 172.26751709 -4.52223778 -10.5637207 172.33114624
		 -4.51684761 -10.56658936 172.39697266 -4.52420902 -10.56742859 172.4627533 -4.54413605 -10.56604004 172.52597046
		 -4.57584095 -10.56272888 172.58395386 -4.61811686 -10.55741882 172.63470459 -4.66924906 -10.55041504 172.6761322
		 -4.72731209 -10.54194641 172.70671082 -4.79017687 -10.53233337 172.72528076 -4.855299 -10.5219574 172.73100281
		 -4.92023182 -10.51126099 172.72389221 -4.98252583 -10.50053406 172.70401001 -5.039726734 -10.49040222 172.67211914
		 -5.089578629 -10.48103333 172.62968445 -5.13023138 -10.47285461 172.57807922 -5.16013718 -10.46624756 172.5193634
		 -5.17815256 -10.46139526 172.45584106 -5.4884572 -10.3094635 172.38945007 -5.47391891 -10.30787659 172.26037598
		 -5.43485498 -10.31045532 172.13648987 -5.37265015 -10.31706238 172.022613525 -5.28981304 -10.32746887 171.92318726
		 -5.18947363 -10.34124756 171.84188843 -5.0754776 -10.35786438 171.78187561 -4.95218992 -10.37669373 171.74560547
		 -4.8243928 -10.39701843 171.73423767 -4.69707823 -10.41801453 171.74830627 -4.57494593 -10.43894958 171.78729248
		 -4.46280003 -10.4589386 171.84967041 -4.36494589 -10.4772644 171.93313599 -4.2851882 -10.49324036 172.034317017
		 -4.22641897 -10.5062561 172.14941406 -4.19112206 -10.51574707 172.27410889 -4.1805687 -10.52131653 172.40339661
		 -4.19500494 -10.52290344 172.5324707 -4.23417091 -10.52023315 172.65632629 -4.29637671 -10.5136261 172.77008057
		 -4.37921286 -10.5032196 172.86959839 -4.47955275 -10.48953247 172.95089722 -4.59354925 -10.47291565 173.010803223
		 -4.71673441 -10.45397949 173.047195435 -4.84453154 -10.4337616 173.058532715 -4.97194719 -10.41267395 173.04447937
		 -5.094080448 -10.39183044 173.0054626465 -5.20622587 -10.37174988 172.94303894 -5.30408001 -10.35342407 172.85968018
		 -5.38383722 -10.33744812 172.75849915 -5.44250584 -10.32452393 172.64329529 -5.4778018 -10.31503296 172.51870728
		 -5.75833797 -10.10369873 172.39097595 -5.73729038 -10.10144043 172.20358276 -5.68047523 -10.10516357 172.023880005
		 -5.5902791 -10.11483765 171.8585968 -5.46990824 -10.12991333 171.7141571 -5.32430935 -10.14994812 171.59616089
		 -5.15874577 -10.17408752 171.5091095 -4.97981739 -10.20140076 171.45625305 -4.79433823 -10.23086548 171.43974304
		 -4.60944176 -10.26142883 171.46026611 -4.43217373 -10.29177856 171.51687622 -4.2693882 -10.32080078 171.60749817
		 -4.12733698 -10.34739685 171.72854614 -4.01146698 -10.37055969 171.87553406 -3.92621684 -10.3894043 172.042678833
		 -3.87490845 -10.40316772 172.22355652 -3.85954094 -10.41136169 172.41136169 -3.88069248 -10.41352844 172.59861755
		 -3.93740511 -10.4098053 172.77844238 -4.027703285 -10.40022278 172.94372559 -4.14797211 -10.38516235 173.088150024
		 -4.29367256 -10.36512756 173.20614624 -4.45913363 -10.3409729 173.29319763 -4.63806343 -10.31365967 173.34599304
		 -4.82354259 -10.28421021 173.36247253 -5.0085401535 -10.25364685 173.34204102 -5.1858077 -10.22329712 173.28543091
		 -5.34859371 -10.19416809 173.19485474 -5.49064541 -10.16757202 173.073776245 -5.60651493 -10.14440918 172.92678833
		 -5.69166279 -10.12565613 172.75968933 -5.7429719 -10.1118927 172.57867432 -5.98298883 -9.84928894 172.39459229
		 -5.95618153 -9.84640503 172.15614319 -5.88389921 -9.85124207 171.92735291 -5.76902056 -9.86343384 171.71705627
		 -5.61585808 -9.88262939 171.53321838 -5.43046713 -9.90817261 171.38304138 -5.2198329 -9.938797 171.27215576
		 -4.99207973 -9.97357178 171.20489502 -4.75605106 -10.011123657 171.18400574 -4.52061796 -10.050048828 171.21006775
		 -4.29496765 -10.088592529 171.28210449 -4.087794304 -10.12565613 171.39743042 -3.90699196 -10.15951538 171.55152893
		 -3.75955105 -10.18899536 171.73855591 -3.65114284 -10.21299744 171.95121765 -3.58582139 -10.23045349 172.18156433
		 -3.56621718 -10.24079895 172.42053223 -3.59312701 -10.24368286 172.65896606 -3.66530752 -10.23884583 172.88777161
		 -3.78018618 -10.22665405 173.098052979 -3.93334746 -10.2074585 173.28193665 -4.11873913 -10.18202209 173.43211365
		 -4.32937193 -10.15129089 173.54295349 -4.55712795 -10.11651611 173.61010742 -4.79325724 -10.078964233 173.63111877
		 -5.028589249 -10.040145874 173.60505676 -5.25423861 -10.0014953613 173.53305054 -5.46141195 -9.96453857 173.41770935
		 -5.64221478 -9.93057251 173.26359558 -5.78965712 -9.90109253 173.076553345 -5.89816618 -9.87719727 172.86381531
		 -5.96338415 -9.85974121 172.6335907 -6.15364218 -9.55603027 172.40016174 -6.12211609 -9.5526886 172.11975098
		 -6.037142277 -9.55827332 171.85073853 -5.90199614 -9.57263184 171.60333252 -5.72199583 -9.59518433 171.38722229
		 -5.50400305 -9.62518311 171.21060181 -5.25631666 -9.66123962 171.080352783 -4.98848486 -9.70211792 171.0012207031
		 -4.71087599 -9.74633789 170.97662354 -4.43409395 -9.79199219 171.007232666 -4.16875505 -9.8374176 171.092025757
		 -3.92519021 -9.88090515 171.22755432 -3.71252632 -9.92074585 171.40875244 -3.53918457 -9.95544434 171.62870789
		 -3.41167235 -9.98362732 171.87884521 -3.33496952 -10.0041046143 172.14961243 -3.31192517 -10.016357422 172.43060303
		 -3.34345245 -10.019699097 172.71099854 -3.42842531 -10.01411438 172.98001099 -3.56346941 -9.99977112 173.22738647
		 -3.74347067 -9.97711182 173.44352722 -3.96156454 -9.94720459 173.62014771 -4.20925093 -9.91114807 173.75041199
		 -4.47698164 -9.87017822 173.82951355 -4.75458956 -9.8260498 173.85411072 -5.031372547 -9.78039551 173.82351685
		 -5.29671097 -9.73498535 173.73873901 -5.54037714 -9.6914978 173.60319519 -5.7529397 -9.6516571 173.42198181
		 -5.92638302 -9.61694336 173.20199585 -6.053896427 -9.58877563 172.95188904 -6.13059855 -9.56817627 172.68115234
		 -6.26378155 -9.23506165 172.40731812 -6.22876263 -9.23138428 172.095779419 -6.13436937 -9.23754883 171.79690552
		 -5.98427486 -9.25360107 171.52206421 -5.7841959 -9.27865601 171.28190613;
	setAttr ".vt[166:331]" -5.54190254 -9.31193542 171.085586548 -5.26670694 -9.35206604 170.94082642
		 -4.96917105 -9.39749146 170.85301208 -4.66068459 -9.44654846 170.82559204 -4.35317087 -9.49728394 170.85961914
		 -4.058373928 -9.54777527 170.95373535 -3.78764391 -9.59608459 171.10447693 -3.55143952 -9.64041138 171.30578613
		 -3.3588047 -9.67884827 171.55018616 -3.21706772 -9.71012878 171.82806396 -3.13183165 -9.73310852 172.12893677
		 -3.10625958 -9.74659729 172.44122314 -3.14127851 -9.75038147 172.75279236 -3.2356708 -9.74411011 173.051651001
		 -3.38576508 -9.72814941 173.32652283 -3.58584452 -9.70300293 173.56668091 -3.82803702 -9.66981506 173.76287842
		 -4.10322952 -9.62968445 173.90776062 -4.40086842 -9.58415222 173.99555969 -4.70935583 -9.53509521 174.022979736
		 -5.016869545 -9.48435974 173.98893738 -5.31166601 -9.43388367 173.89482117 -5.58239651 -9.38557434 173.74409485
		 -5.81860018 -9.34135437 173.54278564 -6.011235714 -9.30279541 173.29837036 -6.15297318 -9.27151489 173.020385742
		 -6.2382102 -9.24864197 172.71949768 -6.3092289 -8.89889526 172.41598511 -6.27203751 -8.89492798 172.085235596
		 -6.17179585 -8.90150452 171.76782227 -6.012470245 -8.91848755 171.47610474 -5.80008078 -8.94515991 171.22116089
		 -5.54290295 -8.98045349 171.012878418 -5.25075769 -9.022994995 170.85910034 -4.93491077 -9.07131958 170.76594543
		 -4.60736656 -9.12335205 170.73683167 -4.28086376 -9.17724609 170.77294922 -3.96795988 -9.23086548 170.87283325
		 -3.68062377 -9.28208923 171.032867432 -3.42982435 -9.3290863 171.24655151 -3.22532439 -9.37001038 171.50596619
		 -3.074864864 -9.40324402 171.80101013 -2.98436046 -9.42753601 172.12042236 -2.95718718 -9.44192505 172.45187378
		 -2.99437809 -9.44590759 172.78262329 -3.094620705 -9.43920898 173.10002136 -3.25394487 -9.42224121 173.39179993
		 -3.46633387 -9.39567566 173.64674377 -3.72351217 -9.36036682 173.85499573 -4.015658379 -9.31773376 174.0087585449
		 -4.33150387 -9.26950073 174.10202026 -4.65904808 -9.21737671 174.13113403 -4.98544979 -9.16348267 174.094985962
		 -5.29845572 -9.10995483 173.99502563 -5.58579206 -9.058639526 173.83503723 -5.83659124 -9.011627197 173.62130737
		 -6.041091442 -8.97071838 173.3618927 -6.19155169 -8.93748474 173.066848755 -6.28205585 -8.91319275 172.74743652
		 -6.28816128 -8.56031799 172.42565918 -6.25021124 -8.55627441 172.0884552 -6.14808702 -8.56300354 171.7649231
		 -5.98555088 -8.58030701 171.46743774 -5.76912785 -8.60742188 171.20748901 -5.50688696 -8.64346313 170.99507141
		 -5.20895433 -8.68684387 170.83828735 -4.88690281 -8.73609924 170.74327087 -4.55304003 -8.78915405 170.71359253
		 -4.22010612 -8.84407043 170.75036621 -3.90106392 -8.8986969 170.8523407 -3.60808945 -8.95101929 171.015457153
		 -3.35235739 -8.99893188 171.2333374 -3.14383292 -9.040634155 171.49789429 -2.99046469 -9.074539185 171.79873657
		 -2.89816976 -9.099319458 172.12435913 -2.87042785 -9.11398315 172.46234131 -2.90837669 -9.11801147 172.79953003
		 -3.010603428 -9.1111908 173.12303162 -3.17303753 -9.093978882 173.42053223 -3.38956308 -9.066757202 173.68052673
		 -3.65180373 -9.030822754 173.89291382 -3.9496336 -8.98735046 174.049697876 -4.27168465 -8.9382019 174.14476013
		 -4.60564947 -8.88504028 174.1743927 -4.93848324 -8.8301239 174.13752747 -5.25762558 -8.77548218 174.035644531
		 -5.55060005 -8.72315979 173.87254333 -5.80623198 -8.67526245 173.65455627 -6.014856815 -8.63356018 173.3901825
		 -6.16822577 -8.59963989 173.089248657 -6.26052094 -8.57498169 172.76361084 -6.20150375 -8.23236084 172.43611145
		 -6.16420984 -8.22839355 172.10536194 -6.064069748 -8.23497009 171.78797913 -5.90464306 -8.25195313 171.49623108
		 -5.69235659 -8.27862549 171.24130249 -5.43517733 -8.31391907 171.033004761 -5.14303255 -8.35646057 170.87922668
		 -4.82708406 -8.40478516 170.78596497 -4.4996419 -8.45681763 170.75689697 -4.1731391 -8.51071167 170.79298401
		 -3.86023521 -8.56433105 170.89297485 -3.57279611 -8.61555481 171.052963257 -3.32209873 -8.66256714 171.26670837
		 -3.11749721 -8.70347595 171.52609253 -2.96713924 -8.73670959 171.82113647 -2.87653255 -8.76100159 172.14056396
		 -2.84935975 -8.77539063 172.47198486 -2.88665295 -8.77926636 172.80274963 -2.98679328 -8.77267456 173.12013245
		 -3.14622021 -8.75570679 173.41189575 -3.35850644 -8.72914124 173.66685486 -3.61568475 -8.6938324 173.87512207
		 -3.90783 -8.65119934 174.028915405 -4.22377968 -8.60298157 174.12208557 -4.55122232 -8.55084229 174.15113831
		 -4.87772465 -8.49694824 174.11503601 -5.19062853 -8.44342041 174.015167236 -5.47806644 -8.3921051 173.85519409
		 -5.72876358 -8.34509277 173.64141846 -5.9333663 -8.30418396 173.38200378 -6.083723545 -8.27095032 173.086959839
		 -6.17432976 -8.24665833 172.76756287 -6.052429676 -7.92759705 172.44683838 -6.017309189 -7.92391968 172.13519287
		 -5.92291737 -7.93008423 171.83631897 -5.77282333 -7.94602966 171.56149292 -5.57284546 -7.97119141 171.3213501
		 -5.33055162 -8.0044708252 171.12512207 -5.055357933 -8.044616699 170.98025513 -4.75782156 -8.090042114 170.8924408
		 -4.44933319 -8.13908386 170.86505127 -4.14182186 -8.18983459 170.89904785 -3.84702277 -8.24031067 170.99316406
		 -3.57629371 -8.28862 171.14390564 -3.34008956 -8.33283997 171.3452301 -3.14735293 -8.37138367 171.58961487
		 -3.0057170391 -8.40267944 171.86759949 -2.92037892 -8.42553711 172.16836548 -2.89480734 -8.43913269 172.48066711
		 -2.9299283 -8.44281006 172.79222107 -3.024320841 -8.43664551 173.091094971 -3.17441511 -8.42059326 173.36593628
		 -3.37439227 -8.39553833 173.60609436 -3.61668587 -8.36225891 173.80239868 -3.89188004 -8.32221985 173.94717407
		 -4.18941641 -8.27668762 174.034988403 -4.49790335 -8.22763062 174.062393188 -4.80541754 -8.17689514 174.028366089
		 -5.10021496 -8.12641907 173.93424988 -5.3709445 -8.078109741 173.78352356 -5.60714865 -8.033889771 173.5821991
		 -5.7998848 -7.99534607 173.33781433 -5.94152117 -7.96405029 173.059814453 -6.026858807 -7.94119263 172.75901794
		 -5.84676552 -7.65783691 172.45739746 -5.815135 -7.65447998 172.17700195 -5.73026466 -7.6600647 171.90797424
		 -5.59511948 -7.67453003 171.6605835 -5.41511869 -7.69708252 171.44448853 -5.19712448 -7.72697449 171.26786804
		 -4.94943953 -7.76313782 171.1375885 -4.68160629 -7.80401611 171.058502197 -4.40399837 -7.84814453 171.033889771
		 -4.12721682 -7.89378357 171.064498901 -3.8618772 -7.9393158 171.14926147;
	setAttr ".vt[332:481]" -3.61831284 -7.98269653 171.28479004 -3.40564799 -8.022644043 171.46600342
		 -3.2323072 -8.057235718 171.68598938 -3.10479426 -8.085418701 171.93614197 -3.027989388 -8.10600281 172.20687866
		 -3.0049455166 -8.11825562 172.487854 -3.036574125 -8.12159729 172.76828003 -3.12154794 -8.11592102 173.037277222
		 -3.25659204 -8.1015625 173.28465271 -3.43659186 -8.07901001 173.5007782 -3.65468788 -8.049118042 173.67741394
		 -3.90226936 -8.012954712 173.80776978 -4.17010403 -7.97207642 173.88676453 -4.44771194 -7.927948 173.91134644
		 -4.72449446 -7.88220215 173.88078308 -4.98983192 -7.83677673 173.79612732 -5.2334981 -7.79328918 173.66046143
		 -5.44606209 -7.75344849 173.47926331 -5.61940289 -7.71875 173.25927734 -5.74691629 -7.69056702 173.0091247559
		 -5.82372046 -7.67007446 172.7383728 -5.59237146 -7.43339539 172.46743774 -5.5655632 -7.43051147 172.22898865
		 -5.49328136 -7.43534851 172.00021362305 -5.37840223 -7.44754028 171.78991699 -5.22534227 -7.46673584 171.60604858
		 -5.039849281 -7.49217224 171.4559021 -4.82921553 -7.52290344 171.34503174 -4.60156155 -7.55766296 171.27789307
		 -4.36543226 -7.5952301 171.25686646 -4.12999964 -7.63404846 171.28291321 -3.90445018 -7.67279053 171.35496521
		 -3.69727802 -7.70974731 171.4703064 -3.51647544 -7.74362183 171.62440491 -3.36893225 -7.77308655 171.81141663
		 -3.26052427 -7.79699707 172.024200439 -3.19520354 -7.81454468 172.25444031 -3.17570138 -7.82489014 172.49339294
		 -3.20250893 -7.82777405 172.73184204 -3.274791 -7.82304382 172.96064758 -3.38967037 -7.81074524 173.17092896
		 -3.54272938 -7.79154968 173.35479736 -3.72812104 -7.76611328 173.50495911 -3.93875384 -7.73538208 173.61581421
		 -4.16650915 -7.70062256 173.68305969 -4.40263939 -7.66305542 173.70396423 -4.63797092 -7.62423706 173.677948
		 -4.86362076 -7.58560181 173.60592651 -5.070792675 -7.54862976 173.49067688 -5.25159502 -7.5146637 173.3364563
		 -5.39903831 -7.48529053 173.14941406 -5.50754786 -7.46128845 172.93666077 -5.5727663 -7.44374084 172.70643616
		 -5.29904604 -7.26292419 172.47666931 -5.27799749 -7.26066589 172.28938293 -5.2211833 -7.26438904 172.10954285
		 -5.13098717 -7.27406311 171.94425964 -5.010616302 -7.28913879 171.79983521 -4.86501741 -7.30906677 171.68183899
		 -4.69945383 -7.33320618 171.59480286 -4.5205245 -7.36053467 171.54203796 -4.33504486 -7.39009094 171.52552795
		 -4.1501503 -7.42054749 171.54594421 -3.97288203 -7.45089722 171.60255432 -3.81009698 -7.48002625 171.69314575
		 -3.66804552 -7.50662231 171.81422424 -3.55217505 -7.52978516 171.96121216 -3.46692491 -7.54862976 172.12837219
		 -3.41561627 -7.56228638 172.30934143 -3.40024996 -7.57048035 172.49703979 -3.42140007 -7.57275391 172.68441772
		 -3.47811294 -7.56903076 172.86412048 -3.56841111 -7.55935669 173.029403687 -3.68868065 -7.54428101 173.17382813
		 -3.83438015 -7.52435303 173.2918396 -3.99984217 -7.50019836 173.37889099 -4.17877054 -7.47277832 173.4317627
		 -4.36424971 -7.44332886 173.44825745 -4.5492487 -7.41287231 173.42773438 -4.72651625 -7.38241577 173.37110901
		 -4.88930178 -7.35339355 173.28051758 -5.031353951 -7.32679749 173.15945435 -5.14722395 -7.30363464 173.012466431
		 -5.2323699 -7.28477478 172.84532166 -5.28367853 -7.27102661 172.66445923 -4.97812176 -7.15286255 172.48464966
		 -4.96358442 -7.15127563 172.3555603 -4.92451906 -7.15396118 172.23170471 -4.86231327 -7.16056824 172.11795044
		 -4.77947712 -7.17097473 172.018417358 -4.67913771 -7.18475342 171.93708801 -4.5651412 -7.20137024 171.87710571
		 -4.441854 -7.22019958 171.84078979 -4.3140564 -7.24052429 171.82943726 -4.18664169 -7.26152039 171.84350586
		 -4.064609528 -7.28245544 171.88249207 -3.95246339 -7.30244446 171.94497681 -3.85460973 -7.32077026 172.02835083
		 -3.77475166 -7.33673096 172.12950134 -3.71608281 -7.34965515 172.24472046 -3.68078613 -7.35914612 172.36930847
		 -3.67023277 -7.36482239 172.49861145 -3.68466973 -7.36631775 172.62765503 -3.72383618 -7.36373901 172.75152588
		 -3.78593874 -7.35713196 172.86538696 -3.8688767 -7.34672546 172.96481323 -3.96921635 -7.33294678 173.046112061
		 -4.083213329 -7.3163147 173.10610962 -4.20639801 -7.29748535 173.14241028 -4.33419466 -7.27716064 173.15383911
		 -4.46161127 -7.25617981 173.13970947 -4.58374453 -7.23524475 173.10070801 -4.69578791 -7.21525574 173.038360596
		 -4.79364157 -7.19692993 172.95487976 -4.87350082 -7.18095398 172.85372925 -4.93216944 -7.16793823 172.73858643
		 -4.96746588 -7.15853882 172.61390686 -4.64184237 -7.10758972 172.49101257 -4.63438082 -7.1068573 172.42515564
		 -4.61445141 -7.1081543 172.36203003 -4.58274651 -7.11157227 172.30401611 -4.54057264 -7.11688232 172.25328064
		 -4.48933983 -7.12387085 172.21185303 -4.43127441 -7.13233948 172.18130493 -4.36841106 -7.14186096 172.16273499
		 -4.30328894 -7.15222168 172.15698242 -4.23835707 -7.1630249 172.16412354 -4.17606258 -7.17364502 172.184021
		 -4.11896324 -7.18379211 172.21589661 -4.069112301 -7.19316101 172.2583313 -4.028357506 -7.20133972 172.30992126
		 -3.99845123 -7.20794678 172.36865234 -3.98043537 -7.21278381 172.43218994 -3.97504449 -7.21566772 172.49813843
		 -3.98240495 -7.21640015 172.56388855 -4.0023345947 -7.21510315 172.62701416 -4.034038067 -7.21170044 172.68510437
		 -4.076315403 -7.20639038 172.73574829 -4.1274457 -7.1993866 172.77728271 -4.1856122 -7.19091797 172.80784607
		 -4.24837446 -7.18130493 172.8263092 -4.31359768 -7.17092896 172.83213806 -4.37853146 -7.16023254 172.82492065
		 -4.44072342 -7.14961243 172.80502319 -4.49792385 -7.13937378 172.77325439 -4.54777622 -7.13000488 172.73069763
		 -4.58853054 -7.12191772 172.67909241 -4.61843538 -7.11531067 172.62046814 -4.63635015 -7.11047363 172.55685425
		 -4.30316496 -7.12882996 172.49551392;
	setAttr -s 992 ".ed";
	setAttr ".ed[0:165]"  0 1 1 1 2 1 2 0 1 2 3 1 3 0 1 3 4 1 4 0 1 4 5 1 5 0 1
		 5 6 1 6 0 1 6 7 1 7 0 1 7 8 1 8 0 1 8 9 1 9 0 1 9 10 1 10 0 1 10 11 1 11 0 1 11 12 1
		 12 0 1 12 13 1 13 0 1 13 14 1 14 0 1 14 15 1 15 0 1 15 16 1 16 0 1 16 17 1 17 0 1
		 17 18 1 18 0 1 18 19 1 19 0 1 19 20 1 20 0 1 20 21 1 21 0 1 21 22 1 22 0 1 22 23 1
		 23 0 1 23 24 1 24 0 1 24 25 1 25 0 1 25 26 1 26 0 1 26 27 1 27 0 1 27 28 1 28 0 1
		 28 29 1 29 0 1 29 30 1 30 0 1 30 31 1 31 0 1 31 32 1 32 0 1 32 1 1 1 33 1 33 34 1
		 34 2 1 34 35 1 35 3 1 35 36 1 36 4 1 36 37 1 37 5 1 37 38 1 38 6 1 38 39 1 39 7 1
		 39 40 1 40 8 1 40 41 1 41 9 1 41 42 1 42 10 1 42 43 1 43 11 1 43 44 1 44 12 1 44 45 1
		 45 13 1 45 46 1 46 14 1 46 47 1 47 15 1 47 48 1 48 16 1 48 49 1 49 17 1 49 50 1 50 18 1
		 50 51 1 51 19 1 51 52 1 52 20 1 52 53 1 53 21 1 53 54 1 54 22 1 54 55 1 55 23 1 55 56 1
		 56 24 1 56 57 1 57 25 1 57 58 1 58 26 1 58 59 1 59 27 1 59 60 1 60 28 1 60 61 1 61 29 1
		 61 62 1 62 30 1 62 63 1 63 31 1 63 64 1 64 32 1 64 33 1 33 65 1 65 66 1 66 34 1 66 67 1
		 67 35 1 67 68 1 68 36 1 68 69 1 69 37 1 69 70 1 70 38 1 70 71 1 71 39 1 71 72 1 72 40 1
		 72 73 1 73 41 1 73 74 1 74 42 1 74 75 1 75 43 1 75 76 1 76 44 1 76 77 1 77 45 1 77 78 1
		 78 46 1 78 79 1 79 47 1 79 80 1 80 48 1 80 81 1 81 49 1 81 82 1 82 50 1 82 83 1 83 51 1
		 83 84 1;
	setAttr ".ed[166:331]" 84 52 1 84 85 1 85 53 1 85 86 1 86 54 1 86 87 1 87 55 1
		 87 88 1 88 56 1 88 89 1 89 57 1 89 90 1 90 58 1 90 91 1 91 59 1 91 92 1 92 60 1 92 93 1
		 93 61 1 93 94 1 94 62 1 94 95 1 95 63 1 95 96 1 96 64 1 96 65 1 65 97 1 97 98 1 98 66 1
		 98 99 1 99 67 1 99 100 1 100 68 1 100 101 1 101 69 1 101 102 1 102 70 1 102 103 1
		 103 71 1 103 104 1 104 72 1 104 105 1 105 73 1 105 106 1 106 74 1 106 107 1 107 75 1
		 107 108 1 108 76 1 108 109 1 109 77 1 109 110 1 110 78 1 110 111 1 111 79 1 111 112 1
		 112 80 1 112 113 1 113 81 1 113 114 1 114 82 1 114 115 1 115 83 1 115 116 1 116 84 1
		 116 117 1 117 85 1 117 118 1 118 86 1 118 119 1 119 87 1 119 120 1 120 88 1 120 121 1
		 121 89 1 121 122 1 122 90 1 122 123 1 123 91 1 123 124 1 124 92 1 124 125 1 125 93 1
		 125 126 1 126 94 1 126 127 1 127 95 1 127 128 1 128 96 1 128 97 1 97 129 1 129 130 1
		 130 98 1 130 131 1 131 99 1 131 132 1 132 100 1 132 133 1 133 101 1 133 134 1 134 102 1
		 134 135 1 135 103 1 135 136 1 136 104 1 136 137 1 137 105 1 137 138 1 138 106 1 138 139 1
		 139 107 1 139 140 1 140 108 1 140 141 1 141 109 1 141 142 1 142 110 1 142 143 1 143 111 1
		 143 144 1 144 112 1 144 145 1 145 113 1 145 146 1 146 114 1 146 147 1 147 115 1 147 148 1
		 148 116 1 148 149 1 149 117 1 149 150 1 150 118 1 150 151 1 151 119 1 151 152 1 152 120 1
		 152 153 1 153 121 1 153 154 1 154 122 1 154 155 1 155 123 1 155 156 1 156 124 1 156 157 1
		 157 125 1 157 158 1 158 126 1 158 159 1 159 127 1 159 160 1 160 128 1 160 129 1 129 161 1
		 161 162 1 162 130 1 162 163 1 163 131 1 163 164 1 164 132 1 164 165 1 165 133 1 165 166 1
		 166 134 1 166 167 1;
	setAttr ".ed[332:497]" 167 135 1 167 168 1 168 136 1 168 169 1 169 137 1 169 170 1
		 170 138 1 170 171 1 171 139 1 171 172 1 172 140 1 172 173 1 173 141 1 173 174 1 174 142 1
		 174 175 1 175 143 1 175 176 1 176 144 1 176 177 1 177 145 1 177 178 1 178 146 1 178 179 1
		 179 147 1 179 180 1 180 148 1 180 181 1 181 149 1 181 182 1 182 150 1 182 183 1 183 151 1
		 183 184 1 184 152 1 184 185 1 185 153 1 185 186 1 186 154 1 186 187 1 187 155 1 187 188 1
		 188 156 1 188 189 1 189 157 1 189 190 1 190 158 1 190 191 1 191 159 1 191 192 1 192 160 1
		 192 161 1 161 193 1 193 194 1 194 162 1 194 195 1 195 163 1 195 196 1 196 164 1 196 197 1
		 197 165 1 197 198 1 198 166 1 198 199 1 199 167 1 199 200 1 200 168 1 200 201 1 201 169 1
		 201 202 1 202 170 1 202 203 1 203 171 1 203 204 1 204 172 1 204 205 1 205 173 1 205 206 1
		 206 174 1 206 207 1 207 175 1 207 208 1 208 176 1 208 209 1 209 177 1 209 210 1 210 178 1
		 210 211 1 211 179 1 211 212 1 212 180 1 212 213 1 213 181 1 213 214 1 214 182 1 214 215 1
		 215 183 1 215 216 1 216 184 1 216 217 1 217 185 1 217 218 1 218 186 1 218 219 1 219 187 1
		 219 220 1 220 188 1 220 221 1 221 189 1 221 222 1 222 190 1 222 223 1 223 191 1 223 224 1
		 224 192 1 224 193 1 193 225 1 225 226 1 226 194 1 226 227 1 227 195 1 227 228 1 228 196 1
		 228 229 1 229 197 1 229 230 1 230 198 1 230 231 1 231 199 1 231 232 1 232 200 1 232 233 1
		 233 201 1 233 234 1 234 202 1 234 235 1 235 203 1 235 236 1 236 204 1 236 237 1 237 205 1
		 237 238 1 238 206 1 238 239 1 239 207 1 239 240 1 240 208 1 240 241 1 241 209 1 241 242 1
		 242 210 1 242 243 1 243 211 1 243 244 1 244 212 1 244 245 1 245 213 1 245 246 1 246 214 1
		 246 247 1 247 215 1 247 248 1 248 216 1 248 249 1 249 217 1 249 250 1;
	setAttr ".ed[498:663]" 250 218 1 250 251 1 251 219 1 251 252 1 252 220 1 252 253 1
		 253 221 1 253 254 1 254 222 1 254 255 1 255 223 1 255 256 1 256 224 1 256 225 1 225 257 1
		 257 258 1 258 226 1 258 259 1 259 227 1 259 260 1 260 228 1 260 261 1 261 229 1 261 262 1
		 262 230 1 262 263 1 263 231 1 263 264 1 264 232 1 264 265 1 265 233 1 265 266 1 266 234 1
		 266 267 1 267 235 1 267 268 1 268 236 1 268 269 1 269 237 1 269 270 1 270 238 1 270 271 1
		 271 239 1 271 272 1 272 240 1 272 273 1 273 241 1 273 274 1 274 242 1 274 275 1 275 243 1
		 275 276 1 276 244 1 276 277 1 277 245 1 277 278 1 278 246 1 278 279 1 279 247 1 279 280 1
		 280 248 1 280 281 1 281 249 1 281 282 1 282 250 1 282 283 1 283 251 1 283 284 1 284 252 1
		 284 285 1 285 253 1 285 286 1 286 254 1 286 287 1 287 255 1 287 288 1 288 256 1 288 257 1
		 257 289 1 289 290 1 290 258 1 290 291 1 291 259 1 291 292 1 292 260 1 292 293 1 293 261 1
		 293 294 1 294 262 1 294 295 1 295 263 1 295 296 1 296 264 1 296 297 1 297 265 1 297 298 1
		 298 266 1 298 299 1 299 267 1 299 300 1 300 268 1 300 301 1 301 269 1 301 302 1 302 270 1
		 302 303 1 303 271 1 303 304 1 304 272 1 304 305 1 305 273 1 305 306 1 306 274 1 306 307 1
		 307 275 1 307 308 1 308 276 1 308 309 1 309 277 1 309 310 1 310 278 1 310 311 1 311 279 1
		 311 312 1 312 280 1 312 313 1 313 281 1 313 314 1 314 282 1 314 315 1 315 283 1 315 316 1
		 316 284 1 316 317 1 317 285 1 317 318 1 318 286 1 318 319 1 319 287 1 319 320 1 320 288 1
		 320 289 1 289 321 1 321 322 1 322 290 1 322 323 1 323 291 1 323 324 1 324 292 1 324 325 1
		 325 293 1 325 326 1 326 294 1 326 327 1 327 295 1 327 328 1 328 296 1 328 329 1 329 297 1
		 329 330 1 330 298 1 330 331 1 331 299 1 331 332 1 332 300 1 332 333 1;
	setAttr ".ed[664:829]" 333 301 1 333 334 1 334 302 1 334 335 1 335 303 1 335 336 1
		 336 304 1 336 337 1 337 305 1 337 338 1 338 306 1 338 339 1 339 307 1 339 340 1 340 308 1
		 340 341 1 341 309 1 341 342 1 342 310 1 342 343 1 343 311 1 343 344 1 344 312 1 344 345 1
		 345 313 1 345 346 1 346 314 1 346 347 1 347 315 1 347 348 1 348 316 1 348 349 1 349 317 1
		 349 350 1 350 318 1 350 351 1 351 319 1 351 352 1 352 320 1 352 321 1 321 353 1 353 354 1
		 354 322 1 354 355 1 355 323 1 355 356 1 356 324 1 356 357 1 357 325 1 357 358 1 358 326 1
		 358 359 1 359 327 1 359 360 1 360 328 1 360 361 1 361 329 1 361 362 1 362 330 1 362 363 1
		 363 331 1 363 364 1 364 332 1 364 365 1 365 333 1 365 366 1 366 334 1 366 367 1 367 335 1
		 367 368 1 368 336 1 368 369 1 369 337 1 369 370 1 370 338 1 370 371 1 371 339 1 371 372 1
		 372 340 1 372 373 1 373 341 1 373 374 1 374 342 1 374 375 1 375 343 1 375 376 1 376 344 1
		 376 377 1 377 345 1 377 378 1 378 346 1 378 379 1 379 347 1 379 380 1 380 348 1 380 381 1
		 381 349 1 381 382 1 382 350 1 382 383 1 383 351 1 383 384 1 384 352 1 384 353 1 353 385 1
		 385 386 1 386 354 1 386 387 1 387 355 1 387 388 1 388 356 1 388 389 1 389 357 1 389 390 1
		 390 358 1 390 391 1 391 359 1 391 392 1 392 360 1 392 393 1 393 361 1 393 394 1 394 362 1
		 394 395 1 395 363 1 395 396 1 396 364 1 396 397 1 397 365 1 397 398 1 398 366 1 398 399 1
		 399 367 1 399 400 1 400 368 1 400 401 1 401 369 1 401 402 1 402 370 1 402 403 1 403 371 1
		 403 404 1 404 372 1 404 405 1 405 373 1 405 406 1 406 374 1 406 407 1 407 375 1 407 408 1
		 408 376 1 408 409 1 409 377 1 409 410 1 410 378 1 410 411 1 411 379 1 411 412 1 412 380 1
		 412 413 1 413 381 1 413 414 1 414 382 1 414 415 1 415 383 1 415 416 1;
	setAttr ".ed[830:991]" 416 384 1 416 385 1 385 417 1 417 418 1 418 386 1 418 419 1
		 419 387 1 419 420 1 420 388 1 420 421 1 421 389 1 421 422 1 422 390 1 422 423 1 423 391 1
		 423 424 1 424 392 1 424 425 1 425 393 1 425 426 1 426 394 1 426 427 1 427 395 1 427 428 1
		 428 396 1 428 429 1 429 397 1 429 430 1 430 398 1 430 431 1 431 399 1 431 432 1 432 400 1
		 432 433 1 433 401 1 433 434 1 434 402 1 434 435 1 435 403 1 435 436 1 436 404 1 436 437 1
		 437 405 1 437 438 1 438 406 1 438 439 1 439 407 1 439 440 1 440 408 1 440 441 1 441 409 1
		 441 442 1 442 410 1 442 443 1 443 411 1 443 444 1 444 412 1 444 445 1 445 413 1 445 446 1
		 446 414 1 446 447 1 447 415 1 447 448 1 448 416 1 448 417 1 417 449 1 449 450 1 450 418 1
		 450 451 1 451 419 1 451 452 1 452 420 1 452 453 1 453 421 1 453 454 1 454 422 1 454 455 1
		 455 423 1 455 456 1 456 424 1 456 457 1 457 425 1 457 458 1 458 426 1 458 459 1 459 427 1
		 459 460 1 460 428 1 460 461 1 461 429 1 461 462 1 462 430 1 462 463 1 463 431 1 463 464 1
		 464 432 1 464 465 1 465 433 1 465 466 1 466 434 1 466 467 1 467 435 1 467 468 1 468 436 1
		 468 469 1 469 437 1 469 470 1 470 438 1 470 471 1 471 439 1 471 472 1 472 440 1 472 473 1
		 473 441 1 473 474 1 474 442 1 474 475 1 475 443 1 475 476 1 476 444 1 476 477 1 477 445 1
		 477 478 1 478 446 1 478 479 1 479 447 1 479 480 1 480 448 1 480 449 1 481 450 1 449 481 1
		 481 451 1 481 452 1 481 453 1 481 454 1 481 455 1 481 456 1 481 457 1 481 458 1 481 459 1
		 481 460 1 481 461 1 481 462 1 481 463 1 481 464 1 481 465 1 481 466 1 481 467 1 481 468 1
		 481 469 1 481 470 1 481 471 1 481 472 1 481 473 1 481 474 1 481 475 1 481 476 1 481 477 1
		 481 478 1 481 479 1 481 480 1;
	setAttr -s 512 -ch 1984 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 0 1 2
		f 3 -3 3 4
		mu 0 3 0 2 3
		f 3 -5 5 6
		mu 0 3 0 3 4
		f 3 -7 7 8
		mu 0 3 0 4 5
		f 3 -9 9 10
		mu 0 3 0 5 6
		f 3 -11 11 12
		mu 0 3 0 6 7
		f 3 -13 13 14
		mu 0 3 0 7 8
		f 3 -15 15 16
		mu 0 3 0 8 9
		f 3 -17 17 18
		mu 0 3 0 9 10
		f 3 -19 19 20
		mu 0 3 0 10 11
		f 3 -21 21 22
		mu 0 3 0 11 12
		f 3 -23 23 24
		mu 0 3 0 12 13
		f 3 -25 25 26
		mu 0 3 0 13 14
		f 3 -27 27 28
		mu 0 3 0 14 15
		f 3 -29 29 30
		mu 0 3 0 15 16
		f 3 -31 31 32
		mu 0 3 0 16 17
		f 3 -33 33 34
		mu 0 3 0 17 18
		f 3 -35 35 36
		mu 0 3 0 18 19
		f 3 -37 37 38
		mu 0 3 0 19 20
		f 3 -39 39 40
		mu 0 3 0 20 21
		f 3 -41 41 42
		mu 0 3 0 21 22
		f 3 -43 43 44
		mu 0 3 0 22 23
		f 3 -45 45 46
		mu 0 3 0 23 24
		f 3 -47 47 48
		mu 0 3 0 24 25
		f 3 -49 49 50
		mu 0 3 0 25 26
		f 3 -51 51 52
		mu 0 3 0 26 27
		f 3 -53 53 54
		mu 0 3 0 27 28
		f 3 -55 55 56
		mu 0 3 0 28 29
		f 3 -57 57 58
		mu 0 3 0 29 30
		f 3 -59 59 60
		mu 0 3 0 30 31
		f 3 -61 61 62
		mu 0 3 0 31 32
		f 3 -63 63 -1
		mu 0 3 0 32 1
		f 4 64 65 66 -2
		mu 0 4 1 33 34 2
		f 4 -67 67 68 -4
		mu 0 4 2 34 35 3
		f 4 -69 69 70 -6
		mu 0 4 3 35 36 4
		f 4 -71 71 72 -8
		mu 0 4 4 36 37 5
		f 4 -73 73 74 -10
		mu 0 4 5 37 38 6
		f 4 -75 75 76 -12
		mu 0 4 6 38 39 7
		f 4 -77 77 78 -14
		mu 0 4 7 39 40 8
		f 4 -79 79 80 -16
		mu 0 4 8 40 41 9
		f 4 -81 81 82 -18
		mu 0 4 9 41 42 10
		f 4 -83 83 84 -20
		mu 0 4 10 42 43 11
		f 4 -85 85 86 -22
		mu 0 4 11 43 44 12
		f 4 -87 87 88 -24
		mu 0 4 12 44 45 13
		f 4 -89 89 90 -26
		mu 0 4 13 45 46 14
		f 4 -91 91 92 -28
		mu 0 4 14 46 47 15
		f 4 -93 93 94 -30
		mu 0 4 15 47 48 16
		f 4 -95 95 96 -32
		mu 0 4 16 48 49 17
		f 4 -97 97 98 -34
		mu 0 4 17 49 50 18
		f 4 -99 99 100 -36
		mu 0 4 18 50 51 19
		f 4 -101 101 102 -38
		mu 0 4 19 51 52 20
		f 4 -103 103 104 -40
		mu 0 4 20 52 53 21
		f 4 -105 105 106 -42
		mu 0 4 21 53 54 22
		f 4 -107 107 108 -44
		mu 0 4 22 54 55 23
		f 4 -109 109 110 -46
		mu 0 4 23 55 56 24
		f 4 -111 111 112 -48
		mu 0 4 24 56 57 25
		f 4 -113 113 114 -50
		mu 0 4 25 57 58 26
		f 4 -115 115 116 -52
		mu 0 4 26 58 59 27
		f 4 -117 117 118 -54
		mu 0 4 27 59 60 28
		f 4 -119 119 120 -56
		mu 0 4 28 60 61 29
		f 4 -121 121 122 -58
		mu 0 4 29 61 62 30
		f 4 -123 123 124 -60
		mu 0 4 30 62 63 31
		f 4 -125 125 126 -62
		mu 0 4 31 63 64 32
		f 4 -127 127 -65 -64
		mu 0 4 32 64 33 1
		f 4 128 129 130 -66
		mu 0 4 33 65 66 34
		f 4 -131 131 132 -68
		mu 0 4 34 66 67 35
		f 4 -133 133 134 -70
		mu 0 4 35 67 68 36
		f 4 -135 135 136 -72
		mu 0 4 36 68 69 37
		f 4 -137 137 138 -74
		mu 0 4 37 69 70 38
		f 4 -139 139 140 -76
		mu 0 4 38 70 71 39
		f 4 -141 141 142 -78
		mu 0 4 39 71 72 40
		f 4 -143 143 144 -80
		mu 0 4 40 72 73 41
		f 4 -145 145 146 -82
		mu 0 4 41 73 74 42
		f 4 -147 147 148 -84
		mu 0 4 42 74 75 43
		f 4 -149 149 150 -86
		mu 0 4 43 75 76 44
		f 4 -151 151 152 -88
		mu 0 4 44 76 77 45
		f 4 -153 153 154 -90
		mu 0 4 45 77 78 46
		f 4 -155 155 156 -92
		mu 0 4 46 78 79 47
		f 4 -157 157 158 -94
		mu 0 4 47 79 80 48
		f 4 -159 159 160 -96
		mu 0 4 48 80 81 49
		f 4 -161 161 162 -98
		mu 0 4 49 81 82 50
		f 4 -163 163 164 -100
		mu 0 4 50 82 83 51
		f 4 -165 165 166 -102
		mu 0 4 51 83 84 52
		f 4 -167 167 168 -104
		mu 0 4 52 84 85 53
		f 4 -169 169 170 -106
		mu 0 4 53 85 86 54
		f 4 -171 171 172 -108
		mu 0 4 54 86 87 55
		f 4 -173 173 174 -110
		mu 0 4 55 87 88 56
		f 4 -175 175 176 -112
		mu 0 4 56 88 89 57
		f 4 -177 177 178 -114
		mu 0 4 57 89 90 58
		f 4 -179 179 180 -116
		mu 0 4 58 90 91 59
		f 4 -181 181 182 -118
		mu 0 4 59 91 92 60
		f 4 -183 183 184 -120
		mu 0 4 60 92 93 61
		f 4 -185 185 186 -122
		mu 0 4 61 93 94 62
		f 4 -187 187 188 -124
		mu 0 4 62 94 95 63
		f 4 -189 189 190 -126
		mu 0 4 63 95 96 64
		f 4 -191 191 -129 -128
		mu 0 4 64 96 65 33
		f 4 192 193 194 -130
		mu 0 4 65 97 98 66
		f 4 -195 195 196 -132
		mu 0 4 66 98 99 67
		f 4 -197 197 198 -134
		mu 0 4 67 99 100 68
		f 4 -199 199 200 -136
		mu 0 4 68 100 101 69
		f 4 -201 201 202 -138
		mu 0 4 69 101 102 70
		f 4 -203 203 204 -140
		mu 0 4 70 102 103 71
		f 4 -205 205 206 -142
		mu 0 4 71 103 104 72
		f 4 -207 207 208 -144
		mu 0 4 72 104 105 73
		f 4 -209 209 210 -146
		mu 0 4 73 105 106 74
		f 4 -211 211 212 -148
		mu 0 4 74 106 107 75
		f 4 -213 213 214 -150
		mu 0 4 75 107 108 76
		f 4 -215 215 216 -152
		mu 0 4 76 108 109 77
		f 4 -217 217 218 -154
		mu 0 4 77 109 110 78
		f 4 -219 219 220 -156
		mu 0 4 78 110 111 79
		f 4 -221 221 222 -158
		mu 0 4 79 111 112 80
		f 4 -223 223 224 -160
		mu 0 4 80 112 113 81
		f 4 -225 225 226 -162
		mu 0 4 81 113 114 82
		f 4 -227 227 228 -164
		mu 0 4 82 114 115 83
		f 4 -229 229 230 -166
		mu 0 4 83 115 116 84
		f 4 -231 231 232 -168
		mu 0 4 84 116 117 85
		f 4 -233 233 234 -170
		mu 0 4 85 117 118 86
		f 4 -235 235 236 -172
		mu 0 4 86 118 119 87
		f 4 -237 237 238 -174
		mu 0 4 87 119 120 88
		f 4 -239 239 240 -176
		mu 0 4 88 120 121 89
		f 4 -241 241 242 -178
		mu 0 4 89 121 122 90
		f 4 -243 243 244 -180
		mu 0 4 90 122 123 91
		f 4 -245 245 246 -182
		mu 0 4 91 123 124 92
		f 4 -247 247 248 -184
		mu 0 4 92 124 125 93
		f 4 -249 249 250 -186
		mu 0 4 93 125 126 94
		f 4 -251 251 252 -188
		mu 0 4 94 126 127 95
		f 4 -253 253 254 -190
		mu 0 4 95 127 128 96
		f 4 -255 255 -193 -192
		mu 0 4 96 128 97 65
		f 4 256 257 258 -194
		mu 0 4 97 129 130 98
		f 4 -259 259 260 -196
		mu 0 4 98 130 131 99
		f 4 -261 261 262 -198
		mu 0 4 99 131 132 100
		f 4 -263 263 264 -200
		mu 0 4 100 132 133 101
		f 4 -265 265 266 -202
		mu 0 4 101 133 134 102
		f 4 -267 267 268 -204
		mu 0 4 102 134 135 103
		f 4 -269 269 270 -206
		mu 0 4 103 135 136 104
		f 4 -271 271 272 -208
		mu 0 4 104 136 137 105
		f 4 -273 273 274 -210
		mu 0 4 105 137 138 106
		f 4 -275 275 276 -212
		mu 0 4 106 138 139 107
		f 4 -277 277 278 -214
		mu 0 4 107 139 140 108
		f 4 -279 279 280 -216
		mu 0 4 108 140 141 109
		f 4 -281 281 282 -218
		mu 0 4 109 141 142 110
		f 4 -283 283 284 -220
		mu 0 4 110 142 143 111
		f 4 -285 285 286 -222
		mu 0 4 111 143 144 112
		f 4 -287 287 288 -224
		mu 0 4 112 144 145 113
		f 4 -289 289 290 -226
		mu 0 4 113 145 146 114
		f 4 -291 291 292 -228
		mu 0 4 114 146 147 115
		f 4 -293 293 294 -230
		mu 0 4 115 147 148 116
		f 4 -295 295 296 -232
		mu 0 4 116 148 149 117
		f 4 -297 297 298 -234
		mu 0 4 117 149 150 118
		f 4 -299 299 300 -236
		mu 0 4 118 150 151 119
		f 4 -301 301 302 -238
		mu 0 4 119 151 152 120
		f 4 -303 303 304 -240
		mu 0 4 120 152 153 121
		f 4 -305 305 306 -242
		mu 0 4 121 153 154 122
		f 4 -307 307 308 -244
		mu 0 4 122 154 155 123
		f 4 -309 309 310 -246
		mu 0 4 123 155 156 124
		f 4 -311 311 312 -248
		mu 0 4 124 156 157 125
		f 4 -313 313 314 -250
		mu 0 4 125 157 158 126
		f 4 -315 315 316 -252
		mu 0 4 126 158 159 127
		f 4 -317 317 318 -254
		mu 0 4 127 159 160 128
		f 4 -319 319 -257 -256
		mu 0 4 128 160 129 97
		f 4 320 321 322 -258
		mu 0 4 129 161 162 130
		f 4 -323 323 324 -260
		mu 0 4 130 162 163 131
		f 4 -325 325 326 -262
		mu 0 4 131 163 164 132
		f 4 -327 327 328 -264
		mu 0 4 132 164 165 133
		f 4 -329 329 330 -266
		mu 0 4 133 165 166 134
		f 4 -331 331 332 -268
		mu 0 4 134 166 167 135
		f 4 -333 333 334 -270
		mu 0 4 135 167 168 136
		f 4 -335 335 336 -272
		mu 0 4 136 168 169 137
		f 4 -337 337 338 -274
		mu 0 4 137 169 170 138
		f 4 -339 339 340 -276
		mu 0 4 138 170 171 139
		f 4 -341 341 342 -278
		mu 0 4 139 171 172 140
		f 4 -343 343 344 -280
		mu 0 4 140 172 173 141
		f 4 -345 345 346 -282
		mu 0 4 141 173 174 142
		f 4 -347 347 348 -284
		mu 0 4 142 174 175 143
		f 4 -349 349 350 -286
		mu 0 4 143 175 176 144
		f 4 -351 351 352 -288
		mu 0 4 144 176 177 145
		f 4 -353 353 354 -290
		mu 0 4 145 177 178 146
		f 4 -355 355 356 -292
		mu 0 4 146 178 179 147
		f 4 -357 357 358 -294
		mu 0 4 147 179 180 148
		f 4 -359 359 360 -296
		mu 0 4 148 180 181 149
		f 4 -361 361 362 -298
		mu 0 4 149 181 182 150
		f 4 -363 363 364 -300
		mu 0 4 150 182 183 151
		f 4 -365 365 366 -302
		mu 0 4 151 183 184 152
		f 4 -367 367 368 -304
		mu 0 4 152 184 185 153
		f 4 -369 369 370 -306
		mu 0 4 153 185 186 154
		f 4 -371 371 372 -308
		mu 0 4 154 186 187 155
		f 4 -373 373 374 -310
		mu 0 4 155 187 188 156
		f 4 -375 375 376 -312
		mu 0 4 156 188 189 157
		f 4 -377 377 378 -314
		mu 0 4 157 189 190 158
		f 4 -379 379 380 -316
		mu 0 4 158 190 191 159
		f 4 -381 381 382 -318
		mu 0 4 159 191 192 160
		f 4 -383 383 -321 -320
		mu 0 4 160 192 161 129
		f 4 384 385 386 -322
		mu 0 4 161 193 194 162
		f 4 -387 387 388 -324
		mu 0 4 162 194 195 163
		f 4 -389 389 390 -326
		mu 0 4 163 195 196 164
		f 4 -391 391 392 -328
		mu 0 4 164 196 197 165
		f 4 -393 393 394 -330
		mu 0 4 165 197 198 166
		f 4 -395 395 396 -332
		mu 0 4 166 198 199 167
		f 4 -397 397 398 -334
		mu 0 4 167 199 200 168
		f 4 -399 399 400 -336
		mu 0 4 168 200 201 169
		f 4 -401 401 402 -338
		mu 0 4 169 201 202 170
		f 4 -403 403 404 -340
		mu 0 4 170 202 203 171
		f 4 -405 405 406 -342
		mu 0 4 171 203 204 172
		f 4 -407 407 408 -344
		mu 0 4 172 204 205 173
		f 4 -409 409 410 -346
		mu 0 4 173 205 206 174
		f 4 -411 411 412 -348
		mu 0 4 174 206 207 175
		f 4 -413 413 414 -350
		mu 0 4 175 207 208 176
		f 4 -415 415 416 -352
		mu 0 4 176 208 209 177
		f 4 -417 417 418 -354
		mu 0 4 177 209 210 178
		f 4 -419 419 420 -356
		mu 0 4 178 210 211 179
		f 4 -421 421 422 -358
		mu 0 4 179 211 212 180
		f 4 -423 423 424 -360
		mu 0 4 180 212 213 181
		f 4 -425 425 426 -362
		mu 0 4 181 213 214 182
		f 4 -427 427 428 -364
		mu 0 4 182 214 215 183
		f 4 -429 429 430 -366
		mu 0 4 183 215 216 184
		f 4 -431 431 432 -368
		mu 0 4 184 216 217 185
		f 4 -433 433 434 -370
		mu 0 4 185 217 218 186
		f 4 -435 435 436 -372
		mu 0 4 186 218 219 187
		f 4 -437 437 438 -374
		mu 0 4 187 219 220 188
		f 4 -439 439 440 -376
		mu 0 4 188 220 221 189
		f 4 -441 441 442 -378
		mu 0 4 189 221 222 190
		f 4 -443 443 444 -380
		mu 0 4 190 222 223 191
		f 4 -445 445 446 -382
		mu 0 4 191 223 224 192
		f 4 -447 447 -385 -384
		mu 0 4 192 224 193 161
		f 4 448 449 450 -386
		mu 0 4 193 225 226 194
		f 4 -451 451 452 -388
		mu 0 4 194 226 227 195
		f 4 -453 453 454 -390
		mu 0 4 195 227 228 196
		f 4 -455 455 456 -392
		mu 0 4 196 228 229 197
		f 4 -457 457 458 -394
		mu 0 4 197 229 230 198
		f 4 -459 459 460 -396
		mu 0 4 198 230 231 199
		f 4 -461 461 462 -398
		mu 0 4 199 231 232 200
		f 4 -463 463 464 -400
		mu 0 4 200 232 233 201
		f 4 -465 465 466 -402
		mu 0 4 201 233 234 202
		f 4 -467 467 468 -404
		mu 0 4 202 234 235 203
		f 4 -469 469 470 -406
		mu 0 4 203 235 236 204
		f 4 -471 471 472 -408
		mu 0 4 204 236 237 205
		f 4 -473 473 474 -410
		mu 0 4 205 237 238 206
		f 4 -475 475 476 -412
		mu 0 4 206 238 239 207
		f 4 -477 477 478 -414
		mu 0 4 207 239 240 208
		f 4 -479 479 480 -416
		mu 0 4 208 240 241 209
		f 4 -481 481 482 -418
		mu 0 4 209 241 242 210
		f 4 -483 483 484 -420
		mu 0 4 210 242 243 211
		f 4 -485 485 486 -422
		mu 0 4 211 243 244 212
		f 4 -487 487 488 -424
		mu 0 4 212 244 245 213
		f 4 -489 489 490 -426
		mu 0 4 213 245 246 214
		f 4 -491 491 492 -428
		mu 0 4 214 246 247 215
		f 4 -493 493 494 -430
		mu 0 4 215 247 248 216
		f 4 -495 495 496 -432
		mu 0 4 216 248 249 217
		f 4 -497 497 498 -434
		mu 0 4 217 249 250 218
		f 4 -499 499 500 -436
		mu 0 4 218 250 251 219
		f 4 -501 501 502 -438
		mu 0 4 219 251 252 220
		f 4 -503 503 504 -440
		mu 0 4 220 252 253 221
		f 4 -505 505 506 -442
		mu 0 4 221 253 254 222
		f 4 -507 507 508 -444
		mu 0 4 222 254 255 223
		f 4 -509 509 510 -446
		mu 0 4 223 255 256 224
		f 4 -511 511 -449 -448
		mu 0 4 224 256 225 193
		f 4 512 513 514 -450
		mu 0 4 257 258 259 260
		f 4 -515 515 516 -452
		mu 0 4 260 259 261 262
		f 4 -517 517 518 -454
		mu 0 4 262 261 263 264
		f 4 -519 519 520 -456
		mu 0 4 264 263 265 266
		f 4 -521 521 522 -458
		mu 0 4 266 265 267 268
		f 4 -523 523 524 -460
		mu 0 4 268 267 269 270
		f 4 -525 525 526 -462
		mu 0 4 270 269 271 272
		f 4 -527 527 528 -464
		mu 0 4 272 271 273 274
		f 4 -529 529 530 -466
		mu 0 4 274 273 275 276
		f 4 -531 531 532 -468
		mu 0 4 276 275 277 278
		f 4 -533 533 534 -470
		mu 0 4 278 277 279 280
		f 4 -535 535 536 -472
		mu 0 4 280 279 281 282
		f 4 -537 537 538 -474
		mu 0 4 282 281 283 284
		f 4 -539 539 540 -476
		mu 0 4 284 283 285 286
		f 4 -541 541 542 -478
		mu 0 4 286 285 287 288
		f 4 -543 543 544 -480
		mu 0 4 288 287 289 290
		f 4 -545 545 546 -482
		mu 0 4 290 289 291 292
		f 4 -547 547 548 -484
		mu 0 4 292 291 293 294
		f 4 -549 549 550 -486
		mu 0 4 294 293 295 296
		f 4 -551 551 552 -488
		mu 0 4 296 295 297 298
		f 4 -553 553 554 -490
		mu 0 4 298 297 299 300
		f 4 -555 555 556 -492
		mu 0 4 300 299 301 302
		f 4 -557 557 558 -494
		mu 0 4 302 301 303 304
		f 4 -559 559 560 -496
		mu 0 4 304 303 305 306
		f 4 -561 561 562 -498
		mu 0 4 306 305 307 308
		f 4 -563 563 564 -500
		mu 0 4 308 307 309 310
		f 4 -565 565 566 -502
		mu 0 4 310 309 311 312
		f 4 -567 567 568 -504
		mu 0 4 312 311 313 314
		f 4 -569 569 570 -506
		mu 0 4 314 313 315 316
		f 4 -571 571 572 -508
		mu 0 4 316 315 317 318
		f 4 -573 573 574 -510
		mu 0 4 318 317 319 320
		f 4 -575 575 -513 -512
		mu 0 4 320 319 258 257
		f 4 576 577 578 -514
		mu 0 4 258 321 322 259
		f 4 -579 579 580 -516
		mu 0 4 259 322 323 261
		f 4 -581 581 582 -518
		mu 0 4 261 323 324 263
		f 4 -583 583 584 -520
		mu 0 4 263 324 325 265
		f 4 -585 585 586 -522
		mu 0 4 265 325 326 267
		f 4 -587 587 588 -524
		mu 0 4 267 326 327 269
		f 4 -589 589 590 -526
		mu 0 4 269 327 328 271
		f 4 -591 591 592 -528
		mu 0 4 271 328 329 273
		f 4 -593 593 594 -530
		mu 0 4 273 329 330 275
		f 4 -595 595 596 -532
		mu 0 4 275 330 331 277
		f 4 -597 597 598 -534
		mu 0 4 277 331 332 279
		f 4 -599 599 600 -536
		mu 0 4 279 332 333 281
		f 4 -601 601 602 -538
		mu 0 4 281 333 334 283
		f 4 -603 603 604 -540
		mu 0 4 283 334 335 285
		f 4 -605 605 606 -542
		mu 0 4 285 335 336 287
		f 4 -607 607 608 -544
		mu 0 4 287 336 337 289
		f 4 -609 609 610 -546
		mu 0 4 289 337 338 291
		f 4 -611 611 612 -548
		mu 0 4 291 338 339 293
		f 4 -613 613 614 -550
		mu 0 4 293 339 340 295
		f 4 -615 615 616 -552
		mu 0 4 295 340 341 297
		f 4 -617 617 618 -554
		mu 0 4 297 341 342 299
		f 4 -619 619 620 -556
		mu 0 4 299 342 343 301
		f 4 -621 621 622 -558
		mu 0 4 301 343 344 303
		f 4 -623 623 624 -560
		mu 0 4 303 344 345 305
		f 4 -625 625 626 -562
		mu 0 4 305 345 346 307
		f 4 -627 627 628 -564
		mu 0 4 307 346 347 309
		f 4 -629 629 630 -566
		mu 0 4 309 347 348 311
		f 4 -631 631 632 -568
		mu 0 4 311 348 349 313
		f 4 -633 633 634 -570
		mu 0 4 313 349 350 315
		f 4 -635 635 636 -572
		mu 0 4 315 350 351 317
		f 4 -637 637 638 -574
		mu 0 4 317 351 352 319
		f 4 -639 639 -577 -576
		mu 0 4 319 352 321 258
		f 4 640 641 642 -578
		mu 0 4 321 353 354 322
		f 4 -643 643 644 -580
		mu 0 4 322 354 355 323
		f 4 -645 645 646 -582
		mu 0 4 323 355 356 324
		f 4 -647 647 648 -584
		mu 0 4 324 356 357 325
		f 4 -649 649 650 -586
		mu 0 4 325 357 358 326
		f 4 -651 651 652 -588
		mu 0 4 326 358 359 327
		f 4 -653 653 654 -590
		mu 0 4 327 359 360 328
		f 4 -655 655 656 -592
		mu 0 4 328 360 361 329
		f 4 -657 657 658 -594
		mu 0 4 329 361 362 330
		f 4 -659 659 660 -596
		mu 0 4 330 362 363 331
		f 4 -661 661 662 -598
		mu 0 4 331 363 364 332
		f 4 -663 663 664 -600
		mu 0 4 332 364 365 333
		f 4 -665 665 666 -602
		mu 0 4 333 365 366 334
		f 4 -667 667 668 -604
		mu 0 4 334 366 367 335
		f 4 -669 669 670 -606
		mu 0 4 335 367 368 336
		f 4 -671 671 672 -608
		mu 0 4 336 368 369 337
		f 4 -673 673 674 -610
		mu 0 4 337 369 370 338
		f 4 -675 675 676 -612
		mu 0 4 338 370 371 339
		f 4 -677 677 678 -614
		mu 0 4 339 371 372 340
		f 4 -679 679 680 -616
		mu 0 4 340 372 373 341
		f 4 -681 681 682 -618
		mu 0 4 341 373 374 342
		f 4 -683 683 684 -620
		mu 0 4 342 374 375 343
		f 4 -685 685 686 -622
		mu 0 4 343 375 376 344
		f 4 -687 687 688 -624
		mu 0 4 344 376 377 345
		f 4 -689 689 690 -626
		mu 0 4 345 377 378 346
		f 4 -691 691 692 -628
		mu 0 4 346 378 379 347
		f 4 -693 693 694 -630
		mu 0 4 347 379 380 348
		f 4 -695 695 696 -632
		mu 0 4 348 380 381 349
		f 4 -697 697 698 -634
		mu 0 4 349 381 382 350
		f 4 -699 699 700 -636
		mu 0 4 350 382 383 351
		f 4 -701 701 702 -638
		mu 0 4 351 383 384 352
		f 4 -703 703 -641 -640
		mu 0 4 352 384 353 321
		f 4 704 705 706 -642
		mu 0 4 353 385 386 354
		f 4 -707 707 708 -644
		mu 0 4 354 386 387 355
		f 4 -709 709 710 -646
		mu 0 4 355 387 388 356
		f 4 -711 711 712 -648
		mu 0 4 356 388 389 357
		f 4 -713 713 714 -650
		mu 0 4 357 389 390 358
		f 4 -715 715 716 -652
		mu 0 4 358 390 391 359
		f 4 -717 717 718 -654
		mu 0 4 359 391 392 360
		f 4 -719 719 720 -656
		mu 0 4 360 392 393 361
		f 4 -721 721 722 -658
		mu 0 4 361 393 394 362
		f 4 -723 723 724 -660
		mu 0 4 362 394 395 363
		f 4 -725 725 726 -662
		mu 0 4 363 395 396 364
		f 4 -727 727 728 -664
		mu 0 4 364 396 397 365
		f 4 -729 729 730 -666
		mu 0 4 365 397 398 366
		f 4 -731 731 732 -668
		mu 0 4 366 398 399 367
		f 4 -733 733 734 -670
		mu 0 4 367 399 400 368
		f 4 -735 735 736 -672
		mu 0 4 368 400 401 369
		f 4 -737 737 738 -674
		mu 0 4 369 401 402 370
		f 4 -739 739 740 -676
		mu 0 4 370 402 403 371
		f 4 -741 741 742 -678
		mu 0 4 371 403 404 372
		f 4 -743 743 744 -680
		mu 0 4 372 404 405 373
		f 4 -745 745 746 -682
		mu 0 4 373 405 406 374
		f 4 -747 747 748 -684
		mu 0 4 374 406 407 375
		f 4 -749 749 750 -686
		mu 0 4 375 407 408 376
		f 4 -751 751 752 -688
		mu 0 4 376 408 409 377
		f 4 -753 753 754 -690
		mu 0 4 377 409 410 378
		f 4 -755 755 756 -692
		mu 0 4 378 410 411 379
		f 4 -757 757 758 -694
		mu 0 4 379 411 412 380
		f 4 -759 759 760 -696
		mu 0 4 380 412 413 381
		f 4 -761 761 762 -698
		mu 0 4 381 413 414 382
		f 4 -763 763 764 -700
		mu 0 4 382 414 415 383
		f 4 -765 765 766 -702
		mu 0 4 383 415 416 384
		f 4 -767 767 -705 -704
		mu 0 4 384 416 385 353
		f 4 768 769 770 -706
		mu 0 4 385 417 418 386
		f 4 -771 771 772 -708
		mu 0 4 386 418 419 387
		f 4 -773 773 774 -710
		mu 0 4 387 419 420 388
		f 4 -775 775 776 -712
		mu 0 4 388 420 421 389
		f 4 -777 777 778 -714
		mu 0 4 389 421 422 390
		f 4 -779 779 780 -716
		mu 0 4 390 422 423 391
		f 4 -781 781 782 -718
		mu 0 4 391 423 424 392
		f 4 -783 783 784 -720
		mu 0 4 392 424 425 393
		f 4 -785 785 786 -722
		mu 0 4 393 425 426 394
		f 4 -787 787 788 -724
		mu 0 4 394 426 427 395
		f 4 -789 789 790 -726
		mu 0 4 395 427 428 396
		f 4 -791 791 792 -728
		mu 0 4 396 428 429 397
		f 4 -793 793 794 -730
		mu 0 4 397 429 430 398
		f 4 -795 795 796 -732
		mu 0 4 398 430 431 399
		f 4 -797 797 798 -734
		mu 0 4 399 431 432 400
		f 4 -799 799 800 -736
		mu 0 4 400 432 433 401
		f 4 -801 801 802 -738
		mu 0 4 401 433 434 402
		f 4 -803 803 804 -740
		mu 0 4 402 434 435 403
		f 4 -805 805 806 -742
		mu 0 4 403 435 436 404
		f 4 -807 807 808 -744
		mu 0 4 404 436 437 405
		f 4 -809 809 810 -746
		mu 0 4 405 437 438 406
		f 4 -811 811 812 -748
		mu 0 4 406 438 439 407
		f 4 -813 813 814 -750
		mu 0 4 407 439 440 408
		f 4 -815 815 816 -752
		mu 0 4 408 440 441 409
		f 4 -817 817 818 -754
		mu 0 4 409 441 442 410
		f 4 -819 819 820 -756
		mu 0 4 410 442 443 411
		f 4 -821 821 822 -758
		mu 0 4 411 443 444 412
		f 4 -823 823 824 -760
		mu 0 4 412 444 445 413
		f 4 -825 825 826 -762
		mu 0 4 413 445 446 414
		f 4 -827 827 828 -764
		mu 0 4 414 446 447 415
		f 4 -829 829 830 -766
		mu 0 4 415 447 448 416
		f 4 -831 831 -769 -768
		mu 0 4 416 448 417 385
		f 4 832 833 834 -770
		mu 0 4 417 449 450 418
		f 4 -835 835 836 -772
		mu 0 4 418 450 451 419
		f 4 -837 837 838 -774
		mu 0 4 419 451 452 420
		f 4 -839 839 840 -776
		mu 0 4 420 452 453 421
		f 4 -841 841 842 -778
		mu 0 4 421 453 454 422
		f 4 -843 843 844 -780
		mu 0 4 422 454 455 423
		f 4 -845 845 846 -782
		mu 0 4 423 455 456 424
		f 4 -847 847 848 -784
		mu 0 4 424 456 457 425
		f 4 -849 849 850 -786
		mu 0 4 425 457 458 426
		f 4 -851 851 852 -788
		mu 0 4 426 458 459 427
		f 4 -853 853 854 -790
		mu 0 4 427 459 460 428
		f 4 -855 855 856 -792
		mu 0 4 428 460 461 429
		f 4 -857 857 858 -794
		mu 0 4 429 461 462 430
		f 4 -859 859 860 -796
		mu 0 4 430 462 463 431
		f 4 -861 861 862 -798
		mu 0 4 431 463 464 432
		f 4 -863 863 864 -800
		mu 0 4 432 464 465 433
		f 4 -865 865 866 -802
		mu 0 4 433 465 466 434
		f 4 -867 867 868 -804
		mu 0 4 434 466 467 435
		f 4 -869 869 870 -806
		mu 0 4 435 467 468 436
		f 4 -871 871 872 -808
		mu 0 4 436 468 469 437
		f 4 -873 873 874 -810
		mu 0 4 437 469 470 438
		f 4 -875 875 876 -812
		mu 0 4 438 470 471 439
		f 4 -877 877 878 -814
		mu 0 4 439 471 472 440
		f 4 -879 879 880 -816
		mu 0 4 440 472 473 441
		f 4 -881 881 882 -818
		mu 0 4 441 473 474 442
		f 4 -883 883 884 -820
		mu 0 4 442 474 475 443
		f 4 -885 885 886 -822
		mu 0 4 443 475 476 444
		f 4 -887 887 888 -824
		mu 0 4 444 476 477 445
		f 4 -889 889 890 -826
		mu 0 4 445 477 478 446
		f 4 -891 891 892 -828
		mu 0 4 446 478 479 447
		f 4 -893 893 894 -830
		mu 0 4 447 479 480 448
		f 4 -895 895 -833 -832
		mu 0 4 448 480 449 417
		f 4 896 897 898 -834
		mu 0 4 449 481 482 450
		f 4 -899 899 900 -836
		mu 0 4 450 482 483 451
		f 4 -901 901 902 -838
		mu 0 4 451 483 484 452
		f 4 -903 903 904 -840
		mu 0 4 452 484 485 453
		f 4 -905 905 906 -842
		mu 0 4 453 485 486 454
		f 4 -907 907 908 -844
		mu 0 4 454 486 487 455
		f 4 -909 909 910 -846
		mu 0 4 455 487 488 456
		f 4 -911 911 912 -848
		mu 0 4 456 488 489 457
		f 4 -913 913 914 -850
		mu 0 4 457 489 490 458
		f 4 -915 915 916 -852
		mu 0 4 458 490 491 459
		f 4 -917 917 918 -854
		mu 0 4 459 491 492 460
		f 4 -919 919 920 -856
		mu 0 4 460 492 493 461
		f 4 -921 921 922 -858
		mu 0 4 461 493 494 462
		f 4 -923 923 924 -860
		mu 0 4 462 494 495 463
		f 4 -925 925 926 -862
		mu 0 4 463 495 496 464
		f 4 -927 927 928 -864
		mu 0 4 464 496 497 465
		f 4 -929 929 930 -866
		mu 0 4 465 497 498 466
		f 4 -931 931 932 -868
		mu 0 4 466 498 499 467
		f 4 -933 933 934 -870
		mu 0 4 467 499 500 468
		f 4 -935 935 936 -872
		mu 0 4 468 500 501 469
		f 4 -937 937 938 -874
		mu 0 4 469 501 502 470
		f 4 -939 939 940 -876
		mu 0 4 470 502 503 471
		f 4 -941 941 942 -878
		mu 0 4 471 503 504 472
		f 4 -943 943 944 -880
		mu 0 4 472 504 505 473
		f 4 -945 945 946 -882
		mu 0 4 473 505 506 474
		f 4 -947 947 948 -884
		mu 0 4 474 506 507 475
		f 4 -949 949 950 -886
		mu 0 4 475 507 508 476
		f 4 -951 951 952 -888
		mu 0 4 476 508 509 477
		f 4 -953 953 954 -890
		mu 0 4 477 509 510 478
		f 4 -955 955 956 -892
		mu 0 4 478 510 511 479
		f 4 -957 957 958 -894
		mu 0 4 479 511 512 480
		f 4 -959 959 -897 -896
		mu 0 4 480 512 481 449
		f 3 960 -898 961
		mu 0 3 513 482 481
		f 3 962 -900 -961
		mu 0 3 513 483 482
		f 3 963 -902 -963
		mu 0 3 513 484 483
		f 3 964 -904 -964
		mu 0 3 513 485 484
		f 3 965 -906 -965
		mu 0 3 513 486 485
		f 3 966 -908 -966
		mu 0 3 513 487 486
		f 3 967 -910 -967
		mu 0 3 513 488 487
		f 3 968 -912 -968
		mu 0 3 513 489 488
		f 3 969 -914 -969
		mu 0 3 513 490 489
		f 3 970 -916 -970
		mu 0 3 513 491 490
		f 3 971 -918 -971
		mu 0 3 513 492 491
		f 3 972 -920 -972
		mu 0 3 513 493 492
		f 3 973 -922 -973
		mu 0 3 513 494 493
		f 3 974 -924 -974
		mu 0 3 513 495 494
		f 3 975 -926 -975
		mu 0 3 513 496 495
		f 3 976 -928 -976
		mu 0 3 513 497 496
		f 3 977 -930 -977
		mu 0 3 513 498 497
		f 3 978 -932 -978
		mu 0 3 513 499 498
		f 3 979 -934 -979
		mu 0 3 513 500 499
		f 3 980 -936 -980
		mu 0 3 513 501 500;
	setAttr ".fc[500:511]"
		f 3 981 -938 -981
		mu 0 3 513 502 501
		f 3 982 -940 -982
		mu 0 3 513 503 502
		f 3 983 -942 -983
		mu 0 3 513 504 503
		f 3 984 -944 -984
		mu 0 3 513 505 504
		f 3 985 -946 -985
		mu 0 3 513 506 505
		f 3 986 -948 -986
		mu 0 3 513 507 506
		f 3 987 -950 -987
		mu 0 3 513 508 507
		f 3 988 -952 -988
		mu 0 3 513 509 508
		f 3 989 -954 -989
		mu 0 3 513 510 509
		f 3 990 -956 -990
		mu 0 3 513 511 510
		f 3 991 -958 -991
		mu 0 3 513 512 511
		f 3 -962 -960 -992
		mu 0 3 513 481 512;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "polySurface3";
	rename -uid "75738168-4200-D0AD-30B0-0FBBC19273D7";
createNode mesh -n "polySurfaceShape3" -p "polySurface3";
	rename -uid "87B0CFBE-4658-E44A-C881-5EACC9F9F1CF";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.15170000493526459 0.34839999675750732 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 3767 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.031500001 0.37 0.032400001
		 0.37079999 0.032000002 0.37380001 0.0308 0.37419999 0.0328 0.3883 0.033 0.38929999
		 0.032299999 0.391 0.0317 0.38949999 0.035799999 0.3849 0.035700001 0.3858 0.034899998
		 0.38690001 0.035100002 0.38589999 0.0328 0.39109999 0.033199999 0.3901 0.035 0.38749999
		 0.035700001 0.38640001 0.031500001 0.37720001 0.0308 0.38119999 0.030099999 0.38119999
		 0.030400001 0.37819999 0.0305 0.38420001 0.0298 0.38429999 0.035999998 0.3752 0.034299999
		 0.37310001 0.035799999 0.37029999 0.037300002 0.37279999 0.036899999 0.3849 0.037099998
		 0.3856 0.036800001 0.3865 0.039000001 0.37549999 0.0381 0.37720001 0.038800001 0.38780001
		 0.039099999 0.3867 0.040199999 0.38730001 0.039999999 0.38839999 0.037900001 0.38749999
		 0.038199998 0.3865 0.034000002 0.38800001 0.034000002 0.38699999 0.034299999 0.38859999
		 0.0385 0.38890001 0.039700001 0.38960001 0.037999999 0.39050001 0.039000001 0.3915
		 0.037500001 0.38839999 0.0337 0.37540001 0.0298 0.3743 0.0287 0.3739 0.0297 0.36849999
		 0.0306 0.36939999 0.028999999 0.38139999 0.0286 0.384 0.0277 0.38159999 0.029100001
		 0.3793 0.032600001 0.39289999 0.034200002 0.3955 0.033199999 0.39669999 0.031500001
		 0.39300001 0.032499999 0.38749999 0.0307 0.3883 0.031599998 0.38620001 0.0305 0.3874
		 0.035599999 0.3838 0.0348 0.38499999 0.034499999 0.3831 0.033500001 0.3847 0.039500002
		 0.38319999 0.0407 0.38319999 0.041200001 0.38499999 0.040100001 0.38479999 0.029999999
		 0.39269999 0.028200001 0.39019999 0.031800002 0.39739999 0.0305 0.39669999 0.033100002
		 0.39230001 0.034699999 0.39430001 0.036699999 0.38190001 0.037 0.3838 0.035399999
		 0.38119999 0.039700001 0.38060001 0.040199999 0.3795 0.041700002 0.3827 0.038699999
		 0.38049999 0.041200001 0.38769999 0.042300001 0.38769999 0.042100001 0.38929999 0.041000001
		 0.389 0.032600001 0.38550001 0.033599999 0.38620001 0.0418 0.3908 0.040600002 0.39050001
		 0.041299999 0.39219999 0.040100001 0.39219999 0.035399999 0.37720001 0.032699998
		 0.38429999 0.033500001 0.3829 0.031500001 0.37830001 0.031099999 0.3813 0.0308 0.38330001
		 0.034000002 0.38119999 0.0339 0.37940001 0.035100002 0.37920001 0.033500001 0.37760001
		 0.031500001 0.38519999 0.032099999 0.38510001 0.032299999 0.37720001 0.032299999
		 0.38319999 0.0328 0.38240001 0.031599998 0.38029999 0.031099999 0.3822 0.031199999
		 0.38280001 0.033 0.3813 0.033100002 0.38010001 0.032400001 0.37970001 0.031599998
		 0.3838 0.032000002 0.38409999 0.032099999 0.37900001 0.0392 0.3858 0.0392 0.38460001
		 0.0403 0.38609999 0.038400002 0.38530001 0.042199999 0.38499999 0.042199999 0.38640001
		 0.041299999 0.3863 0.036499999 0.3849 0.036899999 0.37869999 0.037799999 0.3811 0.037
		 0.38949999 0.035799999 0.38909999 0.0363 0.3876 0.038600001 0.38350001 0.033599999
		 0.39089999 0.0359 0.39050001 0.034499999 0.3917 0.036499999 0.39300001 0.030200001
		 0.3863 0.0309 0.3856 0.0288 0.3872 0.030999999 0.38499999 0.031199999 0.38370001
		 0.032600001 0.3669 0.033399999 0.36899999 0.034400001 0.36469999 0.035100002 0.36700001
		 0.037 0.36399999 0.037099998 0.36590001 0.037799999 0.3689 0.0385 0.36660001 0.0396
		 0.36809999 0.039000001 0.3655 0.040600002 0.3669 0.034000002 0.36320001 0.032000002
		 0.3655 0.033799998 0.36199999 0.0317 0.36430001 0.039000001 0.36390001 0.036800001
		 0.36230001 0.040100001 0.36140001 0.036699999 0.36070001 0.041200001 0.36539999 0.042599998
		 0.36309999 0.0414 0.37279999 0.0427 0.3775 0.041700002 0.37819999 0.039999999 0.3739
		 0.043900002 0.38159999 0.0449 0.38429999 0.0436 0.38460001 0.042800002 0.3822 0.045899998
		 0.384 0.0449 0.38080001 0.0427 0.37200001 0.044 0.3766 0.041099999 0.37869999 0.042399999
		 0.38249999 0.043000001 0.3849 0.038899999 0.37110001 0.040600002 0.36989999 0.0418
		 0.3687 0.046999998 0.38299999 0.045899998 0.38029999 0.045400001 0.3757 0.044300001
		 0.37099999 0.043000001 0.3673 0.045299999 0.38600001 0.044 0.38620001 0.046399999
		 0.3858 0.043299999 0.38640001 0.043499999 0.38789999 0.047699999 0.38499999 0.048599999
		 0.38139999 0.047800001 0.3788 0.0471 0.37470001 0.046 0.37 0.044500001 0.36610001
		 0.0491 0.38699999 0.047800001 0.38710001 0.049199998 0.38409999 0.049699999 0.38069999
		 0.048999999 0.3777 0.050999999 0.3813 0.0504 0.37709999 0.048 0.3741 0.046999998
		 0.36970001 0.0495 0.37329999 0.049800001 0.3876 0.0502 0.38420001 0.050099999 0.38929999
		 0.050900001 0.3854 0.047899999 0.3691 0.037500001 0.39489999 0.039500002 0.39480001
		 0.039700001 0.39590001 0.037 0.396 0.036899999 0.39719999 0.040199999 0.39680001
		 0.036400001 0.39879999 0.039799999 0.39860001 0.045400001 0.3876 0.045200001 0.38929999
		 0.044300001 0.3892 0.044300001 0.38769999 0.044 0.39269999 0.043000001 0.3942 0.042100001
		 0.39379999 0.043099999 0.39250001 0.0447 0.39320001 0.043499999 0.39489999 0.046599999
		 0.3876 0.046300001 0.38960001 0.043400001 0.38940001 0.0416 0.39340001 0.042399999
		 0.39230001 0.045600001 0.3915 0.0447 0.39120001 0.0438 0.391 0.043000001 0.39109999
		 0.035300002 0.40000001 0.033799998 0.4005 0.045400001 0.39410001 0.0438 0.39610001
		 0.047400001 0.38960001 0.046500001 0.3919 0.041999999 0.39539999 0.041200001 0.39469999
		 0.042300001 0.39669999 0.040800001 0.39399999 0.041999999 0.39829999 0.038899999
		 0.39989999 0.045899998 0.3951;
	setAttr ".uvst[0].uvsp[250:499]" 0.0438 0.3973 0.048500001 0.38980001 0.047499999
		 0.39250001 0.041700002 0.3994 0.0458 0.39629999 0.045200001 0.39879999 0.042599998
		 0.40110001 0.043499999 0.3987 0.048999999 0.39250001 0.048900001 0.39070001 0.0473
		 0.39579999 0.047600001 0.3935 0.0403 0.4021 0.0418 0.39989999 0.038199998 0.40169999
		 0.045499999 0.36520001 0.0319 0.382 0.81950003 0.1868 0.81379998 0.19599999 0.81099999
		 0.19320001 0.81150001 0.18870001 0.80739999 0.1982 0.80220002 0.19840001 0.80290002
		 0.19509999 0.80699998 0.1944 0.80250001 0.192 0.80629998 0.19069999 0.79409999 0.18279999
		 0.79280001 0.182 0.79619998 0.1781 0.79680002 0.18080001 0.80140001 0.189 0.80479997
		 0.1866 0.8046 0.1807 0.80070001 0.18000001 0.80250001 0.1762 0.80980003 0.1753 0.7999
		 0.1873 0.80229998 0.1841 0.80909997 0.1837 0.81529999 0.17990001 0.79629999 0.19329999
		 0.79729998 0.19499999 0.79579997 0.1961 0.79400003 0.19410001 0.79180002 0.19499999
		 0.79350001 0.1974 0.79220003 0.1921 0.79430002 0.19069999 0.79299998 0.1885 0.79449999
		 0.1894 0.79210001 0.1894 0.79220003 0.1869 0.79100001 0.1876 0.79110003 0.18520001
		 0.7924 0.185 0.79839998 0.1974 0.79949999 0.1952 0.7992 0.1928 0.79729998 0.189 0.79809999
		 0.1904 0.82499999 0.26089999 0.83230001 0.26429999 0.83469999 0.27320001 0.8251 0.27149999
		 0.81410003 0.26730001 0.81819999 0.255 0.82870001 0.28850001 0.83950001 0.28670001
		 0.8168 0.28960001 0.83569998 0.3091 0.82200003 0.31209999 0.84850001 0.3053 0.80470002
		 0.2924 0.80809999 0.3145 0.85729998 0.25279999 0.85650003 0.25569999 0.85290003 0.2572
		 0.85149997 0.25459999 0.847 0.25 0.84930003 0.24690001 0.85189998 0.24609999 0.84859997
		 0.25060001 0.85009998 0.24330001 0.8538 0.2428 0.85070002 0.25220001 0.85799998 0.2481
		 0.84530002 0.2543 0.84640002 0.2561 0.84399998 0.25119999 0.84439999 0.25279999 0.86610001
		 0.2534 0.86189997 0.25690001 0.87669998 0.2554 0.87040001 0.25960001 0.8696 0.24879999
		 0.86220002 0.2432 0.87330002 0.24429999 0.88209999 0.25029999 0.88700002 0.2447 0.85659999
		 0.2595 0.86299998 0.26280001 0.026000001 0.391 0.0253 0.38150001 0.028200001 0.39829999
		 0.78680003 0.1829 0.78680003 0.17910001 0.78899997 0.17910001 0.78860003 0.1829 0.79030001
		 0.1825 0.79149997 0.1786 0.80690002 0.1657 0.80849999 0.16949999 0.80260003 0.17200001
		 0.80190003 0.1683 0.79720002 0.1701 0.79710001 0.1737 0.78670001 0.175 0.78680003
		 0.17129999 0.78979999 0.1714 0.7895 0.1751 0.79320002 0.171 0.79280001 0.1745 0.7895
		 0.1859 0.78930002 0.1891 0.78689998 0.18610001 0.78820002 0.18610001 0.78799999 0.189
		 0.78680003 0.18889999 0.048599999 0.35089999 0.052099999 0.35859999 0.047899999 0.36160001
		 0.043499999 0.35499999 0.0548 0.36579999 0.050799999 0.36719999 0.038800001 0.3547
		 0.035399999 0.35589999 0.0328 0.3583 0.0306 0.36129999 0.028000001 0.3662 0.024599999
		 0.36210001 0.0274 0.35679999 0.029999999 0.35299999 0.059099998 0.3651 0.057700001
		 0.3558 0.0262 0.37270001 0.0889 0.3757 0.084399998 0.3759 0.084700003 0.36649999
		 0.089400001 0.36649999 0.089699998 0.35699999 0.084799998 0.35699999 0.080499999
		 0.35690001 0.080700003 0.36649999 0.0766 0.3567 0.077100001 0.36629999 0.073600002
		 0.366 0.0726 0.3567 0.077200003 0.37560001 0.074100003 0.37509999 0.080600001 0.37580001
		 0.095100001 0.3662 0.094400004 0.3757 0.095600002 0.35679999 0.0638 0.3732 0.062799998
		 0.36610001 0.066500001 0.366 0.067599997 0.37369999 0.1001 0.37580001 0.1011 0.3664
		 0.1018 0.35690001 0.1059 0.37639999 0.1071 0.3671 0.1079 0.3574 0.043299999 0.40939999
		 0.042199999 0.40509999 0.045499999 0.40220001 0.0473 0.4059 0.056600001 0.3786 0.056299999
		 0.384 0.053100001 0.38280001 0.053199999 0.37779999 0.056299999 0.3725 0.0526 0.37259999
		 0.054400001 0.39359999 0.0526 0.398 0.0502 0.39500001 0.051800001 0.39109999 0.0502
		 0.4021 0.0482 0.3987 0.061099999 0.4086 0.057799999 0.41460001 0.055199999 0.41029999
		 0.0583 0.405 0.067599997 0.38159999 0.064000003 0.38029999 0.088799998 0.38510001
		 0.084399998 0.38499999 0.093900003 0.38510001 0.080600001 0.3849 0.077200003 0.3847
		 0.099100001 0.3854 0.1047 0.38569999 0.074000001 0.38420001 0.067199998 0.3892 0.064000003
		 0.38710001 0.0638 0.40239999 0.060899999 0.3994 0.064499997 0.3583 0.061500002 0.36039999
		 0.0557 0.389 0.052700002 0.38710001 0.065899998 0.39610001 0.062899999 0.3935 0.073200002
		 0.40990001 0.069899999 0.4077 0.072099999 0.40020001 0.075300001 0.40169999 0.073399998
		 0.39250001 0.076700002 0.39340001 0.080200002 0.39399999 0.078900002 0.40290001 0.083999999
		 0.39449999 0.082900003 0.40400001 0.088399999 0.39500001 0.087499999 0.405 0.093500003
		 0.39520001 0.098499998 0.39559999 0.1034 0.39610001 0.092200004 0.40560001 0.097000003
		 0.40599999 0.1019 0.40650001 0.068599999 0.35710001 0.070100002 0.36579999 0.071000002
		 0.3743 0.070799999 0.38299999 0.070299998 0.39109999 0.068999998 0.39840001 0.066699997
		 0.40529999 0.063900001 0.41209999 0.0493 0.4102 0.052700002 0.40599999 0.051399998
		 0.41510001 0.055500001 0.40130001 0.0601 0.37259999 0.060199998 0.3793 0.0601 0.3854
		 0.057700001 0.39629999 0.059300002 0.39089999 0.85799998 0.2265;
	setAttr ".uvst[0].uvsp[500:749]" 0.85149997 0.22920001 0.84740001 0.2273 0.85229999
		 0.2245 0.84619999 0.2233 0.84280002 0.2263 0.84020001 0.22310001 0.83850002 0.2262
		 0.83429998 0.2269 0.8344 0.22400001 0.84350002 0.2148 0.84219998 0.2194 0.83499998
		 0.2208 0.83539999 0.21709999 0.85320002 0.2131 0.85009998 0.2191 0.8642 0.21259999
		 0.85839999 0.2199 0.87449998 0.21430001 0.866 0.2216 0.81730002 0.2331 0.8132 0.2325
		 0.81550002 0.2278 0.81959999 0.2295 0.84030002 0.2032 0.84310001 0.20900001 0.83429998
		 0.2131 0.83099997 0.20909999 0.89389998 0.2088 0.88270003 0.2183 0.88190001 0.20389999
		 0.90270001 0.2163 0.88859999 0.2243 0.91570002 0.20640001 0.90390003 0.19670001 0.92809999
		 0.1953 0.9138 0.1829 0.93739998 0.2102 0.92290002 0.21799999 0.9425 0.22570001 0.9253
		 0.2304 0.90689999 0.2254 0.89120001 0.2313 0.81650001 0.23649999 0.81220001 0.2368
		 0.85439998 0.2052 0.85219997 0.1962 0.86790001 0.2024 0.86919999 0.18700001 0.88870001
		 0.18979999 0.84619999 0.1893 0.85680002 0.17820001 0.86430001 0.16339999 0.87879997
		 0.16850001 0.89660001 0.17399999 0.82929999 0.21969999 0.82789999 0.21699999 0.82370001
		 0.21510001 0.82920003 0.2228 0.82380003 0.2247 0.82560003 0.2217 0.82440001 0.2201
		 0.81989998 0.2218 0.95279998 0.20209999 0.94120002 0.1831 0.90710002 0.235 0.90359998
		 0.24429999 0.89039999 0.23810001 0.92299998 0.243 0.89770001 0.25220001 0.9163 0.25400001
		 0.94300002 0.241 0.93709999 0.2554 0.83090001 0.25870001 0.8373 0.26109999 0.83999997
		 0.266 0.83069998 0.25099999 0.8355 0.25310001 0.83560002 0.2554 0.83050001 0.2527
		 0.83130002 0.2489 0.83560002 0.25130001 0.83539999 0.25229999 0.83109999 0.2499 0.83579999
		 0.2581 0.83029997 0.2552 0.84420002 0.26190001 0.84789997 0.26629999 0.84039998 0.25420001
		 0.84100002 0.25650001 0.83969998 0.25240001 0.83990002 0.25310001 0.84210002 0.259
		 0.85070002 0.2613 0.85549998 0.26519999 0.84789997 0.2586 0.78890002 0.19329999 0.7906
		 0.193 0.78939998 0.1956 0.7863 0.1987 0.78640002 0.1957 0.78799999 0.1957 0.78850001
		 0.1987 0.78649998 0.19320001 0.78659999 0.1912 0.78780001 0.1913 0.78780001 0.19329999
		 0.79049999 0.19840001 0.7906 0.19069999 0.78869998 0.19149999 0.78979999 0.1917 0.81230003
		 0.241 0.81669998 0.2404 0.81840003 0.2449 0.81389999 0.2466 0.82690001 0.2485 0.82620001
		 0.2511 0.82870001 0.2445 0.82819998 0.24529999 0.82730001 0.2467 0.82550001 0.255
		 0.82340002 0.2467 0.82480001 0.2446 0.8211 0.25 0.82169998 0.2429 0.82349998 0.24089999
		 0.82010001 0.2393 0.8222 0.2369 0.81959999 0.2361 0.8222 0.2348 0.82359999 0.2353
		 0.82389998 0.2361 0.82520002 0.2368 0.82700002 0.23729999 0.82709998 0.23819999 0.8258
		 0.2387 0.82749999 0.2394 0.82709998 0.2418 0.82599998 0.24349999 0.82270002 0.1726
		 0.81779999 0.16859999 0.82880002 0.1638 0.8326 0.15449999 0.8391 0.1559 0.83499998
		 0.16680001 0.82870001 0.1771 0.84850001 0.1737 0.85399997 0.16 0.81169999 0.16150001
		 0.8143 0.1646 0.82069999 0.1505 0.82349998 0.152 0.81950003 0.1583 0.81650001 0.15620001
		 0.84600002 0.1576 0.84149998 0.17 0.83469999 0.18099999 0.82340002 0.1609 0.82709998
		 0.15360001 0.83590001 0.198 0.84030002 0.1848 0.83139998 0.1938 0.82639998 0.1903
		 0.82639998 0.2054 0.81650001 0.213 0.82260001 0.2013 0.81389999 0.2071 0.81209999
		 0.2034 0.81080002 0.20100001 0.81889999 0.1981 0.79549998 0.1144 0.79530001 0.113
		 0.79949999 0.1154 0.79909998 0.1167 0.80449998 0.1199 0.80409998 0.1207 0.054000001
		 0.42030001 0.0493 0.42570001 0.0471 0.4197 0.039099999 0.41159999 0.034000002 0.41330001
		 0.035700001 0.40599999 0.039000001 0.40630001 0.044399999 0.43090001 0.042300001
		 0.42399999 0.052299999 0.43149999 0.047600001 0.4373 0.94620001 0.27500001 0.95730001
		 0.2577 0.98220003 0.26289999 0.96530002 0.28850001 0.027899999 0.4289 0.027100001
		 0.41249999 0.035 0.42379999 0.045200001 0.414 0.040600002 0.41729999 0.96160001 0.2395
		 0.9594 0.2212 0.97750002 0.21789999 0.98100001 0.2388 0.031399999 0.40380001 0.0239
		 0.4007 0.0218 0.391 0.8082 0.2518 0.77990001 0.29609999 0.78079998 0.27860001 0.78710002
		 0.27829999 0.78740001 0.296 0.77899998 0.31580001 0.78780001 0.3159 0.79540002 0.2949
		 0.79720002 0.31549999 0.80250001 0.2723 0.7938 0.2764 0.80070001 0.2568 0.060199998
		 0.42989999 0.064099997 0.43439999 0.0601 0.44240001 0.0559 0.43700001 0.0682 0.4386
		 0.0647 0.44690001 0.063699998 0.42269999 0.067299999 0.42629999 0.0704 0.41819999
		 0.067199998 0.4152 0.082000002 0.44729999 0.0867 0.44940001 0.0845 0.45860001 0.079800002
		 0.4569 0.074600004 0.45429999 0.077399999 0.4447 0.072800003 0.442 0.069399998 0.4508
		 0.071500003 0.42969999 0.075900003 0.43259999 0.080300003 0.435 0.085000001 0.4375
		 0.090000004 0.4413 0.074299999 0.421 0.078699999 0.4233 0.083300002 0.42519999 0.087899998
		 0.42680001 0.092900001 0.42820001 0.098200001 0.42919999 0.096100003 0.4413 0.085600004
		 0.41510001 0.0902 0.4161 0.094999999 0.41690001 0.1 0.41769999 0.081100002 0.41370001
		 0.077 0.41190001;
	setAttr ".uvst[0].uvsp[750:999]" 0.056899998 0.4253 0.060600001 0.4188 0.0493
		 0.4747 0.055300001 0.48089999 0.052900001 0.48539999 0.046700001 0.47889999 0.044199999
		 0.46790001 0.0414 0.47189999 0.86059999 0.32749999 0.84490001 0.3321 0.036400001
		 0.46399999 0.0394 0.4605 0.80580002 0.2022 0.80010003 0.20190001 0.81269997 0.2208
		 0.79110003 0.21709999 0.7852 0.2172 0.78579998 0.212 0.7913 0.2119 0.79659998 0.206
		 0.80479997 0.2061 0.80540001 0.2155 0.79720002 0.2167 0.79720002 0.2114 0.80500001
		 0.2103 0.78469998 0.2227 0.79030001 0.2226 0.81010002 0.2271 0.79610002 0.22239999
		 0.80430001 0.22149999 0.78399998 0.22840001 0.78930002 0.2286 0.80309999 0.22759999
		 0.79470003 0.22840001 0.796 0.1998 0.7863 0.2025 0.78939998 0.2024 0.78619999 0.207
		 0.79079998 0.2068 0.7924 0.2018 0.8107 0.1163 0.80830002 0.1168 0.8028 0.1106 0.80470002
		 0.1093 0.81770003 0.1114 0.81370002 0.1143 0.80690002 0.1069 0.8096 0.1034 0.81639999
		 0.12620001 0.8143 0.12639999 0.82560003 0.1229 0.82010001 0.125 0.79720002 0.107
		 0.79839998 0.1049 0.79339999 0.1057 0.79390001 0.1032 0.80180001 0.098899998 0.80010003
		 0.1024 0.79470003 0.1004 0.79570001 0.097000003 0.83389997 0.2304 0.83359998 0.2318
		 0.83139998 0.23270001 0.83130002 0.2314 0.83420002 0.2289 0.83099997 0.2298 0.83039999
		 0.2282 0.82520002 0.2358 0.82690001 0.2366 0.82239997 0.2333 0.82389998 0.2339 0.82660002
		 0.23370001 0.82810003 0.2351 0.82730001 0.236 0.82539999 0.2349 0.82410002 0.2318
		 0.82539999 0.2326 0.82929999 0.234 0.82859999 0.23270001 0.82800001 0.23109999 0.82700002
		 0.23 0.78689998 0.1681 0.78979999 0.1681 0.7931 0.16779999 0.79680002 0.16689999
		 0.80089998 0.1654 0.8053 0.1629 0.79250002 0.1134 0.7924 0.1122 0.78930002 0.1629
		 0.78930002 0.1609 0.79140002 0.1609 0.79170001 0.1627 0.78960001 0.1653 0.787 0.1653
		 0.78710002 0.1629 0.79500002 0.1619 0.79439998 0.1602 0.79790002 0.15880001 0.79860002
		 0.1604 0.79970002 0.1628 0.79589999 0.16419999 0.80140001 0.1566 0.80229998 0.1582
		 0.80379999 0.1605 0.79259998 0.16500001 0.96990001 0.19490001 0.9569 0.1672 0.0206
		 0.38100001 0.0209 0.36970001 0.80140001 0.112 0.79619998 0.109 0.79290003 0.1081
		 0.7956 0.1112 0.8003 0.1137 0.79250002 0.1103 0.91509998 0.27779999 0.90179998 0.2861
		 0.88370001 0.2755 0.89590001 0.26969999 0.91900003 0.2976 0.9325 0.28749999 0.88840002
		 0.29269999 0.9052 0.30680001 0.87220001 0.2798 0.89039999 0.2588 0.88129997 0.26390001
		 0.90710002 0.26289999 0.8714 0.26800001 0.92720002 0.26769999 0.061900001 0.486 0.059999999
		 0.49090001 0.081 0.4946 0.086499996 0.49579999 0.085600004 0.50129998 0.079999998
		 0.5 0.77810001 0.33719999 0.78850001 0.33719999 0.068700001 0.48980001 0.075199999
		 0.49259999 0.073899999 0.49810001 0.067299999 0.49509999 0.81260002 0.33660001 0.79960001
		 0.3371 0.82849997 0.33469999 0.0537 0.46709999 0.059300002 0.4727 0.057399999 0.47670001
		 0.051800001 0.4707 0.065499999 0.47710001 0.063500002 0.4815 0.0491 0.461 0.0469
		 0.46430001 0.082900003 0.48449999 0.087899998 0.48559999 0.086999997 0.491 0.081900001
		 0.48949999 0.071900003 0.4806 0.077600002 0.48280001 0.076300003 0.4876 0.069700003
		 0.48500001 0.041900001 0.45730001 0.044199999 0.4544 0.027799999 0.44100001 0.031800002
		 0.43689999 0.0306 0.4413 0.066500001 0.45719999 0.072099999 0.46079999 0.067599997
		 0.47279999 0.0614 0.4684 0.064000003 0.46250001 0.069899999 0.46700001 0.056200001
		 0.44859999 0.061099999 0.4533 0.055799998 0.46309999 0.050999999 0.4578 0.053300001
		 0.45359999 0.058400001 0.45829999 0.089699998 0.4752 0.088600002 0.48069999 0.083999999
		 0.4797 0.085500002 0.47409999 0.092600003 0.46039999 0.090800002 0.4686 0.086900003
		 0.46759999 0.088699996 0.45969999 0.077500001 0.4639 0.073799998 0.4761 0.075800002
		 0.47029999 0.082599998 0.46599999 0.079300001 0.4779 0.081100002 0.47240001 0.051600002
		 0.44319999 0.046399999 0.4515 0.048599999 0.44780001 0.040199999 0.44760001 0.037799999
		 0.4506 0.037099998 0.44069999 0.034600001 0.4436 0.044599999 0.4413 0.042300001 0.44479999
		 0.041299999 0.43450001 0.039299998 0.43810001 0.8096 0.1592 0.8143 0.15440001 0.81870002
		 0.14910001 0.81169999 0.1295 0.8114 0.131 0.81660002 0.1374 0.81419998 0.1372 0.8064
		 0.155 0.80790001 0.15710001 0.80559999 0.1532 0.81730002 0.14749999 0.81260002 0.15260001
		 0.81110001 0.1506 0.81550002 0.14569999 0.81339997 0.1442 0.8096 0.1489 0.85530001
		 0.2316 0.84939998 0.2325 0.847 0.2305 0.84750003 0.23289999 0.8459 0.23370001 0.84369999
		 0.2326 0.84460002 0.2315 0.85000002 0.2349 0.84780002 0.23540001 0.85869998 0.2342
		 0.8531 0.23469999 0.86129999 0.2369 0.85570002 0.23720001 0.84899998 0.23810001 0.85210001
		 0.2374 0.85000002 0.24079999 0.85339999 0.2402 0.86220002 0.23909999 0.85829997 0.23989999
		 0.86739999 0.23999999 0.035399999 0.4535 0.032600001 0.4562 0.032499999 0.44659999
		 0.0297 0.44859999 0.83060002 0.13410001 0.82569999 0.1357 0.83340001 0.1446 0.82789999
		 0.14489999 0.86809999 0.1473 0.85659999 0.1453 0.84039998 0.1441;
	setAttr ".uvst[0].uvsp[1000:1249]" 0.84810001 0.1442 0.8319 0.1194 0.838 0.1319
		 0.82279998 0.13699999 0.82080001 0.1376 0.82459998 0.1445 0.82270002 0.14380001 0.84600002
		 0.1304 0.83880001 0.1166 0.88410002 0.1507 0.90369999 0.1569 0.86299998 0.1117 0.86790001
		 0.1302 0.85500002 0.12980001 0.84829998 0.114 0.88410002 0.1145 0.88569999 0.1329
		 0.90859997 0.1216 0.90759999 0.1398 0.93110001 0.1507 0.92320001 0.16779999 0.93339998
		 0.1314 0.95709997 0.1426 0.86290002 0.2291 0.87220001 0.22480001 0.87650001 0.22920001
		 0.86669999 0.2324 0.8779 0.23450001 0.86879998 0.2361 0.87660003 0.2397 0.84420002
		 0.2291 0.84079999 0.2317 0.84189999 0.2305 0.83829999 0.2313 0.83929998 0.2299 0.84079999
		 0.22830001 0.83740002 0.22840001 0.83670002 0.2299 0.83590001 0.23119999 0.228 0.3382
		 0.227 0.3335 0.2313 0.33149999 0.2325 0.33579999 0.2247 0.33970001 0.22319999 0.33520001
		 0.23800001 0.333 0.23649999 0.329 0.24150001 0.32620001 0.2438 0.32949999 0.2255
		 0.32859999 0.22040001 0.33039999 0.2296 0.32710001 0.2357 0.3249 0.2397 0.32319999
		 0.075300001 0.3468 0.070699997 0.34670001 0.071199998 0.3364 0.067100003 0.33629999
		 0.060899999 0.3497 0.079899997 0.34709999 0.078000002 0.33669999 0.084399998 0.34729999
		 0.082099997 0.3369 0.089699998 0.34709999 0.086599998 0.33669999 0.1023 0.347 0.1016
		 0.33700001 0.1122 0.3382 0.1092 0.3477 0.095799997 0.34689999 0.095100001 0.33669999
		 0.065800004 0.3475 0.061900001 0.33660001 0.0548 0.33680001 0.052299999 0.34560001
		 0.0458 0.34470001 0.0469 0.33939999 0.0407 0.3432 0.0407 0.3355 0.047499999 0.33309999
		 0.039999999 0.32949999 0.034600001 0.33109999 0.034000002 0.336 0.034600001 0.32640001
		 0.0283 0.32699999 0.0275 0.33109999 0.028000001 0.32249999 0.0228 0.32390001 0.0239
		 0.3204 0.0211 0.3274 0.035799999 0.34709999 0.80379999 0.094499998 0.7967 0.092399999
		 0.81290001 0.098899998 0.81449997 0.0491 0.81330001 0.060800001 0.80199999 0.0592
		 0.80290002 0.047800001 0.80040002 0.069899999 0.81099999 0.071900003 0.80849999 0.081500001
		 0.79860002 0.079099998 0.8276 0.077 0.82130003 0.087099999 0.80589998 0.089000002
		 0.79769999 0.086599998 0.81620002 0.094099998 0.83359998 0.050700001 0.8308 0.064000003
		 0.82279998 0.1076 0.82849997 0.1036 0.85390002 0.069600001 0.85729998 0.0539 0.8524
		 0.0889 0.83670002 0.098399997 0.82130003 0.1429 0.80669999 0.1174 0.81300002 0.1268
		 0.81950003 0.13770001 0.80549997 0.1185 0.8118 0.1274 0.81830001 0.1376 0.81830001
		 0.14 0.81989998 0.1417 0.8161 0.13860001 0.84390002 0.2735 0.84979999 0.28459999
		 0.861 0.30129999 0.8757 0.32190001 0.8531 0.27270001 0.86089998 0.2827 0.87480003
		 0.2978 0.89069998 0.31490001 0.86189997 0.27090001 0.82459998 0.016899999 0.81699997
		 0.035300002 0.80440003 0.0341 0.80830002 0.0162 0.84630001 0.018999999 0.83840001
		 0.035799999 0.87010002 0.0232 0.86320001 0.038800001 0.8955 0.029300001 0.89039999
		 0.044799998 0.80729997 0.2428 0.80739999 0.2376 0.80839998 0.2325 0.79290003 0.24150001
		 0.79390001 0.23469999 0.80220002 0.2333 0.80140001 0.2392 0.78329998 0.2421 0.78369999
		 0.2348 0.78860003 0.235 0.78789997 0.2421 0.78259999 0.2509 0.78710002 0.25049999
		 0.80119997 0.24519999 0.79210001 0.2494 0.78170002 0.26359999 0.78689998 0.2631 0.7924
		 0.26109999 0.8294 0.22579999 0.82010001 0.2335 0.82209998 0.2309 0.82560003 0.228
		 0.98150003 0.073299997 0.97170001 0.087700002 0.94529998 0.068999998 0.949 0.052900001
		 0.9217 0.038600001 0.91860002 0.054200001 0.96490002 0.0986 0.94090003 0.082699999
		 0.91399997 0.069200002 0.8847 0.059700001 0.88120002 0.0757 0.88050002 0.0942 0.96069998
		 0.1103 0.93709999 0.097099997 0.91030002 0.085199997 0.90850002 0.1027 0.9346 0.1132
		 0.95810002 0.1243 0.032499999 0.34990001 0.79680002 0.1841 0.79549998 0.1847 0.7949
		 0.1837 0.79699999 0.18269999 0.7978 0.1842 0.79900002 0.1824 0.79839998 0.1846 0.8003
		 0.18269999 0.79759997 0.1866 0.79830003 0.1856 0.80000001 0.1848 0.7985 0.1868 0.7942
		 0.1874 0.79470003 0.18780001 0.79460001 0.18870001 0.79350001 0.18790001 0.79400003
		 0.1866 0.7931 0.1867 0.7942 0.1857 0.79339999 0.18520001 0.79629999 0.1874 0.7967
		 0.1882 0.8247 0.2397 0.79629999 0.1858 0.79589999 0.1859 0.79659998 0.1859 0.79680002
		 0.18610001 0.79659998 0.1865 0.79689997 0.18629999 0.79519999 0.1869 0.79540002 0.18709999
		 0.79500002 0.1866 0.79530001 0.18619999 0.796 0.1868 0.79570001 0.1865 0.79619998
		 0.18629999 0.84680003 0.245 0.84799999 0.2429 0.84490001 0.2475 0.84289998 0.24969999
		 0.83230001 0.24770001 0.83609998 0.2494 0.83960003 0.25040001 0.82990003 0.2437 0.82920003
		 0.2378 0.82950002 0.2384 0.82980001 0.23899999 0.83340001 0.23289999 0.83149999 0.23379999
		 0.82929999 0.2374 0.82950002 0.2359 0.82929999 0.2368 0.82999998 0.235 0.84490001
		 0.23469999 0.84310001 0.23360001 0.84689999 0.23639999 0.84789997 0.23890001 0.84789997
		 0.2412 0.84020001 0.23289999 0.83780003 0.2325 0.83560002 0.2325 0.8459 0.2436 0.84609997
		 0.2419 0.84450001 0.2462 0.84249997 0.24860001;
	setAttr ".uvst[0].uvsp[1250:1499]" 0.83279997 0.24690001 0.83649999 0.24860001
		 0.83939999 0.24950001 0.83090001 0.2429 0.83050001 0.2377 0.83069998 0.2379 0.8308
		 0.2383 0.83310002 0.23370001 0.83139998 0.23459999 0.83039999 0.2374 0.83020002 0.2366
		 0.83029997 0.23710001 0.83029997 0.236 0.84490001 0.236 0.84299999 0.23450001 0.84630001
		 0.2377 0.84630001 0.2394 0.84609997 0.24079999 0.84020001 0.23360001 0.83759999 0.2333
		 0.83539999 0.2333 0.78930002 0.1128 0.78939998 0.1117 0.78960001 0.1098 0.78969997
		 0.1075 0.78979999 0.1051 0.7899 0.1026 0.79009998 0.099699996 0.79009998 0.096100003
		 0.7902 0.091499999 0.7902 0.085600004 0.7899 0.078400001 0.79089999 0.068800002 0.792
		 0.057999998 0.79269999 0.046700001 0.79350001 0.033300001 0.79439998 0.0155 0.222
		 0.3407 0.2202 0.33660001 0.21789999 0.33140001 0.038800001 0.42879999 0.0374 0.43340001
		 0.035100002 0.43380001 0.93120003 0.30790001 0.94480002 0.2983 0.77740002 0.3594
		 0.78969997 0.3592 0.81800002 0.35679999 0.80299997 0.3585 0.83490002 0.35350001 0.8527
		 0.34909999 0.87010002 0.3432 0.8865 0.33610001 0.90270001 0.3274 0.91729999 0.3177
		 0.80330002 0.1216 0.79909998 0.1175 0.78930002 0.1141 0.79229999 0.1147 0.79570001
		 0.1156 0.81019998 0.1364 0.81 0.13259999 0.78930002 0.1602 0.79119998 0.1596 0.79460001
		 0.15880001 0.7978 0.15790001 0.80110002 0.15530001 0.80549997 0.1515 0.80940002 0.14749999
		 0.81209999 0.1425 0.81239998 0.1374 0.79680002 0.1228 0.80239999 0.1338 0.80150002
		 0.1296 0.78729999 0.15970001 0.78759998 0.1541 0.79619998 0.1513 0.80369997 0.14390001
		 0.80339998 0.1364 0.78899997 0.1196 0.79500002 0.1344 0.79470003 0.1321 0.79280001
		 0.12909999 0.78799999 0.14399999 0.79220003 0.1427 0.79479998 0.1393 0.79509997 0.1362
		 0.7888 0.12729999 0.79149997 0.13500001 0.79140002 0.1339 0.7906 0.1327 0.78820002
		 0.1393 0.79009998 0.13869999 0.7913 0.1371 0.79159999 0.1357 0.78860003 0.13169999
		 0.79040003 0.13500001 0.7902 0.1344 0.7895 0.1338 0.78829998 0.1375 0.78939998 0.1372
		 0.79009998 0.1365 0.79040003 0.1357 0.78850001 0.13349999 0.78960001 0.13510001 0.78960001
		 0.1347 0.78909999 0.1346 0.78839999 0.1364 0.78909999 0.1363 0.78960001 0.1362 0.78960001
		 0.1357 0.78850001 0.1345 0.78839999 0.1356 0.78839999 0.13519999 0.78890002 0.13519999
		 0.78890002 0.1357 0.03426639 0.32214367 0.048500001 0.32699999 0.0251 0.31740001
		 0.077799998 0.3274 0.096799999 0.32789999 0.2384 0.32030001 0.2261 0.32350001 0.2159
		 0.32620001 0.061799999 0.32769999 0.121 0.33059999 0.090000004 0.45039999 0.094400004
		 0.45100001 0.78719997 0.1609 0.1797 0.39120001 0.1793 0.39520001 0.17829999 0.3946
		 0.1787 0.3917 0.1727 0.4084 0.1732 0.41 0.17209999 0.4104 0.17209999 0.40889999 0.171
		 0.40419999 0.1715 0.40549999 0.1714 0.4061 0.1709 0.4048 0.1716 0.4104 0.1714 0.40920001
		 0.1708 0.40650001 0.17039999 0.4052 0.17730001 0.39700001 0.17820001 0.39860001 0.17739999
		 0.40220001 0.1771 0.40169999 0.1762 0.40509999 0.17659999 0.40540001 0.1734 0.39449999
		 0.1727 0.39199999 0.1753 0.38999999 0.176 0.39320001 0.1698 0.40360001 0.16949999
		 0.40509999 0.16949999 0.40419999 0.1701 0.39590001 0.1698 0.39390001 0.167 0.40560001
		 0.1656 0.4061 0.1656 0.405 0.167 0.40450001 0.168 0.40560001 0.168 0.40459999 0.1717
		 0.4075 0.17209999 0.40689999 0.171 0.40790001 0.167 0.40669999 0.1656 0.40720001
		 0.1671 0.40830001 0.16580001 0.40889999 0.1681 0.4066 0.1759 0.39520001 0.1802 0.39559999
		 0.1807 0.39070001 0.18170001 0.38999999 0.1812 0.3955 0.1778 0.40259999 0.1789 0.4003
		 0.1795 0.4032 0.1778 0.40509999 0.1715 0.41260001 0.1727 0.4127 0.17110001 0.4156
		 0.1696 0.41499999 0.1735 0.4077 0.1745 0.40920001 0.1744 0.40700001 0.1751 0.40849999
		 0.1715 0.40349999 0.17200001 0.4052 0.1725 0.4032 0.1728 0.40509999 0.1672 0.4012
		 0.1663 0.40270001 0.1652 0.40270001 0.1661 0.40090001 0.1743 0.41330001 0.1767 0.41119999
		 0.1719 0.4172 0.1733 0.41679999 0.171 0.4118 0.1691 0.41319999 0.17039999 0.40059999
		 0.1699 0.40259999 0.17209999 0.40040001 0.1673 0.39879999 0.16509999 0.40020001 0.1672
		 0.39770001 0.1683 0.3987 0.1645 0.4052 0.1644 0.40650001 0.163 0.40669999 0.16339999
		 0.405 0.1726 0.4066 0.1734 0.40630001 0.1644 0.40790001 0.1629 0.40830001 0.1644
		 0.40939999 0.1631 0.4095 0.1734 0.3962 0.1736 0.4048 0.1733 0.40349999 0.17659999
		 0.39860001 0.1767 0.40169999 0.1761 0.4041 0.1734 0.4016 0.17309999 0.39860001 0.17389999
		 0.3994 0.1749 0.39739999 0.17470001 0.4059 0.17399999 0.4057 0.1761 0.39700001 0.1743
		 0.4039 0.17399999 0.4032 0.1761 0.40059999 0.1763 0.40180001 0.1758 0.40310001 0.1743
		 0.4023 0.1745 0.40059999 0.17550001 0.3998 0.175 0.4043 0.1744 0.4048 0.1761 0.39899999
		 0.1671 0.40369999 0.1657 0.4039 0.1672 0.40270001 0.1681 0.40349999;
	setAttr ".uvst[0].uvsp[1500:1749]" 0.16419999 0.40239999 0.1648 0.4039 0.1639
		 0.40380001 0.17020001 0.40369999 0.17110001 0.39719999 0.1692 0.3994 0.1683 0.40779999
		 0.1697 0.4077 0.1696 0.40619999 0.1682 0.40169999 0.1706 0.40990001 0.1698 0.41080001
		 0.1691 0.40920001 0.16769999 0.41150001 0.17569999 0.4073 0.1753 0.40650001 0.1768
		 0.4084 0.1752 0.4057 0.1753 0.40439999 0.17820001 0.3897 0.1794 0.38769999 0.17829999
		 0.3847 0.1771 0.38699999 0.1761 0.3831 0.17550001 0.38519999 0.1737 0.38820001 0.1736
		 0.3856 0.17209999 0.38690001 0.1734 0.38420001 0.1714 0.38530001 0.17910001 0.38339999
		 0.1802 0.3863 0.1798 0.3822 0.18080001 0.38519999 0.17380001 0.3822 0.1768 0.38159999
		 0.17389999 0.38 0.1776 0.38029999 0.1709 0.38319999 0.17020001 0.3809 0.1682 0.3906
		 0.1693 0.39210001 0.16599999 0.3955 0.1653 0.3944 0.1629 0.39840001 0.1638 0.39919999
		 0.16240001 0.4014 0.1612 0.40110001 0.1604 0.4007 0.1621 0.39739999 0.1672 0.38940001
		 0.16429999 0.39320001 0.16670001 0.39649999 0.1644 0.39969999 0.1631 0.40200001 0.1718
		 0.38999999 0.1705 0.3883 0.1696 0.38690001 0.15979999 0.3996 0.1613 0.39660001 0.16329999
		 0.39210001 0.1661 0.38789999 0.1688 0.3849 0.1613 0.40310001 0.1603 0.40270001 0.1595
		 0.4023 0.16230001 0.40349999 0.1618 0.40490001 0.15880001 0.4014 0.1586 0.39770001
		 0.15989999 0.39480001 0.1619 0.39070001 0.1647 0.38620001 0.1675 0.38330001 0.1573
		 0.4025 0.1578 0.40009999 0.1582 0.4032 0.1577 0.3969 0.15889999 0.3937 0.1564 0.3973
		 0.15790001 0.39320001 0.1611 0.38999999 0.1639 0.3856 0.1602 0.38909999 0.15620001
		 0.40279999 0.1568 0.40000001 0.1552 0.40439999 0.15549999 0.40099999 0.16329999 0.3849
		 0.1663 0.41249999 0.1666 0.41420001 0.1637 0.41389999 0.16419999 0.41249999 0.1665
		 0.4161 0.16329999 0.4149 0.1674 0.41760001 0.1638 0.41710001 0.15979999 0.40419999
		 0.16069999 0.40459999 0.1605 0.40599999 0.1595 0.4059 0.1602 0.40959999 0.1609 0.40920001
		 0.1617 0.4109 0.161 0.41139999 0.1594 0.41029999 0.1603 0.41240001 0.1586 0.4061
		 0.15889999 0.4039 0.16159999 0.4064 0.162 0.4091 0.16249999 0.41049999 0.15889999
		 0.40830001 0.15970001 0.4077 0.16060001 0.40759999 0.16150001 0.40779999 0.1682 0.41940001
		 0.16940001 0.42019999 0.15970001 0.4138 0.1586 0.41100001 0.1578 0.40599999 0.15809999
		 0.4086 0.1618 0.4129 0.16240001 0.4122 0.16140001 0.41429999 0.16320001 0.4113 0.16140001
		 0.41620001 0.1644 0.419 0.1596 0.4147 0.1582 0.41170001 0.15700001 0.40560001 0.1574
		 0.40880001 0.16150001 0.4174 0.1578 0.4129 0.1593 0.41600001 0.15989999 0.41850001
		 0.1577 0.41549999 0.15620001 0.4059 0.15549999 0.40779999 0.1566 0.4091 0.15620001
		 0.41159999 0.16230001 0.41999999 0.1609 0.4174 0.1648 0.42050001 0.1665 0.3818 0.1753
		 0.40220001 0.75330001 0.1837 0.76190001 0.18700001 0.76200002 0.1909 0.75819999 0.1935
		 0.7647 0.19599999 0.76550001 0.1926 0.76969999 0.1936 0.76999998 0.1971 0.7705 0.19059999
		 0.76679999 0.1892 0.77929997 0.182 0.77649999 0.1803 0.77740002 0.17739999 0.7809
		 0.1813 0.76840001 0.186 0.77170002 0.18799999 0.76800001 0.18009999 0.76359999 0.1735
		 0.77079999 0.1754 0.7723 0.1795 0.77069998 0.1839 0.77319998 0.18629999 0.764 0.1829
		 0.75779998 0.17739999 0.77670002 0.19220001 0.77880001 0.19329999 0.77679998 0.19509999
		 0.77539998 0.1939 0.78100002 0.1944 0.7791 0.19670001 0.77890003 0.18960001 0.78070003
		 0.1913 0.78039998 0.1874 0.78130001 0.1886 0.77850002 0.1881 0.78119999 0.186 0.7827
		 0.1869 0.78240001 0.18440001 0.7809 0.1841 0.77410001 0.1964 0.77310002 0.1939 0.7737
		 0.19149999 0.77569997 0.1877 0.77499998 0.1892 0.7374 0.25639999 0.73650002 0.26699999
		 0.72670001 0.26750001 0.72970003 0.25889999 0.74830002 0.26370001 0.74529999 0.25139999
		 0.73159999 0.28330001 0.72109997 0.2802 0.74349999 0.2859 0.72299999 0.30320001 0.73640001
		 0.30770001 0.71060002 0.29800001 0.75550002 0.2899 0.75 0.3116 0.70609999 0.2455
		 0.7112 0.24680001 0.70969999 0.2499 0.70639998 0.2484 0.71630001 0.24079999 0.7148
		 0.2414 0.71170002 0.2385 0.7141 0.2379 0.71079999 0.23540001 0.71439999 0.23649999
		 0.7123 0.2439 0.70599997 0.23999999 0.71740001 0.245 0.71619999 0.2481 0.7191 0.24250001
		 0.7184 0.24349999 0.69840002 0.2449 0.70179999 0.249 0.68790001 0.24529999 0.69370002
		 0.25029999 0.6954 0.23980001 0.69209999 0.2348 0.7033 0.2348 0.68309999 0.2395 0.6789
		 0.2332 0.70639998 0.252 0.70029998 0.2543 0.182 0.40369999 0.1788 0.41249999 0.1752
		 0.41890001 0.78509998 0.18260001 0.7845 0.1788 0.78189999 0.1779 0.7834 0.182 0.76749998
		 0.1637 0.77209997 0.167 0.77109998 0.1707 0.76550001 0.1675 0.7766 0.1692 0.77649999
		 0.1728 0.78390002 0.17479999 0.78380001 0.17110001 0.78049999 0.17039999 0.78070003
		 0.17389999 0.78399998 0.18539999 0.78390002 0.18870001;
	setAttr ".uvst[0].uvsp[1750:1999]" 0.78549999 0.1859 0.78539997 0.18880001 0.16779999
		 0.36750001 0.1719 0.373 0.1656 0.37779999 0.1622 0.3739 0.1611 0.38260001 0.1577
		 0.38029999 0.1768 0.37400001 0.17990001 0.37599999 0.18170001 0.37909999 0.183 0.38280001
		 0.1839 0.38820001 0.1884 0.3854 0.1873 0.3795 0.186 0.37490001 0.1539 0.37850001
		 0.1575 0.36970001 0.1838 0.39500001 0.1225 0.3802 0.1243 0.37130001 0.12890001 0.37259999
		 0.1269 0.38170001 0.12620001 0.36199999 0.131 0.3635 0.13519999 0.3646 0.1329 0.37380001
		 0.1392 0.36559999 0.14300001 0.36660001 0.1401 0.37540001 0.1366 0.37470001 0.134
		 0.3836 0.13699999 0.384 0.13060001 0.3827 0.1172 0.37869999 0.1188 0.36939999 0.1203
		 0.36019999 0.1471 0.38499999 0.1435 0.38440001 0.14669999 0.37740001 0.15009999 0.37850001
		 0.1117 0.37729999 0.1129 0.368 0.1141 0.3585 0.1569 0.4269 0.1538 0.42230001 0.1565
		 0.419 0.1594 0.42289999 0.1521 0.39230001 0.15530001 0.3926 0.15369999 0.3976 0.1507
		 0.39789999 0.1577 0.38769999 0.15440001 0.3865 0.15009999 0.4082 0.1531 0.4066 0.15360001
		 0.41069999 0.1506 0.41299999 0.1547 0.41479999 0.15189999 0.41769999 0.1402 0.421
		 0.1437 0.41839999 0.1451 0.42449999 0.14129999 0.42789999 0.14139999 0.3924 0.14489999
		 0.39199999 0.1205 0.38949999 0.1248 0.3908 0.1155 0.3881 0.1284 0.39179999 0.13169999
		 0.3926 0.1102 0.38679999 0.1348 0.39300001 0.1432 0.3987 0.13959999 0.39989999 0.13940001
		 0.41409999 0.1429 0.41209999 0.1503 0.37029999 0.15279999 0.37310001 0.15009999 0.4032
		 0.1532 0.4023 0.1391 0.40700001 0.1426 0.40549999 0.12819999 0.4181 0.1288 0.40970001
		 0.1322 0.40920001 0.132 0.417 0.12989999 0.40130001 0.1331 0.40130001 0.12639999
		 0.40090001 0.1251 0.40990001 0.1226 0.4003 0.121 0.40970001 0.1181 0.39930001 0.1162
		 0.40920001 0.1132 0.39809999 0.1082 0.39700001 0.1114 0.4084 0.1067 0.40740001 0.1468
		 0.368 0.1434 0.37619999 0.1401 0.38409999 0.1381 0.3928 0.1363 0.40079999 0.1357
		 0.4084 0.13590001 0.41580001 0.1364 0.4233 0.1507 0.42609999 0.1486 0.42089999 0.1473
		 0.43040001 0.1473 0.4156 0.1508 0.3856 0.1486 0.39199999 0.1471 0.39809999 0.14650001
		 0.41 0.1463 0.4041 0.7098 0.2174 0.71579999 0.2159 0.71869999 0.21879999 0.71530002
		 0.22040001 0.72180003 0.21520001 0.7245 0.2184 0.72759998 0.2157 0.7335 0.2175 0.73329997
		 0.2203 0.72890002 0.2189 0.72570002 0.20739999 0.73329997 0.21089999 0.73320001 0.21439999
		 0.7263 0.212 0.71850002 0.21080001 0.71630001 0.20479999 0.71030003 0.21089999 0.70539999
		 0.2034 0.69520003 0.2041 0.70249999 0.2121 0.7507 0.2289 0.74870002 0.22480001 0.75190002
		 0.2242 0.75370002 0.2289 0.73030001 0.19670001 0.73900002 0.20389999 0.73509997 0.20720001
		 0.72689998 0.20209999 0.67650002 0.1963 0.68910003 0.1927 0.68650001 0.207 0.66710001
		 0.2031 0.67989999 0.21250001 0.65549999 0.1918 0.6681 0.18340001 0.64459997 0.1796
		 0.66000003 0.1689 0.64719999 0.2026 0.63419998 0.19320001 0.64359999 0.2147 0.62760001
		 0.208 0.66210002 0.21170001 0.67650002 0.2193 0.7543 0.23270001 0.7507 0.2326 0.71609998
		 0.1969 0.71950001 0.1884 0.70300001 0.1928 0.70389998 0.1778 0.68379998 0.1781 0.71679997
		 0.17030001 0.72619998 0.1825 0.69630003 0.1585 0.71079999 0.1549 0.6778 0.1617 0.73930001
		 0.21430001 0.7414 0.212 0.74529999 0.2111 0.73900002 0.2173 0.74339998 0.2165 0.74479997
		 0.2198 0.74470001 0.2154 0.74830002 0.21780001 0.62040001 0.18359999 0.63349998 0.1662
		 0.66079998 0.2212 0.67629999 0.2263 0.66299999 0.2309 0.64459997 0.22759999 0.66790003
		 0.2396 0.6498 0.2394 0.62559998 0.22319999 0.62989998 0.23810001 0.7317 0.2534 0.722
		 0.25979999 0.72500002 0.255 0.73189998 0.2455 0.7317 0.2465 0.72640002 0.2483 0.72670001
		 0.2472 0.73199999 0.2422 0.73189998 0.2437 0.727 0.2449 0.72710001 0.2438 0.73280001
		 0.24959999 0.72670001 0.25170001 0.71810001 0.2552 0.71439999 0.25929999 0.72130001
		 0.2464 0.72109997 0.24869999 0.72240001 0.2446 0.72299999 0.2437 0.72030002 0.25220001
		 0.7119 0.2543 0.70719999 0.25740001 0.71450001 0.25170001 0.78399998 0.193 0.78329998
		 0.1953 0.7823 0.19239999 0.7841 0.19850001 0.78469998 0.1956 0.7852 0.19310001 0.78539997
		 0.1911 0.78210002 0.198 0.78250003 0.19 0.78430003 0.1911 0.78310001 0.1911 0.75349998
		 0.2376 0.7511 0.2432 0.74690002 0.2413 0.74940002 0.2368 0.736 0.24420001 0.73680001
		 0.2466 0.73559999 0.2392 0.73610002 0.24079999 0.73610002 0.24259999 0.73699999 0.2502
		 0.74080002 0.2432 0.73989999 0.2412 0.74229997 0.2462 0.74430001 0.23999999 0.74229997
		 0.2384 0.74379998 0.23540001 0.74620003 0.23630001 0.74730003 0.23280001 0.7446 0.2326
		 0.74199998 0.23450001 0.74229997 0.2321 0.741 0.234 0.73989999 0.2361 0.73860002
		 0.23459999 0.73930001 0.23370001 0.73890001 0.23800001 0.73750001 0.2358;
	setAttr ".uvst[0].uvsp[2000:2249]" 0.7392 0.2401 0.75120002 0.1689 0.75639999
		 0.1655 0.74629998 0.1591 0.74000001 0.16140001 0.73689997 0.1498 0.74349999 0.14920001
		 0.74510002 0.1727 0.72149998 0.1524 0.72600001 0.1663 0.76310003 0.15889999 0.76020002
		 0.1618 0.7561 0.1451 0.75919998 0.1529 0.75590003 0.1548 0.75340003 0.14650001 0.7331
		 0.1639 0.72970003 0.1508 0.7385 0.17569999 0.75169998 0.15710001 0.74949998 0.1481
		 0.73540002 0.19230001 0.73290002 0.17839999 0.74070001 0.18880001 0.74589998 0.18610001
		 0.74419999 0.20100001 0.75340003 0.2098 0.74860001 0.1974 0.75669998 0.2044 0.759
		 0.20100001 0.75269997 0.1948 0.76069999 0.1988 0.78299999 0.1135 0.7791 0.1154 0.77899998
		 0.114 0.7834 0.1122 0.77359998 0.1181 0.77380002 0.119 0.15009999 0.43619999 0.146
		 0.44150001 0.1432 0.4346 0.16069999 0.43020001 0.1626 0.4249 0.1661 0.42559999 0.16509999
		 0.43329999 0.1533 0.44190001 0.149 0.44800001 0.1437 0.45339999 0.141 0.44620001
		 0.61970001 0.25619999 0.60030001 0.26820001 0.58719999 0.2392 0.61080003 0.23800001
		 0.1657 0.4506 0.1604 0.44400001 0.17219999 0.43360001 0.15369999 0.43110001 0.15719999
		 0.43560001 0.60839999 0.2194 0.61229998 0.2016 0.5905 0.21600001 0.59549999 0.1961
		 0.1708 0.42410001 0.17829999 0.42269999 0.18279999 0.41389999 0.75629997 0.24879999
		 0.77249998 0.29519999 0.77460003 0.27759999 0.77020001 0.31490001 0.76459998 0.29319999
		 0.76090002 0.31349999 0.75980002 0.2701 0.76810002 0.27500001 0.76340002 0.25459999
		 0.134 0.44190001 0.1356 0.45050001 0.12980001 0.45469999 0.12890001 0.44499999 0.1235
		 0.4479 0.1236 0.45770001 0.1285 0.4359 0.1331 0.43360001 0.1283 0.42699999 0.1323
		 0.42519999 0.1073 0.45159999 0.1059 0.46149999 0.1007 0.4614 0.1022 0.45199999 0.1126
		 0.4508 0.1115 0.4612 0.1179 0.4497 0.1176 0.45989999 0.1233 0.4377 0.1182 0.4391
		 0.1132 0.44010001 0.1079 0.4411 0.1021 0.44330001 0.1237 0.42829999 0.1187 0.42910001
		 0.1137 0.4296 0.1087 0.4298 0.1035 0.42969999 0.1146 0.41890001 0.1099 0.41870001
		 0.1049 0.41850001 0.1194 0.419 0.124 0.4188 0.13869999 0.43849999 0.1374 0.43090001
		 0.1296 0.48890001 0.13079999 0.49380001 0.1223 0.498 0.1215 0.493 0.1372 0.48390001
		 0.13850001 0.4887 0.7119 0.32530001 0.69669998 0.3193 0.1459 0.48269999 0.1442 0.47839999
		 0.77179998 0.2007 0.7658 0.2005 0.75639999 0.2177 0.77929997 0.2168 0.78009999 0.2115
		 0.77520001 0.2053 0.76639998 0.2044 0.76450002 0.2137 0.76560003 0.2086 0.77380002
		 0.2106 0.77289999 0.2158 0.77890003 0.22229999 0.75809997 0.2242 0.773 0.22149999
		 0.76480001 0.21960001 0.77890003 0.2282 0.76520002 0.22570001 0.77359998 0.22750001
		 0.77640003 0.199 0.78299999 0.20209999 0.78130001 0.20649999 0.77990001 0.2013 0.76819998
		 0.1136 0.77460003 0.1075 0.77630001 0.109 0.77020001 0.1146 0.76120001 0.1082 0.76999998
		 0.1011 0.77249998 0.1049 0.76520002 0.1115 0.7633 0.1234 0.76130003 0.1227 0.75770003
		 0.121 0.75349998 0.1183 0.78210002 0.1061 0.78109998 0.1039 0.78619999 0.1052 0.78579998
		 0.1028 0.77819997 0.097599998 0.77960002 0.1014 0.78460002 0.0964 0.78530002 0.1
		 0.73290002 0.22409999 0.73580003 0.22589999 0.73470002 0.2272 0.73269999 0.2254 0.7331
		 0.22229999 0.73710001 0.2228 0.73650002 0.2244 0.74129999 0.2322 0.73940003 0.2325
		 0.74430001 0.2296 0.74220002 0.23029999 0.73989999 0.2297 0.74089998 0.2309 0.73909998
		 0.2315 0.73839998 0.2306 0.7432 0.2274 0.7414 0.22849999 0.73689997 0.2296 0.73820001
		 0.2281 0.73940003 0.22669999 0.74080002 0.2247 0.78399998 0.1679 0.78079998 0.1672
		 0.7773 0.1661 0.77340001 0.16410001 0.7694 0.161 0.78619999 0.1129 0.78649998 0.1117
		 0.78500003 0.1628 0.78259999 0.16240001 0.78310001 0.16060001 0.7852 0.1608 0.7845
		 0.16509999 0.77950001 0.1613 0.7762 0.1594 0.77700001 0.15800001 0.7802 0.15970001
		 0.7748 0.16159999 0.7784 0.1635 0.77280003 0.1566 0.77380002 0.1552 0.77109998 0.15880001
		 0.7816 0.1646 0.60519999 0.17470001 0.6207 0.1496 0.1866 0.40450001 0.18970001 0.39390001
		 0.77759999 0.1105 0.78289998 0.1082 0.78649998 0.1076 0.78329998 0.1104 0.7784 0.1123
		 0.78649998 0.1099 0.64880002 0.26300001 0.66799998 0.25729999 0.67919999 0.26449999
		 0.66079998 0.27289999 0.64310002 0.28240001 0.63129997 0.27039999 0.67309999 0.2811
		 0.65530002 0.29350001 0.68989998 0.26989999 0.67439997 0.24699999 0.68269998 0.25330001
		 0.6577 0.2492 0.69190001 0.25839999 0.63819999 0.25150001 0.1134 0.50089997 0.1131
		 0.4957 0.092 0.49689999 0.091300003 0.50220001 0.76770002 0.33590001 0.1053 0.49700001
		 0.105 0.50239998 0.097599998 0.50279999 0.098300003 0.49739999 0.74360001 0.33289999
		 0.7568 0.3346 0.72799999 0.32949999 0.1278 0.48069999 0.1286 0.48449999 0.1208 0.4883
		 0.1205 0.4844 0.1126 0.4912 0.1121 0.4862 0.1346 0.47620001 0.13590001 0.47979999
		 0.092799999 0.48640001 0.092399999 0.49180001;
	setAttr ".uvst[0].uvsp[2250:2499]" 0.1048 0.48699999 0.1051 0.49239999 0.098099999
		 0.4921 0.098099999 0.48699999 0.1415 0.47130001 0.1428 0.47459999 0.1619 0.46219999
		 0.15880001 0.46200001 0.1593 0.45750001 0.1181 0.4675 0.1116 0.46880001 0.1118 0.48159999
		 0.1111 0.47479999 0.1183 0.47350001 0.1193 0.4797 0.1313 0.46219999 0.1247 0.46520001
		 0.1268 0.47670001 0.12540001 0.4711 0.13240001 0.46790001 0.13349999 0.47260001 0.094099998
		 0.47549999 0.0933 0.48100001 0.0964 0.461 0.094899997 0.4691 0.1052 0.46919999 0.1041
		 0.48179999 0.1044 0.4756 0.099600002 0.46919999 0.098200001 0.48120001 0.098800004
		 0.47549999 0.13770001 0.45809999 0.1391 0.46340001 0.1402 0.46779999 0.1477 0.46560001
		 0.14910001 0.46880001 0.15279999 0.45969999 0.15440001 0.46309999 0.1454 0.45820001
		 0.14650001 0.4623 0.1507 0.45249999 0.1514 0.45660001 0.76539999 0.1567 0.76169997
		 0.1513 0.75840002 0.1441 0.76569998 0.12710001 0.7658 0.1286 0.76160002 0.1339 0.76359999
		 0.13339999 0.76920003 0.1531 0.76730001 0.155 0.77029997 0.1515 0.76010001 0.1429
		 0.76190001 0.1417 0.76529998 0.1481 0.76359999 0.1499 0.764 0.141 0.7669 0.14659999
		 0.71210003 0.22239999 0.71880001 0.22229999 0.71609998 0.2238 0.71850002 0.2242 0.72109997
		 0.223 0.72250003 0.2245 0.72060001 0.22490001 0.71630001 0.2263 0.71880001 0.2262
		 0.70850003 0.2252 0.71359998 0.22589999 0.71130002 0.2288 0.70560002 0.2282 0.71649998
		 0.229 0.71420002 0.22920001 0.71499997 0.23360001 0.71240002 0.23289999 0.70789999
		 0.2323 0.70410001 0.2307 0.69870001 0.2308 0.1505 0.47240001 0.1522 0.4761 0.15549999
		 0.46650001 0.1575 0.46950001 0.75309998 0.13070001 0.74730003 0.1287 0.74379998 0.1389
		 0.74970001 0.1397 0.70850003 0.1384 0.72000003 0.1374 0.73659998 0.1375 0.72860003
		 0.13689999 0.7396 0.12549999 0.74650002 0.1142 0.75709999 0.1336 0.75569999 0.13249999
		 0.75379997 0.13940001 0.75580001 0.1388 0.73159999 0.1232 0.73949999 0.1106 0.69239998
		 0.14030001 0.67259997 0.1444 0.71609998 0.1036 0.73019999 0.107 0.72250003 0.122
		 0.70990002 0.1214 0.69520003 0.1044 0.69230002 0.1225 0.67089999 0.1093 0.67040002
		 0.12720001 0.64660001 0.1358 0.65249997 0.1532 0.64590001 0.1165 0.62199998 0.12530001
		 0.70469999 0.21969999 0.6961 0.2146 0.6911 0.21879999 0.70050001 0.2229 0.68879998
		 0.22400001 0.6979 0.22669999 0.68940002 0.2295 0.722 0.22130001 0.72390002 0.2226
		 0.72490001 0.2242 0.72680002 0.22220001 0.72719997 0.22409999 0.72619998 0.22059999
		 0.72960001 0.2212 0.7299 0.223 0.7299 0.2242 0.2159 0.3427 0.2113 0.34419999 0.20900001
		 0.3407 0.2132 0.33930001 0.2172 0.33790001 0.2192 0.34169999 0.2058 0.34619999 0.19949999
		 0.34869999 0.198 0.3448 0.204 0.3425 0.2104 0.33520001 0.2156 0.3328 0.2071 0.3364
		 0.1978009 0.34017885 0.2032 0.33790001 0.1418 0.35600001 0.14659999 0.3574 0.1444
		 0.34619999 0.1517 0.3484 0.15530001 0.36300001 0.1375 0.35510001 0.14049999 0.34549999
		 0.1331 0.354 0.1373 0.34459999 0.1279 0.3524 0.1327 0.3432 0.1157 0.34889999 0.1181
		 0.33939999 0.1219 0.3506 0.1234 0.3405 0.15109999 0.35949999 0.1559 0.3502 0.1619
		 0.35299999 0.16500001 0.36160001 0.1719 0.35690001 0.1719 0.36219999 0.17839999 0.35420001
		 0.1777 0.36210001 0.1719 0.3497 0.1787 0.3479 0.1856 0.3502 0.1855 0.3554 0.1869
		 0.34490001 0.192 0.34720001 0.1925 0.35139999 0.1918 0.34290001 0.1816 0.3673 0.77649999
		 0.092900001 0.78380001 0.091700003 0.76709998 0.096299998 0.7705 0.046599999 0.78240001
		 0.046500001 0.78200001 0.057700001 0.77039999 0.0579 0.78189999 0.068499997 0.78210002
		 0.0779 0.77270001 0.079099998 0.7712 0.0691 0.75950003 0.0836 0.75419998 0.072899997
		 0.7748 0.087099999 0.78299999 0.085600004 0.764 0.090999998 0.75099999 0.046399999
		 0.75209999 0.0594 0.75629997 0.1038 0.75099999 0.099200003 0.72839999 0.063000001
		 0.72689998 0.047600001 0.72860003 0.082500003 0.74290001 0.092900001 0.7572 0.13779999
		 0.77170002 0.1154 0.7647 0.1238 0.75800002 0.13410001 0.77289999 0.1166 0.76599997
		 0.1245 0.759 0.13429999 0.76010001 0.1354 0.75849998 0.1367 0.7622 0.13410001 0.71759999
		 0.26679999 0.71109998 0.2771 0.69880003 0.29269999 0.68239999 0.3118 0.70899999 0.2651
		 0.70060003 0.2739 0.6857 0.28760001 0.66860002 0.30320001 0.70069999 0.26230001 0.76359999
		 0.0156 0.7802 0.0154 0.78240001 0.033100002 0.76950002 0.033100002 0.74150002 0.0154
		 0.74769998 0.031800002 0.71700001 0.017100001 0.72250003 0.032499999 0.69480002 0.035700001
		 0.69099998 0.02 0.759 0.23459999 0.75849998 0.23999999 0.75880003 0.2297 0.77329999
		 0.2405 0.76499999 0.23710001 0.76520002 0.2314 0.77350003 0.23370001 0.77859998 0.24160001
		 0.77880001 0.23459999 0.77810001 0.25 0.77310002 0.2483 0.76440001 0.2432 0.77670002
		 0.26249999 0.77149999 0.2597 0.7385 0.2203 0.7471 0.22939999 0.74529999 0.2265 0.7421
		 0.22319999 0.6031 0.055399999 0.63599998 0.038199998 0.63840002 0.054099999 0.61180001
		 0.070100002;
	setAttr ".uvst[0].uvsp[2500:2749]" 0.6638 0.0266 0.66589999 0.042199999 0.64219999
		 0.068099998 0.6178 0.0814 0.699 0.0506 0.66939998 0.0572 0.7008 0.066799998 0.69999999
		 0.085000001 0.64499998 0.082599998 0.62110001 0.093400002 0.67180002 0.073299997
		 0.67229998 0.090700001 0.64609998 0.098499998 0.6225 0.1073 0.1842 0.37110001 0.77649999
		 0.18350001 0.7766 0.18179999 0.7784 0.1829 0.77759999 0.18430001 0.7755 0.1832 0.77450001
		 0.1814 0.77469999 0.18350001 0.77270001 0.18189999 0.7755 0.1855 0.77450001 0.1857
		 0.77310002 0.1839 0.77460003 0.18440001 0.77880001 0.1866 0.77969998 0.1869 0.77810001
		 0.1874 0.77759999 0.1867 0.7791 0.1857 0.78009999 0.1857 0.7798 0.1842 0.77859998
		 0.1849 0.77649999 0.18619999 0.77609998 0.1869 0.74049997 0.23720001 0.77670002 0.1848
		 0.77700001 0.1851 0.77649999 0.1847 0.77609998 0.1847 0.77640003 0.18529999 0.77579999
		 0.1849 0.77770001 0.18610001 0.7773 0.18610001 0.77810001 0.1858 0.77740002 0.18539999
		 0.77679998 0.1856 0.77710003 0.1855 0.77679998 0.18520001 0.71670002 0.23810001 0.71670002
		 0.2359 0.71759999 0.2394 0.71969998 0.24070001 0.73180002 0.2406 0.727 0.2418 0.72329998
		 0.2413 0.73500001 0.2377 0.73760003 0.2333 0.73699999 0.234 0.73640001 0.2344 0.73180002
		 0.227 0.73369998 0.22830001 0.73769999 0.23270001 0.7367 0.2313 0.7374 0.2318 0.7353
		 0.2305 0.72100002 0.2264 0.72240001 0.2254 0.71960002 0.2277 0.7184 0.23010001 0.71710002
		 0.234 0.72460002 0.22490001 0.72680002 0.22480001 0.72920001 0.2254 0.71859998 0.2369
		 0.71859998 0.2353 0.7191 0.23800001 0.72049999 0.23909999 0.73189998 0.2394 0.72689998
		 0.2403 0.72329998 0.23989999 0.73470002 0.2362 0.73659998 0.23280001 0.73640001 0.233
		 0.736 0.2332 0.7317 0.2282 0.73320001 0.22939999 0.7367 0.2325 0.73610002 0.23190001
		 0.73659998 0.2323 0.7349 0.2315 0.72109997 0.2277 0.72240001 0.2263 0.72009999 0.22939999
		 0.71939999 0.23190001 0.7191 0.2339 0.72460002 0.22589999 0.72670001 0.22589999 0.72899997
		 0.2265 0.155 0.44780001 0.15700001 0.4535 0.15459999 0.45249999 0.63020003 0.29080001
		 0.61769998 0.28 0.7651 0.35749999 0.73720002 0.35210001 0.75209999 0.35510001 0.72039998
		 0.34740001 0.70279998 0.34150001 0.68589997 0.3339 0.67030001 0.3247 0.65570003 0.3141
		 0.64230001 0.30250001 0.77450001 0.1201 0.7791 0.1161 0.7827 0.1146 0.76639998 0.1338
		 0.76709998 0.12989999 0.78530002 0.16 0.7834 0.1594 0.7802 0.1583 0.77710003 0.15700001
		 0.77429998 0.154 0.7705 0.1499 0.76719999 0.1452 0.7651 0.1397 0.76550001 0.1344
		 0.7863 0.1142 0.78109998 0.122 0.77450001 0.13240001 0.77590001 0.12819999 0.77929997
		 0.1506 0.77249998 0.1427 0.773 0.1347 0.78200001 0.1337 0.78250003 0.13150001 0.78469998
		 0.1287 0.78390002 0.14219999 0.7816 0.13860001 0.78170002 0.1355 0.78539997 0.1347
		 0.78560001 0.1336 0.78649998 0.13249999 0.78640002 0.13850001 0.78539997 0.13680001
		 0.7852 0.1354 0.78649998 0.1348 0.78680003 0.13420001 0.78740001 0.1337 0.78719997
		 0.1371 0.78659999 0.1363 0.78640002 0.1355 0.78729999 0.13500001 0.78729999 0.1346
		 0.78780001 0.1345 0.7877 0.1362 0.78719997 0.13600001 0.78719997 0.1355 0.78789997
		 0.1356 0.78789997 0.13519999 0.17640001 0.34259999 0.1912 0.33860001 0.1436 0.33669999
		 0.2051 0.33239999 0.1612 0.34130001 0.098800004 0.45179999 0.49874085 0.63828611
		 0.49972439 0.6395241 0.49914864 0.63971758 0.5003317 0.64229953 0.49976131 0.641868
		 0.5207783 0.63253546 0.5222311 0.63189423 0.52265024 0.63382834 0.52130103 0.63444752
		 0.47793388 0.63893342 0.47711331 0.63607943 0.48192772 0.63500845 0.48280814 0.63797009
		 0.51973653 0.63508391 0.51929438 0.63311946 0.47413623 0.64336729 0.47540897 0.64523435
		 0.47455627 0.64533067 0.52300656 0.63152647 0.52343202 0.63139796 0.52420557 0.63359797
		 0.52350521 0.63332808 0.52582884 0.63309145 0.52524722 0.63084412 0.52714193 0.63005495
		 0.5276674 0.63241363 0.52851689 0.63137949 0.52797568 0.62963402 0.52865422 0.62933803
		 0.5293926 0.63167274 0.48116362 0.64102781 0.47868711 0.64224672 0.50536728 0.63168192
		 0.50447416 0.62865055 0.50826919 0.62765729 0.50887549 0.63071191 0.50947344 0.63329935
		 0.50790083 0.63447344 0.50609398 0.6342839 0.50294805 0.63544452 0.50404811 0.63768351
		 0.50363821 0.63781512 0.50307399 0.63810027 0.5048238 0.64058709 0.50430375 0.64048582
		 0.50413269 0.64122391 0.51086044 0.63778162 0.51054406 0.63831925 0.50986779 0.63579047
		 0.51020515 0.63568723 0.51058006 0.63558769 0.51136136 0.63791758 0.51392829 0.63464844
		 0.51360273 0.63474131 0.51306593 0.63229036 0.51449728 0.63450837 0.51514769 0.63681674
		 0.51436901 0.63629776 0.51981032 0.63003874 0.52116764 0.62625611 0.52232873 0.62963665
		 0.52033639 0.6234417 0.51676261 0.62786317 0.51595759 0.62501204 0.51787066 0.63108277
		 0.52423942 0.62849081 0.53008091 0.62332797 0.52767682 0.62740135 0.47607225 0.64709914
		 0.47508201 0.64712429 0.51905668 0.63516778 0.51865292 0.63333893 0.47256458 0.63705254
		 0.47334129 0.63988245 0.46422318 0.64209175 0.46364498 0.63916123 0.47920999 0.64663053
		 0.4775452 0.64691412 0.4769749 0.6450156 0.47855058 0.64472806 0.46860531 0.6464541
		 0.46920618 0.64882064;
	setAttr ".uvst[0].uvsp[2750:2999]" 0.46522295 0.64886987 0.46501744 0.64639807
		 0.52902782 0.62053275 0.53120315 0.62567055 0.49855757 0.63985658 0.49950215 0.64252853
		 0.47648853 0.64238155 0.47462904 0.64772296 0.47412014 0.64544749 0.47298256 0.64814806
		 0.47106287 0.64854097 0.47026619 0.64625967 0.47229239 0.64593172 0.46978915 0.64811182
		 0.46933597 0.6463412 0.48612922 0.63719261 0.48504138 0.63427532 0.48878321 0.63312113
		 0.4896307 0.63617301 0.4889468 0.63987362 0.48699161 0.6397047 0.49366772 0.63808858
		 0.49433064 0.64046693 0.49391291 0.64057112 0.49495366 0.64041388 0.49517262 0.64308739
		 0.49478385 0.64344752 0.49570012 0.64362645 0.48817518 0.64424503 0.48762846 0.64211965
		 0.48796943 0.64202976 0.48872727 0.64453506 0.48781642 0.64463317 0.48725721 0.64223266
		 0.48391658 0.64319909 0.48340687 0.64074063 0.48424229 0.64310646 0.48335937 0.64337993
		 0.48441148 0.64483309 0.48402321 0.64568454 0.48229736 0.646191 0.48171085 0.64390099
		 0.51211452 0.62962031 0.51130188 0.62663937 0.47191054 0.64340734 0.46841314 0.64428639
		 0.46450421 0.64467394 0.47921151 0.64457643 0.47983229 0.64634323 0.48000419 0.64437246
		 0.48083019 0.64639628 0.50241446 0.63261855 0.50175691 0.62935889 0.50474441 0.6355195
		 0.5064311 0.63690901 0.5053457 0.63726974 0.50705421 0.63953346 0.50611651 0.64038736
		 0.49147266 0.63228893 0.49263394 0.63541269 0.49218264 0.63910592 0.4925853 0.64090526
		 0.49147955 0.64116895 0.49038252 0.63876033 0.49358007 0.64395916 0.49233514 0.64373434
		 0.5316689 0.62740815 0.5327971 0.62961709 0.50710464 0.63667333 0.50685275 0.63676703
		 0.50786054 0.6391716 0.50746155 0.63900661 0.49104634 0.64127052 0.4907828 0.64132357
		 0.49170941 0.64349467 0.49145725 0.64384532 0.51313043 0.63805163 0.51211512 0.6351577
		 0.51399934 0.63687992 0.51118004 0.63262236 0.48638162 0.6456728 0.48503232 0.64513308
		 0.48572591 0.64267635 0.48518437 0.64002883 0.51688147 0.63633752 0.51617277 0.63408232
		 0.51787174 0.63358355 0.5182364 0.63573873 0.51512361 0.63135207 0.50061107 0.63663816
		 0.49748835 0.63389015 0.50147462 0.63892257 0.50236869 0.64198327 0.49656448 0.63064742
		 0.49628299 0.6378715 0.49675506 0.64027476 0.4976064 0.64334011 0.50837338 0.63620901
		 0.50932634 0.63939953 0.48945999 0.64159775 0.49033353 0.64481807 0.49317276 0.62610555
		 0.49242949 0.6262511 0.49280551 0.62481642 0.49356508 0.62748253 0.49276161 0.62782896
		 0.49388593 0.62860882 0.49345988 0.62955904 0.49362934 0.62981886 0.49418744 0.62966704
		 0.4732058 0.63047421 0.47160351 0.63030738 0.47139633 0.62994087 0.47306502 0.62972218
		 0.50368786 0.61633992 0.50263774 0.61347789 0.5065583 0.61171556 0.5076474 0.61445642
		 0.47462437 0.62919724 0.47487542 0.63038731 0.47492495 0.6315394 0.47341722 0.63165331
		 0.47362 0.63383287 0.47532558 0.63343489 0.51448071 0.61746019 0.51370728 0.61783469
		 0.51359737 0.61587828 0.47054148 0.63033843 0.46990108 0.63038158 0.47007865 0.63000095
		 0.47054169 0.63003033 0.47072327 0.63071948 0.46981454 0.63198328 0.47076726 0.63416874
		 0.47113988 0.63346851 0.46827391 0.63213611 0.46706918 0.63256729 0.46677288 0.63098687
		 0.46825165 0.63071954 0.46707729 0.63470674 0.46911669 0.63493985 0.46594658 0.63205111
		 0.4651722 0.63234508 0.4646937 0.63084579 0.46561986 0.63085324 0.46499899 0.63469744
		 0.46576744 0.6344859 0.5068984 0.61821228 0.50532019 0.61946869 0.47212848 0.63176394
		 0.47212026 0.63371736 0.48185706 0.62302184 0.48095429 0.62011051 0.48398069 0.61948299
		 0.48465371 0.62243772 0.48392019 0.62529457 0.4825021 0.62605798 0.48897234 0.62626821
		 0.48839679 0.62635887 0.48864198 0.62495404 0.48965064 0.62628031 0.48942745 0.62804544
		 0.48876747 0.6281749 0.49020341 0.62822044 0.48973545 0.62946129 0.48938721 0.63001537
		 0.48935893 0.63030207 0.48968443 0.63031185 0.49035591 0.63027471 0.49027231 0.6307019
		 0.48351136 0.63044983 0.48314044 0.62894195 0.48374689 0.62895989 0.48395681 0.63072634
		 0.48381186 0.63158178 0.48411825 0.63131845 0.48305863 0.63079154 0.48248816 0.62914968
		 0.48350647 0.63182271 0.48280826 0.62731296 0.48334414 0.62721169 0.48221704 0.62755477
		 0.47935247 0.6268965 0.47966513 0.62856042 0.47962925 0.62856346 0.47936863 0.62865233
		 0.47971806 0.62908077 0.47934881 0.62920058 0.4727799 0.62743437 0.46989661 0.62452257
		 0.47472137 0.62387407 0.47516614 0.62759805 0.4704355 0.62824172 0.47418869 0.62097466
		 0.46937656 0.62159026 0.46765226 0.62771446 0.46460244 0.62846607 0.46051446 0.62598544
		 0.46807423 0.62953055 0.46624961 0.6297937 0.46393391 0.62974942 0.46512181 0.62974828
		 0.51371765 0.61825705 0.5146569 0.61771798 0.51470327 0.61813766 0.51396358 0.61976397
		 0.5151484 0.62129653 0.51582706 0.62074387 0.47534826 0.62908638 0.47543871 0.63007277
		 0.51946843 0.60610813 0.52075624 0.60864574 0.51206803 0.61244136 0.51094425 0.60968113
		 0.51148224 0.62114567 0.5109762 0.62006497 0.51242542 0.61925602 0.51285565 0.62038016
		 0.51238775 0.62293398 0.51396763 0.62224913 0.5198853 0.61364669 0.52236772 0.61224258
		 0.52292323 0.61316246 0.51983786 0.61497307 0.46025592 0.62314731 0.51216233 0.61853874
		 0.49387443 0.62583971 0.49443042 0.62735355 0.49474397 0.62920046 0.49472535 0.62952125
		 0.51118517 0.61644816 0.51055562 0.61892319 0.51485503 0.61717761 0.51519775 0.61740255
		 0.51607955 0.61872101 0.51663685 0.62106329 0.51747918 0.61802137 0.51677859 0.61679816
		 0.51818192 0.61621487 0.51875544 0.61768711 0.51839578 0.62072349 0.51991498 0.6194399
		 0.519449 0.61664605 0.51907015 0.61547059 0.52025044 0.61649853 0.52086031 0.618613
		 0.52166367 0.61836946 0.4984706 0.6184938 0.49747866 0.61563003 0.50037259 0.61456335;
	setAttr ".uvst[0].uvsp[3000:3249]" 0.50114655 0.61751145 0.50220728 0.62043631
		 0.50059974 0.62053496 0.4993965 0.62148643 0.49736503 0.62380373 0.49681935 0.62402511
		 0.49640945 0.62274098 0.49625131 0.62439978 0.49799839 0.62553751 0.49737808 0.62578022
		 0.49680209 0.62633312 0.49844846 0.62742627 0.49785569 0.62714767 0.49833098 0.62781179
		 0.49859849 0.62766957 0.49775523 0.62815928 0.49808148 0.62845492 0.50368166 0.62471038
		 0.50344884 0.62518013 0.50269425 0.62356156 0.50319338 0.62322861 0.50360823 0.62576556
		 0.50400841 0.62585688 0.50385535 0.62305456 0.50424647 0.62476224 0.50442696 0.62593567
		 0.50210643 0.62185866 0.50261521 0.62166226 0.5032382 0.62155819 0.50593996 0.62105238
		 0.50597203 0.62103605 0.50623858 0.62096739 0.50654912 0.6214143 0.50617611 0.62152064
		 0.50879645 0.62229955 0.50781095 0.62368053 0.50799143 0.62096667 0.50819969 0.62473583
		 0.50981915 0.62426734 0.47845712 0.62038189 0.47908187 0.6233725 0.50925231 0.61784971
		 0.51567042 0.61393809 0.51863801 0.61292398 0.51798916 0.61492032 0.51628733 0.6156913
		 0.51889253 0.61428148 0.47570744 0.63081032 0.47580177 0.63291776 0.52198923 0.6107589
		 0.52338648 0.61440217 0.52485025 0.61609006 0.5103339 0.62010133 0.50988197 0.61921048
		 0.50950146 0.62029433 0.50935459 0.61977881 0.48645282 0.61886668 0.48748162 0.62185949
		 0.48688063 0.62474447 0.48740444 0.62663424 0.486296 0.62660527 0.4854489 0.62546039
		 0.48783526 0.6283524 0.48681498 0.62834954 0.48830858 0.63032258 0.48707724 0.63009393
		 0.48714 0.63044274 0.48827735 0.63062489 0.4957647 0.6194995 0.49505475 0.6164155
		 0.49779394 0.62162769 0.49928033 0.62290585 0.49834484 0.62350982 0.49975663 0.62465513
		 0.49888426 0.62519705 0.50042886 0.62626803 0.4995223 0.62712765 0.49972859 0.62736225
		 0.50058961 0.62657416 0.46110567 0.63099521 0.46108228 0.6299091 0.51049697 0.62085438
		 0.51159632 0.622756 0.48572141 0.62662244 0.48521346 0.62679625 0.4861601 0.6282649
		 0.4855921 0.62853688 0.48651761 0.62957132 0.48628938 0.63018632 0.48647517 0.63047826
		 0.48665178 0.63017124 0.50030082 0.6224978 0.49977076 0.62261939 0.50088966 0.62417841
		 0.50027239 0.62425154 0.50117898 0.62596619 0.50065702 0.62555009 0.50085044 0.62612587
		 0.50117481 0.62631202 0.46060663 0.62844563 0.48187304 0.63154739 0.48057592 0.63124222
		 0.47993219 0.62913728 0.48141241 0.62944162 0.48070192 0.63237983 0.48207954 0.63268411
		 0.48106289 0.62780285 0.48084229 0.62597334 0.46138954 0.63230062 0.4611389 0.63453567
		 0.50561166 0.62479126 0.50492144 0.62272888 0.50601518 0.62167645 0.5065552 0.62380368
		 0.50617492 0.62578964 0.50707769 0.62476224 0.50435483 0.6211521 0.50357115 0.61948287
		 0.47789693 0.6311326 0.47667801 0.63128185 0.47624499 0.62981373 0.47787875 0.62957561
		 0.47681901 0.63309002 0.4782024 0.63336325 0.47734898 0.6266607 0.47773379 0.62896407
		 0.47609615 0.62929136 0.50985885 0.62175488 0.51085484 0.62326801 0.50779212 0.62037075
		 0.47939143 0.63187307 0.47989261 0.63280851 0.49158597 0.62053603 0.49048153 0.62420261
		 0.49099648 0.62624156 0.4914698 0.62810898 0.49190441 0.63004619 0.49205801 0.63066244
		 0.49070647 0.61744934 0.49445009 0.62307191 0.49508715 0.62507606 0.49567103 0.62691933
		 0.49632946 0.62879276 0.4965257 0.62940443 0.48429376 0.62719774 0.48468685 0.62891215
		 0.48522407 0.63084948 0.48552302 0.6315124 0.50128734 0.62235606 0.5018636 0.62401825
		 0.50242984 0.62595451 0.50253499 0.62665802 0.47995809 0.63077283 0.48030967 0.63231552
		 0.50683284 0.62307912 0.50741494 0.62460744 0.51457763 0.64369762 0.51493943 0.64313978
		 0.51535046 0.64429891 0.5148561 0.64446902 0.51435995 0.64452982 0.51399267 0.64318943
		 0.52051032 0.64632004 0.5194447 0.644768 0.51994956 0.64471221 0.52047288 0.64459246
		 0.51895142 0.64360297 0.51942623 0.64357042 0.51993895 0.64343905 0.52929866 0.64207786
		 0.52868629 0.6420396 0.52827656 0.64065278 0.52908421 0.64111924 0.5192225 0.64262354
		 0.51888728 0.64232302 0.51754069 0.64500982 0.51822412 0.64692008 0.51584792 0.64748704
		 0.51581073 0.64545137 0.51717436 0.64374983 0.51531363 0.6455856 0.51471281 0.64569086
		 0.4710528 0.65952373 0.46913955 0.66032559 0.46880522 0.65910065 0.47048387 0.65845358
		 0.47144905 0.66086304 0.46935949 0.66166377 0.51072502 0.64508128 0.51080954 0.64625287
		 0.51038504 0.64635897 0.51029789 0.64504898 0.51010787 0.64389294 0.51051056 0.64427698
		 0.51085019 0.64376944 0.51117778 0.6449964 0.49773154 0.64702308 0.49794802 0.64652133
		 0.49824101 0.64726663 0.49785909 0.64747083 0.49864206 0.64875138 0.49824378 0.64882076
		 0.49892026 0.65119517 0.47538134 0.65636146 0.47498026 0.65503073 0.47645843 0.65432358
		 0.47697663 0.65567958 0.4756459 0.65759897 0.47392377 0.65817028 0.47352552 0.65687561
		 0.50256658 0.64816129 0.50396013 0.64785218 0.50467169 0.64983517 0.50284421 0.65011382
		 0.50159168 0.64839494 0.50123727 0.64686763 0.50223076 0.64631319 0.50367343 0.64640838
		 0.50547153 0.64538252 0.50688791 0.64546305 0.50718224 0.64713955 0.5059129 0.64742053
		 0.504471 0.64614439 0.50419098 0.64490396 0.50537837 0.6443603 0.50666189 0.64441264
		 0.50216383 0.6451515 0.50090188 0.64566511 0.50621158 0.64960182 0.50788987 0.64926296
		 0.50818479 0.65137929 0.50510901 0.65206498 0.50868869 0.65386891 0.50576514 0.65459919
		 0.50288486 0.65535384 0.50208157 0.65292025 0.47296533 0.65707183 0.47280389 0.65642846
		 0.47331613 0.65560031 0.51200783 0.65308452 0.5114013 0.65049225 0.51624215 0.64912766
		 0.51686406 0.65182567 0.47423205 0.66185248 0.47004023 0.66353822 0.48166239 0.65307558
		 0.48183912 0.65387607 0.48132932 0.65399182 0.4810676 0.65279031 0.48189825 0.65233362;
	setAttr ".uvst[0].uvsp[3250:3499]" 0.48228595 0.65366817 0.47800934 0.65842915
		 0.47763872 0.65676713 0.47809711 0.6565485 0.4771308 0.65694118 0.47748166 0.65552104
		 0.47789556 0.6553005 0.46830502 0.65945578 0.46797529 0.65853024 0.46842256 0.6577059
		 0.47715575 0.65460902 0.47728211 0.65417683 0.47984272 0.65575051 0.48153871 0.65521598
		 0.48258674 0.65696365 0.48026854 0.65773416 0.47948313 0.65448856 0.48203883 0.65506601
		 0.4826048 0.6548388 0.52699924 0.64358383 0.52691865 0.64237458 0.52904785 0.64325684
		 0.52736843 0.64493084 0.52956617 0.64451003 0.48567238 0.6522193 0.48601836 0.65196657
		 0.48662803 0.65312779 0.48621809 0.65325928 0.48543075 0.65142256 0.48557264 0.65089065
		 0.48524296 0.65238553 0.48487476 0.65117019 0.49743366 0.6474967 0.49728316 0.64671075
		 0.49787548 0.64896977 0.47585118 0.6591174 0.47365692 0.65996259 0.47845194 0.66018802
		 0.4942292 0.65053666 0.49501365 0.65233755 0.49332237 0.65306878 0.49287528 0.65101039
		 0.49354061 0.64878917 0.49467716 0.64873672 0.49518093 0.65022147 0.49235791 0.64963228
		 0.49028924 0.64970827 0.49099317 0.65166402 0.48976815 0.65210116 0.48912781 0.65052319
		 0.48983639 0.64878839 0.49112523 0.64862657 0.491541 0.64982831 0.48876622 0.64951134
		 0.49297839 0.64776856 0.49432835 0.64753795 0.49189085 0.65368199 0.49412596 0.65519416
		 0.49115062 0.6562326 0.49028584 0.65427864 0.49489731 0.65769559 0.49202767 0.65861583
		 0.49714962 0.65432543 0.49774948 0.65681696 0.52408171 0.64250803 0.52349544 0.64263844
		 0.52300799 0.64144242 0.52387977 0.64187622 0.48879358 0.65969861 0.48400986 0.66118628
		 0.48311657 0.65856564 0.48794276 0.6571759 0.52551806 0.64724034 0.52997565 0.64646178
		 0.50437975 0.64775467 0.50479251 0.64765906 0.50410557 0.64643186 0.50356877 0.64508861
		 0.50392032 0.64531851 0.49247402 0.65114689 0.49206603 0.65128493 0.49200988 0.64987808
		 0.49158046 0.64883423 0.49175119 0.64845556 0.50155044 0.65043843 0.5012098 0.64854777
		 0.52165413 0.64317775 0.51966476 0.64201343 0.52128685 0.64183736 0.52208138 0.64436889
		 0.52383935 0.64394867 0.49629292 0.65193641 0.49557915 0.65015209 0.52270722 0.64576739
		 0.5250175 0.6453293 0.52105451 0.64804995 0.50032157 0.65611351 0.49962384 0.65366447
		 0.49915868 0.64590502 0.50034648 0.64590389 0.50046974 0.6469543 0.49927324 0.64674515
		 0.50073105 0.64866948 0.49969622 0.64874423 0.5001694 0.65081728 0.49593633 0.64682317
		 0.4962748 0.64759946 0.49537507 0.64840591 0.49492618 0.64744824 0.49697584 0.64951944
		 0.496057 0.65000129 0.49766615 0.65153044 0.4734323 0.6583764 0.4727326 0.65864909
		 0.47224909 0.65736389 0.50936484 0.64887947 0.50898862 0.64668357 0.51101899 0.64853281
		 0.52437234 0.64386284 0.52484429 0.64237893 0.52511072 0.64372581 0.48883024 0.65473002
		 0.48724172 0.65530735 0.48799261 0.65266573 0.5125227 0.64613867 0.51287293 0.64806324
		 0.51127076 0.64622414 0.51258576 0.64476395 0.4701905 0.65685761 0.47184309 0.65604198
		 0.48470211 0.65406525 0.48580417 0.65347981 0.48541874 0.65588534 0.48392391 0.6529299
		 0.52449274 0.64104128 0.5263201 0.64086545 0.50731134 0.64548182 0.50788999 0.64527297
		 0.50811648 0.64691746 0.50756311 0.64706039 0.50724125 0.64469504 0.50754595 0.64411676
		 0.48877785 0.65076226 0.48940268 0.65223455 0.48885715 0.65240467 0.48818284 0.65088785
		 0.4878659 0.64972377 0.48842961 0.65005469 0.53074992 0.64905024 0.52623105 0.64994901
		 0.47074655 0.66614604 0.47506043 0.66452825 0.47931045 0.66289198 0.52175689 0.65079838
		 0.51684463 0.64277297 0.47925529 0.65348268 0.51243079 0.64331913 0.48329416 0.65162057
		 0.50880671 0.64493841 0.50867128 0.6435101 0.48722738 0.65108669 0.48658985 0.64980143
		 0.50094837 0.64703798 0.50078797 0.6464237 0.49500567 0.64873117 0.49482492 0.64812267
		 0.48714072 0.66602248 0.4882445 0.66848052 0.48753953 0.66917282 0.48641402 0.6662516
		 0.48791546 0.66542035 0.48886174 0.66835594 0.4738684 0.67537844 0.47575325 0.67759192
		 0.47564438 0.67803347 0.47373965 0.67647111 0.48284063 0.66874397 0.48448414 0.67111421
		 0.48414466 0.67151868 0.48250622 0.66888326 0.49239498 0.66500223 0.49254319 0.66508466
		 0.49250641 0.66621745 0.49219218 0.66539752 0.49138871 0.6670565 0.49162269 0.66504627
		 0.50489014 0.65984333 0.50498873 0.66018933 0.50445098 0.66018111 0.50437468 0.6596821
		 0.53143597 0.65539718 0.53109014 0.6591776 0.52947319 0.65893435 0.52949119 0.65544522
		 0.49823505 0.66184205 0.49821541 0.66223645 0.49691203 0.66247576 0.49676108 0.66210067
		 0.49589786 0.66334414 0.49557161 0.66299701 0.50194889 0.66061538 0.50169468 0.66101044
		 0.50042444 0.66110837 0.50028604 0.66075164 0.53414214 0.65670919 0.53379524 0.65930176
		 0.53295243 0.65912378 0.53324437 0.65631223 0.52398288 0.655599 0.52455413 0.65868545
		 0.5235883 0.65846187 0.52324438 0.65578747 0.52299821 0.65868145 0.5222621 0.6556859
		 0.54013324 0.65765738 0.53933597 0.65998209 0.53900588 0.65967298 0.53945458 0.65679449
		 0.52868772 0.65579152 0.5286777 0.65889686 0.52817595 0.6587317 0.52833033 0.65584928
		 0.51861143 0.65790689 0.51877642 0.65876937 0.5181483 0.65782619 0.5182308 0.65767795
		 0.51891029 0.65730822 0.52016377 0.65890211 0.50524312 0.65943462 0.50543463 0.65990084
		 0.51299393 0.65749782 0.51305652 0.65789795 0.51182282 0.6583814 0.51160502 0.65805471
		 0.51447058 0.6576345 0.51437807 0.65810823 0.50928545 0.65820223 0.50934905 0.65858024
		 0.50821596 0.65915984 0.50779843 0.65895599 0.47889793 0.67171562 0.4806228 0.67395985
		 0.47999838 0.67454863 0.478342 0.67251933 0.49886805 0.66156638 0.49925831 0.66177791
		 0.4988462 0.66226202 0.49874067 0.66207206 0.51128793 0.65851194 0.5112983 0.6587289;
	setAttr ".uvst[0].uvsp[3500:3749]" 0.51069283 0.65853477 0.51091993 0.65814739
		 0.48164767 0.66901046 0.48348838 0.67196989 0.48224056 0.67302203 0.47996098 0.66998976
		 0.50282907 0.66004902 0.5029645 0.66036987 0.50193697 0.66108805 0.50165707 0.66090381
		 0.50819868 0.65904742 0.50805116 0.65935344 0.50680614 0.65928262 0.50675207 0.65893871
		 0.53735387 0.65577948 0.53702438 0.65964329 0.53513432 0.65936768 0.53512418 0.65616524
		 0.47722095 0.67257464 0.47889334 0.67530358 0.4774254 0.67653579 0.47512069 0.67341518
		 0.4954094 0.66358596 0.49574801 0.66420835 0.49481896 0.66401094 0.49484646 0.66348964
		 0.5153482 0.65767771 0.51565313 0.6581043 0.51495886 0.65875679 0.51492071 0.65805626
		 0.48433694 0.66701943 0.48620951 0.67011648 0.52618182 0.65878648 0.52614772 0.65516561
		 0.48967952 0.66440439 0.49015087 0.66768062 0.52154458 0.65878022 0.52022529 0.65574539
		 0.49346554 0.66376561 0.49362034 0.66410297 0.5167222 0.65755767 0.51667392 0.65718257
		 0.50202763 0.66161227 0.50207984 0.66179544 0.50830245 0.66002989 0.50825036 0.65984672
		 0.48891199 0.66989666 0.48812187 0.67049563 0.48965928 0.66950768 0.48554099 0.67397416
		 0.48615849 0.67354161 0.48603636 0.67514598 0.48483238 0.67444748 0.48501191 0.67276073
		 0.48564303 0.6722728 0.4841162 0.67332399 0.47612306 0.67927599 0.47690251 0.67871666
		 0.48737514 0.67274022 0.48879927 0.67163765 0.490165 0.67220938 0.48767126 0.6743207
		 0.48685563 0.67145789 0.49031442 0.67069983 0.4895525 0.67111492 0.53656602 0.66248786
		 0.53682089 0.66111696 0.53862 0.6612277 0.5388931 0.66277814 0.53584981 0.66398996
		 0.53918433 0.66457283 0.49296969 0.66745692 0.493628 0.66696143 0.49432832 0.6683901
		 0.49368086 0.66869193 0.4921824 0.66809195 0.50544584 0.66181934 0.5048508 0.66194481
		 0.50582081 0.66313541 0.50534284 0.66328615 0.50614744 0.66428185 0.53119385 0.66057098
		 0.52964652 0.6604178 0.5311327 0.66190124 0.53281283 0.6605131 0.53288841 0.66183388
		 0.50154549 0.66494012 0.50175071 0.66645867 0.5004369 0.6664294 0.50044566 0.66507024
		 0.50099838 0.66317451 0.50193751 0.66289222 0.50251585 0.66440701 0.49983346 0.66361648
		 0.49786091 0.66459644 0.49863979 0.66612005 0.49752426 0.66655529 0.49697208 0.66515779
		 0.49883887 0.66419315 0.4996106 0.66754508 0.50141478 0.66875476 0.49896276 0.67083216
		 0.49752024 0.66805983 0.50285387 0.672364 0.50021082 0.67341053 0.50476635 0.66859937
		 0.50558007 0.67145526 0.53383899 0.66053623 0.49748528 0.67470783 0.49311858 0.67701542
		 0.49148008 0.67443109 0.49607831 0.67213821 0.53419173 0.66558456 0.53903961 0.66648436
		 0.52475476 0.66010988 0.52376747 0.66001713 0.52292538 0.6600737 0.52802348 0.66167229
		 0.52877641 0.66171449 0.5289731 0.6629715 0.52962327 0.66175199 0.52779305 0.66032255
		 0.5285933 0.66040242 0.53957725 0.66129231 0.52656531 0.66162562 0.52714181 0.66313362
		 0.52391469 0.66264498 0.52477396 0.6614393 0.52633095 0.66026223 0.52299023 0.66143411
		 0.52386522 0.66139019 0.47931606 0.67871833 0.47748274 0.68018675 0.47837502 0.67768085
		 0.48070773 0.6796127 0.47817233 0.68186063 0.51902938 0.66006875 0.51907575 0.66149318
		 0.51836646 0.66157794 0.51821339 0.65998596 0.520033 0.66019368 0.50602442 0.66161042
		 0.50630629 0.66301179 0.53074992 0.66333795 0.53369939 0.66308439 0.52912545 0.66533363
		 0.51040912 0.66242957 0.51141894 0.6619584 0.5121361 0.66311103 0.51102823 0.66382992
		 0.5093016 0.66248107 0.50900143 0.66088694 0.50994831 0.6606319 0.51117313 0.66040027
		 0.51336789 0.66020036 0.5144192 0.66020882 0.51467967 0.66168952 0.51350224 0.66190767
		 0.51231539 0.66036814 0.51341963 0.66362548 0.51547801 0.66297305 0.51570439 0.66608441
		 0.51252377 0.66560423 0.51599598 0.66893518 0.51319432 0.66942537 0.51039857 0.67008984
		 0.5095849 0.66723382 0.48060507 0.67562252 0.48146689 0.67506886 0.51899099 0.66860992
		 0.51884782 0.66568744 0.52395928 0.66522145 0.52392209 0.66828316 0.48295426 0.68010944
		 0.47930488 0.68341553 0.49946201 0.66550457 0.49995819 0.66523844 0.49948245 0.6639291
		 0.51247907 0.66181767 0.511922 0.66184449 0.51162946 0.66048306 0.5030334 0.66421568
		 0.50351393 0.6655162 0.48288205 0.67426974 0.48362637 0.67536318 0.48209867 0.67623127
		 0.50876081 0.6625911 0.50903797 0.66394985 0.48470399 0.67639112 0.48205981 0.67771649
		 0.48713827 0.67723775 0.50800198 0.67081678 0.50684702 0.66673756 0.50385648 0.6622135
		 0.50298518 0.66257912 0.50451326 0.66366929 0.50352955 0.66400093 0.50526512 0.66504663
		 0.50794607 0.66117299 0.507011 0.66131473 0.50822592 0.66267014 0.50721329 0.66289997
		 0.50730228 0.66447341 0.53377986 0.66187322 0.53502774 0.66076958 0.53474569 0.66204548
		 0.49583811 0.66949284 0.49438551 0.66982603 0.49524444 0.66782093 0.48135999 0.67672765
		 0.48062998 0.67738307 0.479716 0.67644072 0.51765597 0.66330594 0.51728618 0.66157031
		 0.51907289 0.66282153 0.49188462 0.66992986 0.49304107 0.66912341 0.49312693 0.67102075
		 0.49103847 0.66886538 0.52125001 0.66160727 0.52076042 0.66318423 0.51984894 0.6615296
		 0.52141476 0.6602546 0.49631768 0.66556412 0.49691558 0.66683877 0.49630588 0.66714454
		 0.49557823 0.6658262 0.51518941 0.66020936 0.51595116 0.66005105 0.51602757 0.66155487
		 0.51534629 0.66160971 0.48090276 0.68580604 0.48484284 0.68254191 0.53893471 0.66935992
		 0.53386199 0.66864908 0.52906501 0.66831398 0.48875353 0.67974067 0.49453729 0.6662401
		 0.51705396 0.65985417 0.50251788 0.66289568 0.5085032 0.6611976 0.055869039 0.32738784
		 0.039165854 0.32415226 0.02805103 0.31892639 0.23479219 0.32123864 0.22914137 0.32270876
		 0.21874723 0.32544634 0.2128924 0.32792661 0.2086367 0.33036971 0.202378 0.33361411;
	setAttr ".uvst[0].uvsp[3750:3766]" 0.19735461 0.33585584 0.18661983 0.33983788
		 0.179254 0.34182864 0.17262372 0.34227705 0.16525573 0.34164688 0.15700544 0.3402037
		 0.14776234 0.33778787 0.134315 0.33419386 0.12402844 0.33141741 0.11412264 0.32983267
		 0.10129482 0.32840148 0.093528524 0.32781389 0.08390034 0.32756054 0.075356975 0.32744581
		 0.066421412 0.32761332 0.057881322 0.32749373 0.13926898 0.335531;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 13 ".pt";
	setAttr ".pt[1043]" -type "float3" 0.10753037 0.031368095 0.03101925 ;
	setAttr ".pt[1334]" -type "float3" -0.14561513 0.10929636 0.0070919232 ;
	setAttr ".pt[1336]" -type "float3" -0.39660096 -0.011068303 -0.12605253 ;
	setAttr ".pt[2353]" -type "float3" 0 0 3.7252903e-09 ;
	setAttr ".pt[2360]" -type "float3" 0.20538336 0.088408209 0.00090631552 ;
	setAttr ".pt[3553]" -type "float3" -0.13764811 -0.055878635 -0.071801506 ;
	setAttr ".pt[3554]" -type "float3" 0.096440315 0.0026914524 0.030651717 ;
	setAttr ".pt[3563]" -type "float3" 0.085342154 0.11519613 0.03619463 ;
	setAttr ".pt[3565]" -type "float3" 0.069971003 0.039198566 0.0013894342 ;
	setAttr ".pt[3566]" -type "float3" -0.21950367 0.013040917 -3.126388e-13 ;
	setAttr ".pt[3571]" -type "float3" 0.10111559 -9.3132257e-10 1.1641532e-10 ;
	setAttr -s 3575 ".vt";
	setAttr ".vt[0:165]"  5.54783487 -2.87568665 169.33839417 5.71614122 -2.6915741 169.44085693
		 5.78619862 -2.5955658 169.93969727 5.65600824 -2.78289795 169.99111938 5.9750576 -2.12373352 172.28102112
		 5.95063782 -2.18084717 172.43711853 6.049397469 -2.39056396 172.65370178 5.94936037 -2.42755127 172.38879395
		 6.13426495 -1.33247375 171.98742676 6.0004940033 -1.31636047 172.15000916 5.8921113 -1.54536438 172.28033447
		 6.012481213 -1.51417542 172.11064148 5.92560577 -2.44204712 172.68338013 5.92727995 -2.24351501 172.58694458
		 5.88709736 -1.57089233 172.44873047 5.97658491 -1.32293701 172.28082275 5.87684822 -2.54660034 170.47349548
		 5.88358974 -2.35055542 171.10461426 5.97975302 -2.54823303 171.11294556 5.88299465 -2.74357605 170.61106873
		 5.78452206 -2.39685059 171.58815002 5.83406782 -2.5917511 171.59606934 6.41880989 -1.9294281 170.28422546
		 6.1071167 -2.26966858 169.84492493 6.18604517 -2.18603516 169.34309387 6.44291401 -1.77008057 169.85139465
		 6.323277 -1.15177917 172.044937134 6.35910654 -1.18481445 172.2071991 6.2811203 -1.27720642 172.36357117
		 6.69255304 -1.30319214 170.40316772 6.71595001 -1.45965576 170.71977234 6.88011503 -1.30177307 172.76263428
		 6.93673944 -1.22952271 172.58024597 7.08272028 -0.96153259 172.82562256 7.017705917 -1.038589478 173.039352417
		 6.6418004 -1.37924194 172.59437561 6.70141888 -1.30401611 172.44929504 5.84787416 -1.86689758 172.35809326
		 5.95456123 -1.79948425 172.20730591 5.87928772 -1.86680603 172.51519775 6.7866478 -1.37921143 172.94346619
		 6.93057013 -1.13288879 173.23286438 6.66101837 -1.47380066 173.18904114 6.76229763 -1.33566284 173.48396301
		 6.57038927 -1.46723938 172.7331543 6.068068981 -2.25354004 170.22850037 5.54627037 -2.95783997 170.014053345
		 5.38932419 -3.17866516 169.95147705 5.32337427 -3.30117798 169.11981201 5.40334177 -3.066253662 169.25267029
		 5.79635191 -2.8502655 171.095977783 5.68957424 -2.90310669 171.47221375 5.55781412 -3.069107056 171.10197449
		 5.71430254 -2.91567993 170.76905823 6.15313053 -2.50579834 172.92985535 6.43428802 -2.45243835 173.42611694
		 6.34679651 -2.7515564 173.47953796 6.11827993 -2.74797058 172.83470154 6.015536308 -2.18405151 172.10270691
		 5.70298767 -2.47770691 172.21873474 5.71570396 -2.22550964 171.9646759 5.67137718 -2.48220825 172.073883057
		 6.17347336 -1.43800354 171.75021362 6.13288498 -1.61291504 171.90715027 5.83547163 -1.50448608 171.5887146
		 5.76205301 -1.74832153 171.8523407 7.063933849 -1.14035034 171.94511414 7.20453501 -0.858078 172.035202026
		 7.18599844 -0.69659424 172.45655823 7.1416297 -0.98690796 172.32685852 5.81075764 -2.88619995 172.75392151
		 5.59801674 -3.056503296 172.30618286 6.049199581 -2.89155579 173.48101807 5.86152267 -2.9992981 173.28535461
		 5.97337341 -2.48217773 172.95889282 6.23439837 -2.34169006 173.42370605 6.38433886 -1.26501465 171.45106506
		 6.41418982 -1.21389771 171.86045837 6.012740135 -1.40261841 171.21073914 7.13561583 -1.16241455 171.43742371
		 7.15240908 -1.039138794 171.22398376 7.20340014 -0.60906982 171.98605347 6.92241287 -1.29335022 171.3752594
		 7.070299149 -0.70715332 173.016342163 7.029547691 -0.45428467 173.12010193 6.96272135 -0.52455139 173.48231506
		 7.015939713 -0.78697205 173.28036499 5.71739531 -1.9813385 171.94621277 6.034694672 -1.87173462 172.015625
		 6.87578726 -0.66246033 173.79051208 6.9402914 -0.93231201 173.54006958 6.85448265 -0.87135315 174.017562866
		 6.84231806 -1.13764954 173.79338074 6.33392382 -1.92842102 170.64181519 5.58664083 -1.95550537 171.76628113
		 5.66087437 -1.78001404 171.51754761 5.8613348 -2.4705658 170.63690186 5.77868843 -2.33586121 171.13272095
		 5.70764208 -2.38674927 171.44467163 5.77389717 -1.73631287 171.20065308 5.93203831 -1.91563416 170.93373108
		 6.18487358 -1.71330261 170.96443176 5.98715591 -2.13172913 170.61247253 5.62014866 -2.26356506 171.80041504
		 5.58833647 -2.12545776 171.88395691 5.85169315 -2.36891174 170.45657349 5.50267124 -2.097702026 171.51307678
		 5.58542204 -1.9909668 171.38635254 5.68143559 -2.34725952 170.97085571 5.67421055 -2.35125732 171.26551819
		 5.61892653 -2.35319519 171.3669281 5.63313484 -1.99313354 171.19252014 5.75671434 -2.041854858 170.99890137
		 5.70479393 -2.21446228 170.88479614 5.52571535 -2.27775574 171.57850647 5.55246115 -2.1676178 171.66470337
		 5.75535679 -2.31161499 170.74069214 6.9781642 -1.18870544 172.4105072 6.98738289 -1.17433167 172.20030212
		 7.13090324 -0.93551636 172.60339355 6.74984455 -1.24539185 172.24072266 7.15450621 -0.44522095 172.51289368
		 7.08473587 -0.44821167 172.81669617 7.12998343 -0.68708801 172.73547363 6.19584417 -1.18177795 171.99812317
		 6.52281332 -1.58821106 170.98065186 6.67396641 -1.29444885 171.41249084 6.48021078 -1.59625244 172.8855896
		 6.17517805 -1.66448975 172.70443726 6.19833803 -1.42028809 172.53387451 6.82825565 -1.21240234 171.92074585
		 5.98974085 -2.25312805 172.76004028 6.27467918 -1.79003906 172.9418335 6.13192797 -2.1479187 172.98997498
		 6.35907841 -1.87744141 173.42384338 5.70620871 -2.53442383 171.90220642 5.70275068 -2.37289429 171.82684326
		 5.63031626 -2.8480835 171.93083191 5.63509703 -2.4052124 171.73573303 5.60637999 -2.34046936 171.53497314
		 5.61427736 -2.96739197 168.85298157 5.83507729 -2.69285583 169.16000366 5.67795658 -2.81158447 168.46511841
		 5.98986959 -2.58146667 168.78868103 5.75869179 -2.33378601 168.32043457 6.051158905 -2.25886536 168.54420471
		 6.36081266 -1.9367218 169.097061157 6.18614149 -1.92782593 168.68681335 6.39831972 -1.61190796 168.951828
		 6.0027060509 -1.89282227 168.5683136 6.18176651 -1.51005554 168.85588074 5.42362833 -2.87875366 168.32991028
		 5.42955732 -3.10084534 168.65859985 5.29970503 -2.95523071 168.16642761 5.317873 -3.20205688 168.48524475
		 5.70940399 -1.98330688 168.45582581 5.46800232 -2.44692993 168.23855591 5.20435667 -2.030426025 168.4546814
		 5.23842192 -2.55108643 168.078552246 5.91237354 -1.51885986 168.77696228 5.4634223 -1.62240601 168.84580994
		 6.81190491 -0.91766357 169.89898682 7.25089359 -0.48027039 170.88354492 7.20309544 -0.69042969 171.012268066
		 6.68284559 -1.13485718 170.11064148 7.40252876 -0.12265015 171.85984802;
	setAttr ".vt[166:331]" 7.37219906 0.19973755 172.56898499 7.26376772 -0.11625671 172.54141235
		 7.29437733 -0.35041809 171.93690491 7.11951208 0.28694153 172.58351135 7.16101933 -0.025360107 171.80158997
		 6.63493776 -0.70072937 169.86506653 6.94399166 -0.34109497 170.86694336 7.14605618 -0.82730103 171.096450806
		 7.2300725 -0.44433594 171.97120667 7.14374256 -0.20809937 172.56118774 6.49428225 -1.56134033 169.53146362
		 6.59466505 -1.29928589 169.31573486 6.39492941 -1.14405823 169.22666931 6.86284351 0.080886841 172.49035645
		 6.92614698 -0.14239502 171.84619141 6.65773726 -0.49143982 170.95007324 6.30432749 -0.76856995 169.97901917
		 6.099430561 -1.17529297 169.21730042 7.31282568 0.27613831 173.036270142 7.21553421 -0.035736084 172.96572876
		 7.040194988 0.34542847 173.05708313 7.10207081 -0.15734863 172.9347229 7.077141285 -0.1633606 173.30166626
		 6.74884129 0.15917969 172.96247864 6.55033207 -0.3210907 172.41442871 6.5281415 -0.45510864 171.85327148
		 6.26904583 -0.58969116 171.038635254 6.045837879 -1.010620117 170.14820862 5.80658627 -1.18782043 169.31958008
		 6.53437805 -0.15908813 173.37918091 6.71196318 0.14048767 173.42979431 6.5077486 -0.15438843 172.90571594
		 6.26086617 -0.44407654 172.41175842 6.16985512 -0.50401306 171.8163147 6.010434151 -0.29760742 172.63778687
		 5.82957554 -0.56105042 171.90927124 6.045228481 -0.6415863 171.09513855 5.8557725 -0.98188782 170.2326355
		 5.70908689 -0.74285889 171.14079285 6.34679842 -0.30758667 173.48905945 6.29540157 -0.29881287 172.9949646
		 6.21471691 -0.24990845 173.80184937 6.21369982 -0.13528442 173.25598145 5.6666975 -0.89277649 170.23165894
		 6.48844814 -1.82995605 173.86325073 6.74030304 -1.47229004 174.13693237 6.89882231 -1.57765198 174.25608826
		 6.53701496 -2.034805298 173.9324646 6.68387556 -2.16401672 173.98216248 7.0079140663 -1.65332031 174.42353821
		 6.63073921 -2.41920471 174.12103271 6.83396673 -1.91725159 174.55833435 7.24275827 0.20732117 173.45715332
		 7.22142649 0.10369873 173.87747192 7.20500994 -0.1111908 173.72148132 7.20369864 -0.037719727 173.35906982
		 7.18818903 -0.45574951 174.50672913 7.19374657 -0.84158325 174.63499451 7.086240292 -0.93461609 174.38194275
		 7.15141821 -0.61424255 174.29634094 6.9986043 -0.4291687 174.67802429 7.027146816 -0.87336731 174.85835266
		 6.98124027 0.28201294 173.51078796 6.95169497 0.17515564 174.0042572021 7.038334846 -0.24349976 173.67225647
		 6.92279768 -0.94120789 174.28839111 6.95053005 -0.66593933 174.21542358 6.96983671 -0.079330444 174.41062927
		 7.20473862 -0.14593506 174.28965759 7.19655228 -0.33187866 174.094650269 7.010732651 -0.42991638 174.024673462
		 6.3551321 -2.5476532 174.094787598 6.12700367 -2.72851563 174.020492554 6.71404028 -0.59622192 174.67860413
		 6.77560997 -1.075942993 174.83612061 6.69662428 0.0030517578 173.92800903 6.69108343 -0.20272827 174.37461853
		 7.17521143 -1.1973114 174.62438965 7.03404665 -1.20011902 174.37771606 7.019500256 -1.36088562 174.86351013
		 6.83790779 -1.14840698 174.27494812 6.73136139 -1.56575012 174.79824829 6.57808018 -2.052337646 174.51371765
		 6.62955952 -0.87454224 174.43295288 6.70776272 -1.29862976 174.59933472 6.55324841 -0.30381775 173.80348206
		 6.58312941 -0.54780579 174.15391541 6.61492872 -1.69851685 174.65411377 6.43782949 -1.085220337 174.39234924
		 6.39586735 -1.19302368 174.81015015 6.44484615 -1.6521759 174.92785645 6.47750473 -1.49641418 174.52738953
		 6.27608633 -0.4631958 174.19230652 6.39050484 -0.48219299 173.86413574 6.33119154 -0.78294373 174.55027771
		 6.41330004 -0.74295044 174.15403748 6.44742584 -2.028396606 174.88473511 6.52200317 -1.7550354 174.6459198
		 6.37927866 -2.25949097 174.60414124 5.62215471 -1.11087036 169.31388855 5.31881475 -2.24827576 171.21247864
		 0.46556026 -11.30851746 168.69503784 -0.031290852 -11.63868713 169.32099915 -0.046745982 -11.85762024 169.068756104
		 0.014314532 -11.78353882 168.71166992 -0.28025633 -12.15919495 169.47625732 -0.41062871 -12.66230774 169.49168396
		 -0.24296984 -12.62461853 169.18229675 -0.10916182 -12.21488953 169.1572876 -0.14373878 -12.65298462 168.85586548
		 -0.018014308 -12.25508118 168.79496765 -1.052609682 -12.78599548 167.92623901 -1.13187969 -12.85014343 167.78199768
		 -0.8128171 -12.49583435 167.53721619 -0.82685816 -12.51789856 167.81225586 -0.21372128 -12.67965698 168.50767517
		 -0.097543761 -12.28814697 168.38423157 -0.27310792 -12.049423218 167.94139099 -0.5188638 -12.27015686 167.81517029
		 -0.29618067 -12.15734863 167.51780701 0.22752313 -11.80039978 167.63555908 -0.41245317 -12.67698669 168.35780334
		 -0.33124432 -12.34121704 168.14949036 -0.040135171 -11.84719849 168.26748657 0.41668552 -11.5426178 168.11032104
		 -0.45128527 -13.36962891 168.88362122 -0.43253982 -13.25473022 169.12210083 -0.5453229 -13.42694092 169.24766541
		 -0.62062573 -13.67034912 168.95484924 -0.8339287 -13.97515869 169.071289063 -0.75309074 -13.69320679 169.43244934
		 -0.81598747 -13.80706787 168.59950256 -0.70991182 -13.45213318 168.50019836 -0.99781173 -13.38308716 168.29959106
		 -0.79743731 -13.31550598 168.41296387 -0.99678081 -13.56282043 168.29962158 -1.14530087 -13.28968811 168.16001892
		 -1.20002306 -13.46948242 168.10842896 -1.25424671 -13.20657349 167.94082642 -1.17335474 -13.084945679 168.024459839
		 -0.49354884 -13.092712402 169.40415955 -0.36280426 -12.9868927 169.15959167 -0.30242267 -13.015182495 168.87960815
		 -0.58681715 -12.99940491 168.48365784 -0.40605423 -13.046981812 168.57798767 0.50346798 -11.57965088 173.50869751
		 1.047604561 -11.56091309 173.64894104 1.29868114 -11.765625 174.19447327 0.68909264 -11.99211121 174.069549561
		 -0.036195565 -12.16864014 173.8261261 -0.075846702 -11.46937561 173.30638123 0.89244217 -11.87576294 175.18304443
		 1.51157653 -11.57315063 175.085357666 0.20102671 -12.17190552 175.262146 1.18868089 -11.55792236 176.45016479
		 0.41499576 -11.83171082 176.61177063 1.8791827 -11.20324707 176.24456787 -0.53956258 -12.33522034 175.44525146
		 -0.38772136 -11.99188232 176.73753357 2.58960056 -10.60392761 173.092575073 2.57842112 -10.74038696 173.21720886
		 2.37661767 -10.89561462 173.25492859 2.25834417 -10.78079224 173.15261841 2.042209387 -10.78132629 172.88354492
		 2.24624944 -10.69517517 172.77023315 2.36692691 -10.62515259 172.75604248;
	setAttr ".vt[332:497]" 2.10723329 -10.75282288 172.93235779 2.35727859 -10.57009888 172.64515686
		 2.51381516 -10.49964905 172.63713074 2.19497442 -10.72790527 173.03427124 2.54708862 -10.38641357 172.90299988
		 1.84647703 -10.87832642 173.081253052 1.92463601 -10.91862488 173.21002197 1.77023017 -10.87872314 172.98564148
		 1.80470049 -10.88763428 173.01914978 3.055410862 -10.36204529 173.18785095 2.86953497 -10.60054016 173.34431458
		 3.50976062 -9.94708252 173.40435791 3.29067183 -10.3193512 173.58396912 3.16017008 -10.10910034 172.9828186
		 2.73148465 -10.17500305 172.68609619 3.25546288 -9.85003662 172.77960205 3.65276337 -9.60058594 173.17082214
		 3.79264283 -9.29969788 172.89912415 2.60336089 -10.85165405 173.43154907 2.96084976 -10.69612122 173.7008667
		 5.49745464 -3.52790833 172.32270813 5.45420647 -3.63861084 171.035629272 5.69160461 -3.50952148 173.33833313
		 -1.63180184 -13.13320923 167.61677551 -1.62180519 -12.81408691 167.41900635 -1.41164637 -12.81967163 167.42314148
		 -1.45245552 -13.12249756 167.63040161 -1.29587889 -13.033538818 167.68200684 -1.17441165 -12.74182129 167.42758179
		 0.36939305 -11.84410095 166.78158569 0.34060988 -11.83837891 167.15036011 -0.15349406 -12.13105774 167.15484619
		 -0.085474215 -12.12089539 166.80389404 -0.5474748 -12.33653259 166.80108643 -0.6458407 -12.38659668 167.14859009
		 -1.61746716 -12.5617981 167.12963867 -1.61364782 -12.40080261 166.78817749 -1.30395603 -12.43753052 166.79170227
		 -1.34778512 -12.57896423 167.1293335 -0.94920242 -12.44821167 166.79129028 -1.038104057 -12.53338623 167.11585999
		 -1.35653722 -13.38568115 167.86282349 -1.28017235 -13.80703735 168.062576294 -1.64467442 -13.48822021 167.74688721
		 -1.46817946 -13.47927856 167.77238464 -1.45025909 -13.89108276 167.92689514 -1.67296994 -13.89164734 167.89996338
		 5.065523624 -0.75202942 166.79933167 5.17130232 -0.091018677 168.46466064 5.28496361 -0.77450562 168.82620239
		 5.10717344 -1.54934692 167.36772156 5.37972927 0.44717407 169.99511719 5.52255392 -0.29801941 170.061721802
		 5.063062191 -2.32180786 167.11813354 5.091881752 -2.88032532 167.17875671 5.1621151 -3.26101685 167.50999451
		 5.19670439 -3.55537415 167.98878479 5.27422094 -3.7648468 168.75350952 5.16444778 -4.58665466 168.043960571
		 5.035490513 -4.24330139 167.14447021 4.94983816 -3.87498474 166.50852966 5.22478437 1.24130249 170.081192017
		 4.8445015 0.75631714 168.18119812 5.35336161 -3.77012634 169.74217224 2.55150723 6.85218811 173.61656189
		 3.29658961 6.26248169 173.5436554 3.25314093 5.83821106 171.27346802 2.55860019 6.42347717 171.30532837
		 2.4216857 5.70527649 169.13728333 2.99908733 5.084060669 169.15783691 3.43903041 4.48208618 169.091156006
		 3.80605912 5.27113342 171.16639709 3.70169115 3.82681274 169.021484375 4.19582415 4.6595459 171.022369385
		 4.45958662 4.0043029785 170.8662262 3.96300912 3.17900085 168.93273926 4.28455925 5.10798645 173.18971252
		 4.59549665 4.5100708 172.93463135 3.86117315 5.69551086 173.38442993 1.59418035 6.91906738 171.25979614
		 1.65282464 7.54824829 173.58392334 1.51336777 6.13505554 169.092590332 5.37305975 2.41567993 171.90496826
		 5.066347599 1.95753479 170.46940613 4.8004446 2.62644958 170.625 5.17867708 3.22372437 172.22325134
		 0.51190352 7.9128418 173.53790283 0.5118919 7.2638855 171.18714905 0.5039022 6.37580872 169.037857056
		 -0.69073892 8.12335205 173.47691345 -0.61026305 7.46665955 171.11712646 -0.49812388 6.56715393 168.95977783
		 6.62405825 -1.97749329 176.35127258 6.53961039 -1.88278198 175.54862976 6.57471991 -1.18965149 175.48957825
		 6.65829849 -1.078109741 176.36480713 5.72410154 0.99804688 172.48503113 5.99087429 1.098846436 173.47329712
		 5.93586636 0.27879333 172.99876404 5.76158428 0.15879822 172.15490723 5.64853382 0.80593872 171.31665039
		 5.62495279 -0.024536133 171.192276 6.36409664 0.75714111 175.11169434 6.53934717 0.30462646 175.71192932
		 6.39387274 -0.1541748 174.82449341 6.31159782 0.17807007 174.31542969 6.62203741 -0.32553101 176.137146
		 6.46754742 -0.60601807 175.2354126 6.55365515 1.34030151 178.99732971 6.52957106 0.027526855 179.49705505
		 6.70550919 0.048583984 178.34686279 6.47049665 1.098831177 177.88314819 5.43795443 3.50991821 173.93798828
		 5.71214151 2.74365234 173.37413025 2.76446986 7.4768219 175.94155884 3.51504254 6.76493835 175.78347778
		 1.68907428 8.036895752 176.01272583 4.13920259 6.15263367 175.57142639 4.62184858 5.52923584 175.33343506
		 0.51791888 8.41369629 176.028900146 -0.78508747 8.58802795 175.94813538 4.92718506 4.86602783 175.0043182373
		 5.57316589 3.49749756 175.63221741 5.74532652 2.80207825 174.82551575 6.26228094 2.38839722 178.14511108
		 6.26610994 1.94987488 177.10726929 4.59274292 1.95863342 168.99307251 4.87550545 1.55259705 169.26475525
		 6.1986928 1.039855957 174.35847473 6.06840229 0.30813599 173.72087097 5.9285984 3.13322449 177.019897461
		 5.98825836 2.5382843 176.084732056 5.12874317 3.36457825 180.91462708 5.6406908 3.040176392 180.055435181
		 5.37266064 4.12940979 178.64814758 4.94102621 4.58842468 179.30160522 5.22913027 4.78903198 176.95654297
		 4.76161766 5.33810425 177.42779541 4.15482759 5.85394287 177.80589294 4.18094444 4.93267822 179.83753967
		 3.40509844 6.3387146 178.12586975 3.35992289 5.37980652 180.36280823 2.48617315 6.86624146 178.40124512
		 2.34861493 5.83096313 180.79212952 1.33299673 7.26399231 178.53167725 0.19569853 7.74194336 178.63136292
		 -1.0026500225 7.77619934 178.53633118 1.20956266 6.13920593 181.00032043457 0.014058296 6.35638428 181.051208496
		 -1.20459974 6.53192139 181.025756836 4.28294611 2.56800842 168.88508606 4.63179302 3.33564758 170.71556091
		 4.90482903 3.91294861 172.57023621 5.17563629 4.18467712 174.49969482 5.41974211 4.13250732 176.34884644
		 5.75212002 3.67202759 177.88783264 6.06675005 2.73217773 179.15011597 6.39875221 1.50294495 180.11727905
		 6.71896839 -1.021713257 177.38291931 6.67136383 -0.073959351 177.19812012 6.76711178 -1.13960266 178.49145508
		 6.44755983 0.74008179 176.75759888 5.56715584 1.62844849 171.55392456 5.76750612 1.85447693 172.88166809
		 5.94873905 1.95996094 174.087722778 6.2284956 1.37216187 176.073913574;
	setAttr ".vt[498:663]" 6.023143768 1.80567932 175.1697998 2.54667759 -10.26773071 171.7600708
		 2.24765325 -10.5569458 171.93878174 1.9505477 -10.66566467 171.8465271 2.206007 -10.41056824 171.65739441
		 1.79737663 -10.54893494 171.5965271 1.58739495 -10.75062561 171.80351257 1.34488475 -10.64370728 171.57814026
		 1.19742 -10.79808044 171.80383301 0.80908829 -10.77429199 171.84640503 0.8535018 -10.66873169 171.62025452
		 1.60817504 -10.51860046 170.97758484 1.49669278 -10.55253601 171.30632019 0.93930906 -10.59902954 171.37150574
		 1.0074613094 -10.60221863 171.092147827 2.25312209 -10.33079529 170.9095459 2.040712357 -10.40541077 171.30278015
		 2.88835478 -10.0340271 170.93383789 2.5316534 -10.19142151 171.35887146 3.36809039 -9.64305115 171.094116211
		 2.9146874 -9.94139099 171.48156738 -0.59050351 -10.84941101 172.061935425 -0.76973861 -11.10580444 172.0181427
		 -0.54492861 -11.061203003 171.68919373 -0.40082133 -10.76843262 171.79411316 1.50477099 -10.59298706 170.14108276
		 1.62847555 -10.53564453 170.5738678 0.97517979 -10.66079712 170.78634644 0.79801065 -10.76905823 170.4671936
		 4.14704943 -8.73280334 170.92732239 3.67162943 -9.29356384 171.38735962 3.78543496 -9.3026886 170.52989197
		 4.32823944 -8.31896973 171.4364624 3.83960962 -9.036483765 171.7759552 4.71908426 -7.58302307 170.99865723
		 4.51235676 -8.12460327 170.32374573 4.99273348 -6.81562805 170.50332642 4.69588041 -7.41850281 169.64558411
		 5.15973711 -6.48510742 171.43249512 4.75986671 -7.27935791 171.72200012 5.072207928 -6.31509399 172.33270264
		 4.64622974 -7.21470642 172.42616272 4.35070562 -8.15631104 171.99253845 3.8790133 -8.95196533 172.19076538
		 -0.65622872 -10.87033081 172.31784058 -0.87026 -11.1151123 172.33940125 2.37827778 -10.29342651 170.4012146
		 2.33330631 -10.32925415 169.79716492 3.14759421 -9.87051392 170.32310486 3.28479838 -9.66889954 169.37957764
		 4.093286991 -8.84234619 169.75163269 2.031176805 -10.43664551 169.28582764 2.68345833 -9.98065186 168.72927856
		 3.031862736 -9.45222473 167.9535675 3.6346333 -8.93533325 168.40142822 4.27040529 -8.18435669 168.9209137
		 0.51043469 -10.65077209 171.21058655 0.45707965 -10.73622131 171.00079345703 0.20940366 -10.91418457 170.8291626
		 0.44831839 -10.62173462 171.44548035 -0.0073249093 -10.67550659 171.49346924 0.19165826 -10.68069458 171.30003357
		 0.15569927 -10.77783203 171.18701172 -0.15454032 -10.95777893 171.28141785 5.50537777 -5.61456299 171.14256287
		 5.26725578 -6.0013427734 169.96659851 4.27874231 -8.19639587 172.52896118 4.21330929 -8.46461487 173.022125244
		 3.87519813 -9.061477661 172.5635376 4.52683926 -7.42407227 173.1073761 4.087344646 -8.84660339 173.41557312
		 4.36757088 -7.85943604 173.66679382 4.93776131 -6.38330078 173.16799927 4.79269838 -6.80241394 173.90943909
		 0.84932321 -11.32453918 173.37818909 1.33480227 -11.31600952 173.46209717 1.58398068 -11.4694519 173.73924255
		 0.64290112 -10.925354 173.021728516 1.082816482 -10.99447632 173.079666138 1.11958897 -11.036529541 173.20022583
		 0.6783821 -10.97468567 173.13522339 0.61263603 -10.83952332 172.88522339 1.038435578 -10.91162109 173.006439209
		 1.062599421 -10.9783783 173.020248413 0.63082612 -10.91575623 172.91569519 1.18183005 -11.19900513 173.31272888
		 0.72928083 -11.12840271 173.24502563 1.83325207 -11.24438477 173.48806763 2.1057992 -11.29512024 173.78308105
		 1.48042202 -10.970047 173.10099792 1.54235089 -11.021118164 173.21781921 1.41472077 -10.92817688 173.029846191
		 1.44692695 -10.96955872 173.040496826 1.65096009 -11.15814209 173.32415771 2.26302218 -11.084259033 173.48300171
		 2.55072713 -11.0092315674 173.77770996 2.061234713 -11.049453735 173.29808044 -1.20155501 -14.37428284 168.67630005
		 -0.95319033 -14.11105347 168.67169189 -1.17296684 -14.25759888 169.16769409 -1.76309693 -14.1260376 169.69483948
		 -1.77809608 -14.41052246 169.20414734 -1.43231833 -14.38497925 169.20170593 -1.4026525 -14.097747803 169.67868042
		 -1.75997102 -14.49246216 168.6204071 -1.72179234 -14.29023743 168.16252136 -1.4475075 -14.28465271 168.19610596
		 -1.44459498 -14.47651672 168.6517334 -1.10929346 -13.96295166 169.60372925 -1.05361712 -13.86465454 168.32545471
		 -1.25732529 -14.21046448 168.28747559 -1.091054082 -14.094589233 168.40556335 -0.83376867 -11.13491821 172.65260315
		 -0.58723301 -10.92901611 172.59571838 -0.37402192 -11.00028991699 172.86135864 -0.58685154 -11.24293518 172.9703064
		 0.28171057 -10.8147583 173.015380859 0.32300836 -11.0044403076 173.11457825 0.24352391 -10.66218567 172.71025085
		 0.24122514 -10.7387085 172.74224854 0.24554686 -10.74238586 172.88157654 0.3910698 -11.25823975 173.25540161
		 -0.013870151 -10.87846375 172.93133545 -0.010047118 -10.7074585 172.83718872 -0.044654146 -11.13113403 173.082748413
		 -0.23886086 -10.79656982 172.73838806 -0.19094588 -10.66744995 172.61581421 -0.39964843 -10.775177 172.50866699
		 -0.30025688 -10.66894531 172.34985352 -0.4596414 -10.74897766 172.29179382 -0.30437431 -10.65814209 172.21017456
		 -0.23571733 -10.59545898 172.24145508 -0.22437306 -10.58288574 172.29942322 -0.16283143 -10.51527405 172.35565186
		 -0.069019429 -10.46646118 172.40585327 -0.058056131 -10.47831726 172.45692444 -0.089768901 -10.55761719 172.46246338
		 -0.021696994 -10.49064636 172.5302124 0.046476804 -10.60578918 172.60818481 0.028091213 -10.63223267 172.74183655
		 1.080919862 -11.2638855 167.80192566 0.92151314 -11.43060303 167.39759827 1.61946344 -10.98419189 167.40080261
		 1.96855378 -10.73484802 166.95254517 2.23810554 -10.52384949 167.15002441 1.86377323 -10.7885437 167.71769714
		 1.27094555 -11.012115479 168.22602844 2.29960132 -10.21086121 168.3460083 2.72393537 -9.89820862 167.62045288
		 0.78567147 -11.51239014 166.69636536 0.8489877 -11.50323486 167.0077819824 1.42443204 -10.84379578 166.51528931
		 1.54438174 -10.85897827 166.639328 1.25504541 -11.14825439 166.81781006 1.15371382 -11.15609741 166.59971619
		 2.53134251 -10.289505 167.37094116 2.11452603 -10.56028748 168.034637451 1.52646649 -10.80975342 168.59770203
		 1.39529026 -11.094543457 167.095108032 1.70672107 -10.8419342 166.79057312 1.27007592 -10.67871094 169.73101807
		 1.73572385 -10.56533813 168.91586304 1.039967775 -10.80937195 169.37937927 0.82404268 -11.040390015 169.067611694
		 0.52725279 -10.90617371 170.14381409 -0.15777262 -11.32781982 170.65332031;
	setAttr ".vt[664:829]" 0.36337554 -11.11244202 169.81112671 -0.18152665 -11.58259583 170.21907043
		 -0.16827245 -11.76182556 169.9360199 -0.17810522 -11.87835693 169.73564148 0.21597147 -11.33529663 169.54121399
		 -0.55301422 -11.94567871 165.83087158 -0.59885949 -12.074493408 165.66427612 -0.014231371 -11.68289185 165.77204895
		 -0.056969766 -11.56341553 165.91162109 0.52026367 -11.14201355 165.91093445 0.50839227 -11.10194397 165.99433899
		 6.62523746 -1.38700867 179.6424408 6.60459709 -2.88124084 179.40733337 6.71927881 -2.41029358 178.31588745
		 6.48870087 -2.81936646 176.049758911 6.10737514 -3.66046143 175.56378174 6.26196861 -2.89924622 174.90911865
		 6.41324806 -2.45195007 175.34631348 6.35885191 -4.26361084 178.88616943 6.47902203 -3.60733032 177.91720581
		 6.16489887 -3.35417175 180.48339844 5.97660017 -4.84088135 179.91394043 4.98688173 -6.51148987 175.04850769
		 5.18660355 -5.7883606 174.19842529 5.55577469 -4.54386902 174.68252563 5.45684671 -5.69094849 175.91804504
		 6.0018348694 -4.45378113 176.67999268 6.63386059 -2.067123413 177.26852417 6.47290134 -3.091247559 176.93228149
		 5.28332949 -5.41644287 173.24703979 5.41401529 -5.41111755 172.24804688 5.57316828 -4.42066956 172.229599
		 5.45780754 -4.38476563 173.37522888 5.99604464 -3.34255981 174.20233154 -0.70176309 -11.68731689 173.15762329
		 -2.052021503 -12.24440002 175.6681366 -2.028494596 -12.47499084 174.64239502 -1.64779699 -12.50695801 174.61332703
		 -1.60378182 -12.29919434 175.66470337 -2.072636127 -12.010726929 176.8011322 -1.56621051 -12.026580811 176.80039978
		 -1.11572289 -12.33428955 175.59681702 -1.023409009 -12.021316528 176.7829895 -0.71297145 -12.47195435 174.181427
		 -1.24091399 -12.50558472 174.47792053 -0.96739554 -12.1191864 173.34841919 5.66212273 -2.034606934 181.79193115
		 4.85460997 -2.40032959 182.75013733 4.72956038 -4.40907288 182.50323486 5.36654282 -3.81491089 181.3992157
		 3.93324184 -2.75883484 183.62678528 3.79093981 -4.89385986 183.272995 5.79062891 -0.2033844 181.6650238
		 5.078895569 -0.36791992 182.62313843 5.1219945 1.59761047 182.012832642 5.82295942 1.56900024 181.11532593
		 0.82818216 -3.56507874 185.35740662 -0.26728967 -3.78416443 185.5867157 -0.36658049 -6.22731018 185.44895935
		 0.65463626 -6.093643188 185.13471985 1.6805414 -5.75666809 184.561203 1.93987 -3.32522583 184.98045349
		 2.93938875 -3.072570801 184.35900879 2.79347563 -5.34292603 183.95205688 4.11774778 -0.5181427 183.44326782
		 3.09885025 -0.62911987 184.20315552 2.10389423 -0.72454834 184.86904907 0.8900702 -0.9309082 185.17308044
		 -0.46372467 -1.48312378 185.56132507 4.33174992 1.6685791 182.92730713 3.27527833 1.73570251 183.61688232
		 2.13041806 1.78115845 184.099197388 0.98694706 1.8927002 184.56221008 -0.28094465 1.96105957 184.85014343
		 -1.61323595 2.085281372 185.04095459 -1.83321702 -1.097717285 185.58332825 2.27138925 4.089294434 182.77810669
		 1.14881599 4.38386536 183.16203308 -0.085593589 4.5737915 183.3447113 -1.37383485 4.61720276 183.32475281
		 3.39051533 3.88981628 182.34611511 4.29229784 3.59382629 181.629776 6.27758217 -1.69645691 180.79219055
		 6.30316353 -0.071395874 180.62010193 2.72396374 -9.67660522 179.25198364 1.95138347 -10.31373596 179.62330627
		 1.82232714 -10.83992004 178.76164246 2.6008296 -10.24317932 178.46078491 3.43783879 -9.0090026855 178.83934021
		 3.27360868 -9.602005 178.095687866 2.36026025 -10.73927307 177.57220459 1.59968722 -11.27171326 177.8106842
		 3.88840413 -8.90126038 177.65473938 4.16933918 -8.38893127 178.30325317 -0.37306866 -12.28421021 169.84420776
		 -0.56415999 -12.82618713 169.87002563 -0.46566224 -11.4250946 171.24963379 -1.3226608 -12.96311951 171.36080933
		 -1.81595457 -13.05380249 171.40960693 -1.77398682 -13.28111267 170.99989319 -1.28366959 -13.15074158 170.93560791
		 -0.85177839 -13.015350342 170.3110199 -0.50387728 -12.31007385 170.18969727 -0.65060079 -12.042037964 170.9458313
		 -1.024335384 -12.57356262 171.17816162 -0.96048099 -12.74275208 170.74913025 -0.59634608 -12.18305969 170.53643799
		 -1.85921335 -12.81408691 171.77745056 -1.4169879 -12.75769043 171.75695801 -0.72675699 -11.43463135 171.69219971
		 -1.083848715 -12.48686218 171.62937927 -0.77708912 -11.97485352 171.40255737 -1.88768446 -12.57783508 172.11151123
		 -1.5448668 -12.51911926 172.095703125 -0.92031449 -11.88751221 171.83470154 -1.22578752 -12.34797668 172.031738281
		 -0.68119472 -13.31488037 169.70195007 -1.7333287 -13.81483459 170.13677979 -1.32927835 -13.77230835 170.11410522
		 -1.73679435 -13.5316925 170.57102966 -1.26547563 -13.41238403 170.51579285 -0.99748629 -13.59683228 169.98953247
		 0.80198687 -10.98956299 165.36177063 0.68403602 -11.10020447 165.4876709 0.17975864 -11.63439941 165.092514038
		 0.25415981 -11.45285034 164.92948914 1.090107799 -10.68899536 164.84623718 0.9198584 -10.86381531 165.13630676
		 0.32159892 -11.27459717 164.66256714 0.41631696 -11.055328369 164.31948853 1.21628261 -10.52033997 165.74757385
		 1.13480294 -10.58508301 165.80966187 1.57195532 -10.26371765 165.43984985 1.34982026 -10.4158783 165.61993408
		 -0.49451411 -12.013519287 164.7495575 -0.46663237 -11.78038025 164.54916382 -1.033932924 -12.104599 164.62741089
		 -1.037947655 -11.84431458 164.42884827 -0.31156448 -11.35420227 163.96565247 -0.39806274 -11.53443909 164.32434082
		 -1.0073264837 -11.59855652 164.18118286 -0.91778666 -11.63265991 163.79866028 0.71945906 -10.80322266 172.17756653
		 0.69387257 -10.66810608 172.23927307 0.44540408 -10.58102417 172.26905823 0.45241454 -10.70410156 172.20542908
		 0.76845932 -10.81504822 172.025100708 0.46483839 -10.74137878 172.059051514 0.45193797 -10.71054077 171.90579224
		 -0.16939634 -10.48963928 172.27142334 -0.063938014 -10.46185303 172.35855103 -0.26707479 -10.66467285 172.1056366
		 -0.1871803 -10.6156311 172.16207886 -0.012503524 -10.60794067 172.23458862 0.068518206 -10.4903717 172.32150269
		 -0.017833989 -10.46638489 172.33622742 -0.11772689 -10.52720642 172.23477173 -0.12645733 -10.67097473 172.033737183
		 -0.051039271 -10.63606262 172.11476135 0.19958974 -10.51776123 172.28918457 0.18106343 -10.64558411 172.23304749
		 0.17834066 -10.69187927 172.092880249 0.13050956 -10.6730957 171.96896362 -1.61495233 -12.43122864 166.43237305
		 -1.27849925 -12.45143127 166.43904114 -0.89748245 -12.42868042 166.45329285;
	setAttr ".vt[830:995]" -0.49323332 -12.30451965 166.47050476 -0.06792175 -12.10040283 166.48872375
		 0.36036262 -11.82432556 166.48204041 -1.065114617 -12.099594116 165.76652527 -1.096452475 -12.2171936 165.60185242
		 -1.30721188 -12.19671631 165.84564209 -1.29824209 -11.97332764 165.70870972 -1.012182474 -11.96044922 165.73553467
		 -0.98198742 -12.16744995 165.87110901 -1.2807126 -12.375 166.11196899 -1.61025262 -12.38964844 166.093444824
		 -1.59535599 -12.21659851 165.82554626 -0.57432264 -12.038970947 165.91601563 -0.63143963 -11.86564636 165.79429626
		 -0.21865001 -11.70266724 165.85122681 -0.15866065 -11.85707092 165.96246338 -0.096914157 -12.020904541 166.20046997
		 -0.51493883 -12.20175171 166.16339111 0.17043892 -11.4563446 165.89952087 0.23733552 -11.6053009 165.9960022
		 0.31721196 -11.76083374 166.21939087 -0.91015238 -12.32794189 166.13037109 5.57332802 -4.61408997 170.93080139
		 5.31836653 -4.9546814 169.31272888 0.10377626 -11.72886658 165.30128479 -0.5338099 -12.17321777 165.036941528
		 -1.052472949 -12.32472229 164.9236145 -0.5682137 -12.1799469 165.38275146 0.04255816 -11.7381897 165.54737854
		 -1.083809495 -12.33044434 165.30393982 4.28188896 -8.088729858 174.97309875 3.95055437 -8.81272888 175.3475647
		 3.53072786 -9.68441772 174.63311768 3.89584184 -9.031890869 174.38822937 4.46136761 -8.077453613 176.080917358
		 4.73328972 -7.31944275 175.6207428 3.52943397 -9.48622131 175.64906311 4.10532379 -8.80943298 176.52059937
		 3.11904144 -10.26733398 174.81130981 3.90460396 -9.28840637 173.72665405 3.67429996 -9.82646179 173.94985962
		 4.18004322 -8.40933228 174.086044312 3.34194851 -10.3921814 174.11334229 4.54283285 -7.39692688 174.50933838
		 1.035089016 -10.70758057 179.88044739 0.89993721 -11.22434998 178.95349121 -1.45712435 -11.23815918 180.21420288
		 -2.12813592 -11.36697388 180.2167511 -2.10193992 -11.58894348 179.1137085 -1.48522067 -11.57299805 179.11444092
		 -2.097380877 -11.84916687 177.98886108 -1.52601767 -11.85263062 177.98330688 0.13536768 -10.98324585 180.08013916
		 -0.70369339 -11.15567017 180.1806488 -0.80245703 -11.51164246 179.10678101 -0.011049961 -11.40504456 179.064117432
		 -0.19530241 -11.74946594 177.9883728 -0.91916174 -11.82064819 177.98658752 0.70281136 -11.61317444 177.9229126
		 3.48087144 -9.043609619 180.76315308 2.68381286 -9.83512878 181.31199646 2.11247754 -9.78466797 180.4745636
		 2.95288825 -9.17068481 180.059417725 1.69188583 -10.41046143 181.82144165 1.2185216 -10.28207397 180.81625366
		 4.21868563 -8.32141113 180.23150635 3.75835609 -8.56483459 179.59344482 -1.27633655 -11.14871216 182.51928711
		 -2.15523982 -11.23907471 182.57467651 -2.12759423 -11.44564819 181.34936523 -1.34895766 -11.38441467 181.36325073
		 0.66117841 -10.93330383 182.2131958 -0.32543281 -11.12490845 182.44367981 -0.51034749 -11.23301697 181.29293823
		 0.37884277 -10.76431274 181.068450928 4.63409424 -8.10868835 178.94361877 4.94942951 -7.68708801 179.49879456
		 5.04838562 -6.81924438 176.29125977 5.58007288 -6.21939087 176.89332581 5.28623199 -6.76139832 176.7691803
		 2.84098911 -6.95962524 183.46684265 1.92096758 -7.4831543 184.34384155 2.026159763 -10.13487244 182.87591553
		 3.20289612 -9.5614624 182.29711914 3.14010215 -8.2722168 183.12902832 2.11009312 -9.0057067871 183.86833191
		 4.82698202 -5.98574829 182.0079498291 3.83415961 -6.48324585 182.72900391 3.93399286 -8.65261841 181.55419922
		 4.50784349 -7.86369324 180.82243347 4.71809483 -7.093734741 181.41194153 3.9728229 -7.67327881 182.24923706
		 -2.15413213 -9.73852539 184.52471924 -2.1455102 -10.86457825 183.70524597 -1.23345876 -10.71514893 183.60127258
		 -1.28277218 -9.60476685 184.38874817 -2.097720623 -6.27990723 185.8273468 -2.10571909 -8.37493896 185.41145325
		 -1.2266475 -8.31564331 185.39881897 -1.25372267 -6.28071594 185.71853638 0.87785816 -7.92578125 184.97200012
		 0.7681098 -10.42304993 183.24552917 0.88124621 -9.445755 184.32852173 -0.25456649 -8.16555786 185.25563049
		 -0.26897079 -10.62956238 183.55793762 -0.30080757 -9.57662964 184.49859619 5.34986687 -5.38145447 180.91918945
		 5.22477531 -7.19619751 180.0045928955 5.36089039 -6.43618774 180.47293091 5.52736998 -7.051193237 178.70921326
		 5.16252708 -7.50448608 178.24177551 5.74572182 -6.31159973 177.95535278 5.4294467 -6.81013489 177.57084656
		 5.82656288 -5.76223755 179.48286438 5.7512269 -6.51123047 179.12466431 6.20248508 -5.11755371 178.54075623
		 5.94278669 -5.79174805 178.29711914 0.74390286 -11.49545288 166.44250488 1.075896978 -11.11950684 166.43014526
		 1.34225929 -10.81163025 166.41677856 1.085315824 -10.56312561 166.031570435 1.097838402 -10.49790955 166.092803955
		 1.33238196 -10.40013123 166.14807129 1.28582203 -10.36643982 166.14100647 0.62656283 -11.29685974 166.056030273
		 0.68841428 -11.42410278 166.23609924 0.58260077 -11.14968872 165.96916199 1.29140842 -10.75291443 166.32876587
		 1.024225593 -11.059295654 166.28540039 0.98387283 -10.95848083 166.14916992 1.23846865 -10.68130493 166.22346497
		 1.17335129 -10.61369324 166.1252594 0.92607319 -10.84573364 166.056793213 2.4815371 -10.44081116 172.055236816
		 2.20542359 -10.68595886 172.18208313 2.0035922527 -10.76359558 172.077362061 2.038529634 -10.78356934 172.27546692
		 1.90343046 -10.6902771 172.30990601 1.71265113 -10.73973083 172.26379395 1.83100939 -10.83427429 172.20553589
		 2.21582985 -10.67356873 172.35032654 2.051855326 -10.63444519 172.36434937 2.64250016 -10.30900574 172.19447327
		 2.38815808 -10.55256653 172.28123474 2.73626518 -10.20155334 172.34867859 2.53145099 -10.42976379 172.39582825
		 2.21009564 -10.54716492 172.44206238 2.37634563 -10.54710388 172.42932129 2.3471539 -10.46257019 172.54618835
		 2.49095654 -10.45292664 172.53218079 2.76188254 -10.17076111 172.47229004 2.64838004 -10.33537292 172.51812744
		 2.93641806 -9.95124817 172.53981018 4.88835478 -7.97737122 177.72941589 4.47216845 -8.29203796 177.17147827
		 5.18262911 -7.28677368 177.1844635 4.91178751 -7.62820435 176.68338013 1.90560019 -10.25463867 165.96754456
		 1.67146075 -10.2570343 166.075241089 2.079725027 -10.50665283 166.45492554 1.79972589 -10.57177734 166.42440796
		 3.12283444 -8.99923706 167.10554504 2.92405391 -9.58406067 166.81448364 2.38197041 -10.27561951 166.52215576
		 2.73054409 -10.012084961 166.62350464 1.86717808 -10.095397949 165.2086792;
	setAttr ".vt[996:1161]" 2.28422356 -10.15541077 165.84861755 1.55326605 -10.34625244 166.11677551
		 1.47652626 -10.39277649 166.13812256 1.63732529 -10.56326294 166.39994812 1.54653502 -10.55169678 166.36459351
		 2.63966441 -9.86253357 165.82826233 2.22323298 -9.90098572 165.036529541 3.65673733 -8.31604004 167.49736023
		 4.35874701 -7.5400238 168.064605713 2.86946416 -8.6192627 165.06010437 3.036095619 -8.69966125 166.16238403
		 2.8647573 -9.39479065 165.9229126 2.58347797 -9.44674683 164.95198059 3.47496796 -7.64624023 165.53634644
		 3.5843637 -7.89978027 166.55697632 4.23097801 -6.64350891 166.25294495 4.32883072 -7.030059814 167.20043945
		 4.97611856 -6.06791687 168.089477539 4.88421535 -6.73016357 168.91403198 4.87585545 -5.62011719 167.10899353
		 2.79364586 -10.11427307 171.91125488 3.20550323 -9.74534607 171.69638062 3.35419369 -9.57783508 171.97628784
		 2.94421792 -9.96876526 172.10746765 3.37513781 -9.51864624 172.28033447 3.00040483475 -9.88418579 172.3258667
		 3.33805633 -9.63194275 172.56185913 1.73906124 -10.80039978 172.0075531006 1.47065663 -10.77359009 172.22686768
		 1.5738281 -10.88572693 172.15968323 1.20806825 -10.77886963 172.21206665 1.29168963 -10.93348694 172.15103149
		 1.42824721 -10.86775208 171.97607422 1.09193933 -10.88063049 171.99850464 1.0084534883 -10.87786865 172.1505127
		 0.94742 -10.74525452 172.21780396 -0.049282394 -6.98446655 160.88699341 0.10299102 -6.41584778 160.16708374
		 0.83987427 -5.95222473 160.41973877 0.75517046 -6.50201416 161.098861694 -0.67419273 -7.2311554 160.75549316
		 -0.59031451 -6.7543335 159.96347046 1.60891569 -5.84779358 161.44354248 1.60099018 -5.25828552 160.81660461
		 2.424505 -4.63278198 161.2428894 2.44533277 -5.038848877 161.9594574 0.26244923 -5.96034241 159.28991699
		 -0.72061586 -6.24711609 159.0063323975 0.93975246 -5.54940796 159.56750488 1.91856658 -4.8996582 160.14414978
		 2.63786364 -4.5796814 160.50466919 3.35151482 2.93331909 166.96170044 3.78094292 2.38760376 166.81625366
		 3.5158267 2.18016052 164.71084595 3.90515351 1.73478699 164.56307983 4.62696266 1.15179443 167.077331543
		 2.96606445 3.52272034 167.11506653 2.98333979 2.98049927 164.92251587 2.54096699 4.059005737 167.19985962
		 2.68682027 3.46594238 165.0043334961 2.062815666 4.64775085 167.14538574 2.33928657 3.96977234 164.96321106
		 0.4747186 5.43537903 166.96986389 0.67743611 4.96170044 164.89212036 -0.63906842 5.25311279 164.84169006
		 -0.46892366 5.66651917 166.89743042 1.31417954 5.10185242 167.071136475 1.47542822 4.66455078 164.93774414
		 4.18796349 1.76509094 166.81202698 4.38715887 1.1302948 164.46481323 4.81870079 0.0965271 164.23390198
		 4.92746019 -0.23225403 165.90258789 5.049296379 -1.32765198 165.50843811 5.013645172 -1.15907288 164.48690796
		 4.94214249 -2.23127747 165.062652588 4.87958908 -2.2702179 163.54536438 4.97923517 -1.043426514 163.24154663
		 4.78414965 -2.34573364 162.34577942 4.29217672 -3.28678894 162.60713196 4.26855755 -3.38615417 163.60169983
		 4.2782836 -3.24131775 161.65536499 3.40492749 -4.12084961 161.79240417 3.33114791 -4.20068359 162.63560486
		 3.34968781 -4.17498779 160.87437439 4.82194757 -2.92910767 165.62953186 -0.10569994 -11.36221313 163.50765991
		 -0.79285753 -11.71208191 163.29444885 0.6197958 -10.88825989 163.90356445 0.1336856 -8.73995972 161.046356201
		 0.37566751 -9.51963806 161.11218262 -0.50503337 -9.68461609 160.93981934 -0.60607284 -8.86373901 160.94825745
		 -0.48309195 -10.61343384 161.18424988 0.52942407 -10.45109558 161.43865967 0.42522982 -11.089172363 162.2111969
		 -0.58106911 -11.35258484 161.8381958 1.59814811 -9.81578064 162.29692078 1.27360415 -10.45391846 162.94296265
		 0.14454281 -11.3368988 162.95864868 -0.68225408 -11.61895752 162.64054871 0.86771864 -10.74143982 163.48554993
		 1.16952336 -8.20883179 161.4045105 1.47243881 -8.99923706 161.69540405 1.33648431 -10.46522522 164.52336121
		 1.62912846 -10.20021057 164.22735596 2.38868594 -8.10627747 162.58409119 2.095177412 -7.37602234 162.062408447
		 2.50005913 -8.72135925 163.59750366 2.04477787 -9.77020264 163.92114258 1.48374557 -10.5274353 166.3230896
		 0.60330093 -11.17198181 165.59849548 1.085592747 -10.61206055 165.8624115 1.42428839 -10.40635681 166.14872742
		 0.55847108 -11.18847656 165.75128174 1.051034451 -10.63439941 165.9334259 1.38025284 -10.41314697 166.15232849
		 1.36963499 -10.45533752 166.22111511 1.42786491 -10.49658203 166.27818298 1.31079197 -10.4262085 166.15332031
		 1.8688246 -11.52049255 174.24295044 2.070327044 -11.22087097 174.98503113 2.48288512 -10.74334717 176.044830322
		 3.021136045 -10.15213013 177.28114319 2.39959645 -11.20100403 174.25361633 2.6159637 -10.7746582 174.91809082
		 3.044264317 -10.13723755 175.88276672 3.56916142 -9.46391296 176.92407227 2.88982892 -10.84814453 174.21250916
		 -0.028951941 -7.92929077 161.0061950684 -0.67141259 -8.071914673 160.91426086 0.90548927 -7.37397766 161.30065918
		 1.81362712 -6.60353088 161.78302002 2.68680382 -5.67991638 162.43255615 -1.0048458576 -11.43896484 172.74621582
		 -1.022609115 -11.4143219 172.40576172 -0.92029935 -11.42282104 172.057739258 -1.46897447 -12.053741455 172.6885376
		 -1.36206174 -12.17811584 172.35972595 -1.063167334 -11.79859924 172.18414307 -1.16298509 -11.75160217 172.52352905
		 -1.91393411 -12.17895508 172.74887085 -1.89734745 -12.35041809 172.41670227 -1.63006401 -12.30418396 172.40705872
		 -1.68909574 -12.15596008 172.73918152 -1.94319081 -12.14744568 173.16525269 -1.72187436 -12.1269989 173.13845825
		 -1.14374208 -11.77297974 172.84703064 -1.49513245 -12.046981812 173.076828003 -1.98782659 -12.37283325 173.7784729
		 -1.69478405 -12.36358643 173.7432251 -1.39307165 -12.2999115 173.61488342 0.41735908 -10.65997314 171.68925476
		 -0.41987568 -10.72494507 172.097579956 -0.252547 -10.67468262 171.93104553 0.062245507 -10.6426239 171.78459167
		 4.1993885 -3.79745483 164.35319519 3.45238781 -4.67660522 163.29556274 4.86714458 -3.45619202 166.027435303
		 4.37879801 -4.29699707 164.88270569 3.75131679 -5.26478577 163.79130554 2.96007323 -6.35728455 162.84135437
		 3.20439982 -6.97879028 163.44935608 3.31975269 -7.43743896 164.39222717 4.56755161 -4.78128052 165.4724884
		 4.021242619 -5.83485413 164.41369629 4.15379715 -6.30104065 165.25907898;
	setAttr ".vt[1162:1327]" 4.71072245 -5.21824646 166.21012878 -0.86637157 -12.58824158 168.18310547
		 -0.99911189 -12.73638916 168.23248291 -1.0040768385 -12.76835632 168.069213867 -0.82629341 -12.55895996 168.011810303
		 -0.76885831 -12.52809143 168.20217896 -0.66114211 -12.41304016 168.015991211 -0.68634039 -12.51879883 168.2464447
		 -0.55471295 -12.342453 168.061538696 -0.68880677 -12.67027283 168.48910522 -0.65756494 -12.57275391 168.35186768
		 -0.51365733 -12.48725891 168.21022034 -0.57822841 -12.67750549 168.41165161 -1.092540741 -13.20603943 168.42805481
		 -0.99075669 -13.18789673 168.50422668 -0.8750478 -13.2480011 168.42184448 -1.033371329 -13.28965759 168.33244324
		 -1.16565681 -13.13015747 168.33595276 -1.13609028 -13.19955444 168.22584534 -1.13051105 -12.98246765 168.26654053
		 -1.13292503 -13.022964478 168.12632751 -0.82634896 -12.90061951 168.54219055 -0.71633101 -12.95915222 168.48460388
		 -0.13806383 -10.60577393 172.52735901 -0.95600569 -12.61213684 168.46844482 -1.040732145 -12.68858337 168.4881134
		 -0.90722191 -12.58737183 168.50376892 -0.85321093 -12.59707642 168.52128601 -0.84619606 -12.67790222 168.60195923
		 -0.8133952 -12.61845398 168.54882813 -1.10999918 -12.99472046 168.61691284 -1.040395617 -13.0075073242 168.6330719
		 -1.15471852 -12.97203064 168.5322113 -1.12132037 -12.84519958 168.50743103 -0.94100565 -12.82958984 168.62747192
		 -1.060616851 -12.80982971 168.63049316 -0.97230738 -12.66136169 168.59698486 2.21272993 -10.54058838 172.7434082
		 2.33065987 -10.42182922 172.67097473 2.011719704 -10.63439941 172.85380554 1.73770583 -10.72143555 172.96716309
		 0.63538533 -10.70066833 172.85525513 1.028876066 -10.75561523 172.9783783 1.38230002 -10.76374817 173.011123657
		 0.28026175 -10.53900146 172.70523071 -0.0026229585 -10.35194397 172.47741699 -0.0069004647 -10.34840393 172.52294922
		 0.011047877 -10.35151672 172.56765747 0.67007786 -10.54666138 172.28556824 0.43823025 -10.4745636 172.31562805
		 0.0085177412 -10.34489441 172.44577026 0.12653026 -10.3735199 172.39070129 0.045980737 -10.35110474 172.41548157
		 0.22626686 -10.4118042 172.35675049 1.86903369 -10.56796265 172.34562683 1.67224109 -10.61988831 172.31137085
		 2.03622508 -10.51586914 172.38879395 2.19975376 -10.41259766 172.46391296 2.33719277 -10.31771851 172.56442261
		 1.4298774 -10.65138245 172.27867126 1.17261767 -10.64878845 172.26609802 0.92174786 -10.61091614 172.27009583
		 2.2872014 -10.40042114 172.77037048 2.41638803 -10.26641846 172.68986511 2.017584801 -10.54490662 172.87690735
		 1.73891246 -10.62025452 172.98207092 0.63565278 -10.61981201 172.86883545 1.038630843 -10.6771698 172.98109436
		 1.37636518 -10.68344116 173.015808105 0.26800269 -10.42628479 172.74182129 -0.053776842 -10.2461853 172.4883728
		 -0.064123161 -10.24951172 172.52868652 -0.05135664 -10.24995422 172.57550049 0.63708591 -10.45881653 172.32064819
		 0.39540827 -10.37802124 172.35726929 -0.040180862 -10.24075317 172.45761108 0.078079022 -10.25549316 172.40643311
		 -0.0011196628 -10.2432251 172.42340088 0.17182882 -10.29512024 172.38737488 1.89192271 -10.45779419 172.36639404
		 1.68557644 -10.53869629 172.34884644 2.084879398 -10.39337158 172.39312744 2.27899384 -10.27539063 172.45445251
		 2.43341851 -10.17654419 172.57200623 1.41780293 -10.57069397 172.31494141 1.16578734 -10.56022644 172.30656433
		 0.91621804 -10.51716614 172.30741882 -1.61350882 -12.15588379 165.71002197 -1.60748744 -12.25909424 165.54743958
		 -1.59348416 -12.3629303 165.25274658 -1.5785253 -12.35746765 164.86618042 -1.56060326 -12.1254425 164.56864929
		 -1.547876 -11.85861206 164.37120056 -1.53259706 -11.60728455 164.12983704 -1.53090823 -11.70317078 163.72532654
		 -1.52805662 -11.75224304 163.19898987 -1.53785932 -11.67747498 162.51881409 -1.56621206 -11.3956604 161.72740173
		 -1.41893148 -10.63175964 161.031082153 -1.31674206 -9.69126892 160.83032227 -1.27409828 -8.85919189 160.88832092
		 -1.23870587 -8.083999634 160.84631348 -1.21446514 -7.3110199 160.66329956 -1.18855226 -6.91041565 159.8730011
		 -1.20831788 -6.28735352 158.94554138 6.25644588 -4.63308716 177.68153381 6.0090112686 -5.32078552 177.71105957
		 5.91793633 -5.60903931 177.30134583 0.4421213 -11.0015258789 165.95831299 -0.065310568 -11.46891785 165.92016602
		 -1.60680115 -11.93803406 165.7063446 -1.088447452 -11.87904358 165.74575806 -0.52026612 -11.75740051 165.80970764
		 1.2312758 -10.262146 166.092926025 1.078207016 -10.36126709 166.046264648 -1.28967941 -11.86824036 165.7134552
		 -1.037875533 -11.80609131 165.77314758 -0.60941166 -11.70077515 165.84080505 -0.22705238 -11.59844971 165.86367798
		 0.13464841 -11.3240509 165.94969177 0.59316939 -11.00065612793 166.012680054 0.92649221 -10.75065613 166.063919067
		 1.11856246 -10.51338196 166.12940979 1.25790989 -10.34249878 166.10993958 -0.17055601 -10.7780304 164.82424927
		 1.071821809 -9.88708496 165.88925171 0.74326634 -10.11721802 165.33114624 -1.56896877 -11.81874084 165.73233032
		 -1.54258025 -11.20246887 166.22309875 -0.32303005 -10.92590332 166.37782288 0.70749658 -10.41593933 166.38296509
		 1.14332104 -9.96607971 166.16316223 -1.53950596 -11.10881042 164.67622375 1.31583798 -8.87065125 165.74064636
		 1.17755663 -9.06968689 165.22975159 -0.2331647 -9.30821228 164.9488678 -1.50648046 -9.59605408 167.12185669
		 -0.39972547 -9.48420715 167.13043213 0.64975876 -9.20321655 166.91061401 1.17777777 -8.87738037 166.279953
		 -1.40183568 -9.4697113 164.71809387 1.24636161 -7.32499695 165.7194519 1.075758696 -7.56533813 165.20529175
		 -0.19412041 -7.77867126 165.0069122314 -1.42845213 -8.031265259 167.27003479 -0.45747244 -7.95837402 167.26838684
		 0.56610119 -7.62626648 167.06791687 1.19163072 -7.35536194 166.26002502 -1.30357039 -7.90220642 164.7805481
		 0.4409157 -6.62017822 165.7711792 0.10157656 -6.79823303 165.35617065 -0.49825504 -6.91152954 165.22094727
		 -1.35602152 -7.0572052 167.059005737 -0.59232676 -7.01184082 167.045776367 0.11721988 -6.80178833 166.91253662
		 0.52669972 -6.60238647 166.33258057 -1.25778425 -6.91850281 165.09526062 -0.1092885 -6.13221741 165.83328247
		 -0.21134052 -6.34413147 165.4909668 -0.66761768 -6.26560974 165.48413086 -1.3013221 -6.30581665 166.79484558
		 -0.6942066 -6.32165527 166.78440857 -0.19114617 -6.32038879 166.76034546 -0.077771284 -6.10517883 166.34895325
		 -1.22845364 -6.19532776 165.43206787 -1.24890077 -5.7530365 166.36935425;
	setAttr ".vt[1328:1493]" -1.2223202 -5.72135925 165.91313171 -0.71096665 -5.84461975 165.91065979
		 -0.72129983 -5.83447266 166.36779785 4.10944271 -3.14844179 160.83778381 4.88317251 -1.017005563 161.92050171
		 2.85731459 -4.50637817 159.88803101 3.19651175 3.22087097 163.085479736 1.31711495 4.6315155 163.17701721
		 0.97832996 -5.8755188 158.58096313 -1.18628323 -5.93592834 157.89297485 4.29932451 1.33520508 162.7421875
		 -1.52019167 4.90203857 163.086456299 -1.016304374 -3.82403564 185.72244263 -2.0078947544 -3.73371887 185.75921631
		 -1.57572019 -11.98028564 165.68304443 -7.9016819 -2.24333191 168.7368927 -8.017537117 -2.15647888 169.33018494
		 -8.10395145 -1.94514465 169.2711792 -7.9967742 -2.027496338 168.83428955 -8.55535316 -1.35835266 171.59570313
		 -8.58481789 -1.61442566 171.72407532 -8.64437485 -1.46650696 171.89704895 -8.60274124 -1.30209351 171.7434082
		 -8.53118992 -0.62579346 171.28349304 -8.51210785 -0.83708191 171.39727783 -8.53178024 -0.86329651 171.50163269
		 -8.5371027 -0.64562988 171.39738464 -8.61977959 -1.38941956 171.98400879 -8.60966206 -1.21679688 171.88661194
		 -8.50826931 -0.77705383 171.67105103 -8.5084343 -0.5428772 171.52728271 -8.19603825 -1.73681641 169.65557861
		 -8.16953468 -1.95420837 169.84580994 -8.29234409 -1.68913269 170.39343262 -8.23786831 -1.58244324 170.34326172
		 -8.30232334 -1.65522766 170.88845825 -8.37325668 -1.79747009 170.89175415 -8.72595882 -1.035903931 169.55795288
		 -8.77844334 -0.87503052 169.13783264 -8.43336582 -1.36984253 168.67132568 -8.39387608 -1.50128174 169.15267944
		 -8.6609869 -0.27320862 171.33677673 -8.7166748 -0.40498352 171.61477661 -8.71157455 -0.28427124 171.48439026
		 -9.063538551 -0.40760803 170.033737183 -9.012069702 -0.27293396 169.69554138 -9.36567402 -0.25634766 171.93682861
		 -9.43967342 0.027801514 172.24185181 -9.49359417 0.1366272 172.059738159 -9.3898201 -0.1620636 171.76602173
		 -9.13852692 -0.39277649 171.78581238 -9.15000725 -0.30584717 171.65097046 -8.56175137 -1.077148438 171.62800598
		 -8.53990746 -1.091598511 171.49568176 -8.59153461 -0.9944458 171.7809906 -9.30327225 -0.35430908 172.1084137
		 -9.3602705 -0.090438843 172.39962769 -9.21273327 -0.49850464 172.34843445 -9.26189423 -0.3276825 172.62065125
		 -9.10656548 -0.49568176 171.93048096 -8.38561821 -1.49276733 169.4778595 -7.96257401 -2.35467529 169.35081482
		 -7.84802008 -2.44926453 168.63682556 -7.83198452 -2.66905212 168.48271179 -7.95355511 -2.58779907 169.28977966
		 -8.25901031 -1.86502075 170.42353821 -8.15403748 -2.12944031 170.057220459 -8.15085125 -2.35121155 170.42098999
		 -8.24370098 -2.081939697 170.76271057 -8.77477169 -1.59532166 172.20376587 -8.73978043 -1.84196472 172.049240112
		 -8.9561224 -1.90222168 172.52545166 -9.035187721 -1.56248474 172.67373657 -8.41154289 -1.42324829 171.46299744
		 -8.34970284 -1.72547913 171.57284546 -8.3061285 -1.53053284 171.31660461 -8.32225704 -1.79328918 171.41996765
		 -8.38378143 -0.66119385 171.11842346 -8.43165588 -0.92947388 171.28689575 -8.22844601 -0.87591553 170.97138977
		 -8.27104473 -1.082565308 171.2121582 -9.44038296 0.016418457 171.19680786 -9.5522356 0.15617371 171.57623291
		 -9.55882835 0.44863892 171.72149658 -9.56678963 0.31750488 171.28971863 -8.47087955 -2.10197449 172.032775879
		 -8.28645611 -2.31768799 171.59529114 -8.70733547 -2.077606201 172.65945435 -8.53471947 -2.22483826 172.49087524
		 -8.65829086 -1.4662323 172.24093628 -8.72742367 -1.38221741 172.75621033 -8.68293953 -0.30979919 170.76300049
		 -8.75193596 -0.34553528 171.15380859 -8.27974606 -0.62162781 170.53063965 -9.44716454 0.088394165 170.77127075
		 -9.51780701 0.6050415 171.27587891 -9.3981781 0.18231201 170.57748413 -9.31219769 -0.12385559 170.66133118
		 -9.48331928 0.35969543 172.26937866 -9.44561863 0.24865723 172.50733948 -9.32367134 0.49624634 172.76940918
		 -9.39062595 0.60826111 172.39888 -8.4603014 -1.17227173 171.38130188 -8.3044138 -1.28842163 171.31202698
		 -9.38593388 0.077804565 172.72091675 -9.32470608 0.29127502 173.038070679 -9.35031891 -0.14112854 172.92636108
		 -9.37105846 0.076217651 173.20285034 -8.64681053 -1.050109863 169.87313843 -8.12737274 -1.25289917 171.13749695
		 -8.074566841 -1.11187744 170.95748901 -8.10583115 -1.58233643 169.89854431 -8.11851883 -1.55584717 170.36506653
		 -8.14517975 -1.63249207 170.75869751 -8.038348198 -1.015609741 170.6605835 -8.38708305 -0.89935303 170.22781372
		 -8.18919468 -1.1030426 170.29605103 -8.31712627 -1.27532959 169.89837646 -8.16732693 -1.57183838 171.17008972
		 -8.1741848 -1.40376282 171.20306396 -8.22425079 -1.4675293 169.69015503 -7.90246391 -1.39898682 170.97637939
		 -7.90699673 -1.25427246 170.91842651 -7.89930677 -1.63877869 170.22462463 -7.97407007 -1.61296082 170.41477966
		 -7.89270544 -1.66316223 170.66139221 -7.79901075 -1.26446533 170.70149231 -7.96514225 -1.26029968 170.42346191
		 -7.95448494 -1.43016052 170.190979 -7.92622232 -1.59938049 170.94377136 -8.025774002 -1.4770813 171.060577393
		 -8.022884369 -1.51165771 169.97532654 -9.4160471 -0.10641479 171.61508179 -9.53730011 0.19458008 171.84895325
		 -9.4134903 -0.081054688 171.43458557 -9.14446545 -0.21142578 171.46943665 -9.50300121 0.72605896 171.81077576
		 -9.52296066 0.42729187 171.99975586 -9.47617817 0.65704346 172.11773682 -8.63062859 -0.42533875 171.29627991
		 -8.84489632 -0.57476807 170.19511414 -9.043322563 -0.20466614 170.67692566 -9.056941986 -0.6428833 172.090286255
		 -8.76736927 -0.77288818 171.92788696 -8.7115984 -0.55271912 171.7666626 -9.20673275 -0.1350708 171.17883301
		 -8.68600845 -1.17860413 172.08140564 -8.75329304 -1.17553711 172.32157898 -8.88777828 -0.89045715 172.18785095
		 -9.064358711 -1.002166748 172.67611694 -8.32887173 -1.80332947 171.21974182 -8.2946682 -1.65080261 171.15858459
		 -8.25795269 -2.10958862 171.25128174 -8.18522739 -1.68765259 171.092330933 -8.0061979294 -1.66522217 170.9128418
		 -8.070699692 -1.96678162 168.55259705 -7.882092 -2.22660828 168.2641449 -7.84112787 -2.042556763 167.88946533
		 -8.19360828 -1.82090759 168.16239929 -7.87682915 -1.62870789 167.71998596 -8.21417236 -1.49884033 167.8901825
		 -8.60319138 -1.088821411 168.39779663 -8.3897562 -1.091918945 167.98692322 -8.63745022 -0.73042297 168.23298645
		 -8.1741991 -1.06060791 167.86421204 -8.37708855 -0.60171509 168.16400146;
	setAttr ".vt[1494:1659]" -7.6556983 -2.18455505 167.72750854 -7.76054668 -2.37457275 168.054077148
		 -7.59197474 -2.30984497 167.51779175 -7.72293043 -2.51434326 167.85696411 -7.81783056 -1.20603943 167.82450867
		 -7.60292101 -1.80117798 167.65441895 -7.45324612 -1.35131836 167.81338501 -7.44925451 -1.9425354 167.44300842
		 -8.031288147 -0.72712708 168.25134277 -7.65767097 -0.82278442 168.31799316 -9.11262226 0.12348938 169.16975403
		 -9.03031826 -0.13121033 169.38499451 -9.52012253 0.4884491 170.29612732 -9.53210354 0.69874573 170.16656494
		 -9.70853996 1.16645813 171.21180725 -9.59294796 0.91680908 171.26220703 -9.59379864 1.079040527 171.90162659
		 -9.7645092 1.35174561 172.0035095215 -9.56165791 1.47149658 172.07194519 -9.4667654 1.27003479 171.18667603
		 -8.90884781 0.31874084 169.1557312 -9.23235798 0.7782135 170.1917572 -9.36109352 0.36679077 170.41624451
		 -9.4457798 0.81838989 171.27674866 -9.35792351 1.02355957 171.88746643 -8.78458118 -0.64425659 168.83078003
		 -8.84152985 -0.35142517 168.59710693 -8.56673908 -0.21728516 168.56678772 -9.29054737 1.40380859 171.99595642
		 -9.2277832 1.16192627 171.25959778 -9.0010643005 0.63380432 170.31851196 -8.63541889 0.18507385 169.32783508
		 -8.23527622 -0.35636902 168.70465088 -9.68137169 1.055053711 172.34692383 -9.72862625 1.30456543 172.45339966
		 -9.51749229 1.39146423 172.53749084 -9.38790798 1.033859253 172.3036499 -9.41199684 0.96478271 172.66537476
		 -9.26002216 1.3735199 172.47291565 -8.96060944 0.9783783 171.93666077 -8.89573288 0.79179382 171.34034729
		 -8.66754436 0.52323914 170.46801758 -8.29278755 0.087417603 169.50289917 -7.96419048 -0.51713562 168.93464661
		 -9.075521469 1.078262329 172.82467651 -9.0070495605 1.088607788 172.39985657 -9.29517841 1.25210571 172.8659668
		 -8.71174335 0.76698303 171.98043823 -8.62694454 0.62478638 171.37365723 -8.41980267 0.73175049 172.24229431
		 -8.36319637 0.67709351 171.47982788 -8.45527172 0.52116394 170.54750061 -8.14516544 0.11262512 169.60528564
		 -8.21529007 0.50646973 170.60121155 -8.84091759 0.88119507 172.94792175 -8.77880192 0.9074707 172.50747681
		 -8.69226551 0.88873291 173.32284546 -8.55988121 0.86357117 172.85011292 -7.98614836 0.1603241 169.64720154
		 -9.16893673 -0.87269592 173.025787354 -9.04084301 -1.081100464 173.26013184 -9.59903622 -0.65774536 173.43461609
		 -9.36418629 -0.545578 173.37675476 -9.3324852 -1.27908325 173.20181274 -9.66794777 -0.76586914 173.60284424
		 -9.25819111 -1.60218811 173.21263123 -9.44942951 -1.070480347 173.73554993 -9.72502422 1.20736694 172.82235718
		 -9.70675468 0.97451782 172.70167542 -9.73118305 0.81896973 172.96362305 -9.73473835 1.027313232 173.16716003
		 -9.85627747 0.42500305 173.57731628 -9.77146339 0.36567688 173.3613739 -9.76934052 0.016387939 173.42378235
		 -9.8620224 0.032165527 173.64077759 -9.72254658 0.40576172 173.80400085 -9.75064468 -0.011077881 173.91213989
		 -9.55080891 1.057388306 173.33654785 -9.51074886 1.28462219 172.91586304 -9.41871929 0.82240295 173.0005645752
		 -9.48493576 0.29489136 173.33183289 -9.5192709 0.0014648438 173.38661194 -9.64335155 0.7504425 173.62052917
		 -9.80152988 0.76387024 173.40921021 -9.72731018 0.63465881 173.20977783 -9.49172688 0.56271362 173.22052002
		 -8.95702171 -1.74554443 173.26112366 -8.79613876 -1.96984863 173.2204895 -9.47694969 -0.154953 174.046585083
		 -9.45938969 0.3334198 173.94216919 -9.33610535 1.004776001 173.37194824 -9.41800117 0.70509338 173.71606445
		 -9.82021523 -0.30899048 173.64715576 -9.73760796 -0.26182556 173.45162964 -9.68890953 -0.45397949 173.89459229
		 -9.45176601 -0.19717407 173.41786194 -9.39888 -0.63340759 173.98747253 -9.14543724 -1.22998047 173.74760437
		 -9.31211567 -0.25831604 174.018447876 -9.2979393 0.21954346 173.91270447 -9.12231731 0.90658569 173.30906677
		 -9.21114922 0.57263184 173.66668701 -9.20423794 -0.72567749 173.93901062 -9.075709343 0.055358887 173.9521637
		 -9.11919785 -0.36680603 174.073028564 -9.14663315 -0.62818909 174.3243103 -9.059501648 -0.097717285 174.34204102
		 -8.9344244 0.73492432 173.34161377 -8.79319382 0.6880188 173.72242737 -8.96985054 0.44143677 173.64712524
		 -8.9193716 0.35639954 174.077926636 -9.11254406 -1.071487427 174.11520386 -9.091077805 -0.67744446 173.96328735
		 -9.007598877 -1.42185974 173.80693054 -7.66171169 -0.37265015 168.93119812 -7.53402901 -1.59326172 170.57154846
		 -3.78543019 -11.10676575 168.58776855 -3.19374537 -11.53886414 168.66497803 -3.1496942 -11.62686157 168.97201538
		 -3.34888864 -11.4425354 169.25592041 -3.025588512 -11.94325256 169.36871338 -3.1508379 -11.96932983 169.067581177
		 -3.076274872 -12.41156006 169.081085205 -2.90333223 -12.44882202 169.40348816 -3.17821741 -12.44140625 168.76312256
		 -3.26688862 -12.021255493 168.72485352 -2.14772725 -12.60714722 167.93606567 -2.3684094 -12.29252625 167.8565979
		 -2.37081385 -12.31336975 167.53631592 -2.077259064 -12.71037292 167.78269958 -3.2060616 -12.066207886 168.34869385
		 -3.11269045 -12.47712708 168.43234253 -2.93387294 -11.74720764 167.97613525 -3.42268801 -11.51823425 167.56736755
		 -2.89091945 -11.90364075 167.51365662 -2.6764946 -12.0065460205 167.8474884 -2.97186446 -12.14460754 168.1282196
		 -2.91226315 -12.50115967 168.26419067 -3.12053061 -11.56208801 168.29263306 -3.64795876 -11.24632263 168.01890564
		 -2.89202094 -13.16357422 168.76748657 -2.77679825 -13.47200012 168.84790039 -2.81025958 -13.22407532 169.13716125
		 -2.91597605 -13.045043945 169.0099945068 -2.63338089 -13.80708313 168.97943115 -2.62981963 -13.50093079 169.32125854
		 -2.65423059 -13.27430725 168.37142944 -2.63782334 -13.63604736 168.46875 -2.33754539 -13.22709656 168.21914673
		 -2.37206793 -13.43107605 168.20300293 -2.56748939 -13.097900391 168.29840088 -2.16461205 -13.15422058 168.1182251
		 -2.10393143 -13.37347412 168.061798096 -2.01897645 -13.076217651 167.93130493 -2.098669052 -12.93112183 168.021148682
		 -2.8470695 -12.88726807 169.31086731 -2.98307943 -12.77793884 169.05279541 -3.029314995 -12.8013916 168.76976013
		 -2.76649189 -12.79992676 168.36080933 -2.92474842 -12.84236145 168.46998596 -4.39996338 -11.27075195 173.32402039
		 -4.66439629 -11.65638733 173.86950684 -5.25645638 -11.36190796 173.92723083 -4.93726397 -11.15681458 173.42401123
		 -3.92325997 -11.92736816 173.66981506 -3.79234052 -11.28927612 173.13337708;
	setAttr ".vt[1660:1825]" -4.91972589 -11.52838135 174.95129395 -5.48712826 -11.14242554 174.79853821
		 -4.25160074 -11.88769531 175.096435547 -5.27022028 -11.2276001 176.21478271 -4.53918314 -11.60220337 176.43710327
		 -5.88405704 -10.75683594 175.9647522 -3.53302884 -12.1214447 175.33081055 -3.75171685 -11.81437683 176.6186676
		 -6.34908724 -9.98420715 172.73828125 -6.025289059 -10.17114258 172.82099915 -6.18228579 -10.30621338 172.89440918
		 -6.3722086 -10.13735962 172.85168457 -5.76502132 -10.24429321 172.54492188 -5.8447094 -10.18869019 172.58668518
		 -6.094584465 -9.98416138 172.42051697 -5.94512987 -10.081573486 172.43101501 -6.22279263 -9.81034851 172.30131531
		 -6.063549042 -9.91531372 172.3495636 -5.94687939 -10.11581421 172.69606018 -6.26278925 -9.71411133 172.58862305
		 -5.64019728 -10.3752594 172.79008484 -5.67984724 -10.3046875 172.91412354 -5.49551535 -10.3994751 172.62695313
		 -5.57290173 -10.41075134 172.69317627 -6.78578663 -9.72862244 172.78819275 -6.66025257 -10.0031585693 172.94644165
		 -7.1946044 -9.28216553 172.96629333 -7.033582211 -9.68701172 173.15353394 -6.85643053 -9.45687866 172.57528687
		 -6.93788004 -9.20266724 172.36413574 -6.39276743 -9.48126221 172.34762573 -7.29459095 -8.91871643 172.71821594
		 -7.38106871 -8.60638428 172.43309021 -6.42477179 -10.27816772 173.047195435 -6.77086449 -10.10159302 173.28482056
		 -8.19973755 -2.94509888 170.33892822 -8.29257965 -2.83790588 171.59033203 -8.56502819 -2.78395081 172.53211975
		 -1.7981149 -13.065002441 167.65248108 -1.82783484 -12.75396729 167.4284668 -2.036024332 -12.59844971 167.44190979
		 -1.94157541 -12.93469238 167.68516541 -3.54605722 -11.61936951 166.65657043 -3.11334467 -11.93226624 166.7325592
		 -3.045737028 -11.91372681 167.10049438 -3.54274511 -11.59855652 167.043121338 -2.67561555 -12.20359802 166.76319885
		 -2.57432604 -12.23733521 167.12519836 -1.88719428 -12.52804565 167.1240387 -1.93207133 -12.41171265 166.78051758
		 -2.28795505 -12.37174988 166.76719666 -2.18906784 -12.42658997 167.11291504 -1.95015752 -13.28878784 167.84968567
		 -2.12355614 -13.69598389 168.0079650879 -1.82233834 -13.42532349 167.7797699 -1.90490043 -13.82218933 167.93225098
		 -6.95374393 -0.030883789 166.36485291 -7.13781595 -0.8369751 166.90640259 -7.48429441 0.0062103271 168.3228302
		 -7.21171999 0.6945343 167.98246765 -7.76176405 0.64463806 169.52780151 -7.53071022 1.33477783 169.47685242
		 -7.087024689 -1.67541504 166.62927246 -7.27876139 -2.22840881 166.62031555 -7.48852015 -2.6043396 166.90710449
		 -7.66663551 -2.89416504 167.35986328 -7.85786486 -3.10960388 168.094329834 -7.83378267 -3.91268921 167.38702393
		 -7.56525564 -3.58006287 166.51980591 -7.30708885 -3.22491455 165.92897034 -7.29595518 2.11154175 169.55360413
		 -6.71669245 1.50700378 167.75100708 -8.07505703 -3.125 169.059204102 -4.071208477 7.25515747 173.28718567
		 -3.87038302 6.73410034 171.053894043 -4.68238211 6.3182373 170.93525696 -4.88373232 6.72923279 173.15072632
		 -3.6348629 6.11431885 168.89689636 -4.29512739 5.55134583 168.89239502 -4.74356079 4.92112732 168.86384583
		 -5.32207251 5.81459045 170.76844788 -5.21431971 4.39100647 168.6990509 -5.53581715 3.76675415 168.5827179
		 -6.19092798 4.66409302 170.39407349 -5.8453064 5.27618408 170.57772827 -6.033319473 5.7315979 172.73150635
		 -6.42204666 5.21174622 172.44613647 -5.50170326 6.21011353 172.97268677 -3.03998208 7.73573303 173.3598938
		 -2.86288285 7.19816589 171.058029175 -2.62082839 6.36557007 168.94645691 -7.41381693 3.32644653 171.3815155
		 -7.046539783 4.014175415 171.73312378 -6.73348761 3.39797974 170.12649536 -7.055265427 2.7855835 169.96231079
		 -1.90343761 8.026550293 173.41522217 -1.72986615 7.36761475 171.098831177 -1.5462445 6.4637146 168.98002625
		 -9.51941109 -1.062973022 175.70257568 -9.47052288 -0.095046997 175.82032776 -9.21947098 -0.18566895 174.97335815
		 -9.23213673 -0.97309875 174.90328979 -8.10080719 2.073547363 171.96850586 -8.17194271 1.29631042 171.6812439
		 -8.28807068 1.41009521 172.59179688 -8.2663765 2.16239929 173.041137695 -7.99065542 1.05921936 170.67446899
		 -7.86634016 1.81365967 170.7980957 -8.73673439 1.79008484 174.7348175 -8.67202759 1.24949646 173.97062683
		 -8.91141415 0.94935608 174.44987488 -9.025818825 1.33630371 175.31007385 -9.06863308 0.46838379 174.79916382
		 -9.33824921 0.70721436 175.66030884 -9.22340393 2.18409729 178.42234802 -9.26358128 2.013259888 177.35328674
		 -9.53046608 0.95080566 177.80122375 -9.41725445 0.88191223 178.93988037 -7.43357372 4.32171631 173.45492554
		 -7.62594366 3.59454346 172.91151428 -4.45205545 7.79325867 175.61083984 -5.27160931 7.18530273 175.40109253
		 -3.36899447 8.37437439 175.76989746 -5.91259718 6.62136841 175.16192627 -6.41673708 6.055999756 174.89630127
		 -2.1021018 8.56648254 175.87463379 -6.75679636 5.45773315 174.5491333 -7.95396805 3.722229 174.33433533
		 -7.62352705 4.26597595 175.16490173 -8.82096958 3.24859619 177.60177612 -8.76173973 2.81782532 176.62135315
		 -6.28133059 2.61264038 168.59683228 -6.69337416 2.26742554 168.81838989 -8.48513699 2.078262329 173.97183228
		 -8.51159286 1.41874695 173.34095764 -8.12818336 3.90788269 176.52886963 -8.29145718 3.42201233 175.61482239
		 -7.79921675 4.14161682 180.43095398 -7.3464613 5.31192017 178.83201599 -7.7908082 4.92224121 178.14265442
		 -8.25204086 3.87911987 179.53038025 -6.81457806 5.91532898 176.98120117 -7.23144197 5.40621948 176.47190857
		 -6.30419636 6.46058655 177.41903687 -6.66898775 5.61520386 179.45370483 -5.5084796 6.84495544 177.80218506
		 -5.75555229 5.80186462 179.96127319 -4.58679008 7.38589478 178.17668152 -4.7990346 6.30343628 180.53416443
		 -3.38354158 7.60267639 178.3817749 -2.18382406 7.8150177 178.5239563 -3.65182161 6.56489563 180.89024353
		 -2.43250036 6.63461304 181.031265259 -5.90502214 3.17826843 168.51171875 -6.41993046 4.015136719 170.24971008
		 -6.74006033 4.65403748 172.075668335 -7.13034534 4.90032959 174.016067505 -7.47579861 4.85618591 175.86611938
		 -8.051691055 4.43669128 177.36425781 -8.63547707 3.57499695 178.57914734 -8.99787521 2.29582214 179.49589539
		 -9.70071983 -0.071929932 176.81103516 -9.42617989 0.89045715 176.69551086 -9.79107475 -0.24182129 177.91372681
		 -9.17834854 1.71847534 176.27420044 -7.72305679 2.59590149 171.02104187;
	setAttr ".vt[1826:1991]" -7.92750025 2.8447113 172.37576294 -8.11231327 2.93902588 173.63172913
		 -8.80567455 2.35990906 175.6153717 -8.47434139 2.8200531 174.71562195 -6.14272499 -9.71192932 171.39703369
		 -5.79622507 -9.91195679 171.31816101 -5.57685471 -10.18127441 171.52053833 -5.89058685 -10.026580811 171.59335327
		 -5.38667679 -10.08895874 171.2729187 -5.21076155 -10.30664063 171.49464417 -4.92186928 -10.21284485 171.30065918
		 -4.41273022 -10.30014038 171.37814331 -4.38733387 -10.41204834 171.58666992 -4.80457926 -10.3866272 171.5227356
		 -5.11660671 -10.07460022 170.69520569 -4.52367306 -10.23588562 170.8611145 -4.47208929 -10.21409607 171.13786316
		 -5.027136803 -10.068695068 171.033828735 -5.57846308 -9.896698 170.97857666 -5.76023436 -9.84880066 170.5705719
		 -6.067197323 -9.65077209 170.993927 -6.3820982 -9.4967804 170.54429626 -6.81601143 -9.042648315 170.65422058
		 -6.46084642 -9.37678528 171.088516235 -2.97806787 -10.76016235 171.94424438 -3.14429069 -10.65762329 171.63934326
		 -3.020796299 -10.87191772 171.58050537 -2.82516527 -10.94416809 171.92097473 -4.97869301 -10.28878784 169.88691711
		 -4.29547358 -10.52546692 170.2835083 -4.48007393 -10.34440613 170.56848145 -5.11550474 -10.15216064 170.30374146
		 -7.48478603 -8.0493927 170.39071655 -7.11820364 -8.66456604 170.030075073 -7.10251999 -8.63653564 170.90315247
		 -7.705091 -7.63404846 170.89819336 -7.2967968 -8.36341858 171.2855072 -7.96959019 -6.86854553 170.4047699
		 -7.73643017 -7.43643188 169.74855042 -8.15366936 -6.098724365 169.87039185 -7.88254642 -6.7616272 169.030487061
		 -8.048104286 -6.55337524 171.13235474 -8.33052826 -5.74284363 170.78552246 -7.99127436 -6.49345398 171.86172485
		 -8.35752106 -5.57774353 171.70252991 -7.74086714 -7.45718384 171.45361328 -7.37392569 -8.26565552 171.70579529
		 -2.78890991 -10.99639893 172.22123718 -2.99239922 -10.80688477 172.22241211 -5.8341341 -9.83773804 170.04699707
		 -5.73781347 -9.92277527 169.44786072 -6.55753994 -9.32443237 169.89387512 -6.57939959 -9.17658997 168.93737793
		 -7.30734968 -8.18182373 169.22315979 -5.97303009 -9.57983398 168.32646179 -5.41579962 -10.11662292 168.97433472
		 -6.75490332 -8.3997345 167.90864563 -6.20546007 -8.9992981 167.51037598 -7.39297676 -7.56079102 168.35087585
		 -4.020684719 -10.3759613 171.016983032 -3.93611813 -10.48005676 170.82110596 -3.71187925 -10.65376282 170.70021057
		 -3.97590566 -10.34086609 171.25120544 -3.67719841 -10.47433472 171.10626221 -3.50225782 -10.50366211 171.32232666
		 -3.62342143 -10.53964233 170.99986267 -3.35911393 -10.71156311 171.13545227 -8.50613499 -4.85844421 170.44801331
		 -8.25420666 -5.2769165 169.29971313 -7.71091461 -7.491745 172.0026092529 -7.40088415 -8.36000061 172.09022522
		 -7.70520639 -7.75337219 172.51176453 -7.94180298 -6.7111969 172.5712738 -7.65091181 -8.14660645 172.93083191
		 -7.90897036 -7.16699219 173.15794373 -8.31837559 -5.6632843 172.57102966 -8.2477541 -6.088851929 173.34104919
		 -4.68803453 -10.95620728 173.15820313 -5.46483374 -11.011688232 173.44786072 -5.17922211 -10.88453674 173.18275452
		 -4.45537853 -10.62736511 172.92340088 -4.49534798 -10.61965942 172.97119141 -4.92121744 -10.59736633 173.0024871826
		 -4.87798166 -10.61270142 172.94566345 -4.38621473 -10.67883301 172.73178101 -4.42016983 -10.67056274 172.86323547
		 -4.84242725 -10.64945984 172.81182861 -4.82511091 -10.66285706 172.77879333 -4.50858021 -10.82939148 173.019760132
		 -4.99478483 -10.77450562 173.054763794 -5.67152309 -10.74372864 173.17048645 -5.97898531 -10.79736328 173.42912292
		 -5.27544212 -10.51823425 172.86003113 -5.32606649 -10.50619507 172.94308472 -5.22546387 -10.52807617 172.77207947
		 -5.18284273 -10.52589417 172.73420715 -5.45628262 -10.62483215 173.041870117 -6.093423367 -10.54481506 173.12347412
		 -6.40766382 -10.47921753 173.38157654 -5.87062025 -10.48840332 172.96618652 -2.33401847 -14.27908325 168.61071777
		 -2.38827634 -14.18559265 169.12362671 -2.53884077 -13.95231628 168.56967163 -2.1107347 -14.030197144 169.6428833
		 -2.12233686 -14.3405304 169.17955017 -2.084259748 -14.42860413 168.61419678 -2.0056591034 -14.20973206 168.18104553
		 -2.36942768 -13.85125732 169.54116821 -2.39099765 -13.72312927 168.21282959 -2.21961689 -14.10339355 168.22479248
		 -2.39786148 -13.95558167 168.30136108 -2.9197793 -11.04637146 172.56137085 -3.20120001 -11.11860657 172.86943054
		 -3.38657093 -10.890625 172.75178528 -3.12438917 -10.83163452 172.51628113 -4.11590576 -10.60527039 172.87976074
		 -4.15520859 -10.77726746 172.94212341 -4.061355114 -10.61047363 172.59986877 -4.078414917 -10.58808899 172.72395325
		 -4.075652599 -10.55859375 172.81529236 -4.25468826 -10.97097778 173.073562622 -3.80576563 -10.75067139 172.8263855
		 -3.79742455 -10.59051514 172.75863647 -3.79927254 -10.94174194 172.94563293 -3.50119328 -10.71586609 172.67753601
		 -3.57081437 -10.58476257 172.60784912 -3.43146062 -10.592453 172.41915894 -3.2990551 -10.70301819 172.48233032
		 -3.19245911 -10.66217041 172.25550842 -3.35835528 -10.55151367 172.18862915 -3.51818752 -10.52011108 172.33555603
		 -3.47285056 -10.49754333 172.1363678 -3.62235093 -10.47236633 172.328125 -3.71011019 -10.50613403 172.46170044
		 -3.74199867 -10.4670105 172.40753174 -3.6763835 -10.42156982 172.31793213 -3.83531785 -10.5397644 172.59979248
		 -3.85467076 -10.540802 172.50241089 -3.78574276 -10.4839325 172.72476196 -4.26954174 -10.9172821 167.59761047
		 -4.11099482 -11.12957764 167.21972656 -4.75744534 -10.61233521 167.11627197 -5.011481285 -10.40203857 167.40263367
		 -5.33385563 -10.1105957 166.78485107 -5.053452015 -10.3391571 166.61787415 -4.51212025 -10.70776367 167.99995422
		 -5.77407932 -9.40653992 167.21954346 -5.50120354 -9.81939697 167.96484375 -3.93974447 -11.24053955 166.51617432
		 -4.025803089 -11.22358704 166.83361816 -4.46828651 -10.42800903 166.19302368 -4.25258541 -10.84292603 166.3589325
		 -4.37928247 -10.82569885 166.58171082 -4.59144783 -10.4548645 166.30212402 -5.23151064 -10.097244263 167.68798828
		 -5.56454325 -9.79194641 166.98527527 -4.78905678 -10.45896912 168.33456421 -4.53402281 -10.75357056 166.84727478
		 -4.77837753 -10.4571228 166.44160461 -4.73264027 -10.4705658 169.51728821 -5.057693958 -10.27404785 168.609375
		 -4.46040154 -10.63244629 169.18833923 -4.19713354 -10.83309937 168.90734863 -4.016432285 -10.71759033 169.99789429
		 -3.38061571 -11.17253113 170.56742859 -3.80139017 -10.91188049 169.68513489;
	setAttr ".vt[1992:2157]" -3.30352783 -11.40487671 170.13897705 -3.25179815 -11.56759644 169.85726929
		 -3.63410735 -11.14492798 169.43925476 -3.21031237 -11.67475891 169.65759277 -2.67810464 -11.89030457 165.74012756
		 -3.16404605 -11.45378113 165.78276062 -3.18977165 -11.56158447 165.62901306 -2.62974477 -12.022262573 165.57995605
		 -3.64793587 -10.93185425 165.73184204 -3.64813709 -10.88529968 165.81947327 -9.85013676 -1.51869202 177.72628784
		 -10.0014867783 -2.0082855225 178.86947632 -9.8203392 -0.50662231 179.099502563 -9.35997772 -1.94241333 175.34761047
		 -9.1642971 -1.60255432 174.59046936 -8.98038673 -2.12481689 174.14752197 -9.14749622 -2.86190796 174.86030579
		 -9.83042526 -2.75003052 177.32566833 -9.8947258 -3.41537476 178.3706665 -9.80582714 -4.086181641 179.50547791
		 -9.78054905 -2.55505371 180.069824219 -8.52344036 -5.81555176 174.46444702 -8.92374516 -4.95858765 175.35571289
		 -8.80280209 -3.80513 173.93789673 -8.58603573 -5.083374023 173.57237244 -9.39418507 -3.69519043 176.094009399
		 -9.70763111 -1.17108154 176.6506958 -9.65304852 -2.23187256 176.27252197 -8.53763771 -4.69306946 172.58869934
		 -8.61216831 -4.67425537 171.55647278 -8.57511711 -3.6738739 172.63920593 -8.55118942 -3.68869019 171.49938965
		 -8.78453922 -2.59098816 173.42074585 -3.148453 -11.56652832 173.042129517 -2.49358177 -12.21896362 175.62252808
		 -2.40408707 -12.45129395 174.58262634 -2.57740927 -11.96607971 176.75750732 -2.9749589 -12.19732666 175.51683044
		 -3.11458707 -11.89898682 176.69364929 -3.27928567 -12.24507141 174.1076355 -2.79458976 -12.39476013 174.41767883
		 -2.92783475 -11.9942627 173.27836609 -9.1096735 -1.23953247 181.36927795 -9.37540913 -3.18869019 181.21757507
		 -8.57657909 -3.92056274 182.22055054 -8.20808029 -1.74801636 182.17366028 -7.42737389 -2.265625 183.16799927
		 -7.70615339 -4.63121033 183.1085968 -8.2372303 0.40112305 182.10081482 -8.93784714 0.63519287 181.1690979
		 -8.19944954 2.46809387 181.60707092 -8.68231869 2.41668701 180.58732605 -4.73067856 -3.37393188 185.30699158
		 -4.93062782 -5.9835968 185.39416504 -3.86832166 -6.1554718 185.66870117 -3.74205065 -3.657547 185.74163818
		 -5.74372435 -3.055648804 184.79847717 -6.0017271042 -5.69087219 184.9080658 -6.6254673 -2.70968628 184.077682495
		 -6.91993046 -5.22087097 184.062759399 -7.5235343 0.17015076 183.14701843 -6.63891077 -0.024475098 184.053207397
		 -5.6071229 -0.27578735 184.64498901 -4.50893688 -0.61572266 185.17364502 -3.28472614 -1.35266113 185.51670837
		 -7.40755558 2.44941711 182.52456665 -6.40481853 2.39360046 183.29899597 -5.31709242 2.31634521 183.91921997
		 -4.18747234 2.26127625 184.44502258 -2.94619799 2.16275024 184.82299805 -4.98404312 4.62362671 182.43037415
		 -3.87661481 4.73649597 182.92926025 -2.63396883 4.57164001 183.091018677 -6.12061644 4.57827759 181.96443176
		 -7.088891983 4.38668823 181.27001953 -9.63131809 -0.82757568 180.3109436 -9.32208061 0.79957581 180.081207275
		 -6.83526611 -9.28556824 179.027084351 -6.71901512 -9.85809326 178.21217346 -5.97356892 -10.52960205 178.54391479
		 -6.05125761 -9.98231506 179.40589905 -7.46352816 -8.51994324 178.54206848 -7.34427691 -9.14385986 177.80221558
		 -5.74739599 -10.95758057 177.58184814 -6.4446969 -10.33003235 177.30900574 -7.80195618 -8.35063171 177.30836487
		 -8.0040597916 -7.77632141 177.94694519 -2.80125093 -12.63430786 169.77127075 -3.0037305355 -12.085601807 169.76246643
		 -3.14263821 -11.29801941 171.1600647 -2.2909615 -12.89614868 171.31260681 -2.27028394 -13.11167908 170.89413452
		 -2.56033492 -12.87223816 170.233078 -2.93333197 -12.13345337 170.11566162 -2.96018124 -11.93452454 170.88928223
		 -2.9333055 -12.042633057 170.47337341 -2.59259081 -12.66140747 170.70237732 -2.63102531 -12.51300049 171.13485718
		 -2.27613401 -12.69168091 171.71011353 -2.92410707 -11.33482361 171.61669922 -2.59572029 -12.40481567 171.56884766
		 -2.87592053 -11.88064575 171.33699036 -2.21565986 -12.49438477 172.06880188 -2.75311303 -11.80693054 171.7598877
		 -2.49196243 -12.28829956 171.96961975 -2.66799998 -13.12501526 169.58909607 -2.12107348 -13.67350769 170.046264648
		 -2.18946505 -13.33309937 170.44903564 -2.40321112 -13.43644714 169.88677979 -3.82818913 -10.76330566 165.14724731
		 -3.32879734 -11.2948761 164.75959778 -3.27515173 -11.4609375 164.9367981 -3.75573587 -10.87304688 165.29177856
		 -4.047581196 -10.381073 164.60980225 -3.41451645 -10.85896301 164.13493347 -3.35758376 -11.091567993 164.48713684
		 -3.91466045 -10.59996033 164.9158783 -4.15078402 -10.27178955 165.57368469 -4.21396017 -10.20648193 165.48719788
		 -4.32451582 -10.078140259 165.33534241 -4.47043657 -9.9356842 165.14103699 -2.64151525 -11.90316772 164.6690979
		 -2.642308 -11.67532349 164.46766663 -2.092634916 -12.069213867 164.57789612 -2.06683445 -11.82470703 164.37243652
		 -2.7211628 -11.26370239 163.85899353 -2.68434811 -11.44577026 164.22821045 -2.13508344 -11.58374023 163.73918152
		 -2.073075056 -11.58561707 164.13206482 -4.3443408 -10.47366333 171.88806152 -4.076230526 -10.44245911 171.95927429
		 -4.073449612 -10.31687927 172.033920288 -4.31139898 -10.35232544 171.97068787 -4.3714242 -10.46073914 171.75778198
		 -4.020307064 -10.41145325 171.70173645 -4.065701485 -10.43756104 171.83778381 -3.58000541 -10.4354248 172.20175171
		 -3.65467548 -10.39054871 172.23632813 -3.38561559 -10.5171814 172.0038604736 -3.51481533 -10.49049377 172.040145874
		 -3.69800925 -10.40826416 172.055953979 -3.61780739 -10.42158508 172.11672974 -3.67947602 -10.36820984 172.17204285
		 -3.74774313 -10.34843445 172.12443542 -3.50083566 -10.48083496 171.89401245 -3.60186315 -10.46058655 171.96659851
		 -3.83965325 -10.29920959 172.089950562 -3.83053899 -10.41752625 172.021774292 -3.79035091 -10.4400177 171.91055298
		 -3.7204597 -10.44104004 171.81163025 -1.95362747 -12.42181396 166.42875671 -2.32909036 -12.35351563 166.42564392
		 -2.71857977 -12.18292236 166.42225647 -3.12675977 -11.93347168 166.40066528 -3.51988649 -11.61100769 166.34761047
		 -2.16162276 -12.081375122 165.72203064 -2.12199259 -12.20106506 165.5546875 -1.87849092 -12.17692566 165.83708191
		 -2.19929338 -12.12329102 165.84465027 -2.14339757 -11.92459106 165.70967102 -1.85601068 -11.95480347 165.69407654
		 -1.92936969 -12.34634399 166.0962677 -2.59076142 -11.96624756 165.8601532 -2.97304511 -11.71409607 165.87072754
		 -2.88864112 -11.57836914 165.7671814 -2.50872707 -11.80052185 165.74105835;
	setAttr ".vt[2158:2323]" -3.075852633 -11.86759949 166.10542297 -2.67438698 -12.12236023 166.10684204
		 -3.32346439 -11.39361572 165.88182068 -3.23366189 -11.26304626 165.78904724 -3.4422729 -11.53985596 166.095123291
		 -2.28823376 -12.26976013 166.10092163 -8.43280029 -3.89248657 170.2134552 -8.14495945 -4.30377197 168.63829041
		 -3.23541594 -11.56874084 165.15161133 -2.64529681 -12.081619263 164.94824219 -2.1144712 -12.29109192 164.8706665
		 -2.64880443 -12.12075806 165.29467773 -3.21613455 -11.59886169 165.40100098 -2.12176037 -12.32344055 165.26098633
		 -7.99179363 -7.44673157 174.48982239 -7.57457972 -8.38302612 173.93759155 -7.31164074 -9.080352783 174.21040344
		 -7.72182226 -8.19613647 174.91094971 -8.21234322 -7.4251709 175.63331604 -8.36412048 -6.63136292 175.10545349
		 -7.39899778 -8.93101501 175.25445557 -7.9083786 -8.17320251 176.13626099 -6.97793245 -9.70887756 174.40963745
		 -7.52748394 -8.60884094 173.26089478 -7.35624456 -9.16278076 173.50317383 -7.78617144 -7.72819519 173.60420227
		 -7.12331915 -9.76499939 173.67799377 -8.14312077 -6.72012329 173.98135376 -5.073356152 -11.012390137 178.76704407
		 -5.14689779 -10.49182129 179.68281555 -2.79573822 -11.36906433 180.13825989 -2.7159059 -11.54168701 179.053039551
		 -2.66211176 -11.81361389 177.93664551 -4.25506687 -10.76870728 179.88137817 -4.17082977 -11.28289795 178.90734863
		 -3.38601804 -11.45089722 178.98503113 -3.4799974 -11.056900024 180.038818359 -4.00187397 -11.63800049 177.86312866
		 -3.26396918 -11.73464966 177.89353943 -4.90210485 -11.44145203 177.7552948 -7.21081114 -8.31863403 180.51663208
		 -6.90321922 -8.68249512 179.80093384 -6.14149141 -9.43797302 180.26806641 -6.51111746 -9.19096375 181.056106567
		 -5.30516243 -10.18299866 180.62619019 -5.94457674 -10.34082031 181.6738739 -7.94734621 -7.58627319 179.88215637
		 -7.62058449 -7.95056152 179.23306274 -3.0054936409 -11.34107971 182.56176758 -2.91335297 -11.64474487 181.28897095
		 -5.020791531 -11.094177246 182.11582947 -4.50061464 -10.8122406 180.91529846 -3.73996425 -11.47683716 181.15730286
		 -3.93135595 -11.39102173 182.40827942 -8.47236538 -6.79367065 179.082504272 -8.17848492 -7.22862244 178.52355957
		 -8.76139927 -6.084640503 175.77410889 -8.95021915 -6.0073852539 176.30825806 -9.10036659 -5.42991638 176.37686157
		 -7.37035322 -7.015045166 183.78289795 -6.37366533 -7.57292175 184.57069397 -6.41738415 -10.18040466 182.71917725
		 -6.32632685 -8.92120361 183.84866333 -7.5354414 -8.32844543 183.19888306 -7.15121078 -9.13746643 182.028198242
		 -8.9367857 -5.56462097 181.80220032 -8.17535877 -6.30233765 182.79762268 -7.73163891 -8.057998657 181.26641846
		 -8.4134798 -7.54499817 182.28843689 -8.96347427 -6.69619751 181.20600891 -8.38710499 -7.2348938 180.51173401
		 -3.065127134 -9.83007813 184.7756958 -3.049654961 -10.68562317 183.69540405 -2.94428539 -6.24951172 185.83140564
		 -2.98355818 -8.30989075 185.37301636 -5.15587664 -7.9538269 185.062698364 -5.085456848 -10.5370636 183.29975891
		 -5.1715436 -9.45225525 184.42019653 -3.98074031 -8.15263367 185.27313232 -3.99608302 -10.67414856 183.66648865
		 -4.044951916 -9.70246887 184.73561096 -9.48379421 -4.79034424 180.69346619 -9.39242744 -5.82060242 180.12968445
		 -9.0017795563 -6.48501587 179.60224915 -9.13057518 -6.20361328 178.24041748 -8.78674984 -6.63642883 177.78977966
		 -9.40673542 -5.51063538 177.46598816 -9.10510731 -6.019851685 177.07963562 -9.70091343 -5.017807007 179.046356201
		 -9.49629498 -5.7387085 178.64842224 -9.80845451 -4.2827301 178.034561157 -9.6171627 -4.9801178 177.81918335
		 -3.86811495 -11.22026062 166.27023315 -4.14339304 -10.81163025 166.1940155 -4.37172413 -10.40776062 166.098129272
		 -4.11900759 -10.23980713 165.81394958 -4.1328721 -10.16680908 165.87826538 -4.32246447 -10.03302002 165.88517761
		 -4.27643585 -10.0057067871 165.88645935 -3.66712475 -11.050354004 165.89468384 -3.77057362 -11.15940857 166.078704834
		 -3.59406495 -10.91438293 165.81123352 -4.31126022 -10.36260986 166.014343262 -4.24611712 -10.30606079 165.92849731
		 -3.99687505 -10.66786194 165.92068481 -4.063179016 -10.76441956 166.060714722 -4.15942001 -10.25802612 165.85787964
		 -3.91756487 -10.55911255 165.84185791 -6.11131334 -9.86199951 171.70863342 -5.66401958 -10.21296692 171.76367188
		 -5.86867142 -10.074859619 171.85325623 -5.72391653 -10.17869568 171.91682434 -5.49931812 -10.3001709 171.8662262
		 -5.32773447 -10.24412537 171.92102051 -5.53380156 -10.13093567 171.93479919 -5.8912282 -10.028320313 171.99516296
		 -5.71744251 -10.022171021 171.98080444 -6.27044821 -9.69355774 171.84407043 -6.046300411 -9.91821289 171.94085693
		 -6.18876314 -9.76574707 172.048553467 -6.36732483 -9.55604553 171.99671936 -5.89884615 -9.86598206 172.057220459
		 -6.054132462 -9.8639679 172.075241089 -6.098860264 -9.74246216 172.22775269 -6.17881584 -9.75256348 172.20948792
		 -6.30384016 -9.64686584 172.18618774 -6.42595577 -9.51881409 172.13189697 -6.57849264 -9.28959656 172.15917969
		 -8.50797176 -7.12557983 177.31190491 -8.24692249 -7.61366272 176.76860046 -8.84240627 -6.49516296 176.71740723
		 -8.53237915 -6.87080383 176.23736572 -4.62346411 -9.93746948 165.75709534 -4.88619328 -9.90563965 165.62341309
		 -5.10276794 -10.10899353 166.093414307 -4.80614614 -10.19215393 166.086654663 -6.095507145 -8.46650696 166.66999817
		 -5.83000231 -9.035339355 166.40879822 -5.4166398 -9.84797668 166.12239075 -5.69260216 -9.4901123 166.22084045
		 -5.24418354 -9.71340942 165.47059631 -4.8228364 -9.77702332 164.86412048 -4.46746397 -10.028808594 165.8789978
		 -4.5190568 -9.99639893 165.83439636 -4.60994196 -10.18226624 166.069671631 -4.51653671 -10.1627655 166.042800903
		 -5.52197742 -9.33514404 165.43338013 -5.10766745 -9.45762634 164.67306519 -6.63126945 -7.75511169 167.0073547363
		 -7.3444767 -6.9198761 167.4881897 -5.62200785 -8.086837769 164.65866089 -5.31527662 -8.90028381 164.60418701
		 -5.63872814 -8.82237244 165.54431152 -5.86595678 -8.1410675 165.74575806 -6.27725792 -7.10894775 165.032470703
		 -6.42697716 -7.3223877 166.070159912 -7.039716244 -6.062210083 165.66075134 -7.22600317 -6.43315125 166.6114502
		 -7.85638809 -5.4074707 167.44110107 -7.92720509 -6.067626953 168.27377319 -7.61610889 -4.95869446 166.46713257
		 -6.39438438 -9.5291748 171.53085327 -6.73683834 -9.13253784 171.26879883 -6.91767836 -8.94595337 171.54057312
		 -6.56111765 -9.36225891 171.71716309 -6.96335316 -8.85751343 171.85290527;
	setAttr ".vt[2324:2489]" -6.6273036 -9.24272156 171.93699646 -6.96354961 -8.96089172 172.14077759
		 -5.39228916 -10.32800293 171.70228577 -5.23164463 -10.40066528 171.82907104 -5.08705616 -10.33026123 171.89831543
		 -4.94648457 -10.473526 171.82911682 -4.83733273 -10.37283325 171.891922 -5.064059258 -10.4299469 171.68408203
		 -4.70862675 -10.47384644 171.70419312 -4.64804554 -10.4848175 171.83882141 -4.59176207 -10.37550354 171.90901184
		 -2.38311768 -7.011154175 160.67756653 -3.10666323 -6.42611694 160.88021851 -3.10455704 -5.85821533 160.28582764
		 -2.51810002 -6.42959595 160.053771973 -1.83083582 -6.84300232 159.89167786 -1.76322186 -7.26098633 160.63249207
		 -3.85409427 -5.63819885 161.21121216 -4.48404646 -4.6688385 161.75521851 -4.36628962 -4.18016052 161.1328125
		 -3.70579624 -5.11585999 160.62791443 -2.698107 -5.85533142 159.33325195 -1.71073103 -6.27856445 159.024414063
		 -3.1764605 -5.4145813 159.50856018 -4.49116611 -4.18241072 160.26257324 -3.66304612 -4.83795166 159.78405762
		 -4.5705924 3.47596741 166.77348328 -5.088104248 2.95172119 166.6000061 -4.33316898 3.21508789 164.69633484
		 -4.95704651 2.36773682 164.490448 -6.12504196 1.83654785 166.79884338 -4.1527667 4.0026855469 166.92657471
		 -4.015799522 3.66271973 164.83049011 -3.71482444 4.52580261 166.99029541 -3.70470738 3.98564148 164.88531494
		 -3.11212802 5.018081665 166.98907471 -3.22694135 4.40361023 164.87355042 -1.401667 5.55245972 166.92755127
		 -1.41393805 5.12313843 164.87438965 -2.29659629 5.38920593 166.95524597 -2.082393646 4.89628601 164.87860107
		 -5.56385422 2.38323975 166.57473755 -5.42596436 1.89181519 164.42781067 -6.0087838173 1.10588074 164.38421631
		 -6.55407333 0.48205566 165.61567688 -6.64143181 -0.44017029 164.20410156 -6.84172726 -0.60058594 165.12091064
		 -6.58950853 -1.49113464 163.29199219 -6.75882769 -1.55906677 164.68037415 -6.40193176 -0.22470093 162.96417236
		 -6.44177389 -1.27218628 162.16943359 -6.026887894 -2.63604736 162.36068726 -6.031470299 -2.70837402 163.32049561
		 -5.93134832 -2.69052124 161.33670044 -5.25871277 -3.49987793 161.65092468 -5.1883049 -3.66081238 162.44268799
		 -5.37821674 -3.41130066 160.85083008 -6.79788971 -2.27978516 165.19268799 -2.83544636 -11.14065552 163.38635254
		 -2.24244571 -11.59764099 163.22769165 -3.5156765 -10.60437012 163.71862793 -2.67253566 -8.59645081 160.84910583
		 -1.9400965 -8.79847717 160.82041931 -2.12514687 -9.58847046 160.79782104 -2.98048687 -9.2961731 160.95446777
		 -2.32761788 -10.49916077 161.017868042 -2.40010262 -11.14755249 161.77835083 -3.20558524 -10.6945343 162.10469055
		 -3.21755409 -10.1171875 161.34870911 -3.9905858 -10.021697998 162.74258423 -4.18860865 -9.38069153 162.10644531
		 -3.018776894 -11.016937256 162.82473755 -2.34692478 -11.5138855 162.5562439 -3.70996118 -10.39024353 163.28245544
		 -3.65211701 -7.96487427 161.17247009 -3.98336792 -8.64349365 161.51683044 -4.24431658 -10.12693787 164.26119995
		 -4.47213936 -9.81694031 163.94561768 -4.91627121 -7.66786194 162.26023865 -4.52745628 -7.027404785 161.75285339
		 -5.14538908 -8.2677002 163.25880432 -4.76758909 -9.28079224 163.61743164 -4.45677662 -10.13772583 166.0062713623
		 -3.69909096 -10.95188904 165.41236877 -4.11025667 -10.32136536 165.63624573 -4.43339252 -10.037307739 165.90223694
		 -3.66891813 -10.97689819 165.56898499 -4.076658726 -10.34931946 165.70959473 -4.39912844 -10.034179688 165.91233826
		 -4.3539238 -10.069595337 165.92747498 -4.40805387 -10.10604858 165.96690369 -4.30698776 -10.034790039 165.88226318
		 -5.80152369 -11.053741455 173.92475891 -6.014445305 -10.74226379 174.65614319 -6.45030069 -10.25483704 175.71969604
		 -7.072501183 -9.6934967 176.97161865 -6.29947042 -10.69766235 173.88536072 -6.52481985 -10.26104736 174.54400635
		 -6.97978067 -9.62368774 175.51702881 -7.53766727 -8.94619751 176.57704163 -6.74525023 -10.28413391 173.80241394
		 -1.8086108 -8.045974731 160.81733704 -2.44256926 -7.85473633 160.83084106 -3.32358003 -7.21408081 161.064804077
		 -4.13565683 -6.32197571 161.51960754 -4.87250853 -5.26351929 162.13948059 -2.72040534 -11.33883667 172.32585144
		 -2.8082068 -11.37625122 172.65663147 -2.76955581 -11.3303833 171.98962402 -2.37213969 -12.039077759 172.64970398
		 -2.63585567 -11.70500183 172.45777893 -2.67157769 -11.74092102 172.12005615 -2.40884161 -12.13468933 172.30845642
		 -2.13921571 -12.14404297 172.71765137 -2.1630652 -12.29333496 172.39071655 -2.16210771 -12.11581421 173.11624146
		 -2.38836741 -12.032150269 173.030685425 -2.68470669 -11.71368408 172.78530884 -2.2656014 -12.32493591 173.71705627
		 -2.54222417 -12.2308197 173.56632996 -3.95807171 -10.3637085 171.49813843 -3.19721293 -10.6125946 172.0097351074
		 -3.33905792 -10.52032471 171.81777954 -3.62008643 -10.42724609 171.63119507 -6.19589949 -3.16738892 163.98516846
		 -5.50440979 -4.14546204 162.9927063 -6.60308599 -3.65786743 164.39170837 -7.051728249 -2.80587769 165.5045166
		 -5.28782511 -5.88276672 162.47541809 -5.99657249 -4.68791199 163.36152649 -5.7055397 -6.45889282 163.033874512
		 -6.0026016235 -6.91036987 163.92645264 -6.99405622 -4.13259888 164.90074158 -6.4553833 -5.2272644 163.90023804
		 -6.79580402 -5.70019531 164.68714905 -7.32724571 -4.56077576 165.5894165 -2.39758611 -12.41934204 168.234375
		 -2.34741426 -12.33929443 168.025970459 -2.21413302 -12.58651733 168.092086792 -2.30134535 -12.58728027 168.33952332
		 -2.49509645 -12.33462524 168.18496704 -2.53767657 -12.19792175 167.99238586 -2.59538531 -12.31889343 168.18180847
		 -2.7198894 -12.13734436 168.029891968 -2.64199448 -12.52592468 168.37399292 -2.74773216 -12.52001953 168.27668762
		 -2.77320957 -12.29981995 168.13189697 -2.65084696 -12.39230347 168.23394775 -2.37221837 -13.030105591 168.34390259
		 -2.34174395 -13.10958862 168.25570679 -2.53024673 -13.0013580322 168.32800293 -2.51203561 -12.91444397 168.41915894
		 -2.26317096 -12.96702576 168.30743408 -2.21410489 -13.032821655 168.18771362 -2.1631496 -12.84776306 168.12733459
		 -2.23908544 -12.80548096 168.32229614 -2.59125805 -12.70574951 168.46740723 -2.66037416 -12.7539978 168.3734436
		 -3.63776088 -10.51805115 172.53074646 -2.40570641 -12.42427063 168.50895691 -2.34568048 -12.5243988 168.64364624
		 -2.45560122 -12.39834595 168.47201538 -2.52184176 -12.40751648 168.43421936 -2.55380297 -12.52076721 168.54922485
		 -2.57902193 -12.43505859 168.39552307 -2.42248273 -12.90570068 168.50814819;
	setAttr ".vt[2490:2655]" -2.49476624 -12.85055542 168.5315094 -2.33507848 -12.91172791 168.46220398
		 -2.34547925 -12.74513245 168.5881958 -2.52498555 -12.66877747 168.61958313 -2.43375278 -12.69293213 168.6819458
		 -2.44810677 -12.49269104 168.68508911 -5.89304876 -10.10874939 172.44221497 -6.050163269 -9.8110199 172.36895752
		 -5.72042465 -10.24798584 172.51121521 -5.47955132 -10.38504028 172.61322021 -4.40668106 -10.68225098 172.65762329
		 -4.82504129 -10.63844299 172.72764587 -5.18430567 -10.50918579 172.70687866 -4.047841072 -10.57473755 172.52676392
		 -3.68277979 -10.34953308 172.30355835 -3.72210383 -10.38023376 172.36212158 -3.81015873 -10.44599915 172.41870117
		 -4.30738592 -10.22216797 172.023635864 -4.075221062 -10.19247437 172.079025269 -3.67737699 -10.33320618 172.25427246
		 -3.76766825 -10.29129028 172.17626953 -3.70729637 -10.32429504 172.21379089 -3.86804008 -10.18754578 172.13667297
		 -5.51285553 -9.99240112 171.97592163 -5.31942511 -10.10908508 171.97494507 -5.686409 -9.88903809 172.021057129
		 -5.86806822 -9.74308777 172.092346191 -6.095502853 -9.65895081 172.2673645 -5.081799984 -10.19828796 171.96444702
		 -4.83927631 -10.25131226 171.95205688 -4.59739637 -10.25552368 171.96708679 -5.98293781 -9.89804077 172.46911621
		 -6.10849953 -9.60273743 172.39595032 -5.73589039 -10.12388611 172.5333252 -5.51583719 -10.31607056 172.67147827
		 -4.38969278 -10.61175537 172.6461792 -4.85361338 -10.53181458 172.75338745 -5.23283625 -10.42376709 172.71307373
		 -3.94106007 -10.41760254 172.49258423 -3.6369586 -10.26751709 172.29147339 -3.63557267 -10.26142883 172.33062744
		 -3.64159918 -10.27500916 172.33476257 -4.2627492 -10.12991333 172.070144653 -4.02874279 -10.11088562 172.11564636
		 -3.64533997 -10.26669312 172.26348877 -3.73372936 -10.22012329 172.19750977 -3.67487788 -10.28317261 172.24009705
		 -3.82005024 -10.12820435 172.14916992 -5.54700422 -9.88075256 172.017089844 -5.35146379 -9.99763489 172.0014343262
		 -5.72111416 -9.77165222 172.06803894 -5.9195261 -9.62193298 172.1363678 -6.09658432 -9.46867371 172.2756958
		 -5.087226868 -10.089996338 172.012313843 -4.82949924 -10.14964294 172.00093078613
		 -4.57049274 -10.16038513 172.015258789 -9.65903187 -3.80691528 177.15205383 -9.48938942 -4.78729248 176.76966858
		 -9.6564827 -4.50737 177.2361145 -3.57061934 -10.78919983 165.79118347 -3.147681 -11.35626221 165.79342651
		 -2.68898535 -11.69668579 165.72169495 -4.21452904 -9.92630005 165.85858154 -4.075089931 -10.066741943 165.84425354
		 -1.84790897 -11.84764099 165.70411682 -2.097261906 -11.76872253 165.74928284 -2.51070762 -11.62901306 165.78305054
		 -2.86995435 -11.4667511 165.77442932 -3.18493557 -11.13684082 165.83485413 -3.59235525 -10.77113342 165.84544373
		 -3.91451716 -10.45396423 165.84579468 -4.12101603 -10.17108154 165.86990356 -4.25790834 -9.95324707 165.8344574
		 -2.11423206 -11.85784912 165.70504761 -2.86647606 -10.63246155 164.70300293 -3.98010111 -9.58503723 165.6625061
		 -3.66053677 -9.8734436 165.14125061 -2.7396121 -10.79199219 166.27471924 -3.70195317 -10.16493225 166.17736816
		 -4.079586029 -9.6530304 165.91021729 -4.097695351 -8.56790161 165.48806763 -3.94021153 -8.82688904 165.026519775
		 -2.5557549 -9.17411804 164.8285675 -2.59412265 -9.34912109 167.018692017 -3.58558893 -8.94042969 166.69137573
		 -4.0096025467 -8.55758667 166.018615723 -3.82560658 -7.039031982 165.4855957 -3.61385655 -7.3336792 165.019638062
		 -2.40624666 -7.6421814 164.89718628 -2.37523937 -7.84436035 167.16911316 -3.33417273 -7.3911438 166.87243652
		 -3.84067082 -7.047683716 166.01461792 -2.96252322 -6.41757202 165.59814453 -2.6065619 -6.63265991 165.22492981
		 -2.02138257 -6.8190918 165.14474487 -2.10840893 -6.92050171 166.97036743 -2.77154326 -6.6264801 166.7718811
		 -3.092608452 -6.38339233 166.15504456 -2.36337209 -5.99328613 165.71963501 -2.2537725 -6.22155762 165.38916016
		 -1.7922945 -6.19796753 165.42390442 -1.90277982 -6.24931335 166.72955322 -2.38945794 -6.18832397 166.65571594
		 -2.4354465 -5.95629883 166.22819519 -1.77644563 -5.76983643 166.31518555 -1.73969424 -5.78520203 165.85823059
		 -6.34631395 -0.52742004 161.34527588 -5.43730164 -3.23347473 160.027130127 -4.085760593 3.76359558 163.045059204
		 -3.52231693 -5.23049927 158.70605469 -5.5225563 1.82418823 162.43571472 -3.00054478645 -3.74591064 185.86486816
		 -1.44943464 -11.74723816 166.3417511 -1.53941655 -11.74169922 166.080413818 -1.43785322 -11.73217773 166.080978394
		 -1.49025691 -11.67863464 165.59179688 -1.42344975 -11.6962738 165.69390869 -3.90499616 -9.27604675 166.28646851
		 -3.97135472 -9.014266968 166.33705139 -3.90884542 -9.011947632 165.99728394 -3.87942195 -9.26573181 165.94128418
		 0.87198466 -9.76535034 167.45381165 0.82414615 -9.78625488 167.97015381 0.65660447 -10.63833618 167.86585999
		 0.67705214 -10.61216736 167.32691956 -3.8104353 -9.55387878 165.90066528 -3.84769607 -9.5448761 166.24874878
		 1.031489134 -8.90138245 166.93101501 1.050568104 -9.026931763 166.55966187 1.078665137 -8.88519287 166.58937073
		 -4.0074901581 -8.87239075 166.36422729 -4.024632454 -8.79621887 166.36531067 -3.98136473 -8.78878784 165.96611023
		 -3.92214847 -8.85365295 166.062652588 -4.048990726 -8.50172424 165.96379089 -4.096150875 -8.47445679 166.36955261
		 -4.13565016 -8.12191772 166.40931702 -4.025679111 -8.17153931 165.99862671 -4.039037228 -7.98768616 166.14115906
		 -4.14388752 -7.96179199 166.43742371 -4.16183949 -7.83314514 166.4447937 -4.060046196 -7.89321899 166.029693604
		 0.81590974 -10.17886353 166.92193604 0.92055547 -9.71255493 166.86505127 -2.80921006 -11.48982239 167.097335815
		 -2.82576847 -11.48440552 167.65101624 -3.3888104 -11.10626221 167.63163757 -3.32112598 -11.11352539 167.089920044
		 -3.26172423 -11.093017578 166.62825012 -3.016047716 -11.30136108 166.50538635 -2.76614571 -11.44566345 166.62980652
		 -2.26163721 -11.71984863 166.58659363 -2.29557395 -11.62690735 166.15917969 -2.23211122 -11.66244507 166.15563965
		 -2.13259339 -11.69012451 166.13583374 -2.25211954 -11.52859497 165.64378357 -2.18827057 -11.57943726 165.684021
		 -2.12611008 -11.57635498 165.56939697 -3.1438024 -10.94647217 165.83731079 -3.11457205 -11.017593384 165.7623291
		 -3.16671824 -11.072631836 166.19880676 -3.21202111 -11.031692505 166.19970703 -3.24979067 -10.97567749 166.20024109
		 -3.19694257 -10.90127563 165.78417969 -3.59434128 -10.47825623 166.20802307 -3.55971599 -10.5272522 166.20724487;
	setAttr ".vt[2656:2821]" -3.60899615 -10.53677368 166.64227295 -3.62686467 -10.38117981 166.20785522
		 -3.5685761 -10.35552979 165.79301453 -3.51438165 -10.43638611 165.92524719 -3.90621877 -9.3290863 166.74951172
		 -3.97234321 -8.92918396 167.32144165 -3.99713016 -8.88873291 166.7086792 -3.97577858 -8.95111084 167.83018494
		 -3.86409807 -9.75335693 167.24319458 -3.87999058 -9.7743988 167.76173401 -3.85200787 -9.70045471 166.65245056
		 -4.10462093 -8.51979065 166.81007385 -4.31132269 -7.25892639 167.40629578 -4.18382454 -7.87864685 166.82318115
		 1.017568469 -9.024368286 166.2157135 1.019556403 -8.86610413 166.28147888 -3.73197699 -9.64750671 165.92962646
		 -3.82649159 -9.65995789 166.23713684 0.89423579 -8.96331787 168.044830322 0.94610089 -8.94154358 167.53865051
		 1.23411036 -7.27272034 167.64871216 1.10826504 -7.39756775 168.19526672 0.9456079 -9.56594849 166.11251831
		 1.0018583536 -9.27806091 166.15818787 0.99861968 -9.28843689 166.50440979 0.95369685 -9.55703735 166.46266174
		 1.18789506 -7.84651184 166.67961121 1.12214553 -7.90615845 166.25715637 1.13822854 -7.22662354 166.34744263
		 1.25263631 -7.24375916 166.79385376 -4.23482943 -7.38427734 167.96173096 -4.28119612 -7.19393921 166.8999939
		 -1.33662069 -11.74223328 166.089660645 -1.35115361 -11.67900085 165.59817505 0.9531247 -9.34135437 166.96525574
		 1.081801414 -8.80152893 166.19000244 1.092716813 -8.80909729 166.5916748 1.13862741 -8.51473999 166.19259644
		 1.1008327 -8.18437195 166.22416687 1.17426133 -8.13520813 166.64285278 1.1511972 -8.48762512 166.60098267
		 1.096267819 -8.00051879883 166.36682129 1.17463768 -7.9750824 166.67105103 0.35868505 -11.1229248 167.2552948
		 0.36211151 -11.11581421 167.7993927 -0.21259789 -11.49108887 167.76841736 -0.163057 -11.49662781 167.2169342
		 0.11072218 -11.30940247 166.64680481 0.34876946 -11.10227966 166.79100037 -0.66090232 -11.72399902 166.65942383
		 -0.64915025 -11.66654968 166.22776794 -0.58545095 -11.63134766 166.23707581 -0.74749815 -11.69372559 166.19895935
		 -0.65610915 -11.58340454 165.75382996 -0.58864504 -11.53289795 165.71954346 -0.71226382 -11.58001709 165.63374329
		 0.30190027 -10.95533752 165.99290466 0.3399187 -11.040817261 166.36001587 0.29395327 -11.08152771 166.3551178
		 0.27068418 -11.040023804 165.91638184 0.35969669 -10.91040039 165.9446106 0.37842596 -10.98498535 166.3638916
		 0.72289902 -10.48928833 166.40177917 0.69682491 -10.54776001 166.8354187 0.68877697 -10.53811646 166.39805603
		 0.7545836 -10.3923645 166.40438843 0.66673625 -10.44706726 166.11299133 0.73002362 -10.3664856 165.98579407
		 0.84767157 -10.071578979 165.998703 0.847157 -10.10786438 166.41319275 -3.64218116 -10.60116577 167.1335907
		 -3.68649888 -10.62731934 167.67225647 1.1148659 -8.53286743 167.040039063 1.17310369 -7.89201355 167.058151245
		 1.25008762 -7.20768738 167.14186096 0.936948 -9.67204285 166.44955444 0.86862439 -9.65917969 166.1348877
		 0.911286 -9.80978394 166.43675232 0.83462131 -9.81886292 166.064605713 -2.34019089 -11.74781799 167.08543396
		 -2.4036715 -11.71192932 167.66590881 -2.50921774 -11.56767273 166.48875427 -2.66530991 -11.42129517 166.18008423
		 -2.49637318 -11.51504517 166.17028809 -2.60289955 -11.33233643 165.72775269 -2.44043708 -11.41595459 165.62062073
		 -0.64264357 -11.71644592 167.74530029 -0.63651806 -11.75221252 167.16265869 -0.40091479 -11.57312012 166.58462524
		 -0.38362423 -11.52050781 166.26643372 -0.21357726 -11.42764282 166.29147339 -0.15520932 -11.45239258 166.7481842
		 -0.36887777 -11.41444397 165.7026825 -0.23964746 -11.33843994 165.83511353 -4.25048542 -7.23005676 166.55308533
		 -4.098277092 -7.21359253 166.11836243 -2.77061772 -11.36251831 166.18615723 -2.73077154 -11.38510132 166.18353271
		 -2.72315931 -11.26908875 165.74739075 -2.68149257 -11.30563354 165.7973938 -0.14759851 -11.39178467 166.30081177
		 -0.10746419 -11.36940002 166.30703735 -0.16518794 -11.31213379 165.91165161 -0.11937788 -11.27581787 165.86555481
		 -3.39409137 -10.69088745 165.66822815 -3.43856406 -10.77484131 166.20455933 -3.49676394 -10.52348328 165.84094238
		 -3.43627572 -10.82507324 166.66864014 0.56660938 -10.70101929 165.84629822 0.70378256 -10.54795837 166.03062439
		 0.53677231 -10.75717163 166.38110352 0.52191621 -10.83520508 166.84664917 -3.69104385 -10.060028076 165.79568481
		 -3.72375274 -10.096221924 166.20864868 -3.79615712 -9.79782104 166.22659302 -3.68837905 -9.80735779 165.86254883
		 -3.74188972 -10.16726685 166.71815491 -1.8336885 -11.81178284 166.50672913 -1.49171209 -11.85389709 167.13919067
		 -1.84642053 -11.76904297 166.07824707 -1.82610679 -11.68206787 165.52546692 -1.52802455 -11.8782959 167.72720337
		 -1.08217597 -11.81373596 166.54098511 -1.029888868 -11.77116394 166.11549377 -1.014889836 -11.68301392 165.52459717
		 -2.9719255 -11.25196838 166.19746399 -2.93947244 -11.16242981 165.59552002 0.09557312 -11.25987244 166.33634949
		 0.11235449 -11.17506409 165.70132446 -1.44331193 -11.40335083 166.1491394 -1.5671196 -11.41146851 166.15629578
		 -1.45555246 -11.33621216 166.37939453 -1.43213177 -11.47370911 165.91215515 -1.57481563 -11.49230957 165.8838501
		 -1.42503393 -11.50616455 165.71690369 -1.50734437 -11.62480164 165.59718323 -3.52169728 -9.20449829 166.16625977
		 -3.57431698 -8.95988464 166.28369141 -3.58049679 -8.93852234 166.35578918 -3.51226807 -9.2089386 166.30786133
		 0.29986471 -10.44145203 167.32575989 0.27841914 -10.46820068 167.85766602 0.41711152 -9.73789978 167.93565369
		 0.4654215 -9.71086121 167.42381287 -3.4590528 -9.4803009 166.34431458 -3.4533782 -9.48614502 166.12808228
		 -3.44602489 -9.50434875 165.92166138 -3.50541806 -9.20454407 165.95132446 0.67406648 -8.80683899 166.57330322
		 0.64664054 -8.94917297 166.54309082 0.63499427 -8.83988953 166.85845947 -3.60614443 -8.78092957 166.3453064
		 -3.62776208 -8.68670654 166.31997681 -3.63383985 -8.71946716 166.38844299 -3.61608434 -8.79603577 166.38352966
		 -3.58197379 -8.80924988 166.28971863 -3.55189705 -8.71708679 166.028533936 -3.50797963 -8.3959198 165.996521
		 -3.65373898 -8.1627655 166.032730103 -3.67091632 -8.15805054 166.30929565 -3.61625147 -8.41062927 166.2840271
		 -3.66212869 -7.9981842 166.19477844 -3.66127038 -7.88322449 166.11734009 -3.7325902 -7.80429077 166.39228821
		 -3.7137351 -7.96585083 166.38449097 0.42356977 -10.024703979 166.84477234;
	setAttr ".vt[2822:2987]" 0.32960054 -10.32887268 166.72402954 -3.57421112 -8.94374084 165.98986816
		 -3.045861721 -10.84109497 167.12145996 -3.11883879 -10.82919312 167.65072632 -2.67103672 -11.12109375 167.64785767
		 -2.64820647 -11.12564087 167.118927 -2.8050046 -10.98175049 166.66145325 -2.98695278 -10.79653931 166.5848999
		 -2.11503983 -11.36048889 166.29641724 -2.20712996 -11.33198547 166.30503845 -2.11767244 -11.34240723 166.53141785
		 -2.0099778175 -11.38365173 166.26377869 -2.11794734 -11.3901062 165.97845459 -2.22923613 -11.37548828 165.98551941
		 -2.0040650368 -11.42208862 165.90901184 -2.14045262 -11.47293091 165.740448 -2.22611475 -11.49502563 165.66876221
		 -2.097017527 -11.4964447 165.55755615 -2.99780774 -10.83403015 165.82275391 -2.98781633 -10.80744934 166.07661438
		 -2.93115139 -10.89326477 166.054748535 -3.047264576 -10.94033813 165.76623535 -3.12187982 -10.82740784 165.75717163
		 -3.048609257 -10.70530701 166.05897522 -2.97999144 -10.80152893 166.36218262 -2.92084217 -10.87306213 166.36006165
		 -3.036085606 -10.71055603 166.34112549 -3.25205112 -10.31973267 166.56338501 -3.23466492 -10.30381775 166.2752533
		 -3.23855495 -10.2986145 166.27650452 -3.25133562 -10.2542572 166.26898193 -3.21964431 -10.28901672 166.19778442
		 -3.23375607 -10.22714233 166.1791687 -3.51935196 -9.24380493 166.71585083 -3.58263493 -8.86547852 167.31086731
		 -3.47962284 -9.70089722 167.24879456 -3.44114828 -9.62654114 166.59915161 -3.6055665 -8.82922363 166.67100525
		 -3.49641204 -9.72807312 167.76289368 -3.58788276 -8.8943634 167.82650757 -3.67999268 -8.3788147 166.83920288
		 -3.7694037 -7.83325195 166.80781555 -3.90415883 -7.21012878 167.39967346 -3.66131663 -8.40058899 166.51016235
		 -3.71422267 -8.089996338 166.53311157 -3.77410436 -7.68586731 166.59669495 -3.74311113 -7.89599609 166.57774353
		 0.64843905 -8.97053528 166.47087097 0.66761309 -8.79168701 166.53437805 0.65049738 -8.81991577 166.4770813
		 0.67893666 -8.95448303 166.17860413 -3.43162704 -9.60154724 166.3430481 -3.42332411 -9.58265686 166.18643188
		 0.70729768 -7.34687805 168.12220764 0.8274228 -7.22189331 167.60641479 0.54277521 -8.87582397 167.4927063
		 0.48938605 -8.90455627 168.0056610107 0.5680396 -9.53623962 166.039611816 0.56212401 -9.49633789 166.30725098
		 0.61651719 -9.21496582 166.3502655 0.62210691 -9.21499634 166.13499451 0.77771217 -7.69667053 166.7953949
		 0.84248066 -7.20724487 166.82798767 0.7976315 -7.18475342 166.6136322 0.75729024 -7.81549072 166.58917236
		 -3.83048034 -7.33558655 167.9239502 0.59335017 -9.21932983 166.4903717 -1.320678 -11.41209412 166.1675415
		 -1.28755391 -11.49305725 165.89697266 -1.33495212 -11.62524414 165.60505676 0.55781734 -9.25408936 166.89683533
		 0.5457359 -9.49046326 166.52285767 0.68850875 -8.73033142 166.57949829 0.68842888 -8.6975708 166.51075745
		 0.63756412 -8.72763062 166.21372986 0.58560544 -8.40620422 166.17698669 0.67056984 -8.42016602 166.47293091
		 0.71545309 -8.16647339 166.50195313 0.72240567 -8.17372131 166.22525024 0.71072543 -8.0091247559 166.38687134
		 0.74341273 -7.97698975 166.58015442 0.71318918 -7.89413452 166.30934143 -0.35458505 -11.13150024 167.22183228
		 -0.40156385 -11.12684631 167.7487793 0.051125281 -10.83718872 167.79125977 0.045287609 -10.84895325 167.25946045
		 0.055024866 -10.80433655 166.72169495 -0.13699432 -10.98858643 166.78164673 -0.3309474 -11.12481689 166.67826843
		 -0.69552475 -11.33589172 166.37374878 -0.78716457 -11.36392212 166.35679626 -0.8117094 -11.34577942 166.59069824
		 -0.88904697 -11.3865509 166.31478882 -0.64023846 -11.37960815 166.057861328 -0.7515325 -11.39364624 166.04069519
		 -0.85960972 -11.42506409 165.96118164 -0.61711419 -11.49919128 165.74201965 -0.7087009 -11.47663879 165.80567932
		 -0.74065161 -11.49995422 165.61924744 0.23901288 -10.9140625 165.97517395 0.20338076 -10.96253967 165.91439819
		 0.06256374 -10.90097046 166.19015503 0.11680382 -10.81542969 166.21687317 0.17949609 -10.71368408 166.20462036
		 0.30784115 -10.85842896 165.92849731 0.016579445 -10.88059998 166.49259949 0.075408749 -10.80937195 166.49990845
		 0.13386439 -10.71867371 166.4838562 0.34658742 -10.31298828 166.43629456 0.35034898 -10.30780029 166.43788147
		 0.36395556 -10.26350403 166.43148804 0.35663375 -10.23634338 166.34069824 0.3405498 -10.29814148 166.35800171
		 0.47163862 -9.95503235 166.038330078 0.56955391 -10.23396301 165.96099854 0.43652564 -9.99542236 166.31980896
		 -3.3474226 -10.45906067 167.69714355 -3.29942036 -10.43232727 167.16539001 0.50400287 -9.6365509 166.77514648
		 0.67726588 -8.3890686 167.030914307 0.75613344 -7.84321594 167.0061035156 0.73666388 -8.097412109 166.72776794
		 0.6941281 -8.4103241 166.70132446 0.75342232 -7.9059906 166.77482605 -3.45039225 -9.62103271 166.075515747
		 0.84200591 -7.15925598 167.13134766 0.73251957 -7.23129272 166.36694336 0.52975315 -9.59269714 166.36300659
		 0.52221346 -9.61158752 166.51956177 0.50237322 -9.7245636 166.34510803 0.50874257 -9.72605896 166.44638062
		 -2.28176332 -11.32698059 167.65403748 -2.21419191 -11.36099243 167.10256958 -2.3737123 -11.23713684 166.64038086
		 -2.35845828 -11.25491333 166.29794312 -2.51770067 -11.17298889 166.34913635 -2.60098553 -11.11897278 166.57563782
		 -2.37726712 -11.30769348 165.99015808 -2.52476263 -11.23022461 166.040328979 -2.4030118 -11.37812805 165.63668823
		 -2.59695983 -11.26953125 165.73664856 -0.78887987 -11.36463928 167.16677856 -0.79283923 -11.33074951 167.72042847
		 -0.56770277 -11.24177551 166.72213745 -0.38784453 -11.17848206 166.44569397 -0.54252881 -11.25961304 166.38041687
		 -0.347543 -11.2358551 166.13920593 -0.491348 -11.31256104 166.075927734 -0.24588992 -11.27560425 165.84346008
		 -0.40732118 -11.37643433 165.71549988 -3.78539443 -7.1733551 166.41326904 -3.8491087 -7.1955719 166.62289429
		 0.5684436 -9.6312561 166.25505066 -2.59966779 -11.12878418 166.370224 -2.67167115 -11.075424194 166.35920715
		 -2.61560202 -11.17980957 166.082626343 -2.69483924 -11.11590576 166.053863525 -2.65125751 -11.25178528 165.86703491
		 -2.68937516 -11.21903992 165.75727844 -0.23345968 -11.081710815 166.46961975 -0.30745885 -11.13468933 166.47407532
		 -0.17681982 -11.12240601 166.16807556 -0.26022708 -11.18588257 166.1894989 -0.15541933 -11.22558594 165.87229919
		 -0.20316134 -11.25810242 165.97814941 -3.87608027 -7.14752197 166.92515564;
	setAttr ".vt[2988:3153]" -3.29533815 -10.61251831 165.69146729 -3.38677216 -10.45278931 165.79974365
		 -3.19751167 -10.3114624 166.17340088 -3.12836218 -10.53326416 166.0362854 -3.12998748 -10.53514099 166.34095764
		 -3.1353507 -10.57188416 166.66070557 -3.69769096 -7.22026062 166.17320251 0.48573095 -10.67457581 165.82400513
		 0.26205605 -10.54194641 166.1890564 0.32088155 -10.32046509 166.33178711 0.62994277 -10.50973511 165.98426819
		 0.22991449 -10.54373169 166.49208069 0.1969357 -10.58039856 166.81015015 -3.3235786 -9.94534302 165.86798096
		 -3.35572529 -9.6955719 165.86964417 -3.3903935 -9.71466064 166.17097473 -3.31533194 -9.98583984 166.15144348
		 -3.36174393 -10.015075684 166.67552185 -3.34071064 -9.98954773 166.26235962 -3.40725803 -9.71611023 166.27130127
		 0.4973169 -9.7053833 166.042190552 0.44984624 -9.9992218 166.43231201 -3.37779117 -10.26809692 165.82284546
		 -1.50386524 -11.44206238 167.16357422 -1.80256796 -11.38882446 166.58262634 -1.79470372 -11.41384888 166.21464539
		 -1.79556775 -11.46612549 165.87660217 -1.80969965 -11.57225037 165.53718567 -1.54151404 -11.467453 167.72502136
		 -1.1336087 -11.39054871 166.61305237 -1.099373102 -11.41564941 166.24632263 -1.066122413 -11.46801758 165.90988159
		 -1.031716824 -11.57312012 165.534729 -2.80124259 -10.97621155 166.32522583 -2.81439209 -11.0014190674 166.020339966
		 -2.87679577 -11.061920166 165.64285278 -0.099099852 -10.98316956 166.44741821 -0.051444821 -11.0085449219 166.14555359
		 0.047130503 -11.07421875 165.74310303 -3.42332387 -10.39271545 165.92170715 0.54919052 -10.35591125 166.096282959
		 -3.73853493 -9.8187561 165.40226746 -3.77040005 -9.75724792 165.49688721 -3.77912426 -9.70927429 165.27046204
		 -3.74429154 -9.79129028 165.25570679 -3.71940994 -9.8752594 165.26330566 -3.71020484 -9.8968811 165.52137756
		 -4.066759586 -8.90763855 164.74832153 -3.98609734 -9.042160034 165.059463501 -4.0049319267 -8.95115662 165.055984497
		 -4.0073957443 -8.85202026 165.059875488 -3.9584074 -9.097244263 165.28617859 -3.97408295 -9.010131836 165.27658081
		 -3.9771049 -8.91194153 165.28517151 -4.061753273 -7.19781494 165.37442017 -4.054181576 -7.31158447 165.36865234
		 -4.09793663 -7.41120911 165.633255 -4.030820847 -7.27827454 165.55067444 -3.94134998 -9.019989014 165.45074463
		 -3.93170047 -9.069107056 165.52044678 -3.91595292 -9.37957764 165.072372437 -3.98428988 -9.33184814 164.70677185
		 -3.82983351 -9.72703552 164.67712402 -3.81547356 -9.67044067 165.047729492 -3.93605733 -9.42156982 165.31506348
		 -3.78594279 -9.75398254 165.040557861 -3.74572277 -9.84925842 165.040908813 1.21922994 -7.62982178 165.085159302
		 1.18370628 -7.2361908 165.11668396 1.16256046 -7.31407166 165.36860657 1.25968361 -7.63743591 165.30989075
		 1.24547291 -7.58918762 164.82861328 1.26948106 -7.17002869 164.84736633 -3.44292378 -10.42703247 165.3033905
		 -3.41875529 -10.42784119 165.084884644 -3.37228537 -10.48628235 165.082733154 -3.3952415 -10.48196411 165.32696533
		 -3.36797237 -10.46310425 165.53962708 -3.41817784 -10.42645264 165.45625305 -3.45152855 -10.36196899 165.53396606
		 -3.48836637 -10.36000061 165.29978943 -1.44784498 -11.57832336 165.49085999 -1.50206339 -11.57888794 165.57565308
		 -1.52596378 -11.57089233 165.4274292 -1.44784486 -11.57504272 165.4083252 -1.5227145 -11.5700531 165.14369202
		 -1.44785011 -11.57543945 165.15045166 -1.44783795 -11.5269165 164.69340515 1.18333268 -8.60839844 165.29219055
		 1.10724664 -8.63796997 165.53982544 1.058932185 -8.93302917 165.55300903 1.083955646 -8.91435242 165.28512573
		 1.16196346 -8.56016541 165.057754517 1.13506079 -8.22325134 165.076049805 1.10779762 -8.25840759 165.32232666
		 -2.2475152 -11.421875 165.062561035 -2.47976923 -11.27674866 165.062301636 -2.50932789 -11.20890808 164.67073059
		 -2.20175529 -11.39080811 164.69645691 -2.065068245 -11.47613525 165.066131592 -2.076976538 -11.51020813 165.35864258
		 -2.27644444 -11.46624756 165.4161377 -2.49679327 -11.31536865 165.33665466 -2.80713439 -11.12179565 165.45323181
		 -2.99249721 -10.94387817 165.37969971 -2.97920489 -10.92059326 165.061248779 -2.80285978 -11.084320068 165.06187439
		 -2.62918663 -11.22938538 165.35183716 -2.62443948 -11.24703979 165.5894165 -2.81809425 -11.11360168 165.64331055
		 -2.99221301 -10.95739746 165.57997131 -2.28489709 -11.46537781 165.63642883 -2.070474386 -11.5453186 165.59136963
		 -2.76864457 -11.066558838 164.64903259 -3.016582012 -10.86427307 164.64541626 -2.98208451 -10.85844421 164.24746704
		 -2.47313595 -11.15844727 164.2492981 -2.94952726 -10.84762573 163.77261353 -2.45637417 -11.11659241 163.76208496
		 -1.93919814 -11.3502655 163.75219727 -1.92350352 -11.40083313 164.22836304 1.11324406 -8.14883423 165.32647705
		 1.083194733 -8.17253113 165.44096375 1.076616883 -8.31765747 165.55596924 -3.39609218 -10.4337616 163.78916931
		 -3.42791128 -10.45924377 164.28623962 -3.82554984 -9.70545959 164.36482239 -3.78424597 -9.6746521 163.85212708
		 1.23569155 -8.0054168701 164.44458008 1.28752184 -7.16346741 164.45223999 0.84450561 -9.84036255 165.40222168
		 0.85028076 -9.81797791 165.25566101 0.88519788 -9.72999573 165.27041626 0.87643832 -9.77157593 165.49684143
		 0.81610525 -9.91670227 165.52133179 0.82531416 -9.90742493 165.26327515 1.17360461 -8.91012573 164.74827576
		 1.11174166 -8.95358276 165.055938721 1.092819333 -9.044570923 165.059417725 1.11430001 -8.85446167 165.059829712
		 1.080839872 -9.012542725 165.27653503 1.065081239 -9.099639893 165.28613281 1.17024088 -7.20031738 165.37437439
		 1.1392349 -7.2807312 165.55062866 1.2062254 -7.41372681 165.63320923 1.04810071 -9.022369385 165.45069885
		 1.038406134 -9.071487427 165.520401 1.022347808 -9.38818359 165.07232666 0.92157447 -9.69613647 165.047683716
		 0.93585891 -9.76812744 164.67707825 1.090720534 -9.34272766 164.70672607 1.042419434 -9.42738342 165.3150177
		 0.89195776 -9.78622437 165.040512085 0.85163939 -9.88957214 165.040863037 -4.11115837 -7.62728882 165.085205078
		 -4.15152121 -7.63485718 165.30993652 -4.075257778 -7.23368835 165.11672974 -4.13736677 -7.58662415 164.82865906
		 -4.16097498 -7.16743469 164.84741211 0.54826504 -10.49821472 165.30335999 0.50052905 -10.55499268 165.32693481
		 0.477543 -10.58145142 165.082702637 0.52407312 -10.51829529 165.084854126 0.5235346 -10.48492432 165.45622253
		 0.47330031 -10.51686096 165.53959656 0.59377599 -10.42671204 165.29975891;
	setAttr ".vt[3154:3319]" 0.55695814 -10.41020203 165.53393555 -1.36972404 -11.57617188 165.4274292
		 -1.39362538 -11.58174133 165.57565308 -1.37298465 -11.57798767 165.14369202 1.20784461 -8.48742676 164.78889465
		 1.22442508 -8.041564941 164.80883789 1.17353177 -8.86071777 164.41477966 -0.64810109 -11.49746704 165.062545776
		 -0.69385332 -11.48179626 164.69644165 -0.38613769 -11.33117676 164.67071533 -0.41572693 -11.3710022 165.062286377
		 -0.61918432 -11.51782227 165.41612244 -0.81868643 -11.55250549 165.35862732 -0.83058584 -11.53666687 165.066116333
		 -0.39871258 -11.38691711 165.3366394 -0.088186286 -11.19577026 165.45320129 -0.092467666 -11.19476318 165.061843872
		 0.08402966 -11.034683228 165.061218262 0.0973351 -11.027923584 165.37966919 -0.077197962 -11.16972351 165.64326477
		 -0.27098072 -11.30247498 165.58938599 -0.26624221 -11.3066864 165.35180664 0.097060949 -11.021606445 165.5799408
		 -0.58364886 -11.50239563 165.63119507 -0.82520407 -11.57324219 165.59135437 -0.12670027 -11.2043457 164.64900208
		 -0.42229933 -11.29037476 164.24928284 0.086915568 -11.011764526 164.24743652 0.12142465 -11.0074768066 164.64538574
		 -0.43901813 -11.23565674 163.7620697 0.054373 -10.98660278 163.77258301 -0.97211349 -11.47570801 164.22834778
		 -0.95637399 -11.4206543 163.75218201 -4.0056619644 -8.14639282 165.32652283 -4.00032043457 -8.25598145 165.32237244
		 -3.96919203 -8.31524658 165.55601501 -3.97563362 -8.17012024 165.44100952 0.50135243 -10.55203247 163.78913879
		 0.89030623 -9.71469116 163.8520813 0.93158627 -9.75022888 164.36477661 0.53314531 -10.58963013 164.28619385
		 -4.12799025 -8.0028686523 164.44462585 -4.1790185 -7.16085815 164.45228577 -2.54875731 -11.23486328 165.062347412
		 -2.6183033 -11.19285583 165.062271118 -2.56187487 -11.2711792 165.31315613 -2.53324056 -11.32209778 165.58071899
		 -2.57442522 -11.28384399 165.52282715 -0.34670293 -11.33349609 165.062332153 -0.27712077 -11.29544067 165.062240601
		 -0.33359444 -11.34820557 165.31314087 -0.32103476 -11.3430481 165.52281189 -0.36224815 -11.37417603 165.58070374
		 -1.95905375 -11.47492981 164.69734192 -1.99160457 -11.4954834 165.056930542 -4.076189041 -8.605896 165.29223633
		 -3.95209432 -8.9306488 165.55305481 -4.00012731552 -8.63552856 165.53987122 -4.054779053 -8.55767822 165.057800293
		 -4.027554512 -8.22079468 165.076095581 -0.93661147 -11.53968811 164.69732666 -0.90406251 -11.55027771 165.056915283
		 -4.10059547 -8.4848938 164.78894043 -4.11675072 -8.039016724 164.80888367 -4.066646099 -8.85823059 164.41482544
		 -1.44781625 -11.45703125 163.74163818 -1.44781911 -11.46775818 164.21765137 -1.80449235 -11.55841064 165.64794922
		 -1.96631026 -11.54151917 165.57588196 -1.93673897 -11.53395081 165.38049316 -1.73344421 -11.55839539 165.47801208
		 -1.89990985 -11.51118469 165.057144165 -1.7120564 -11.54208374 165.093994141 -1.69197106 -11.52539063 164.69647217
		 -1.14623868 -11.57099915 165.6355896 -1.162238 -11.57493591 165.47801208 -0.95893693 -11.56640625 165.38047791
		 -0.92936003 -11.56437683 165.5758667 -1.18363035 -11.57002258 165.093994141 -0.99576378 -11.55729675 165.057128906
		 -1.20372093 -11.55822754 164.69647217 1.13910842 -8.12147522 165.077362061 1.14531457 -7.97880554 165.085144043
		 1.12084651 -8.0031280518 165.33361816 -3.22639418 -10.68516541 164.65977478 -3.21735477 -10.6839447 165.077667236
		 -3.42892885 -10.46554565 164.66094971 -4.031505585 -8.1190033 165.077407837 -4.01312542 -8.00068664551 165.33366394
		 -4.037575722 -7.97633362 165.085189819 0.3314141 -10.82206726 164.65975952 0.53417391 -10.58598328 164.66091919
		 0.32241195 -10.7913208 165.077636719 -3.58873034 -10.18966675 165.042068481 -3.61534405 -10.19590759 164.67800903
		 -3.46661782 -10.36376953 165.073516846 -3.66116095 -10.18179321 165.28840637 1.23739934 -7.76387024 165.59329224
		 1.13411164 -8.078598022 165.5791626 0.69429189 -10.26153564 165.042037964 0.57200062 -10.44973755 165.073486328
		 0.72087419 -10.28752136 164.67797852 0.7667554 -10.23275757 165.28837585 -4.026457787 -8.076141357 165.57920837
		 -4.12944508 -7.76130676 165.59333801 -3.047250032 -10.89057922 165.35739136 -3.11640024 -10.80671692 165.37619019
		 -3.10404468 -10.79882813 165.067398071 -3.032284975 -10.8729248 165.061004639 -3.056355476 -10.89758301 165.50268555
		 -3.076592684 -10.82540894 165.59593201 0.1521363 -10.97665405 165.35734558 0.13724847 -10.98693848 165.060974121
		 0.20898774 -10.91116333 165.067367554 0.22137 -10.88977051 165.37615967 0.18156937 -10.88690186 165.59590149
		 0.16125868 -10.96185303 165.50265503 -4.12803364 -7.10964966 163.94319153 -4.04548502 -7.96430969 163.93132019
		 1.23657751 -7.11225891 163.94314575 1.1532141 -7.96684265 163.93127441 1.073391795 -8.80531311 163.89575195
		 -3.96646404 -8.80288696 163.89579773 -3.92211986 -9.45349121 165.50537109 1.028457165 -9.45747375 165.50532532
		 -3.65723538 -10.16566467 165.56047058 0.762869 -10.1975708 165.56044006 -3.22840095 -10.67900085 165.40576172
		 -3.17480803 -10.65864563 165.68330383 0.33349922 -10.75524902 165.4057312 0.31111538 -10.69981384 165.67004395
		 -2.018484831 -11.522995 165.34152222 -2.018759489 -11.5234375 165.45898438 -0.87718856 -11.56274414 165.34150696
		 -0.87690526 -11.55610657 165.45896912 -3.39948368 -9.69670105 165.40045166 -3.26056266 -9.54989624 165.49655151
		 -3.22648096 -9.65278625 165.50410461 -3.64330268 -7.30526733 165.59603882 -3.68337226 -7.27546692 165.50030518
		 -3.49185371 -8.96409607 165.46150208 -3.50577879 -8.91001892 165.40557861 -3.34192085 -10.44313049 165.54867554
		 -3.33891082 -10.3732605 165.36203003 -3.17792892 -10.1993866 165.43582153 -1.44782066 -11.52929688 165.50033569
		 -1.49002087 -11.48597717 165.58030701 0.507456 -8.51211548 165.47964478 0.46257433 -8.82478333 165.50639343
		 -2.58256173 -11.19529724 165.58430481 -2.77938175 -11.067306519 165.63435364 -2.93786216 -10.88426208 165.58642578
		 -2.051923752 -11.45913696 165.5904541 -2.25520706 -11.41954041 165.61512756 0.73520094 -8.14546204 165.37882996
		 0.63101685 -8.19822693 165.49913025 0.36680987 -9.55163574 165.496521 0.50558662 -9.70095825 165.40042114
		 0.33262956 -9.65522766 165.5040741 0.79178745 -7.27757263 165.5002594 0.75169176 -7.30735779 165.59599304
		 0.61263376 -8.91197205 165.4055481 0.59865862 -8.96603394 165.46154785 0.44432926 -10.41860962 165.36199951
		 0.44727147 -10.49353027 165.54864502 0.28353131 -10.22691345 165.43579102;
	setAttr ".vt[3320:3485]" -1.40557683 -11.48707581 165.58030701 -0.1158614 -11.11804199 165.63432312
		 -0.31280336 -11.2447052 165.58428955 0.042787984 -10.94000244 165.58639526 -0.61338544 -11.45291138 165.60987854
		 -0.84366745 -11.48162842 165.59042358 -3.52347946 -8.19624329 165.49917603 -3.62761521 -8.14337158 165.37887573
		 -2.4749918 -11.26234436 165.59165955 -2.55330825 -11.27381897 165.4985199 -0.34213972 -11.3296814 165.49850464
		 -0.42043531 -11.30964661 165.59164429 -3.35563421 -8.82296753 165.50643921 -3.40021825 -8.51025391 165.47969055
		 -1.80539668 -11.50398254 165.63011169 -1.96572649 -11.48622131 165.55337524 -0.9298923 -11.50984192 165.55335999
		 -1.14519 -11.51686096 165.61767578 0.62533391 -7.63545227 165.55903625 0.59874815 -8.000045776367 165.54173279
		 -3.49102068 -7.99809265 165.54177856 -3.51725841 -7.63348389 165.55908203 -2.97765207 -10.85720825 165.43762207
		 -3.017224312 -10.75863647 165.57661438 0.1222698 -10.81417847 165.5765686 0.082606263 -10.90713501 165.43759155
		 -3.36654162 -9.26802063 165.46435547 0.47305691 -9.26985168 165.46432495 -3.1474793 -9.94148254 165.50601196
		 0.25334504 -9.95213318 165.50598145 -3.13563824 -10.62788391 165.65490723 0.2718859 -10.6647644 165.64154053
		 -1.99433589 -11.41175842 165.44824219 -0.90121359 -11.43495178 165.44822693 -3.38216281 -9.6473999 165.22860718
		 -3.38934088 -9.48893738 165.24391174 -3.30018926 -9.75665283 165.24668884 -3.6035068 -8.87091064 165.025238037
		 -3.58059335 -8.99110413 165.019546509 -3.65333915 -8.83418274 164.82963562 -3.59442258 -8.73835754 165.037124634
		 -3.55971813 -8.90510559 165.22087097 -3.53364754 -9.036392212 165.223526 -3.51128101 -8.74406433 165.25624084
		 -3.71262527 -7.18354797 165.33766174 -3.70256424 -7.34307861 165.32978821 -3.51206422 -9.21157837 165.013565063
		 -3.42905164 -9.48324585 165.024795532 -3.41730237 -9.60861206 164.82116699 -3.57730532 -9.11256409 164.77565002
		 -3.45507407 -9.25627136 165.23484802 -3.3437109 -9.74794006 165.017654419 -3.39470744 -9.62207031 165.022644043
		 0.80240273 -7.63197327 165.071502686 0.74762774 -7.63308716 165.31672668 0.81091189 -7.3452301 165.32974243
		 0.83076292 -7.25212097 165.082107544 0.85081452 -7.71276855 164.80375671 0.92027009 -7.15988159 164.79919434
		 -3.23081446 -10.32260132 165.20355225 -3.17897129 -10.4303894 165.23046875 -3.13654804 -10.40956116 164.97753906
		 -3.18421197 -10.31288147 164.98675537 -3.21185946 -10.16995239 165.21720886 -1.44775927 -11.39877319 165.27539063
		 -1.54568493 -11.39164734 165.292099 -1.44772959 -11.33198547 165.066665649 -1.52919555 -11.32800293 165.067092896
		 -1.44770646 -11.27983093 164.8793335 0.63663322 -8.50767517 165.26144409 0.61829132 -8.74603271 165.25619507
		 0.71772802 -8.50541687 165.038589478 0.70333606 -8.26655579 165.27314758 0.75087398 -8.23120117 165.065597534
		 -2.18282986 -11.18736267 165.0092163086 -2.20259786 -11.10264587 164.77044678 -2.39052439 -11.045776367 164.84510803
		 -2.35113478 -11.13038635 165.044891357 -2.21979976 -11.28511047 165.29627991 -2.062837601 -11.33782959 165.29742432
		 -2.017878771 -11.25627136 165.041610718 -2.40669084 -11.19140625 165.28594971 -2.68773222 -10.99485779 165.27590942
		 -2.61804986 -10.94857788 165.0048065186 -2.76847005 -10.8323822 165.014099121 -2.80699778 -10.87628174 165.25343323
		 -2.55330324 -11.090927124 165.2663269 -2.53043032 -10.92224121 164.73484802 -2.33803511 -10.96348572 164.43930054
		 -2.76208901 -10.70954895 164.28089905 -2.80878448 -10.73701477 164.79444885 -2.30797029 -10.89552307 163.79916382
		 -2.73455191 -10.68040466 163.80638123 -1.84809315 -11.11755371 164.27632141 -1.85904467 -11.060180664 163.78662109
		 0.7304765 -8.10412598 165.25645447 -3.099592924 -10.32392883 163.82164001 -3.44854498 -9.57887268 163.89543152
		 -3.48993993 -9.60986328 164.40200806 -3.13168979 -10.35975647 164.30342102 0.85692954 -7.94935608 164.49810791
		 0.93617988 -7.1388092 164.47201538 0.49564147 -9.49078369 165.24386597 0.48831168 -9.64924622 165.22857666
		 0.40623337 -9.75968933 165.24665833 0.68736345 -8.99313354 165.019592285 0.71039164 -8.87295532 165.025192261
		 0.7602554 -8.83628845 164.82958984 0.70143425 -8.74040222 165.037078857 0.64037901 -9.038375854 165.22348022
		 0.66657442 -8.90711975 165.2208252 0.82112479 -7.18566895 165.33761597 0.61862403 -9.21354675 165.013519287
		 0.68395525 -9.11459351 164.77560425 0.52348024 -9.61048889 164.82113647 0.53535312 -9.48513794 165.024765015
		 0.56159621 -9.25817871 165.23480225 0.44975987 -9.7497406 165.017623901 0.50087667 -9.62393188 165.022613525
		 -3.69433355 -7.62983704 165.071548462 -3.72233129 -7.24993896 165.08215332 -3.63955474 -7.6309967 165.31677246
		 -3.74282789 -7.71058655 164.80380249 -3.81175637 -7.15762329 164.79924011 0.336294 -10.35092163 165.20352173
		 0.28971049 -10.3266449 164.98672485 0.24195604 -10.42178345 164.97750854 0.28434914 -10.45808411 165.23043823
		 0.31749102 -10.19151306 165.2171936 -1.34982705 -11.39248657 165.292099 -1.36625957 -11.32807922 165.067108154
		 0.77564406 -8.54946899 164.79693604 0.79400486 -8.076553345 164.88577271 0.82397777 -8.79165649 164.4427948
		 -0.71249998 -11.19581604 165.0092010498 -0.54414481 -11.14398193 165.044876099 -0.50467026 -11.050720215 164.84509277
		 -0.69264984 -11.10462952 164.77043152 -0.87751245 -11.26025391 165.041595459 -0.83263332 -11.34959412 165.29740906
		 -0.67562765 -11.30400085 165.29626465 -0.4886587 -11.22232056 165.28593445 -0.207422 -11.01725769 165.27587891
		 -0.088049591 -10.90466309 165.25340271 -0.12652554 -10.84532166 165.014068604 -0.27705336 -10.95782471 165.004776001
		 -0.34194884 -11.1194458 165.26629639 -0.36464599 -10.92402649 164.7348175 -0.086116292 -10.74153137 164.79441833
		 -0.13279274 -10.71080017 164.28086853 -0.55708522 -10.96434021 164.43928528 -0.16031156 -10.68162537 163.80635071
		 -0.58709812 -10.89633179 163.79914856 -1.036180496 -11.060562134 163.78662109 -1.047177196 -11.11793518 164.27641296
		 -3.62285399 -8.10205078 165.25650024 -3.59586811 -8.26449585 165.27319336 0.20506936 -10.32551575 163.8216095
		 0.23714226 -10.36135864 164.3033905 0.59610873 -9.61181641 164.40197754 0.55473316 -9.58078003 163.89538574
		 -3.74917459 -7.94715881 164.49815369 -3.82765293 -7.13653564 164.4720459 -2.49654698 -11.046005249 165.039611816
		 -2.42617011 -11.096481323 165.045272827 -2.4667542 -11.16111755 165.2550354;
	setAttr ".vt[3486:3574]" -0.39865246 -11.059310913 165.039596558 -0.46907809 -11.1109314 165.045257568
		 -0.42856616 -11.19110107 165.25502014 -1.93232989 -11.28204346 165.043777466 -1.90746951 -11.21766663 164.82092285
		 -3.52939534 -8.50569153 165.26148987 -3.61049199 -8.50335693 165.038635254 -3.64337611 -8.22911072 165.065643311
		 -0.9630838 -11.28431702 165.043762207 -0.98788542 -11.21810913 164.82090759 -3.66845465 -8.54734802 164.79698181
		 -3.68636298 -8.074432373 164.88581848 -3.71702671 -8.78948975 164.44284058 -1.44763923 -11.11592102 163.76922607
		 -1.44766688 -11.18829346 164.46783447 -1.71280837 -11.39242554 165.3028717 -1.87164819 -11.37820435 165.28936768
		 -1.67696738 -11.31604004 165.051651001 -1.84603405 -11.2996521 165.050140381 -1.61834836 -11.25045776 164.80485535
		 -1.023860216 -11.38879395 165.28935242 -1.18270814 -11.39727783 165.3028717 -1.049396038 -11.30160522 165.050140381
		 -1.21847725 -11.31672668 165.051651001 -1.27703822 -11.25062561 164.80485535 0.76247507 -8.086532593 165.070953369
		 0.71261686 -7.91737366 165.29969788 0.76896715 -7.92922974 165.0806427 -3.034007788 -10.49485779 164.70787048
		 -3.16347289 -10.31680298 164.77362061 -3.036634207 -10.53985596 164.99490356 -3.65483928 -8.08442688 165.070999146
		 -3.66118121 -7.92712402 165.080688477 -3.60481524 -7.91531372 165.29974365 0.13933846 -10.49711609 164.70783997
		 0.14192019 -10.54975891 164.99487305 0.26897174 -10.32165527 164.77359009 -3.25613284 -9.99650574 164.99237061
		 -3.20396543 -10.19842529 164.99191284 -3.24305606 -10.071578979 164.72181702 -3.23100805 -9.96734619 165.23814392
		 0.36193979 -10.0028839111 164.99234009 0.34869727 -10.073928833 164.7217865 0.30957487 -10.210495 164.99188232
		 0.33684438 -9.97743225 165.2381134 -2.88786554 -10.78646851 165.23692322 -2.84404564 -10.76130676 165.014648438
		 -2.91254926 -10.68383789 165.015975952 -2.95989466 -10.69168091 165.26037598 -0.0070972806 -10.81591797 165.2368927
		 0.065023527 -10.72019958 165.26034546 0.017695181 -10.69691467 165.015945435 -0.050883163 -10.77537537 165.01461792
		 -3.78066611 -7.082366943 163.99717712 -3.70034814 -7.93411255 163.99238586 0.88923591 -7.084594727 163.99713135
		 0.80810595 -7.93626404 163.99234009 0.72960287 -8.7396698 163.95748901 -3.62261128 -8.7375946 163.95753479
		 -3.063616991 -10.55891418 165.28082275 0.16887742 -10.58255005 165.28079224 -1.96426392 -11.35093689 165.2671814
		 -0.9312197 -11.36204529 165.26716614 4.68921137 0.16175154 162.35606384 4.56559229 -2.27524471 161.32899475
		 3.25843501 -4.071361542 160.19229126 2.30617642 -4.90797043 159.50463867 1.44293952 -5.53697634 158.90414429
		 -0.58205748 -5.91906595 158.085021973 -1.83682656 -5.73947906 158.11940002 -2.75733376 -5.46150684 158.43978882
		 -3.89732265 -4.83942795 158.9647522 -4.58944464 -4.1176548 159.44223022 -5.71861458 -2.39602923 160.43505859
		 -6.17102242 -1.049247861 161.091079712 -6.14166021 0.056811213 161.61618042 -5.74235439 1.19672346 162.14476013
		 -5.18012905 2.28640151 162.58093262 -4.42555809 3.30493283 162.9009552 -3.031719685 4.23131466 163.062072754
		 -1.86398268 4.74948502 163.0809021 -0.71386325 4.82515907 163.11219788 0.79012281 4.68176174 163.16018677
		 1.64071512 4.38862658 163.16125488 2.59309292 3.67378736 163.11486816 3.36489916 2.9329505 163.033065796
		 3.9807899 1.8798573 162.84133911 4.49649286 0.74178088 162.54692078 -3.59409904 3.98176479 163.052993774;
	setAttr -s 7150 ".ed";
	setAttr ".ed[0:165]"  0 1 1 1 2 1 2 3 1 3 0 1 4 5 1 5 6 1 6 7 1 7 4 1 8 9 1
		 9 10 1 10 11 1 11 8 1 12 6 1 5 13 1 13 12 1 14 10 1 9 15 1 15 14 1 16 17 1 17 18 1
		 18 19 1 19 16 1 20 21 1 21 18 1 17 20 1 22 23 1 23 24 1 24 25 1 25 22 1 26 27 1 27 28 1
		 28 15 1 15 26 1 25 29 1 29 30 1 30 22 1 31 32 1 32 33 1 33 34 1 34 31 1 35 36 1 36 32 1
		 31 35 1 37 5 1 4 38 1 38 37 1 10 37 1 38 11 1 14 39 1 39 37 1 39 13 1 40 31 1 34 41 1
		 41 40 1 42 40 1 41 43 1 43 42 1 44 35 1 40 44 1 19 3 1 2 16 1 45 16 1 2 23 1 23 45 1
		 46 47 1 47 48 1 48 49 1 49 46 1 3 46 1 49 0 1 50 51 1 51 52 1 52 53 1 53 50 1 54 55 1
		 55 56 1 56 57 1 57 54 1 6 54 1 57 7 1 58 4 1 7 59 1 59 58 1 60 58 1 59 61 1 61 60 1
		 62 8 1 11 63 1 63 62 1 64 62 1 63 65 1 65 64 1 66 67 1 67 68 1 68 69 1 69 66 1 57 70 1
		 70 59 1 70 71 1 71 61 1 56 72 1 72 70 1 72 73 1 73 71 1 12 74 1 74 54 1 74 75 1 75 55 1
		 76 77 1 77 8 1 62 76 1 78 76 1 64 78 1 79 80 1 80 81 1 81 67 1 67 79 1 82 79 1 66 82 1
		 83 84 1 84 85 1 85 86 1 86 83 1 33 83 1 86 34 1 60 87 1 87 88 1 88 58 1 88 38 1 87 65 1
		 63 88 1 85 89 1 89 90 1 90 86 1 90 41 1 89 91 1 91 92 1 92 90 1 52 47 1 46 53 1 19 53 1
		 93 45 1 22 93 1 94 95 1 95 64 1 65 94 1 96 97 1 97 17 1 16 96 1 97 98 1 98 20 1 95 99 1
		 99 78 1 99 100 1 100 101 1 101 78 1 100 102 1 102 93 1 93 101 1 103 104 1 104 87 1
		 60 103 1 104 94 1 102 105 1 105 45 1 105 96 1;
	setAttr ".ed[166:331]" 106 107 1 107 95 1 94 106 1 108 109 1 109 97 1 96 108 1
		 109 110 1 110 98 1 107 111 1 111 99 1 111 112 1 112 100 1 112 113 1 113 102 1 114 115 1
		 115 104 1 103 114 1 115 106 1 113 116 1 116 105 1 116 108 1 117 118 1 118 69 1 69 119 1
		 119 117 1 32 117 1 119 33 1 36 120 1 120 117 1 121 122 1 122 123 1 123 68 1 68 121 1
		 123 83 1 119 123 1 77 124 1 124 9 1 125 30 1 30 82 1 82 126 1 126 125 1 30 80 1 125 93 1
		 42 127 1 127 44 1 125 78 1 126 76 1 128 129 1 129 35 1 44 128 1 129 28 1 28 36 1
		 27 120 1 118 130 1 130 66 1 130 126 1 124 26 1 92 43 1 129 14 1 130 77 1 120 130 1
		 130 26 1 39 128 1 128 131 1 131 13 1 128 132 1 132 133 1 133 131 1 127 132 1 42 134 1
		 134 132 1 134 75 1 75 133 1 131 74 1 135 21 1 20 136 1 136 135 1 61 135 1 136 60 1
		 71 137 1 137 135 1 137 51 1 51 21 1 138 103 1 136 138 1 98 138 1 139 114 1 138 139 1
		 110 139 1 71 52 1 81 121 1 122 84 1 0 140 1 140 141 1 141 1 1 142 143 1 143 141 1
		 140 142 1 144 145 1 145 143 1 142 144 1 141 23 1 145 146 1 146 24 1 24 143 1 147 148 1
		 148 146 1 145 147 1 149 150 1 150 148 1 147 149 1 144 149 1 151 142 1 140 152 1 152 151 1
		 153 151 1 152 154 1 154 153 1 155 149 1 144 156 1 156 155 1 157 155 1 156 158 1 158 157 1
		 151 156 1 153 158 1 159 150 1 155 159 1 49 152 1 48 154 1 157 160 1 160 159 1 161 162 1
		 162 163 1 163 164 1 164 161 1 165 166 1 166 167 1 167 168 1 168 165 1 169 166 1 165 170 1
		 170 169 1 171 172 1 172 162 1 161 171 1 29 164 1 163 173 1 173 29 1 173 80 1 174 168 1
		 167 175 1 175 174 1 81 174 1 175 121 1 176 146 1 148 177 1 177 176 1 150 178 1 178 177 1
		 176 25 1 173 174 1 163 168 1 162 165 1 172 170 1 178 171 1;
	setAttr ".ed[332:497]" 161 177 1 164 176 1 179 169 1 170 180 1 180 179 1 181 172 1
		 171 182 1 182 181 1 183 178 1 159 183 1 181 180 1 183 182 1 166 184 1 184 185 1 185 167 1
		 169 186 1 186 184 1 185 187 1 187 175 1 187 188 1 188 84 1 122 187 1 179 189 1 189 186 1
		 190 179 1 180 191 1 191 190 1 192 181 1 182 193 1 193 192 1 192 191 1 194 193 1 183 194 1
		 195 196 1 196 189 1 189 197 1 197 195 1 190 197 1 198 190 1 191 199 1 199 198 1 200 198 1
		 199 201 1 201 200 1 202 192 1 193 203 1 203 202 1 202 199 1 202 204 1 204 201 1 205 195 1
		 197 206 1 206 205 1 207 205 1 206 208 1 208 207 1 198 206 1 200 208 1 160 194 1 203 209 1
		 209 204 1 210 211 1 211 212 1 212 213 1 213 210 1 214 213 1 212 215 1 215 214 1 216 214 1
		 215 217 1 217 216 1 55 214 1 216 56 1 75 213 1 218 219 1 219 220 1 220 221 1 221 218 1
		 222 223 1 223 224 1 224 225 1 225 222 1 226 227 1 227 223 1 222 226 1 218 228 1 228 229 1
		 229 219 1 230 188 1 188 221 1 220 230 1 230 85 1 224 231 1 231 232 1 232 225 1 233 226 1
		 222 234 1 234 233 1 229 233 1 234 219 1 234 235 1 235 220 1 225 235 1 232 236 1 236 235 1
		 236 230 1 232 91 1 89 236 1 216 237 1 237 72 1 237 238 1 238 73 1 226 239 1 239 240 1
		 240 227 1 228 196 1 196 241 1 241 229 1 241 242 1 242 233 1 242 239 1 184 218 1 221 185 1
		 243 215 1 212 244 1 244 243 1 223 243 1 244 224 1 245 217 1 243 245 1 227 245 1 186 228 1
		 246 244 1 211 246 1 246 231 1 247 248 1 248 217 1 245 247 1 240 247 1 134 210 1 246 91 1
		 211 92 1 210 43 1 239 249 1 249 250 1 250 240 1 195 251 1 251 241 1 251 252 1 252 242 1
		 252 249 1 253 247 1 250 253 1 254 255 1 255 256 1 256 257 1 257 254 1 249 254 1 257 250 1
		 207 258 1 258 259 1 259 205 1 259 251 1 258 260 1 260 261 1 261 259 1;
	setAttr ".ed[498:663]" 261 252 1 260 255 1 254 261 1 262 263 1 263 257 1 256 262 1
		 263 253 1 248 237 1 248 264 1 264 238 1 262 264 1 264 253 1 194 265 1 265 203 1 108 266 1
		 266 110 1 266 106 1 114 266 1 267 268 1 268 269 1 269 270 1 270 267 1 271 272 1 272 273 1
		 273 274 1 274 271 1 275 276 1 276 274 1 273 275 1 277 278 1 278 279 1 279 280 1 280 277 1
		 275 281 1 281 282 1 282 276 1 283 284 1 284 285 1 285 286 1 286 283 1 284 280 1 279 285 1
		 281 287 1 287 288 1 288 282 1 289 283 1 286 290 1 290 289 1 270 289 1 290 267 1 291 292 1
		 292 293 1 293 294 1 294 291 1 295 294 1 293 296 1 296 295 1 294 297 1 297 298 1 298 291 1
		 268 271 1 274 269 1 276 270 1 282 289 1 288 283 1 299 300 1 300 298 1 298 301 1 301 299 1
		 302 299 1 301 303 1 303 302 1 304 278 1 277 305 1 305 304 1 303 304 1 305 302 1 306 293 1
		 292 307 1 307 306 1 272 306 1 307 273 1 308 275 1 307 308 1 291 308 1 309 287 1 281 310 1
		 310 309 1 300 309 1 310 298 1 310 308 1 311 312 1 312 313 1 313 314 1 314 311 1 315 316 1
		 316 311 1 314 315 1 317 314 1 313 318 1 318 317 1 319 315 1 317 319 1 320 321 1 321 319 1
		 317 320 1 318 322 1 322 320 1 323 319 1 321 324 1 324 323 1 325 326 1 326 327 1 327 328 1
		 328 325 1 329 330 1 330 331 1 331 332 1 332 329 1 330 333 1 333 334 1 334 331 1 335 336 1
		 336 325 1 328 335 1 337 335 1 328 338 1 338 337 1 339 329 1 332 340 1 340 339 1 341 342 1
		 342 326 1 325 341 1 343 344 1 344 342 1 341 343 1 345 336 1 336 346 1 346 347 1 347 345 1
		 348 345 1 347 349 1 349 348 1 348 343 1 341 345 1 342 350 1 350 327 1 344 351 1 351 350 1
		 71 352 1 352 353 1 353 52 1 73 354 1 354 352 1 355 356 1 356 357 1 357 358 1 358 355 1
		 278 359 1 359 360 1 360 279 1 361 362 1 362 363 1 363 364 1 364 361 1;
	setAttr ".ed[664:829]" 365 364 1 363 366 1 366 365 1 367 368 1 368 369 1 369 370 1
		 370 367 1 371 365 1 366 372 1 372 371 1 362 286 1 285 363 1 279 366 1 360 372 1 356 367 1
		 370 357 1 373 359 1 304 373 1 303 374 1 374 373 1 375 355 1 358 376 1 376 375 1 376 377 1
		 377 378 1 378 375 1 379 380 1 380 381 1 381 382 1 382 379 1 380 383 1 383 384 1 384 381 1
		 385 157 1 158 386 1 386 385 1 153 387 1 387 386 1 382 160 1 385 382 1 154 388 1 388 387 1
		 48 389 1 389 388 1 390 391 1 391 388 1 389 390 1 391 392 1 392 387 1 393 383 1 380 394 1
		 394 393 1 47 395 1 395 389 1 396 397 1 397 398 1 398 399 1 399 396 1 400 399 1 398 401 1
		 401 400 1 402 401 1 398 403 1 403 402 1 404 405 1 405 406 1 406 407 1 407 404 1 408 409 1
		 409 406 1 405 408 1 410 403 1 397 410 1 399 411 1 411 412 1 412 396 1 400 413 1 413 411 1
		 414 415 1 415 416 1 416 417 1 417 414 1 403 405 1 404 402 1 410 408 1 418 412 1 411 419 1
		 419 418 1 420 419 1 413 420 1 421 418 1 419 422 1 422 421 1 420 423 1 423 422 1 424 425 1
		 425 426 1 426 427 1 427 424 1 428 429 1 429 430 1 430 431 1 431 428 1 383 432 1 432 433 1
		 433 384 1 432 428 1 431 433 1 434 435 1 435 436 1 436 437 1 437 434 1 435 438 1 438 439 1
		 439 436 1 438 427 1 426 439 1 440 441 1 441 442 1 442 443 1 443 440 1 444 445 1 445 414 1
		 417 444 1 446 447 1 447 397 1 396 446 1 448 446 1 412 448 1 447 449 1 449 410 1 449 450 1
		 450 408 1 451 448 1 418 451 1 452 451 1 421 452 1 450 453 1 453 409 1 444 454 1 454 455 1
		 455 445 1 456 440 1 443 457 1 457 456 1 458 416 1 415 459 1 459 458 1 460 434 1 437 461 1
		 461 460 1 429 460 1 461 430 1 462 456 1 457 463 1 463 462 1 454 462 1 463 455 1 464 465 1
		 465 466 1 466 467 1 467 464 1 466 468 1 468 469 1 469 467 1 468 453 1;
	setAttr ".ed[830:995]" 450 469 1 470 471 1 471 467 1 469 470 1 449 470 1 447 472 1
		 472 470 1 472 473 1 473 471 1 474 475 1 475 473 1 472 474 1 446 474 1 476 474 1 448 476 1
		 477 476 1 451 477 1 452 478 1 478 477 1 476 479 1 479 475 1 480 479 1 477 480 1 481 480 1
		 478 481 1 207 437 1 436 258 1 439 260 1 200 430 1 461 208 1 482 407 1 406 483 1 483 482 1
		 458 482 1 483 416 1 409 484 1 484 483 1 484 417 1 453 485 1 485 484 1 485 444 1 486 454 1
		 485 486 1 468 486 1 487 462 1 486 487 1 466 487 1 488 456 1 487 488 1 465 488 1 489 440 1
		 488 489 1 490 427 1 438 491 1 491 490 1 492 490 1 491 442 1 442 492 1 435 493 1 493 491 1
		 493 443 1 393 415 1 414 494 1 494 393 1 494 432 1 445 495 1 495 494 1 495 428 1 496 429 1
		 495 496 1 455 496 1 434 497 1 497 493 1 497 457 1 394 459 1 463 498 1 498 496 1 498 460 1
		 497 498 1 499 500 1 500 501 1 501 502 1 502 499 1 503 502 1 501 504 1 504 503 1 505 506 1
		 506 507 1 507 508 1 508 505 1 509 510 1 510 511 1 511 512 1 512 509 1 504 506 1 505 503 1
		 509 513 1 513 514 1 514 510 1 513 515 1 515 516 1 516 514 1 517 518 1 518 516 1 515 517 1
		 510 505 1 508 511 1 514 503 1 516 502 1 518 499 1 519 520 1 520 521 1 521 522 1 522 519 1
		 523 524 1 524 525 1 525 526 1 526 523 1 527 528 1 528 517 1 517 529 1 529 527 1 530 531 1
		 531 528 1 527 530 1 532 530 1 527 533 1 533 532 1 534 532 1 533 535 1 535 534 1 534 536 1
		 536 537 1 537 532 1 536 538 1 538 539 1 539 537 1 537 540 1 540 530 1 540 541 1 541 531 1
		 519 542 1 542 543 1 543 520 1 524 509 1 512 525 1 544 513 1 524 544 1 523 545 1 545 544 1
		 546 515 1 544 546 1 546 529 1 545 547 1 547 546 1 529 548 1 548 533 1 547 548 1 545 549 1
		 549 550 1 550 547 1 550 551 1 551 552 1 552 547 1 553 548 1 552 553 1;
	setAttr ".ed[996:1161]" 553 535 1 554 555 1 555 525 1 512 554 1 555 556 1 556 526 1
		 557 558 1 558 559 1 559 554 1 554 557 1 559 560 1 560 555 1 561 556 1 560 561 1 562 536 1
		 534 563 1 563 562 1 564 565 1 565 349 1 349 566 1 566 564 1 539 567 1 567 565 1 564 539 1
		 568 348 1 565 568 1 569 568 1 567 569 1 564 540 1 566 541 1 538 570 1 570 567 1 570 571 1
		 571 569 1 558 561 1 558 522 1 521 561 1 572 573 1 573 574 1 574 312 1 312 572 1 575 576 1
		 576 577 1 577 578 1 578 575 1 579 580 1 580 581 1 581 582 1 582 579 1 577 583 1 583 584 1
		 584 578 1 572 584 1 583 573 1 585 586 1 586 574 1 573 585 1 587 588 1 588 577 1 576 587 1
		 580 589 1 589 590 1 590 581 1 588 591 1 591 583 1 591 585 1 592 350 1 351 593 1 593 592 1
		 585 592 1 593 586 1 594 327 1 592 594 1 591 594 1 594 338 1 588 338 1 587 337 1 589 339 1
		 340 590 1 595 596 1 596 295 1 295 597 1 597 595 1 598 599 1 599 600 1 600 601 1 601 598 1
		 602 603 1 603 604 1 604 605 1 605 602 1 599 602 1 605 600 1 606 597 1 296 606 1 596 297 1
		 607 374 1 301 607 1 603 378 1 377 604 1 297 607 1 608 609 1 609 596 1 595 608 1 609 607 1
		 608 374 1 610 611 1 611 612 1 612 613 1 613 610 1 614 578 1 584 615 1 615 614 1 616 579 1
		 582 617 1 617 616 1 618 575 1 614 618 1 619 572 1 311 619 1 620 621 1 621 614 1 615 620 1
		 316 622 1 622 619 1 316 613 1 612 622 1 623 624 1 624 621 1 620 623 1 623 625 1 625 626 1
		 626 624 1 627 628 1 628 626 1 625 627 1 628 629 1 629 630 1 630 626 1 631 632 1 632 633 1
		 633 634 1 634 631 1 633 635 1 635 636 1 636 634 1 621 637 1 637 618 1 635 616 1 617 636 1
		 619 615 1 622 620 1 625 611 1 611 542 1 542 627 1 638 290 1 286 639 1 639 638 1 640 641 1
		 641 642 1 642 643 1 643 640 1 638 640 1 643 644 1 644 638 1 550 645 1;
	setAttr ".ed[1162:1327]" 645 646 1 646 551 1 647 648 1 648 362 1 361 647 1 649 650 1
		 650 651 1 651 652 1 652 649 1 651 648 1 647 652 1 642 653 1 653 654 1 654 643 1 654 655 1
		 655 644 1 639 656 1 656 640 1 656 657 1 657 641 1 523 658 1 658 549 1 650 657 1 656 651 1
		 639 648 1 549 659 1 659 645 1 658 660 1 660 659 1 661 267 1 267 644 1 655 661 1 526 662 1
		 662 658 1 663 662 1 556 663 1 662 664 1 664 660 1 665 664 1 663 665 1 666 667 1 667 268 1
		 268 668 1 668 666 1 661 668 1 669 670 1 670 671 1 671 672 1 672 669 1 673 674 1 674 672 1
		 671 673 1 492 675 1 675 676 1 676 677 1 677 492 1 441 675 1 678 679 1 679 680 1 680 681 1
		 681 678 1 424 678 1 681 425 1 676 682 1 682 683 1 683 677 1 676 684 1 684 685 1 685 682 1
		 686 687 1 687 688 1 688 689 1 689 686 1 688 679 1 679 690 1 690 689 1 691 424 1 490 691 1
		 677 691 1 678 692 1 692 690 1 691 692 1 683 692 1 693 687 1 687 571 1 570 693 1 694 693 1
		 538 694 1 694 695 1 695 696 1 696 693 1 696 688 1 688 697 1 697 680 1 696 354 1 354 697 1
		 695 352 1 698 613 1 315 698 1 699 700 1 700 701 1 701 702 1 702 699 1 703 699 1 702 704 1
		 704 703 1 705 323 1 324 706 1 706 705 1 707 315 1 323 707 1 708 707 1 705 708 1 709 698 1
		 707 709 1 710 711 1 711 712 1 712 713 1 713 710 1 714 715 1 715 712 1 711 714 1 710 716 1
		 716 717 1 717 711 1 718 717 1 716 719 1 719 718 1 720 721 1 721 722 1 722 723 1 723 720 1
		 723 724 1 724 725 1 725 720 1 726 725 1 724 727 1 727 726 1 714 726 1 727 715 1 717 728 1
		 728 714 1 729 726 1 728 729 1 730 725 1 729 730 1 731 720 1 730 731 1 732 721 1 731 732 1
		 733 734 1 734 729 1 728 733 1 734 735 1 735 730 1 735 736 1 736 731 1 737 738 1 738 739 1
		 739 732 1 732 737 1 736 737 1 718 733 1 464 718 1 719 465 1 740 741 1;
	setAttr ".ed[1328:1493]" 741 736 1 735 740 1 742 743 1 743 738 1 737 742 1 741 742 1
		 734 744 1 744 740 1 733 745 1 745 744 1 464 745 1 471 745 1 473 744 1 475 740 1 479 741 1
		 480 742 1 481 743 1 746 710 1 713 684 1 684 746 1 675 746 1 441 747 1 747 746 1 747 716 1
		 489 747 1 489 719 1 748 749 1 749 750 1 750 751 1 751 748 1 752 748 1 751 753 1 753 752 1
		 322 754 1 754 755 1 755 320 1 756 757 1 757 752 1 753 756 1 271 758 1 758 759 1 759 272 1
		 760 663 1 561 760 1 761 762 1 762 763 1 763 764 1 764 761 1 765 759 1 758 766 1 766 765 1
		 767 768 1 768 769 1 769 770 1 770 767 1 771 762 1 761 772 1 772 771 1 521 773 1 773 760 1
		 774 768 1 767 775 1 775 774 1 776 771 1 772 777 1 777 776 1 778 779 1 779 774 1 775 778 1
		 667 758 1 666 766 1 770 665 1 663 767 1 760 775 1 773 778 1 759 780 1 780 306 1 780 296 1
		 781 598 1 601 782 1 782 781 1 783 781 1 782 784 1 784 783 1 785 606 1 780 785 1 765 785 1
		 786 787 1 787 788 1 788 789 1 789 786 1 790 791 1 791 792 1 792 793 1 793 790 1 786 794 1
		 794 795 1 795 787 1 790 796 1 796 797 1 797 791 1 798 799 1 799 789 1 788 798 1 800 801 1
		 801 799 1 798 800 1 802 793 1 792 803 1 803 802 1 803 804 1 804 805 1 805 802 1 801 804 1
		 803 799 1 792 789 1 791 786 1 797 794 1 806 807 1 807 808 1 808 809 1 809 806 1 810 811 1
		 811 812 1 812 507 1 507 810 1 813 814 1 814 632 1 631 813 1 815 816 1 816 629 1 628 815 1
		 817 818 1 818 819 1 819 820 1 820 817 1 821 822 1 822 816 1 815 821 1 819 814 1 813 820 1
		 823 818 1 817 824 1 824 823 1 808 823 1 824 809 1 825 822 1 821 826 1 826 825 1 811 825 1
		 826 812 1 368 827 1 827 828 1 828 369 1 829 830 1 830 365 1 371 829 1 830 831 1 831 364 1
		 831 832 1 832 361 1 833 834 1 834 670 1 669 833 1 835 836 1 836 837 1;
	setAttr ".ed[1494:1659]" 837 838 1 838 835 1 835 839 1 839 840 1 840 841 1 841 835 1
		 842 843 1 843 844 1 844 845 1 845 842 1 846 847 1 847 842 1 845 846 1 844 848 1 848 849 1
		 849 845 1 850 846 1 849 850 1 847 851 1 851 838 1 838 842 1 837 843 1 827 840 1 839 828 1
		 830 847 1 846 831 1 850 832 1 829 851 1 852 562 1 563 853 1 853 852 1 562 694 1 852 695 1
		 852 353 1 853 395 1 395 353 1 854 855 1 855 798 1 788 854 1 855 856 1 856 800 1 857 858 1
		 858 671 1 670 857 1 859 857 1 834 859 1 859 856 1 855 857 1 854 858 1 860 861 1 861 862 1
		 862 863 1 863 860 1 864 861 1 860 865 1 865 864 1 866 861 1 864 867 1 867 866 1 866 868 1
		 868 862 1 869 870 1 870 344 1 343 869 1 871 863 1 863 870 1 869 871 1 569 871 1 869 568 1
		 870 872 1 872 351 1 862 872 1 571 873 1 873 871 1 873 860 1 686 865 1 873 686 1 749 874 1
		 874 875 1 875 750 1 876 877 1 877 878 1 878 879 1 879 876 1 880 703 1 704 881 1 881 880 1
		 882 883 1 883 884 1 884 885 1 885 882 1 874 882 1 885 875 1 886 887 1 887 706 1 324 886 1
		 888 886 1 321 888 1 755 888 1 201 431 1 433 204 1 209 384 1 381 265 1 265 160 1 209 265 1
		 889 890 1 890 891 1 891 892 1 892 889 1 890 893 1 893 894 1 894 891 1 895 889 1 892 896 1
		 896 895 1 897 898 1 898 899 1 899 900 1 900 897 1 901 902 1 902 903 1 903 904 1 904 901 1
		 893 901 1 904 894 1 896 905 1 905 906 1 906 895 1 907 689 1 689 908 1 908 909 1 909 907 1
		 910 727 1 724 911 1 911 910 1 912 913 1 913 914 1 914 915 1 915 912 1 916 712 1 715 917 1
		 917 916 1 918 919 1 919 920 1 920 921 1 921 918 1 910 917 1 913 918 1 921 914 1 922 923 1
		 923 924 1 924 925 1 925 922 1 926 927 1 927 928 1 928 929 1 929 926 1 723 930 1 930 911 1
		 931 912 1 915 932 1 932 931 1 722 933 1 933 930 1 934 931 1 932 935 1;
	setAttr ".ed[1660:1825]" 935 934 1 936 713 1 916 936 1 919 937 1 937 938 1 938 920 1
		 939 906 1 905 940 1 940 939 1 941 939 1 940 942 1 942 941 1 936 685 1 943 938 1 937 944 1
		 944 943 1 945 943 1 944 946 1 946 945 1 832 947 1 947 647 1 948 949 1 949 649 1 652 948 1
		 947 948 1 950 951 1 951 674 1 673 950 1 952 953 1 953 951 1 950 952 1 954 955 1 955 850 1
		 849 954 1 956 954 1 848 956 1 957 958 1 958 959 1 959 960 1 960 957 1 961 960 1 959 962 1
		 962 961 1 958 955 1 954 959 1 956 962 1 958 948 1 947 955 1 957 949 1 963 964 1 964 965 1
		 965 500 1 500 963 1 966 967 1 967 968 1 968 969 1 969 966 1 970 971 1 971 967 1 966 970 1
		 972 973 1 973 964 1 963 972 1 972 974 1 974 975 1 975 973 1 976 971 1 970 977 1 977 976 1
		 978 976 1 977 979 1 979 978 1 333 978 1 979 334 1 974 980 1 980 981 1 981 975 1 982 346 1
		 346 981 1 980 982 1 983 757 1 756 984 1 984 983 1 985 983 1 984 986 1 986 985 1 796 987 1
		 987 988 1 988 797 1 989 641 1 657 990 1 990 989 1 991 551 1 646 992 1 992 991 1 993 994 1
		 994 653 1 642 993 1 796 995 1 995 996 1 996 987 1 794 997 1 997 998 1 998 795 1 989 993 1
		 999 650 1 649 1000 1 1000 999 1 997 999 1 1000 998 1 987 989 1 990 988 1 996 993 1
		 988 997 1 990 999 1 996 1001 1 1001 994 1 1002 1001 1 995 1002 1 1003 552 1 991 1003 1
		 1003 1004 1 1004 553 1 1005 1006 1 1006 1007 1 1007 1008 1 1008 1005 1 1006 991 1
		 992 1007 1 1009 1010 1 1010 1006 1 1005 1009 1 1010 1003 1 1011 1012 1 1012 1010 1
		 1009 1011 1 1012 1004 1 1013 1014 1 1014 1004 1 1012 1013 1 1015 1013 1 1011 1015 1
		 1014 535 1 563 1014 1 1013 853 1 390 853 1 1015 390 1 1016 963 1 499 1016 1 528 1017 1
		 1017 518 1 531 1018 1 1018 1017 1 1019 972 1 1016 1019 1 541 1020 1 1020 1018 1 1019 1021 1
		 1021 974 1 1017 1016 1 1018 1019 1 1020 1021 1 1022 347 1 982 1022 1 1022 566 1 1022 1020 1;
	setAttr ".ed[1826:1991]" 982 1021 1 965 1023 1 1023 501 1 968 1024 1 1024 1025 1
		 1025 969 1 1024 1026 1 1026 1027 1 1027 1025 1 1023 1028 1 1028 504 1 506 1029 1
		 1029 810 1 1030 1031 1 1031 807 1 806 1030 1 1026 1031 1 1030 1027 1 1028 1029 1
		 1032 1033 1 1033 1034 1 1034 1035 1 1035 1032 1 1032 1036 1 1036 1037 1 1037 1033 1
		 1038 1039 1 1039 1040 1 1040 1041 1 1041 1038 1 1038 1035 1 1034 1039 1 1042 1033 1
		 1037 1043 1 1043 1042 1 1042 1044 1 1044 1034 1 1039 1045 1 1045 1046 1 1046 1040 1
		 1044 1045 1 1047 404 1 407 1048 1 1048 1047 1 1049 1047 1 1048 1050 1 1050 1049 1
		 394 1051 1 1051 458 1 1052 402 1 1047 1052 1 1053 1052 1 1049 1053 1 1054 401 1 1052 1054 1
		 1055 1054 1 1053 1055 1 1056 400 1 1054 1056 1 1057 1056 1 1055 1057 1 1058 1059 1
		 1059 1060 1 1060 1061 1 1061 1058 1 420 1058 1 1061 423 1 413 1062 1 1062 1058 1
		 1062 1063 1 1063 1059 1 1056 1062 1 1057 1063 1 482 1064 1 1064 1048 1 1064 1065 1
		 1065 1050 1 1051 1064 1 1051 1066 1 1066 1065 1 1067 379 1 379 1068 1 1068 1069 1
		 1069 1067 1 1068 1070 1 1070 1071 1 1071 1069 1 1067 394 1 1067 1066 1 1069 1072 1
		 1072 1066 1 1071 1073 1 1073 1072 1 1074 1071 1 1070 1075 1 1075 1074 1 1074 1076 1
		 1076 1073 1 1077 1074 1 1075 1078 1 1078 1077 1 1077 1079 1 1079 1076 1 1046 1079 1
		 1077 1040 1 1078 1041 1 385 1080 1 1080 1070 1 1070 382 1 1081 802 1 805 1082 1 1082 1081 1
		 1081 1083 1 1083 793 1 1084 1085 1 1085 1086 1 1086 1087 1 1087 1084 1 1088 1089 1
		 1089 1090 1 1090 1091 1 1091 1088 1 1089 1092 1 1092 1093 1 1093 1090 1 1094 1081 1
		 1082 1095 1 1095 1094 1 1096 1083 1 1094 1096 1 1097 1098 1 1098 1085 1 1084 1097 1
		 1089 1085 1 1098 1092 1 1088 1086 1 1083 1099 1 1099 790 1 1099 995 1 1100 1002 1
		 1099 1100 1 1101 1098 1 1097 1102 1 1102 1101 1 1096 1100 1 1101 1103 1 1103 1092 1
		 1103 1104 1 1104 1093 1 1103 1005 1 1008 1104 1 1105 1000 1 949 1105 1 787 1106 1
		 1106 854 1 795 1107 1 1107 1106 1 1108 1107 1 998 1108 1 1105 1108 1 1109 1110 1
		 1110 950 1 673 1109 1 1110 1111 1 1111 952 1 1112 1113 1;
	setAttr ".ed[1992:2157]" 1113 957 1 960 1112 1 1114 1112 1 961 1114 1 858 1109 1
		 1111 1113 1 1112 952 1 1114 953 1 1113 1105 1 1106 1109 1 1107 1110 1 1108 1111 1
		 574 1115 1 1115 313 1 1115 1116 1 1116 318 1 1116 1117 1 1117 322 1 1117 1118 1 1118 754 1
		 586 1119 1 1119 1115 1 1119 1120 1 1120 1116 1 1120 1121 1 1121 1117 1 1121 1122 1
		 1122 1118 1 1121 866 1 867 1122 1 1120 868 1 1123 872 1 868 1123 1 1119 1123 1 1123 593 1
		 1032 1124 1 1124 1125 1 1125 1036 1 1035 1126 1 1126 1124 1 1126 1097 1 1084 1124 1
		 1087 1125 1 1038 1127 1 1127 1126 1 1127 1102 1 1041 1128 1 1128 1127 1 610 1129 1
		 1129 1130 1 1130 543 1 543 610 1 520 1131 1 1131 773 1 698 1129 1 1130 1131 1 1132 1133 1
		 1133 1134 1 1134 1135 1 1135 1132 1 1136 1137 1 1137 1138 1 1138 1139 1 1139 1136 1
		 1140 1136 1 1139 1141 1 1141 1140 1 778 1134 1 1133 779 1 1137 776 1 777 1138 1 1131 1134 1
		 1130 1135 1 1135 1142 1 1142 1143 1 1143 1132 1 1129 1142 1 700 1144 1 1144 1145 1
		 1145 701 1 1144 1140 1 1141 1145 1 709 1146 1 1146 1143 1 1142 709 1 708 1146 1 812 1147 1
		 1147 508 1 1148 815 1 627 1148 1 1149 821 1 1148 1149 1 511 557 1 1149 1150 1 1150 826 1
		 1150 1147 1 557 1147 1 1150 558 1 519 1148 1 522 1149 1 1080 1151 1 1151 1075 1 1151 1152 1
		 1152 1078 1 1080 1153 1 1153 1154 1 1154 1151 1 1152 1128 1 1152 1155 1 1155 1156 1
		 1156 1128 1 1154 1155 1 1156 1102 1 1157 1101 1 1156 1157 1 1158 1103 1 1157 1158 1
		 1153 392 1 392 1159 1 1159 1154 1 1160 1155 1 1159 1160 1 1161 1158 1 1157 1160 1
		 1160 1161 1 1159 1162 1 1162 1161 1 1158 1009 1 1161 1011 1 1162 1015 1 1162 391 1
		 1153 386 1 255 426 1 425 256 1 264 680 1 697 238 1 681 262 1 1163 1164 1 1164 1165 1
		 1165 1166 1 1166 1163 1 1167 1163 1 1166 1168 1 1168 1167 1 1169 1167 1 1168 1170 1
		 1170 1169 1 1171 1172 1 1172 1173 1 1173 1174 1 1174 1171 1 1175 1176 1 1176 1177 1
		 1177 1178 1 1178 1175 1 1179 1175 1 1178 1180 1 1180 1179 1 1164 1181 1 1181 1182 1
		 1182 1165 1 1181 1179 1 1180 1182 1 1183 1171 1 1174 1184 1 1184 1183 1;
	setAttr ".ed[2158:2323]" 1176 1183 1 1184 1177 1 1165 277 1 280 1166 1 284 1168 1
		 283 1170 1 1173 1170 1 288 1173 1 287 1174 1 309 1184 1 300 1177 1 299 1178 1 302 1180 1
		 305 1182 1 1172 1169 1 18 50 1 630 1185 1 1185 624 1 1185 637 1 612 623 1 332 335 1
		 337 340 1 587 590 1 576 581 1 575 582 1 618 617 1 637 636 1 1185 634 1 630 631 1
		 629 813 1 816 820 1 822 817 1 825 824 1 811 809 1 810 806 1 1029 1030 1 1028 1027 1
		 1023 1025 1 965 969 1 964 966 1 973 970 1 975 977 1 981 979 1 346 334 1 336 331 1
		 1186 1187 1 1187 1164 1 1163 1186 1 1188 1186 1 1167 1188 1 1189 1188 1 1169 1189 1
		 1190 1191 1 1191 1172 1 1171 1190 1 1192 1193 1 1193 1176 1 1175 1192 1 1194 1192 1
		 1179 1194 1 1187 1195 1 1195 1181 1 1195 1194 1 1196 1190 1 1183 1196 1 1193 1196 1
		 1191 1189 1 1192 1197 1 1197 1196 1 1190 1198 1 1198 1189 1 1197 1198 1 1195 1197 1
		 1187 1198 1 1188 1198 1 1199 1200 1 1200 333 1 330 1199 1 1201 1199 1 329 1201 1
		 1202 1201 1 339 1202 1 1203 1204 1 1204 580 1 579 1203 1 1204 1205 1 1205 589 1 1205 1202 1
		 1206 1203 1 616 1206 1 1207 1208 1 1208 633 1 632 1207 1 1208 1209 1 1209 635 1 1209 1206 1
		 1210 1211 1 1211 808 1 807 1210 1 1212 1207 1 814 1212 1 1213 1214 1 1214 819 1 818 1213 1
		 1214 1212 1 1215 1213 1 823 1215 1 1211 1215 1 1216 1217 1 1217 968 1 967 1216 1
		 1218 1216 1 971 1218 1 1219 1218 1 976 1219 1 1200 1220 1 1220 978 1 1220 1219 1
		 1217 1221 1 1221 1024 1 1221 1222 1 1222 1026 1 1223 1210 1 1031 1223 1 1222 1223 1
		 1224 1225 0 1225 1200 1 1199 1224 1 1226 1224 0 1201 1226 1 1227 1226 0 1202 1227 1
		 1228 1229 0 1229 1204 1 1203 1228 1 1229 1230 0 1230 1205 1 1230 1227 0 1231 1228 0
		 1206 1231 1 1232 1233 0 1233 1208 1 1207 1232 1 1233 1234 0 1234 1209 1 1234 1231 0
		 1235 1236 0 1236 1211 1 1210 1235 1 1237 1232 0 1212 1237 1 1238 1239 0 1239 1214 1
		 1213 1238 1 1239 1237 0 1240 1238 0 1215 1240 1 1236 1240 0 1241 1242 0 1242 1217 1
		 1216 1241 1 1243 1241 0 1218 1243 1 1244 1243 0 1219 1244 1 1225 1245 0;
	setAttr ".ed[2324:2489]" 1245 1220 1 1245 1244 0 1242 1246 0 1246 1221 1 1246 1247 0
		 1247 1222 1 1248 1235 0 1223 1248 1 1247 1248 0 646 653 1 994 992 1 1001 1007 1 1002 1008 1
		 1100 1104 1 1096 1093 1 1094 1090 1 1095 1091 1 763 783 1 784 764 1 769 765 1 766 770 1
		 666 665 1 668 664 1 661 660 1 655 659 1 654 645 1 1249 1250 1 1250 834 1 833 1249 1
		 1250 1251 1 1251 859 1 1251 1252 1 1252 856 1 1252 1253 1 1253 800 1 1253 1254 1
		 1254 801 1 1254 1255 1 1255 804 1 1255 1256 1 1256 805 1 1256 1257 1 1257 1082 1
		 1257 1258 1 1258 1095 1 1258 1259 1 1259 1091 1 1259 1260 1 1260 1088 1 1260 1261 1
		 1261 1086 1 1261 1262 1 1262 1087 1 1262 1263 1 1263 1125 1 1263 1264 1 1264 1036 1
		 1264 1265 1 1265 1037 1 1265 1266 1 1266 1043 1 1267 1268 1 1268 1269 1 1269 690 1
		 690 1267 1 942 985 1 985 909 1 908 942 1 986 864 1 865 907 1 907 986 1 899 877 1
		 876 900 1 903 883 1 882 904 1 874 894 1 749 891 1 748 892 1 752 896 1 757 905 1 983 940 1
		 878 880 1 881 879 1 884 887 1 886 885 1 888 875 1 755 750 1 754 751 1 1118 753 1
		 1122 756 1 867 984 1 683 1267 1 682 945 1 945 1267 1 1268 946 1 946 941 1 941 1269 1
		 1269 908 1 685 943 1 936 938 1 916 920 1 917 921 1 910 914 1 911 915 1 930 932 1
		 933 935 1 927 922 1 925 928 1 944 939 1 937 906 1 919 895 1 918 889 1 913 890 1 912 893 1
		 931 901 1 934 902 1 923 898 1 897 924 1 1270 1271 1 1271 672 1 674 1270 1 1272 1249 1
		 833 1273 1 1273 1272 1 1271 1274 1 1274 669 1 1275 1276 1 1276 951 1 953 1275 1 1276 1270 1
		 1277 1278 1 1278 837 1 836 1277 1 1278 1279 1 1279 843 1 1279 1280 1 1280 844 1 1280 1281 1
		 1281 848 1 1282 1283 1 1283 962 1 956 1282 1 1283 1284 1 1284 961 1 1281 1282 1 1284 1285 1
		 1285 1114 1 1285 1275 1 1274 1273 1 1270 1286 1 1286 1274 1 1287 1288 1 1288 1276 1
		 1275 1287 1 1288 1286 1 1277 1289 1 1289 1290 1 1290 1278 1 1290 1291 1 1291 1279 1
		 1291 1281 1 1282 1292 1 1292 1284 1 1291 1292 1 1292 1293 1 1293 1285 1;
	setAttr ".ed[2490:2655]" 1293 1287 1 1286 1294 1 1294 1273 1 1295 1296 1 1296 1288 1
		 1287 1295 1 1296 1297 1 1297 1286 1 1298 1299 1 1299 1291 1 1290 1298 1 1299 1300 1
		 1300 1292 1 1300 1301 1 1301 1293 1 1301 1295 1 1297 1302 1 1302 1294 1 1303 1304 1
		 1304 1296 1 1295 1303 1 1304 1305 1 1305 1297 1 1306 1307 1 1307 1299 1 1298 1306 1
		 1307 1308 1 1308 1300 1 1308 1309 1 1309 1301 1 1309 1303 1 1305 1310 1 1310 1302 1
		 1311 1312 1 1312 1304 1 1303 1311 1 1312 1313 1 1313 1305 1 1314 1315 1 1315 1307 1
		 1306 1314 1 1315 1316 1 1316 1308 1 1316 1317 1 1317 1309 1 1317 1311 1 1313 1318 1
		 1318 1310 1 1319 1320 1 1320 1312 1 1311 1319 1 1320 1321 1 1321 1313 1 1322 1323 1
		 1323 1315 1 1314 1322 1 1323 1324 1 1324 1316 1 1324 1325 1 1325 1317 1 1325 1319 1
		 1321 1326 1 1326 1318 1 1327 1328 1 1328 1329 1 1329 1330 1 1330 1327 1 1322 1327 1
		 1330 1323 1 1328 1326 1 1321 1329 1 1319 1329 1 1325 1330 1 1331 3550 0 1332 1072 1
		 1046 1333 1 1334 3570 0 1336 3553 0 1334 1055 1 1333 3551 0 1266 1337 1 1042 1336 1
		 1050 1338 1 1338 3572 0 1335 3568 0 1332 3549 0 1337 3554 0 1340 929 1 929 722 1
		 721 1340 1 1341 926 1 1340 1341 1 841 1342 1 1342 836 1 839 851 1 829 828 1 371 369 1
		 372 370 1 360 357 1 359 358 1 373 376 1 374 377 1 608 604 1 595 605 1 597 600 1 606 601 1
		 785 782 1 765 784 1 769 764 1 768 761 1 774 772 1 779 777 1 1133 1138 1 1132 1139 1
		 1143 1141 1 1146 1145 1 708 701 1 705 702 1 706 704 1 887 881 1 884 879 1 883 876 1
		 903 900 1 902 897 1 934 924 1 935 925 1 933 928 1 1342 1289 1 1340 732 1 739 1341 1
		 266 111 1 266 113 1 1343 1344 1 1344 1345 1 1345 1346 1 1346 1343 1 1347 1348 1 1348 1349 1
		 1349 1350 1 1350 1347 1 1351 1352 1 1352 1353 1 1353 1354 1 1354 1351 1 1355 1356 1
		 1356 1350 1 1349 1355 1 1357 1358 1 1358 1354 1 1353 1357 1 1359 1360 1 1360 1361 1
		 1361 1362 1 1362 1359 1 1363 1362 1 1361 1364 1 1364 1363 1 1365 1366 1 1366 1367 1
		 1367 1368 1 1368 1365 1 1369 1358 1 1358 1370 1 1370 1371 1 1371 1369 1 1365 1372 1;
	setAttr ".ed[2656:2821]" 1372 1373 1 1373 1366 1 1374 1375 1 1375 1376 1 1376 1377 1
		 1377 1374 1 1378 1374 1 1377 1379 1 1379 1378 1 1380 1381 1 1381 1347 1 1350 1380 1
		 1352 1381 1 1380 1353 1 1380 1382 1 1382 1357 1 1356 1382 1 1383 1384 1 1384 1375 1
		 1374 1383 1 1385 1386 1 1386 1384 1 1383 1385 1 1387 1383 1 1378 1387 1 1359 1345 1
		 1344 1360 1 1388 1368 1 1368 1345 1 1359 1388 1 1389 1390 1 1390 1391 1 1391 1392 1
		 1392 1389 1 1343 1390 1 1389 1344 1 1393 1394 1 1394 1395 1 1395 1396 1 1396 1393 1
		 1397 1398 1 1398 1399 1 1399 1400 1 1400 1397 1 1348 1398 1 1397 1349 1 1401 1402 1
		 1402 1348 1 1347 1401 1 1403 1404 1 1404 1402 1 1401 1403 1 1405 1406 1 1406 1352 1
		 1351 1405 1 1407 1408 1 1408 1406 1 1405 1407 1 1409 1410 1 1410 1411 1 1411 1412 1
		 1412 1409 1 1402 1413 1 1413 1398 1 1404 1414 1 1414 1413 1 1413 1415 1 1415 1399 1
		 1414 1416 1 1416 1415 1 1397 1417 1 1417 1355 1 1400 1418 1 1418 1417 1 1419 1405 1
		 1351 1420 1 1420 1419 1 1421 1407 1 1419 1421 1 1422 1412 1 1412 1423 1 1423 1424 1
		 1424 1422 1 1425 1409 1 1422 1425 1 1426 1427 1 1427 1428 1 1428 1429 1 1429 1426 1
		 1375 1427 1 1426 1376 1 1401 1430 1 1430 1431 1 1431 1403 1 1381 1430 1 1430 1406 1
		 1408 1431 1 1427 1432 1 1432 1433 1 1433 1428 1 1384 1432 1 1432 1434 1 1434 1435 1
		 1435 1433 1 1394 1389 1 1392 1395 1 1394 1360 1 1436 1365 1 1388 1436 1 1437 1408 1
		 1407 1438 1 1438 1437 1 1439 1359 1 1362 1440 1 1440 1439 1 1363 1441 1 1441 1440 1
		 1421 1442 1 1442 1438 1 1421 1443 1 1443 1444 1 1444 1442 1 1443 1436 1 1436 1445 1
		 1445 1444 1 1446 1403 1 1431 1447 1 1447 1446 1 1437 1447 1 1388 1448 1 1448 1445 1
		 1439 1448 1 1449 1437 1 1438 1450 1 1450 1449 1 1451 1439 1 1440 1452 1 1452 1451 1
		 1441 1453 1 1453 1452 1 1442 1454 1 1454 1450 1 1444 1455 1 1455 1454 1 1445 1456 1
		 1456 1455 1 1457 1446 1 1447 1458 1 1458 1457 1 1449 1458 1 1448 1459 1 1459 1456 1
		 1451 1459 1 1460 1461 1 1461 1410 1 1410 1462 1 1462 1460 1 1376 1461 1 1460 1377 1
		 1460 1463 1 1463 1379 1 1464 1411 1 1411 1465 1 1465 1466 1 1466 1464 1 1465 1461 1;
	setAttr ".ed[2822:2987]" 1426 1465 1 1354 1467 1 1467 1420 1 1468 1469 1 1469 1425 1
		 1425 1372 1 1372 1468 1 1424 1372 1 1436 1468 1 1387 1470 1 1470 1385 1 1421 1468 1
		 1419 1469 1 1471 1387 1 1378 1472 1 1472 1471 1 1379 1370 1 1370 1472 1 1463 1371 1
		 1409 1473 1 1473 1462 1 1469 1473 1 1369 1467 1 1386 1434 1 1357 1472 1 1420 1473 1
		 1473 1463 1 1369 1473 1 1356 1474 1 1474 1471 1 1471 1382 1 1474 1475 1 1475 1476 1
		 1476 1471 1 1476 1470 1 1476 1477 1 1477 1385 1 1475 1418 1 1418 1477 1 1417 1474 1
		 1478 1479 1 1479 1363 1 1364 1478 1 1403 1479 1 1478 1404 1 1478 1480 1 1480 1414 1
		 1364 1396 1 1396 1480 1 1481 1479 1 1446 1481 1 1481 1441 1 1482 1481 1 1457 1482 1
		 1482 1453 1 1395 1414 1 1464 1423 1 1429 1466 1 1346 1483 1 1483 1484 1 1484 1343 1
		 1485 1484 1 1483 1486 1 1486 1485 1 1487 1485 1 1486 1488 1 1488 1487 1 1368 1483 1
		 1486 1367 1 1367 1489 1 1489 1488 1 1490 1488 1 1489 1491 1 1491 1490 1 1492 1490 1
		 1491 1493 1 1493 1492 1 1492 1487 1 1494 1495 1 1495 1484 1 1485 1494 1 1496 1497 1
		 1497 1495 1 1494 1496 1 1498 1499 1 1499 1487 1 1492 1498 1 1500 1501 1 1501 1499 1
		 1498 1500 1 1499 1494 1 1501 1496 1 1502 1498 1 1493 1502 1 1495 1390 1 1497 1391 1
		 1502 1503 1 1503 1500 1 1504 1505 1 1505 1506 1 1506 1507 1 1507 1504 1 1508 1509 1
		 1509 1510 1 1510 1511 1 1511 1508 1 1512 1513 1 1513 1508 1 1511 1512 1 1514 1504 1
		 1507 1515 1 1515 1514 1 1373 1516 1 1516 1506 1 1505 1373 1 1424 1516 1 1517 1518 1
		 1518 1510 1 1509 1517 1 1464 1518 1 1517 1423 1 1519 1520 1 1520 1491 1 1489 1519 1
		 1520 1521 1 1521 1493 1 1366 1519 1 1517 1516 1 1509 1506 1 1508 1507 1 1513 1515 1
		 1520 1504 1 1514 1521 1 1519 1505 1 1522 1523 1 1523 1513 1 1512 1522 1 1524 1525 1
		 1525 1514 1 1515 1524 1 1526 1502 1 1521 1526 1 1523 1524 1 1525 1526 1 1510 1527 1
		 1527 1528 1 1528 1511 1 1528 1529 1 1529 1512 1 1518 1530 1 1530 1527 1 1530 1466 1
		 1429 1531 1 1531 1530 1 1529 1532 1 1532 1522 1 1533 1534 1 1534 1523 1 1522 1533 1
		 1535 1536 1 1536 1525 1 1524 1535 1 1534 1535 1 1537 1526 1 1536 1537 1 1538 1539 1;
	setAttr ".ed[2988:3153]" 1539 1532 1 1532 1540 1 1540 1538 1 1539 1533 1 1541 1542 1
		 1542 1534 1 1533 1541 1 1543 1544 1 1544 1542 1 1541 1543 1 1545 1546 1 1546 1536 1
		 1535 1545 1 1542 1545 1 1544 1547 1 1547 1545 1 1548 1549 1 1549 1539 1 1538 1548 1
		 1550 1551 1 1551 1549 1 1548 1550 1 1549 1541 1 1551 1543 1 1537 1503 1 1547 1552 1
		 1552 1546 1 1553 1554 1 1554 1555 1 1555 1556 1 1556 1553 1 1557 1558 1 1558 1555 1
		 1554 1557 1 1559 1560 1 1560 1558 1 1557 1559 1 1399 1559 1 1557 1400 1 1554 1418 1
		 1561 1562 1 1562 1563 1 1563 1564 1 1564 1561 1 1565 1566 1 1566 1567 1 1567 1568 1
		 1568 1565 1 1569 1565 1 1568 1570 1 1570 1569 1 1564 1571 1 1571 1572 1 1572 1561 1
		 1573 1563 1 1562 1531 1 1531 1573 1 1428 1573 1 1566 1574 1 1574 1575 1 1575 1567 1
		 1576 1577 1 1577 1565 1 1569 1576 1 1564 1577 1 1576 1571 1 1563 1578 1 1578 1577 1
		 1578 1566 1 1578 1579 1 1579 1574 1 1573 1579 1 1579 1433 1 1435 1574 1 1415 1580 1
		 1580 1559 1 1416 1581 1 1581 1580 1 1570 1582 1 1582 1583 1 1583 1569 1 1571 1584 1
		 1584 1540 1 1540 1572 1 1576 1585 1 1585 1584 1 1583 1585 1 1527 1562 1 1561 1528 1
		 1586 1587 1 1587 1555 1 1558 1586 1 1567 1587 1 1586 1568 1 1588 1586 1 1560 1588 1
		 1588 1570 1 1572 1529 1 1589 1556 1 1587 1589 1 1575 1589 1 1590 1588 1 1560 1591 1
		 1591 1590 1 1590 1582 1 1553 1477 1 1435 1589 1 1434 1556 1 1386 1553 1 1582 1592 1
		 1592 1593 1 1593 1583 1 1584 1594 1 1594 1538 1 1585 1595 1 1595 1594 1 1593 1595 1
		 1596 1592 1 1590 1596 1 1597 1598 1 1598 1599 1 1599 1600 1 1600 1597 1 1592 1598 1
		 1597 1593 1 1548 1601 1 1601 1602 1 1602 1550 1 1594 1601 1 1601 1603 1 1603 1604 1
		 1604 1602 1 1595 1603 1 1603 1597 1 1600 1604 1 1605 1599 1 1598 1606 1 1606 1605 1
		 1596 1606 1 1580 1591 1 1581 1607 1 1607 1591 1 1596 1607 1 1607 1605 1 1546 1608 1
		 1608 1537 1 1453 1609 1 1609 1451 1 1609 1457 1 1449 1609 1 1610 1611 1 1611 1612 1
		 1612 1613 1 1613 1610 1 1614 1615 1 1615 1616 1 1616 1617 1 1617 1614 1 1618 1616 1
		 1615 1619 1 1619 1618 1 1620 1621 1 1621 1622 1 1622 1623 1 1623 1620 1 1619 1624 1;
	setAttr ".ed[3154:3319]" 1624 1625 1 1625 1618 1 1626 1627 1 1627 1628 1 1628 1629 1
		 1629 1626 1 1628 1622 1 1621 1629 1 1624 1630 1 1630 1631 1 1631 1625 1 1632 1633 1
		 1633 1627 1 1626 1632 1 1610 1633 1 1632 1611 1 1634 1635 1 1635 1636 1 1636 1637 1
		 1637 1634 1 1638 1639 1 1639 1636 1 1635 1638 1 1634 1640 1 1640 1641 1 1641 1635 1
		 1612 1615 1 1614 1613 1 1611 1619 1 1632 1624 1 1626 1630 1 1642 1643 1 1643 1640 1
		 1640 1644 1 1644 1642 1 1645 1646 1 1646 1643 1 1642 1645 1 1647 1648 1 1648 1620 1
		 1623 1647 1 1645 1648 1 1647 1646 1 1649 1650 1 1650 1637 1 1636 1649 1 1616 1650 1
		 1649 1617 1 1651 1650 1 1618 1651 1 1651 1634 1 1652 1653 1 1653 1625 1 1631 1652 1
		 1640 1653 1 1652 1644 1 1651 1653 1 1654 1655 1 1655 1656 1 1656 1657 1 1657 1654 1
		 1658 1655 1 1654 1659 1 1659 1658 1 1660 1661 1 1661 1656 1 1655 1660 1 1662 1660 1
		 1658 1662 1 1663 1660 1 1662 1664 1 1664 1663 1 1663 1665 1 1665 1661 1 1666 1667 1
		 1667 1664 1 1662 1666 1 1668 1669 1 1669 1670 1 1670 1671 1 1671 1668 1 1672 1673 1
		 1673 1674 1 1674 1675 1 1675 1672 1 1674 1676 1 1676 1677 1 1677 1675 1 1678 1669 1
		 1668 1679 1 1679 1678 1 1680 1681 1 1681 1669 1 1678 1680 1 1682 1683 1 1683 1673 1
		 1672 1682 1 1684 1668 1 1671 1685 1 1685 1684 1 1686 1684 1 1685 1687 1 1687 1686 1
		 1688 1689 1 1689 1690 1 1690 1679 1 1679 1688 1 1691 1692 1 1692 1689 1 1688 1691 1
		 1688 1684 1 1686 1691 1 1670 1693 1 1693 1685 1 1693 1694 1 1694 1687 1 1395 1695 1
		 1695 1696 1 1696 1414 1 1696 1697 1 1697 1416 1 355 1698 1 1698 1699 1 1699 356 1
		 1622 1700 1 1700 1701 1 1701 1623 1 1702 1703 1 1703 1704 1 1704 1705 1 1705 1702 1
		 1706 1707 1 1707 1704 1 1703 1706 1 367 1708 1 1708 1709 1 1709 368 1 1710 1711 1
		 1711 1707 1 1706 1710 1 1704 1628 1 1627 1705 1 1707 1622 1 1711 1700 1 1699 1708 1
		 1712 1647 1 1701 1712 1 1712 1713 1 1713 1646 1 375 1714 1 1714 1698 1 378 1715 1
		 1715 1714 1 1716 1717 1 1717 1718 1 1718 1719 1 1719 1716 1 1718 1720 1 1720 1721 1
		 1721 1719 1 1722 1723 1 1723 1501 1 1500 1722 1 1723 1724 1 1724 1496 1 1717 1722 1;
	setAttr ".ed[3320:3485]" 1503 1717 1 1724 1725 1 1725 1497 1 1725 1726 1 1726 1391 1
		 1727 1726 1 1725 1728 1 1728 1727 1 1724 1729 1 1729 1728 1 1730 1731 1 1731 1719 1
		 1721 1730 1 1726 1732 1 1732 1392 1 1733 1734 1 1734 1735 1 1735 1736 1 1736 1733 1
		 1737 1738 1 1738 1735 1 1734 1737 1 1739 1740 1 1740 1735 1 1738 1739 1 1741 1742 1
		 1742 1743 1 1743 1744 1 1744 1741 1 1745 1744 1 1743 1746 1 1746 1745 1 1747 1736 1
		 1740 1747 1 1733 1748 1 1748 1749 1 1749 1734 1 1749 1750 1 1750 1737 1 1751 1752 1
		 1752 1753 1 1753 1754 1 1754 1751 1 1739 1741 1 1744 1740 1 1745 1747 1 1755 1756 1
		 1756 1749 1 1748 1755 1 1757 1750 1 1756 1757 1 422 1756 1 1755 421 1 423 1757 1
		 1758 1759 1 1759 1760 1 1760 1761 1 1761 1758 1 1762 1763 1 1763 1764 1 1764 1765 1
		 1765 1762 1 1720 1766 1 1766 1767 1 1767 1721 1 1766 1763 1 1762 1767 1 1768 1769 1
		 1769 1770 1 1770 1771 1 1771 1768 1 1770 1772 1 1772 1773 1 1773 1771 1 1772 1760 1
		 1759 1773 1 1774 1775 1 1775 1776 1 1776 1777 1 1777 1774 1 1778 1752 1 1751 1779 1
		 1779 1778 1 1780 1733 1 1736 1781 1 1781 1780 1 1782 1748 1 1780 1782 1 1747 1783 1
		 1783 1781 1 1745 1784 1 1784 1783 1 1785 1755 1 1782 1785 1 1785 452 1 1746 1786 1
		 1786 1784 1 1779 1787 1 1787 1788 1 1788 1778 1 1789 1790 1 1790 1775 1 1774 1789 1
		 1791 1792 1 1792 1754 1 1753 1791 1 1793 1794 1 1794 1769 1 1768 1793 1 1764 1794 1
		 1793 1765 1 1795 1796 1 1796 1790 1 1789 1795 1 1787 1796 1 1795 1788 1 1797 1798 1
		 1798 1799 1 1799 1800 1 1800 1797 1 1798 1801 1 1801 1802 1 1802 1799 1 1801 1784 1
		 1786 1802 1 1803 1801 1 1798 1804 1 1804 1803 1 1803 1783 1 1803 1805 1 1805 1781 1
		 1804 1806 1 1806 1805 1 1807 1805 1 1806 1808 1 1808 1807 1 1807 1780 1 1809 1782 1
		 1807 1809 1 1810 1785 1 1809 1810 1 1810 478 1 1808 1811 1 1811 1809 1 1812 1810 1
		 1811 1812 1 1812 481 1 1602 1770 1 1769 1550 1 1604 1772 1 1551 1794 1 1764 1543 1
		 1813 1814 1 1814 1743 1 1742 1813 1 1753 1814 1 1813 1791 1 1814 1815 1 1815 1746 1
		 1752 1815 1 1815 1816 1 1816 1786 1 1778 1816 1 1817 1816 1 1788 1817 1 1817 1802 1;
	setAttr ".ed[3486:3651]" 1818 1817 1 1795 1818 1 1818 1799 1 1819 1818 1 1789 1819 1
		 1819 1800 1 1820 1819 1 1774 1820 1 1821 1822 1 1822 1773 1 1759 1821 1 1823 1776 1
		 1776 1822 1 1821 1823 1 1822 1824 1 1824 1771 1 1775 1824 1 1730 1825 1 1825 1751 1
		 1754 1730 1 1767 1825 1 1825 1826 1 1826 1779 1 1762 1826 1 1827 1826 1 1765 1827 1
		 1827 1787 1 1824 1828 1 1828 1768 1 1790 1828 1 1792 1731 1 1827 1829 1 1829 1796 1
		 1793 1829 1 1829 1828 1 1830 1831 1 1831 1832 1 1832 1833 1 1833 1830 1 1834 1835 1
		 1835 1832 1 1831 1834 1 1836 1837 1 1837 1838 1 1838 1839 1 1839 1836 1 1840 1841 1
		 1841 1842 1 1842 1843 1 1843 1840 1 1834 1836 1 1839 1835 1 1843 1844 1 1844 1845 1
		 1845 1840 1 1844 1846 1 1846 1847 1 1847 1845 1 1848 1847 1 1846 1849 1 1849 1848 1
		 1842 1837 1 1836 1843 1 1834 1844 1 1831 1846 1 1830 1849 1 1850 1851 1 1851 1852 1
		 1852 1853 1 1853 1850 1 1854 1855 1 1855 1856 1 1856 1857 1 1857 1854 1 1858 1859 1
		 1859 1848 1 1848 1860 1 1860 1858 1 1861 1858 1 1860 1862 1 1862 1861 1 1863 1864 1
		 1864 1858 1 1861 1863 1 1865 1866 1 1866 1864 1 1863 1865 1 1863 1867 1 1867 1868 1
		 1868 1865 1 1867 1869 1 1869 1870 1 1870 1868 1 1861 1871 1 1871 1867 1 1862 1872 1
		 1872 1871 1 1853 1873 1 1873 1874 1 1874 1850 1 1856 1841 1 1840 1857 1 1875 1857 1
		 1845 1875 1 1875 1876 1 1876 1854 1 1877 1875 1 1847 1877 1 1859 1877 1 1877 1878 1
		 1878 1876 1 1864 1879 1 1879 1859 1 1879 1878 1 1878 1880 1 1880 1881 1 1881 1876 1
		 1878 1882 1 1882 1883 1 1883 1880 1 1884 1882 1 1879 1884 1 1866 1884 1 1885 1841 1
		 1856 1886 1 1886 1885 1 1855 1887 1 1887 1886 1 1888 1885 1 1885 1889 1 1889 1890 1
		 1890 1888 1 1886 1891 1 1891 1889 1 1892 1891 1 1887 1892 1 1893 1894 1 1894 1865 1
		 1868 1893 1 1895 1896 1 1896 1692 1 1692 1897 1 1897 1895 1 1869 1895 1 1897 1898 1
		 1898 1869 1 1899 1897 1 1691 1899 1 1900 1898 1 1899 1900 1 1871 1895 1 1872 1896 1
		 1898 1901 1 1901 1870 1 1900 1902 1 1902 1901 1 1892 1890 1 1892 1852 1 1851 1890 1
		 1903 1657 1 1657 1904 1 1904 1905 1 1905 1903 1 1906 1907 1 1907 1908 1 1908 1909 1;
	setAttr ".ed[3652:3817]" 1909 1906 1 1910 1911 1 1911 1912 1 1912 1913 1 1913 1910 1
		 1907 1914 1 1914 1915 1 1915 1908 1 1905 1915 1 1914 1903 1 1916 1905 1 1904 1917 1
		 1917 1916 1 1918 1909 1 1908 1919 1 1919 1918 1 1912 1920 1 1920 1921 1 1921 1913 1
		 1915 1922 1 1922 1919 1 1916 1922 1 1923 1924 1 1924 1694 1 1693 1923 1 1917 1924 1
		 1923 1916 1 1925 1923 1 1670 1925 1 1925 1922 1 1681 1925 1 1681 1919 1 1680 1918 1
		 1920 1683 1 1682 1921 1 1926 1927 1 1927 1638 1 1638 1928 1 1928 1926 1 598 1929 1
		 1929 1930 1 1930 599 1 602 1931 1 1931 1932 1 1932 603 1 1930 1931 1 1933 1639 1
		 1927 1933 1 1641 1928 1 1934 1643 1 1713 1934 1 1932 1715 1 1934 1641 1 1935 1926 1
		 1928 1936 1 1936 1935 1 1934 1936 1 1713 1935 1 1937 1938 1 1938 1939 1 1939 1940 1
		 1940 1937 1 1941 1942 1 1942 1914 1 1907 1941 1 1943 1944 1 1944 1911 1 1910 1943 1
		 1945 1941 1 1906 1945 1 1946 1654 1 1903 1946 1 1947 1942 1 1941 1948 1 1948 1947 1
		 1946 1949 1 1949 1659 1 1949 1939 1 1938 1659 1 1950 1947 1 1948 1951 1 1951 1950 1
		 1951 1952 1 1952 1953 1 1953 1950 1 1954 1953 1 1952 1955 1 1955 1954 1 1952 1956 1
		 1956 1957 1 1957 1955 1 1958 1959 1 1959 1960 1 1960 1961 1 1961 1958 1 1959 1962 1
		 1962 1963 1 1963 1960 1 1945 1964 1 1964 1948 1 1962 1944 1 1943 1963 1 1942 1946 1
		 1947 1949 1 1954 1874 1 1874 1940 1 1940 1953 1 1965 1966 1 1966 1627 1 1633 1965 1
		 1967 1968 1 1968 1969 1 1969 1970 1 1970 1967 1 1965 1971 1 1971 1968 1 1967 1965 1
		 1883 1972 1 1972 1973 1 1973 1880 1 1974 1702 1 1705 1975 1 1975 1974 1 1976 1977 1
		 1977 1978 1 1978 1979 1 1979 1976 1 1977 1974 1 1975 1978 1 1968 1980 1 1980 1981 1
		 1981 1969 1 1971 1982 1 1982 1980 1 1967 1983 1 1983 1966 1 1970 1984 1 1984 1983 1
		 1881 1985 1 1985 1854 1 1978 1983 1 1984 1979 1 1975 1966 1 1973 1986 1 1986 1881 1
		 1986 1987 1 1987 1985 1 1988 1982 1 1971 1610 1 1610 1988 1 1985 1989 1 1989 1855 1
		 1990 1887 1 1989 1990 1 1987 1991 1 1991 1989 1 1992 1990 1 1991 1992 1 1993 1994 1
		 1994 1613 1 1613 1995 1 1995 1993 1 1994 1988 1 1996 1997 1 1997 1998 1 1998 1999 1;
	setAttr ".ed[3818:3983]" 1999 1996 1 2000 1998 1 1997 2001 1 2001 2000 1 1823 2002 1
		 2002 2003 1 2003 2004 1 2004 1823 1 2004 1777 1 2005 2006 1 2006 2007 1 2007 2008 1
		 2008 2005 1 1761 2006 1 2005 1758 1 2002 2009 1 2009 2010 1 2010 2003 1 2010 2011 1
		 2011 2012 1 2012 2003 1 2013 2014 1 2014 2015 1 2015 2016 1 2016 2013 1 2014 2017 1
		 2017 2008 1 2008 2015 1 2018 1821 1 1758 2018 1 2018 2002 1 2017 2019 1 2019 2005 1
		 2019 2018 1 2019 2009 1 2020 1901 1 1902 2016 1 2016 2020 1 2021 1870 1 2020 2021 1
		 2020 2022 1 2022 2023 1 2023 2021 1 2015 2022 1 2007 2024 1 2024 2015 1 2024 1697 1
		 1697 2022 1 1696 2023 1 2025 1658 1 1938 2025 1 699 2026 1 2026 2027 1 2027 700 1
		 703 2028 1 2028 2026 1 2029 2030 1 2030 1667 1 1666 2029 1 2031 1666 1 1658 2031 1
		 2032 2029 1 2031 2032 1 2033 2031 1 2025 2033 1 2034 2035 1 2035 2036 1 2036 2037 1
		 2037 2034 1 2038 2037 1 2036 2039 1 2039 2038 1 2037 2040 1 2040 2041 1 2041 2034 1
		 2042 2043 1 2043 2041 1 2040 2042 1 2044 2045 1 2045 2046 1 2046 2047 1 2047 2044 1
		 2044 2048 1 2048 2049 1 2049 2045 1 2050 2051 1 2051 2049 1 2048 2050 1 2039 2051 1
		 2050 2038 1 2038 2052 1 2052 2040 1 2053 2052 1 2050 2053 1 2054 2053 1 2048 2054 1
		 2055 2054 1 2044 2055 1 2056 2055 1 2047 2056 1 2057 2052 1 2053 2058 1 2058 2057 1
		 2054 2059 1 2059 2058 1 2055 2060 1 2060 2059 1 2061 2056 1 2056 739 1 738 2061 1
		 2061 2060 1 2057 2042 1 1800 2043 1 2042 1797 1 2062 2059 1 2060 2063 1 2063 2062 1
		 2064 2061 1 743 2064 1 2064 2063 1 2062 2065 1 2065 2058 1 2065 2066 1 2066 2057 1
		 2066 1797 1 2066 1804 1 2065 1806 1 2062 1808 1 2063 1811 1 2064 1812 1 2067 2012 1
		 2012 2035 1 2034 2067 1 2067 2004 1 2067 2068 1 2068 1777 1 2041 2068 1 2068 1820 1
		 2043 1820 1 2069 2070 1 2070 2071 1 2071 2072 1 2072 2069 1 2073 2074 1 2074 2070 1
		 2069 2073 1 1663 2075 1 2075 2076 1 2076 1665 1 2077 2074 1 2073 2078 1 2078 2077 1
		 1617 2079 1 2079 2080 1 2080 1614 1 2081 1892 1 1990 2081 1 2082 2083 1 2083 763 1
		 762 2082 1 2084 2085 1 2085 2080 1 2079 2084 1 2086 2087 1 2087 2088 1 2088 2089 1;
	setAttr ".ed[3984:4149]" 2089 2086 1 771 2090 1 2090 2082 1 2081 2091 1 2091 1852 1
		 2092 2093 1 2093 2086 1 2089 2092 1 776 2094 1 2094 2090 1 2095 2093 1 2092 2096 1
		 2096 2095 1 2080 1995 1 2085 1993 1 2086 1990 1 1992 2087 1 2093 2081 1 2095 2091 1
		 1649 2097 1 2097 2079 1 1639 2097 1 781 2098 1 2098 1929 1 783 2099 1 2099 2098 1
		 2100 2097 1 1933 2100 1 2100 2084 1 2101 2102 1 2102 2103 1 2103 2104 1 2104 2101 1
		 2105 2106 1 2106 2107 1 2107 2108 1 2108 2105 1 2104 2109 1 2109 2110 1 2110 2101 1
		 2108 2111 1 2111 2112 1 2112 2105 1 2113 2103 1 2102 2114 1 2114 2113 1 2115 2113 1
		 2114 2116 1 2116 2115 1 2117 2118 1 2118 2107 1 2106 2117 1 2117 2119 1 2119 2120 1
		 2120 2118 1 2114 2118 1 2120 2116 1 2102 2107 1 2101 2108 1 2110 2111 1 2121 2122 1
		 2122 2123 1 2123 2124 1 2124 2121 1 2125 1838 1 1838 2126 1 2126 2127 1 2127 2125 1
		 2128 1958 1 1961 2129 1 2129 2128 1 2130 1955 1 1957 2131 1 2131 2130 1 2132 2133 1
		 2133 2134 1 2134 2135 1 2135 2132 1 2136 2130 1 2131 2137 1 2137 2136 1 2133 2128 1
		 2129 2134 1 2138 2139 1 2139 2132 1 2135 2138 1 2122 2139 1 2138 2123 1 2140 2141 1
		 2141 2136 1 2137 2140 1 2126 2141 1 2140 2127 1 1709 2142 1 2142 827 1 2143 1710 1
		 1706 2144 1 2144 2143 1 1703 2145 1 2145 2144 1 1702 2146 1 2146 2145 1 2147 1996 1
		 1999 2148 1 2148 2147 1 2149 2150 1 2150 2151 1 2151 2152 1 2152 2149 1 2149 841 1
		 840 2153 1 2153 2149 1 2154 2155 1 2155 2156 1 2156 2157 1 2157 2154 1 2158 2155 1
		 2154 2159 1 2159 2158 1 2155 2160 1 2160 2161 1 2161 2156 1 2162 2160 1 2158 2162 1
		 2154 2150 1 2150 2163 1 2163 2159 1 2157 2151 1 2142 2153 1 2145 2158 1 2159 2144 1
		 2146 2162 1 2163 2143 1 2164 2165 1 2165 1894 1 1893 2164 1 2021 1893 1 2023 2164 1
		 1695 2164 1 1695 1732 1 1732 2165 1 2166 2103 1 2113 2167 1 2167 2166 1 2115 2168 1
		 2168 2167 1 2169 1999 1 1998 2170 1 2170 2169 1 2171 2148 1 2169 2171 1 2169 2167 1
		 2168 2171 1 2170 2166 1 2172 2173 1 2173 2174 1 2174 2175 1 2175 2172 1 2176 2177 1
		 2177 2172 1 2175 2176 1 2178 2179 1 2179 2176 1 2175 2178 1 2174 2180 1 2180 2178 1;
	setAttr ".ed[4150:4315]" 2181 1686 1 1687 2182 1 2182 2181 1 2183 2181 1 2182 2173 1
		 2173 2183 1 1899 2181 1 2183 1900 1 1694 2184 1 2184 2182 1 2184 2174 1 2183 2185 1
		 2185 1902 1 2172 2185 1 2013 2185 1 2177 2013 1 2071 2186 1 2186 2187 1 2187 2072 1
		 2188 2189 1 2189 878 1 877 2188 1 880 2190 1 2190 2028 1 2191 2192 1 2192 2193 1
		 2193 2194 1 2194 2191 1 2186 2192 1 2191 2187 1 2195 1667 1 2030 2196 1 2196 2195 1
		 2197 1664 1 2195 2197 1 2197 2075 1 1763 1544 1 1720 1552 1 1547 1766 1 1503 1608 1
		 1608 1718 1 1608 1552 1 2198 2199 1 2199 2200 1 2200 2201 1 2201 2198 1 2200 2202 1
		 2202 2203 1 2203 2201 1 2204 2205 1 2205 2199 1 2198 2204 1 2206 2207 1 2207 899 1
		 898 2206 1 2208 2209 1 2209 2210 1 2210 2211 1 2211 2208 1 2202 2209 1 2208 2203 1
		 2204 2212 1 2212 2213 1 2213 2205 1 2214 2215 1 2215 2216 1 2216 2014 1 2014 2214 1
		 2217 2218 1 2218 2049 1 2051 2217 1 2219 2220 1 2220 2221 1 2221 2222 1 2222 2219 1
		 2223 2224 1 2224 2039 1 2036 2223 1 2225 2226 1 2226 2227 1 2227 2228 1 2228 2225 1
		 2224 2217 1 2221 2226 1 2225 2222 1 922 2229 1 2229 2230 1 2230 923 1 926 2231 1
		 2231 2232 1 2232 927 1 2218 2233 1 2233 2045 1 2234 2235 1 2235 2220 1 2219 2234 1
		 2233 2236 1 2236 2046 1 2237 2238 1 2238 2235 1 2234 2237 1 2239 2223 1 2035 2239 1
		 2227 2240 1 2240 2241 1 2241 2228 1 2242 2243 1 2243 2213 1 2212 2242 1 2244 2245 1
		 2245 2243 1 2242 2244 1 2011 2239 1 2246 2247 1 2247 2241 1 2240 2246 1 2248 2249 1
		 2249 2247 1 2246 2248 1 1974 2250 1 2250 2146 1 2251 1977 1 1976 2252 1 2252 2251 1
		 2251 2250 1 2253 2000 1 2001 2254 1 2254 2253 1 2255 2253 1 2254 2256 1 2256 2255 1
		 2257 2160 1 2162 2258 1 2258 2257 1 2259 2161 1 2257 2259 1 2260 2261 1 2261 2262 1
		 2262 2263 1 2263 2260 1 2264 2265 1 2265 2262 1 2261 2264 1 2262 2257 1 2258 2263 1
		 2265 2259 1 2258 2250 1 2251 2263 1 2252 2260 1 2266 1833 1 1833 2267 1 2267 2268 1
		 2268 2266 1 2269 2270 1 2270 2271 1 2271 2272 1 2272 2269 1 2273 2269 1 2272 2274 1
		 2274 2273 1 2275 2266 1 2268 2276 1 2276 2275 1 2276 2277 1 2277 2278 1 2278 2275 1;
	setAttr ".ed[4316:4481]" 2279 2280 1 2280 2273 1 2274 2279 1 2281 2282 1 2282 2280 1
		 2279 2281 1 1676 2282 1 2281 1677 1 2277 2283 1 2283 2284 1 2284 2278 1 2285 2284 1
		 2283 1690 1 1690 2285 1 2286 2287 1 2287 2077 1 2078 2286 1 2288 2289 1 2289 2287 1
		 2286 2288 1 2111 2290 1 2290 2291 1 2291 2112 1 2292 2293 1 2293 1984 1 1970 2292 1
		 2294 2295 1 2295 1972 1 1883 2294 1 2296 1969 1 1981 2297 1 2297 2296 1 2291 2298 1
		 2298 2299 1 2299 2112 1 2109 2300 1 2300 2301 1 2301 2110 1 2296 2292 1 2302 2303 1
		 2303 1976 1 1979 2302 1 2300 2303 1 2302 2301 1 2290 2293 1 2292 2291 1 2296 2298 1
		 2301 2290 1 2302 2293 1 2297 2304 1 2304 2298 1 2305 2299 1 2304 2305 1 2306 2294 1
		 1882 2306 1 1884 2307 1 2307 2306 1 2308 2309 1 2309 2310 1 2310 2311 1 2311 2308 1
		 2310 2295 1 2294 2311 1 2312 2308 1 2311 2313 1 2313 2312 1 2306 2313 1 2314 2312 1
		 2313 2315 1 2315 2314 1 2307 2315 1 2316 2315 1 2307 2317 1 2317 2316 1 2318 2314 1
		 2316 2318 1 1866 2317 1 2165 2316 1 2317 1894 1 1727 2318 1 2165 1727 1 2319 1830 1
		 2266 2319 1 1849 2320 1 2320 1860 1 2320 2321 1 2321 1862 1 2322 2319 1 2275 2322 1
		 2321 2323 1 2323 1872 1 2278 2324 1 2324 2322 1 2319 2320 1 2322 2321 1 2324 2323 1
		 2325 2285 1 1689 2325 1 1896 2325 1 2323 2325 1 2324 2285 1 1832 2326 1 2326 2267 1
		 2270 2327 1 2327 2328 1 2328 2271 1 2327 2329 1 2329 2330 1 2330 2328 1 1835 2331 1
		 2331 2326 1 2125 2332 1 2332 1839 1 2333 2121 1 2124 2334 1 2334 2333 1 2329 2333 1
		 2334 2330 1 2332 2331 1 2335 2336 1 2336 2337 1 2337 2338 1 2338 2335 1 2338 2339 1
		 2339 2340 1 2340 2335 1 2341 2342 1 2342 2343 1 2343 2344 1 2344 2341 1 2344 2337 1
		 2336 2341 1 2345 2346 1 2346 2339 1 2338 2345 1 2337 2347 1 2347 2345 1 2349 2344 1
		 2349 2347 1 2350 2351 1 2351 1742 1 1741 2350 1 2352 2353 1 2353 2351 1 2350 2352 1
		 1791 2354 1 2354 1731 1 2355 2350 1 1739 2355 1 2356 2352 1 2355 2356 1 2357 2355 1
		 1738 2357 1 2358 2356 1 2357 2358 1 2359 2357 1 1737 2359 1 2360 2358 1 2359 2360 1
		 2361 1061 1 1060 2362 1 2362 2361 1 2361 1757 1 2361 2363 1 2363 1750 1 2362 2364 1;
	setAttr ".ed[4482:4647]" 2364 2363 1 2363 2359 1 2364 2360 1 2351 2365 1 2365 1813 1
		 2353 2366 1 2366 2365 1 2365 2354 1 2366 2367 1 2367 2354 1 2368 2369 1 2369 2370 1
		 2370 1716 1 1716 2368 1 2369 2371 1 2371 2372 1 2372 2370 1 1731 2368 1 2367 2368 1
		 2367 2373 1 2373 2369 1 2373 2374 1 2374 2371 1 2375 2376 1 2376 2372 1 2371 2375 1
		 2374 2377 1 2377 2375 1 2378 2379 1 2379 2376 1 2375 2378 1 2377 2380 1 2380 2378 1
		 2343 2378 1 2380 2348 1 2342 2379 1 1717 2372 1 2372 2381 1 2381 1722 1 2382 2383 1
		 2383 2119 1 2117 2382 1 2106 2384 1 2384 2382 1 2385 2386 1 2386 2387 1 2387 2388 1
		 2388 2385 1 2389 2390 1 2390 2391 1 2391 2392 1 2392 2389 1 2391 2393 1 2393 2394 1
		 2394 2392 1 2395 2396 1 2396 2383 1 2382 2395 1 2397 2395 1 2384 2397 1 2398 2385 1
		 2388 2399 1 2399 2398 1 2394 2399 1 2388 2392 1 2387 2389 1 2105 2400 1 2400 2384 1
		 2299 2400 1 2401 2400 1 2305 2401 1 2402 2403 1 2403 2398 1 2399 2402 1 2401 2397 1
		 2394 2404 1 2404 2402 1 2393 2405 1 2405 2404 1 2405 2309 1 2308 2404 1 2406 2252 1
		 2303 2406 1 2166 2407 1 2407 2104 1 2407 2408 1 2408 2109 1 2409 2300 1 2408 2409 1
		 2409 2406 1 2410 2000 1 2253 2411 1 2411 2410 1 2255 2412 1 2412 2411 1 2413 2261 1
		 2260 2414 1 2414 2413 1 2415 2264 1 2413 2415 1 2410 2170 1 2255 2413 1 2414 2412 1
		 2256 2415 1 2406 2414 1 2410 2407 1 2411 2408 1 2412 2409 1 1656 2416 1 2416 1904 1
		 1661 2417 1 2417 2416 1 1665 2418 1 2418 2417 1 2076 2419 1 2419 2418 1 2416 2420 1
		 2420 1917 1 2417 2421 1 2421 2420 1 2418 2422 1 2422 2421 1 2419 2423 1 2423 2422 1
		 2423 2179 1 2178 2422 1 2180 2421 1 2424 2180 1 2184 2424 1 2424 2420 1 1924 2424 1
		 2340 2425 1 2425 2426 1 2426 2335 1 2426 2427 1 2427 2336 1 2426 2385 1 2398 2427 1
		 2425 2386 1 2427 2428 1 2428 2341 1 2403 2428 1 2428 2429 1 2429 2342 1 1937 1873 1
		 1873 2430 1 2430 2431 1 2431 1937 1 2091 2432 1 2432 1853 1 2431 2025 1 2432 2430 1
		 2433 2434 1 2434 2435 1 2435 2436 1 2436 2433 1 1136 2437 1 2437 2438 1 2438 1137 1
		 1140 2439 1 2439 2437 1 2096 2436 1 2435 2095 1 2438 2094 1 2435 2432 1 2434 2430 1;
	setAttr ".ed[4648:4813]" 2433 2440 1 2440 2441 1 2441 2434 1 2441 2431 1 2027 2442 1
		 2442 1144 1 2442 2439 1 2033 2441 1 2440 2443 1 2443 2033 1 2443 2032 1 1837 2444 1
		 2444 2126 1 2445 1954 1 2130 2445 1 2446 2445 1 2136 2446 1 1888 1842 1 2141 2447 1
		 2447 2446 1 2444 2447 1 1890 2447 1 2444 1888 1 2445 1850 1 2446 1851 1 2376 2448 1
		 2448 2381 1 2379 2449 1 2449 2448 1 2448 2450 1 2450 2451 1 2451 2381 1 2429 2449 1
		 2429 2452 1 2452 2453 1 2453 2449 1 2453 2450 1 2403 2452 1 2454 2452 1 2402 2454 1
		 2455 2454 1 2404 2455 1 2450 2456 1 2456 1729 1 1729 2451 1 2457 2456 1 2453 2457 1
		 2458 2457 1 2457 2454 1 2455 2458 1 2458 2459 1 2459 2456 1 2312 2455 1 2314 2458 1
		 2318 2459 1 1728 2459 1 1723 2451 1 1599 1761 1 1760 1600 1 1581 2024 1 2007 1607 1
		 1605 2006 1 2460 2461 1 2461 2462 1 2462 2463 1 2463 2460 1 2464 2465 1 2465 2461 1
		 2460 2464 1 2466 2467 1 2467 2465 1 2464 2466 1 2468 2469 1 2469 2470 1 2470 2471 1
		 2471 2468 1 2472 2473 1 2473 2474 1 2474 2475 1 2475 2472 1 2476 2477 1 2477 2473 1
		 2472 2476 1 2462 2478 1 2478 2479 1 2479 2463 1 2478 2477 1 2476 2479 1 2480 2481 1
		 2481 2469 1 2468 2480 1 2474 2481 1 2480 2475 1 2461 1621 1 1620 2462 1 2465 1629 1
		 2467 1626 1 2470 1630 1 2467 2470 1 2469 1631 1 2481 1652 1 2474 1644 1 2473 1642 1
		 2477 1645 1 2478 1648 1 2466 2471 1 1393 1361 1 1951 2482 1 2482 1956 1 1964 2482 1
		 1950 1939 1 1683 1680 1 1678 1673 1 1920 1918 1 1912 1909 1 1911 1906 1 1944 1945 1
		 1962 1964 1 1959 2482 1 1958 1956 1 2128 1957 1 2133 2131 1 2132 2137 1 2139 2140 1
		 2122 2127 1 2121 2125 1 2333 2332 1 2329 2331 1 2327 2326 1 2270 2267 1 2269 2268 1
		 2273 2276 1 2280 2277 1 2282 2283 1 1676 1690 1 1674 1679 1 2483 2460 1 2463 2484 1
		 2484 2483 1 2485 2464 1 2483 2485 1 2486 2466 1 2485 2486 1 2487 2468 1 2471 2488 1
		 2488 2487 1 2489 2472 1 2475 2490 1 2490 2489 1 2491 2476 1 2489 2491 1 2479 2492 1
		 2492 2484 1 2491 2492 1 2493 2480 1 2487 2493 1 2493 2490 1 2486 2488 1 2493 2494 1
		 2494 2489 1 2486 2495 1 2495 2487 1 2495 2494 1 2494 2492 1 2495 2484 1 2495 2485 1;
	setAttr ".ed[4814:4979]" 2496 1675 1 1677 2497 1 2497 2496 1 2498 1672 1 2496 2498 1
		 2499 1682 1 2498 2499 1 2500 1910 1 1913 2501 1 2501 2500 1 1921 2502 1 2502 2501 1
		 2499 2502 1 2503 1943 1 2500 2503 1 2504 1961 1 1960 2505 1 2505 2504 1 1963 2506 1
		 2506 2505 1 2503 2506 1 2507 2124 1 2123 2508 1 2508 2507 1 2509 2129 1 2504 2509 1
		 2510 2135 1 2134 2511 1 2511 2510 1 2509 2511 1 2512 2138 1 2510 2512 1 2512 2508 1
		 2513 2272 1 2271 2514 1 2514 2513 1 2515 2274 1 2513 2515 1 2516 2279 1 2515 2516 1
		 2281 2517 1 2517 2497 1 2516 2517 1 2328 2518 1 2518 2514 1 2330 2519 1 2519 2518 1
		 2520 2334 1 2507 2520 1 2520 2519 1 2521 2496 1 2497 2522 1 2522 2521 0 2523 2498 1
		 2521 2523 0 2524 2499 1 2523 2524 0 2525 2500 1 2501 2526 1 2526 2525 0 2502 2527 1
		 2527 2526 0 2524 2527 0 2528 2503 1 2525 2528 0 2529 2504 1 2505 2530 1 2530 2529 0
		 2506 2531 1 2531 2530 0 2528 2531 0 2532 2507 1 2508 2533 1 2533 2532 0 2534 2509 1
		 2529 2534 0 2535 2510 1 2511 2536 1 2536 2535 0 2534 2536 0 2537 2512 1 2535 2537 0
		 2537 2533 0 2538 2513 1 2514 2539 1 2539 2538 0 2540 2515 1 2538 2540 0 2541 2516 1
		 2540 2541 0 2517 2542 1 2542 2522 0 2541 2542 0 2518 2543 1 2543 2539 0 2519 2544 1
		 2544 2543 0 2545 2520 1 2532 2545 0 2545 2544 0 2295 2297 1 1981 1972 1 2310 2304 1
		 2309 2305 1 2405 2401 1 2393 2397 1 2391 2395 1 2390 2396 1 2083 2099 1 2087 2085 1
		 2084 2088 1 1992 1993 1 1991 1994 1 1987 1988 1 1986 1982 1 1973 1980 1 1249 2147 1
		 2148 1250 1 2171 1251 1 2168 1252 1 2115 1253 1 2116 1254 1 2120 1255 1 2119 1256 1
		 2383 1257 1 2396 1258 1 2390 1259 1 2389 1260 1 2387 1261 1 2386 1262 1 2425 1263 1
		 2340 1264 1 2339 1265 1 2346 1266 1 2546 2017 1 2017 2547 1 2547 2548 1 2548 2546 1
		 2245 2216 1 2215 2288 1 2288 2245 1 2289 2214 1 2214 2177 1 2176 2289 1 2207 2188 1
		 2209 2191 1 2194 2210 1 2202 2187 1 2200 2072 1 2199 2069 1 2205 2073 1 2213 2078 1
		 2243 2286 1 2189 2190 1 2192 2195 1 2196 2193 1 2186 2197 1 2071 2075 1 2070 2076 1
		 2074 2419 1 2077 2423 1 2287 2179 1 2546 2009 1 2546 2248 1 2248 2010 1 2547 2244 1;
	setAttr ".ed[4980:5145]" 2244 2249 1 2249 2548 1 2216 2547 1 2246 2011 1 2240 2239 1
		 2227 2223 1 2226 2224 1 2221 2217 1 2220 2218 1 2235 2233 1 2238 2236 1 2232 2229 1
		 2242 2247 1 2212 2241 1 2204 2228 1 2198 2225 1 2201 2222 1 2203 2219 1 2208 2234 1
		 2211 2237 1 2230 2206 1 2549 2001 1 1997 2550 1 2550 2549 1 1996 2551 1 2551 2550 1
		 2552 2256 1 2254 2553 1 2553 2552 1 2549 2553 1 2554 2152 1 2151 2555 1 2555 2554 1
		 2157 2556 1 2556 2555 1 2156 2557 1 2557 2556 1 2161 2558 1 2558 2557 1 2559 2259 1
		 2265 2560 1 2560 2559 1 2264 2561 1 2561 2560 1 2559 2558 1 2415 2562 1 2562 2561 1
		 2552 2562 1 2147 2563 1 2563 2551 1 2551 2564 1 2564 2549 1 2565 2552 1 2553 2566 1
		 2566 2565 1 2564 2566 1 2555 1290 1 1289 2554 1 2556 2567 1 2567 1290 1 2558 2567 1
		 2561 2568 1 2568 2559 1 2568 2567 1 2562 2569 1 2569 2568 1 2565 2569 1 2563 1294 1
		 1294 2564 1 2570 2565 1 2566 2571 1 2571 2570 1 2564 2572 1 2572 2571 1 2567 2573 1
		 2573 1298 1 2568 2574 1 2574 2573 1 2569 2575 1 2575 2574 1 2570 2575 1 1302 2572 1
		 2576 2570 1 2571 2577 1 2577 2576 1 2572 2578 1 2578 2577 1 2573 2579 1 2579 1306 1
		 2574 2580 1 2580 2579 1 2575 2581 1 2581 2580 1 2576 2581 1 1310 2578 1 2582 2576 1
		 2577 2583 1 2583 2582 1 2578 2584 1 2584 2583 1 2579 2585 1 2585 1314 1 2580 2586 1
		 2586 2585 1 2581 2587 1 2587 2586 1 2582 2587 1 1318 2584 1 2588 2582 1 2583 2589 1
		 2589 2588 1 2584 2590 1 2590 2589 1 2585 2591 1 2591 1322 1 2586 2592 1 2592 2591 1
		 2587 2593 1 2593 2592 1 2588 2593 1 1326 2590 1 1327 2594 1 2594 2595 1 2595 1328 1
		 2591 2594 1 2595 2590 1 2595 2588 1 2594 2593 1 2380 2597 1 1339 3566 0 2597 3558 0
		 2599 2347 1 2600 3562 0 2598 2356 1 2362 1339 1 2596 3560 0 2598 3564 0 2366 2600 1
		 2599 3556 0 2601 2047 1 2046 2231 1 2231 2601 1 1341 2601 1 2152 1342 1 2142 2143 1
		 2163 2153 1 1709 1710 1 1708 1711 1 1699 1700 1 1698 1701 1 1714 1712 1 1715 1713 1
		 1932 1935 1 1931 1926 1 1930 1927 1 1929 1933 1 2098 2100 1 2099 2084 1 2083 2088 1
		 2082 2089 1 2090 2092 1 2094 2096 1 2438 2436 1 2437 2433 1 2439 2440 1 2442 2443 1;
	setAttr ".ed[5146:5311]" 2027 2032 1 2026 2029 1 2028 2030 1 2190 2196 1 2189 2193 1
		 2188 2194 1 2207 2210 1 2206 2211 1 2230 2237 1 2229 2238 1 2232 2236 1 2056 2601 1
		 1454 1609 1 1456 1609 1 1272 2563 1 1272 1294 1 2602 2603 1 2603 2604 1 2604 2602 1
		 2603 2605 1 2605 2606 1 2606 2604 1 2607 2608 1 2608 2609 1 2609 2610 1 2610 2607 1
		 2611 2612 1 2612 2613 0 2613 2614 1 2614 2611 1 2610 2615 1 2615 2616 1 2616 2607 1
		 2617 2618 1 2618 2619 1 2619 2617 1 2620 2621 1 2621 2622 1 2622 2623 1 2623 2620 1
		 2624 2625 1 2625 2626 1 2626 2627 1 2627 2624 1 2628 2629 1 2629 2630 1 2630 2631 1
		 2631 2628 1 2632 2633 1 2633 2611 1 2614 2632 1 2634 2635 1 2635 2636 0 2636 2637 1
		 2637 2634 1 2637 2638 1 2638 2639 1 2639 2634 1 2639 2640 1 2640 2634 1 2641 2642 1
		 2642 2643 1 2643 2641 1 2643 2644 1 2644 2641 1 2642 2645 1 2645 2646 1 2646 2643 1
		 2646 2647 1 2647 2644 1 2648 2649 1 2649 2650 1 2650 2651 1 2651 2648 1 2651 2652 1
		 2652 2653 1 2653 2648 1 2654 2655 1 2655 2656 1 2656 2654 1 2656 2657 1 2657 2654 1
		 2657 2658 1 2658 2659 1 2659 2654 1 2660 2661 1 2661 2662 1 2662 2660 1 2662 2608 1
		 2607 2660 1 2663 2661 1 2661 2664 1 2664 2665 1 2665 2663 0 2666 2660 1 2616 2666 1
		 2662 2621 1 2620 2662 1 2667 2661 1 2661 2668 1 2668 2669 1 2669 2667 1 2669 2626 1
		 2625 2667 1 2629 2669 1 2669 2630 1 2628 2627 1 2626 2629 1 2670 2671 1 2671 2619 1
		 2618 2670 1 2615 2672 1 2672 2673 1 2673 2616 1 2674 2675 1 2675 2676 1 2676 2677 0
		 2677 2674 0 2678 2679 1 2679 2680 1 2680 2681 1 2681 2678 1 2682 2683 1 2683 2684 1
		 2684 2685 0 2685 2682 1 2686 2668 0 2663 2686 0 2668 2687 0 2687 2669 1 2679 2670 1
		 2618 2680 1 2650 2638 1 2638 2651 1 2620 2608 1 2604 2688 1 2688 2602 1 2606 2689 1
		 2689 2688 1 2690 2675 1 2675 2611 1 2633 2690 1 2623 2609 1 2671 2691 1 2691 2692 1
		 2692 2619 1 2693 2694 1 2694 2695 1 2695 2696 1 2696 2693 1 2697 2683 1 2682 2698 1
		 2698 2697 1 2699 2700 1 2700 2701 0 2701 2702 1 2702 2699 1 2702 2703 1 2703 2704 1
		 2704 2699 1 2705 2706 1 2706 2707 1 2707 2705 1 2705 2708 1 2708 2706 1 2706 2709 1;
	setAttr ".ed[5312:5477]" 2709 2710 1 2710 2707 1 2708 2711 1 2711 2709 1 2712 2713 1
		 2713 2714 1 2714 2715 1 2715 2712 1 2712 2716 1 2716 2717 1 2717 2713 1 2718 2719 1
		 2719 2720 1 2720 2718 1 2718 2721 1 2721 2719 1 2718 2722 1 2722 2723 1 2723 2721 1
		 2724 2725 1 2725 2721 1 2723 2724 1 2726 2727 1 2727 2665 0 2664 2726 1 2633 2681 1
		 2680 2690 1 2692 2617 1 2728 2729 1 2729 2676 1 2675 2728 1 2728 2696 1 2695 2729 1
		 2682 2729 1 2729 2698 1 2698 2695 1 2694 2697 1 2685 2730 0 2730 2729 1 2674 2612 0
		 2681 2731 1 2731 2732 1 2732 2678 1 2731 2733 1 2733 2734 1 2734 2732 1 2713 2704 1
		 2704 2714 1 2735 2736 1 2736 2635 0 2634 2735 1 2634 2737 1 2737 2641 1 2641 2735 1
		 2737 2640 1 2640 2738 1 2738 2739 1 2739 2737 1 2738 2740 1 2740 2741 1 2741 2739 1
		 2673 2666 1 2701 2742 0 2742 2743 1 2743 2702 1 2743 2705 1 2705 2744 1 2744 2702 1
		 2744 2745 1 2745 2746 1 2746 2747 1 2747 2744 1 2745 2748 1 2748 2749 1 2749 2746 1
		 2630 2750 1 2750 2751 0 2751 2631 1 2640 2752 1 2752 2753 1 2753 2640 1 2752 2754 1
		 2754 2755 1 2755 2753 1 2747 2756 1 2756 2757 1 2757 2747 1 2756 2758 1 2758 2759 1
		 2759 2757 1 2617 2690 1 2687 2750 0 2726 2637 1 2636 2727 0 2760 2761 1 2761 2655 1
		 2655 2762 1 2762 2760 1 2761 2652 1 2652 2638 1 2638 2763 1 2763 2761 1 2726 2763 1
		 2633 2731 1 2699 2614 1 2613 2700 0 2764 2765 1 2765 2720 1 2720 2766 1 2766 2764 1
		 2766 2767 1 2767 2704 1 2704 2717 1 2717 2766 1 2767 2614 1 2768 2769 1 2769 2770 1
		 2770 2771 1 2771 2768 1 2772 2656 1 2656 2726 1 2726 2772 1 2633 2733 1 2772 2666 1
		 2666 2770 1 2769 2772 1 2724 2734 1 2733 2725 1 2672 2771 1 2770 2673 1 2632 2725 1
		 2768 2658 1 2657 2769 1 2641 2773 1 2773 2774 1 2774 2735 1 2644 2775 1 2775 2773 1
		 2647 2776 1 2776 2775 1 2774 2777 1 2777 2736 0 2621 2625 1 2624 2622 1 2743 2774 1
		 2774 2778 1 2778 2705 1 2778 2779 1 2779 2708 1 2779 2780 1 2780 2711 1 2742 2777 0
		 2602 2773 1 2775 2603 1 2776 2605 1 2688 2779 1 2778 2602 1 2689 2780 1 2739 2642 1
		 2741 2645 1 2707 2745 1 2710 2748 1 2753 2738 1 2755 2740 1 2746 2756 1 2749 2758 1;
	setAttr ".ed[5478:5643]" 2639 2781 1 2781 2752 1 2781 2782 1 2782 2754 1 2757 2783 1
		 2783 2703 1 2703 2747 1 2759 2784 1 2784 2783 1 2692 2696 1 2728 2617 1 2649 2782 1
		 2781 2650 1 2691 2693 1 2714 2783 1 2784 2715 1 2760 2653 1 2716 2764 1 2763 2656 1
		 2719 2767 1 2659 2762 1 2765 2722 1 2662 2667 1 2632 2719 1 2785 2786 1 2786 2787 1
		 2787 2785 1 2785 2788 1 2788 2789 1 2789 2786 1 2788 2790 1 2790 2791 1 2791 2789 1
		 2605 2791 1 2790 2606 1 2792 2793 1 2793 2794 1 2794 2795 1 2795 2792 1 2796 2797 1
		 2797 2798 0 2798 2799 1 2799 2796 1 2795 2800 1 2800 2801 1 2801 2792 1 2802 2803 1
		 2803 2792 1 2801 2802 1 2610 2803 1 2802 2615 1 2804 2805 1 2805 2806 1 2806 2804 1
		 2807 2808 1 2808 2809 1 2809 2810 1 2810 2807 1 2807 2811 1 2811 2812 1 2812 2808 1
		 2622 2812 1 2811 2623 1 2813 2814 1 2814 2815 1 2815 2816 1 2816 2813 1 2627 2814 1
		 2813 2624 1 2817 2818 1 2818 2819 1 2819 2820 1 2820 2817 1 2631 2818 1 2817 2628 1
		 2821 2822 1 2822 2796 1 2796 2821 1 2803 2823 1 2823 2793 1 2609 2823 1 2824 2825 1
		 2825 2826 0 2826 2827 1 2827 2824 1 2827 2828 1 2828 2829 1 2829 2824 1 2830 2831 1
		 2831 2832 1 2832 2830 1 2833 2830 1 2832 2833 1 2830 2834 1 2834 2835 1 2835 2831 1
		 2833 2836 1 2836 2834 1 2834 2837 1 2837 2838 1 2838 2835 1 2645 2838 1 2837 2646 1
		 2836 2839 1 2839 2837 1 2839 2647 1 2840 2841 1 2841 2842 1 2842 2843 1 2843 2840 1
		 2648 2840 1 2843 2649 1 2840 2844 1 2844 2845 1 2845 2841 1 2653 2844 1 2841 2846 1
		 2846 2847 1 2847 2842 1 2845 2848 1 2848 2846 1 2849 2850 1 2850 2851 1 2851 2849 1
		 2852 2849 1 2851 2852 1 2851 2853 1 2853 2854 1 2854 2852 1 2855 2856 1 2856 2857 1
		 2857 2858 1 2858 2855 1 2855 2795 1 2794 2859 1 2859 2855 1 2860 2857 1 2856 2861 1
		 2861 2860 0 2858 2800 1 2809 2859 1 2859 2810 1 2862 2863 1 2863 2864 1 2864 2856 1
		 2856 2862 1 2862 2865 1 2865 2866 1 2866 2863 1 2867 2863 1 2863 2868 1 2868 2867 1
		 2868 2820 1 2819 2867 1 2868 2866 1 2866 2815 1 2815 2820 1 2869 2870 1 2870 2871 1
		 2871 2872 1 2872 2869 1 2670 2872 1 2871 2671 1 2800 2873 1 2873 2874 1 2874 2801 1;
	setAttr ".ed[5644:5809]" 2875 2876 0 2876 2877 1 2877 2878 1 2878 2875 0 2879 2880 1
		 2880 2881 1 2881 2882 1 2882 2879 1 2678 2879 1 2882 2679 1 2883 2884 1 2884 2885 0
		 2885 2886 1 2886 2883 1 2864 2887 0 2887 2861 0 2869 2805 1 2804 2870 1 2881 2888 1
		 2888 2805 1 2869 2881 1 2829 2847 1 2846 2829 1 2794 2810 1 2889 2785 1 2787 2889 1
		 2889 2890 1 2890 2788 1 2890 2891 1 2891 2790 1 2891 2689 1 2872 2882 1 2892 2877 1
		 2877 2806 1 2806 2892 1 2880 2893 1 2893 2888 1 2823 2811 1 2807 2793 1 2804 2894 1
		 2894 2895 1 2895 2870 1 2895 2896 1 2896 2871 1 2896 2691 1 2897 2898 1 2898 2899 1
		 2899 2900 1 2900 2897 1 2693 2897 1 2900 2694 1 2901 2902 1 2902 2886 1 2886 2903 1
		 2903 2901 1 2697 2901 1 2903 2683 1 2904 2905 1 2905 2906 0 2906 2907 1 2907 2904 1
		 2907 2908 1 2908 2909 1 2909 2904 1 2909 2910 1 2910 2904 1 2911 2912 1 2912 2913 1
		 2913 2911 1 2912 2914 1 2914 2913 1 2911 2915 1 2915 2916 1 2916 2912 1 2916 2917 1
		 2917 2914 1 2915 2918 1 2918 2919 1 2919 2916 1 2709 2919 1 2918 2710 1 2919 2920 1
		 2920 2917 1 2711 2920 1 2921 2922 1 2922 2923 1 2923 2924 1 2924 2921 1 2715 2922 1
		 2921 2712 1 2924 2925 1 2925 2926 1 2926 2921 1 2926 2716 1 2923 2927 1 2927 2928 1
		 2928 2924 1 2928 2929 1 2929 2925 1 2930 2822 1 2822 2931 1 2931 2930 1 2822 2932 1
		 2932 2931 1 2932 2933 1 2933 2934 1 2934 2931 1 2935 2936 1 2936 2933 1 2933 2937 1
		 2937 2935 1 2723 2936 1 2935 2724 1 2860 2938 0 2938 2939 1 2939 2857 1 2940 2892 1
		 2892 2888 1 2893 2940 1 2806 2894 1 2941 2877 1 2876 2942 1 2942 2941 1 2942 2943 1
		 2943 2944 1 2944 2941 1 2942 2883 1 2883 2945 1 2945 2942 1 2902 2945 1 2902 2899 1
		 2899 2943 1 2943 2945 1 2946 2802 1 2874 2946 1 2946 2672 1 2942 2947 1 2947 2884 0
		 2877 2799 1 2798 2878 0 2885 2948 0 2948 2903 1 2948 2684 0 2876 2947 0 2880 2949 1
		 2949 2950 1 2950 2893 1 2949 2951 1 2951 2952 1 2952 2950 1 2927 2908 1 2908 2928 1
		 2826 2953 0 2953 2954 1 2954 2827 1 2954 2832 1 2832 2955 1 2955 2827 1 2955 2956 1
		 2956 2957 1 2957 2958 1 2958 2955 1 2956 2959 1 2959 2960 1 2960 2957 1 2959 2961 1;
	setAttr ".ed[5810:5975]" 2961 2962 1 2962 2960 1 2740 2962 1 2961 2741 1 2858 2873 1
		 2963 2964 1 2964 2905 0 2904 2963 1 2904 2965 1 2965 2913 1 2913 2963 1 2965 2910 1
		 2910 2966 1 2966 2967 1 2967 2965 1 2966 2968 1 2968 2969 1 2969 2967 1 2968 2970 1
		 2970 2971 1 2971 2969 1 2748 2971 1 2970 2749 1 2819 2972 1 2972 2973 0 2973 2867 1
		 2974 2949 1 2879 2974 1 2732 2974 1 2975 2976 1 2976 2958 1 2958 2975 1 2975 2977 1
		 2977 2978 1 2978 2976 1 2977 2979 1 2979 2980 1 2980 2978 1 2754 2980 1 2979 2755 1
		 2981 2982 1 2982 2910 1 2910 2981 1 2981 2983 1 2983 2984 1 2984 2982 1 2983 2985 1
		 2985 2986 1 2986 2984 1 2758 2986 1 2985 2759 1 2973 2987 0 2987 2863 1 2824 2939 1
		 2938 2825 0 2988 2989 1 2989 2990 1 2990 2991 1 2991 2988 1 2762 2989 1 2988 2760 1
		 2990 2850 1 2850 2992 1 2992 2991 1 2992 2993 1 2993 2829 1 2829 2848 1 2848 2992 1
		 2993 2939 1 2950 2940 1 2818 2994 1 2994 2972 0 2751 2994 0 2796 2907 1 2906 2797 0
		 2995 2996 1 2996 2997 1 2997 2998 1 2998 2995 1 2764 2995 1 2998 2765 1 2996 2999 1
		 2999 2930 1 2930 2997 1 2999 2929 1 2929 2908 1 2908 3000 1 3000 2999 1 2796 3000 1
		 3001 3002 1 3002 3003 1 3003 3004 1 3004 3001 1 2771 3002 1 3001 2768 1 3005 2858 1
		 2939 3005 1 2952 2940 1 3005 3006 1 3006 3007 1 3007 2858 1 2937 2951 1 2951 3008 1
		 3008 2935 1 3008 2734 1 2873 3007 1 3007 3003 1 3003 2874 1 3006 3004 1 2821 2940 1
		 2952 3009 1 3009 2821 1 2974 3008 1 3004 2854 1 2854 3010 1 3010 3001 1 3010 2658 1
		 2954 3011 1 3011 3012 1 3012 2832 1 3012 3013 1 3013 2833 1 3013 3014 1 3014 2836 1
		 3014 3015 1 3015 2839 1 3015 2776 1 2898 2944 1 2953 3016 0 3016 3011 1 2808 2816 1
		 2816 2865 1 2865 2809 1 2913 3017 1 3017 3011 1 3011 2963 1 2914 3018 1 3018 3017 1
		 2917 3019 1 3019 3018 1 2920 3020 1 3020 3019 1 2780 3020 1 3016 2964 0 2901 2900 1
		 3011 2787 1 2787 3012 1 2786 3013 1 2789 3014 1 2791 3015 1 3002 2946 1 3017 2787 1
		 3018 2889 1 3019 2890 1 3020 2891 1 2831 2956 1 2835 2959 1 2838 2961 1 2937 3009 1
		 2967 2911 1 2969 2915 1 2971 2918 1 2814 2817 1 2812 2813 1 2957 2975 1 2960 2977 1;
	setAttr ".ed[5976:6141]" 2962 2979 1 2982 2966 1 2984 2968 1 2986 2970 1 2976 3021 1
		 3021 2828 1 2828 2958 1 2978 3022 1 3022 3021 1 2980 3023 1 3023 3022 1 2782 3023 1
		 2909 3024 1 3024 2981 1 3024 3025 1 3025 2983 1 3025 3026 1 3026 2985 1 3026 2784 1
		 2806 2941 1 2944 2894 1 2853 3027 1 3027 3010 1 3027 2659 1 2842 3022 1 3023 2843 1
		 2847 3021 1 2895 2898 1 2897 2896 1 2922 3026 1 3025 2923 1 3024 2927 1 2844 2988 1
		 2991 2845 1 2925 2996 1 2995 2926 1 2936 3028 1 3028 2934 1 2722 3028 1 2849 2993 1
		 2932 3009 1 3000 2822 1 2989 3027 1 2853 2990 1 2997 2934 1 3028 2998 1 2862 2859 1
		 2852 3006 1 3005 2849 1 2602 2774 1 2664 2666 1 2747 2702 1 2719 2614 1 2617 2675 1
		 2730 2676 0 2799 2940 1 2958 2827 1 2849 2939 1 2859 2856 1 2987 2864 0 3029 3030 1
		 3030 3031 1 3031 3032 1 3032 3029 1 3032 3033 1 3033 3034 1 3034 3029 1 3035 3036 1
		 3036 3037 1 3037 3035 1 3037 3038 1 3038 3035 1 3036 3039 1 3039 3040 1 3040 3037 1
		 3040 3041 1 3041 3038 1 3042 3043 1 3043 3044 1 3044 3045 1 3045 3042 0 3046 3040 1
		 3039 3047 1 3047 3046 1 3048 3049 1 3049 3050 1 3050 3051 1 3051 3048 1 3051 3031 1
		 3031 3052 1 3052 3048 1 3053 3050 1 3050 3054 1 3054 3053 1 3054 3033 1 3032 3053 1
		 3055 3056 1 3056 3057 1 3057 3058 1 3058 3055 1 3059 3060 1 3060 3056 0 3055 3059 1
		 3061 3062 1 3062 3063 1 3063 3064 1 3064 3061 1 3064 3065 1 3065 3066 1 3066 3061 1
		 3066 3067 1 3067 3068 1 3068 3061 1 3069 3070 1 3070 3071 1 3071 3072 1 3072 3069 1
		 3071 3073 1 3073 3074 1 3074 3072 1 3073 3075 1 3075 3074 1 3076 3077 1 3077 3078 1
		 3078 3079 1 3079 3076 1 3080 3081 1 3081 3082 1 3082 3076 1 3076 3080 1 3083 3084 1
		 3084 3085 1 3085 3086 1 3086 3083 1 3083 3087 1 3087 3088 1 3088 3089 1 3089 3083 1
		 3089 3090 1 3090 3084 1 3091 3092 1 3092 3093 1 3093 3094 1 3094 3091 1 3091 3095 1
		 3095 3096 1 3096 3097 1 3097 3091 1 3097 3098 1 3098 3092 1 3099 3089 1 3088 3100 1
		 3100 3099 1 3101 3102 1 3102 3103 1 3103 3104 1 3104 3101 1 3104 3085 1 3085 3101 1
		 3101 3094 1 3093 3102 1 3103 3105 1 3105 3106 0 3106 3104 1 3106 3107 0 3107 3108 1;
	setAttr ".ed[6142:6307]" 3108 3104 1 3109 3110 1 3110 3111 1 3111 3082 1 3082 3109 1
		 3112 3113 1 3113 3114 1 3114 3115 1 3115 3112 0 3116 3117 1 3117 3060 0 3059 3116 1
		 3118 3119 1 3119 3120 1 3120 3121 1 3121 3118 1 3118 3122 1 3122 3123 1 3123 3119 1
		 3124 3125 1 3125 3126 1 3126 3124 1 3124 3127 1 3127 3125 1 3125 3128 1 3128 3129 1
		 3129 3126 1 3127 3079 1 3079 3128 1 3130 3131 0 3131 3132 1 3132 3057 1 3057 3130 1
		 3133 3134 1 3134 3129 1 3128 3133 1 3135 3136 1 3136 3137 1 3137 3138 1 3138 3135 1
		 3135 3139 1 3139 3120 1 3120 3136 1 3140 3141 1 3141 3137 1 3137 3140 1 3140 3119 1
		 3123 3141 1 3142 3143 1 3143 3043 1 3043 3144 1 3144 3142 1 3145 3142 1 3144 3146 0
		 3146 3145 1 3147 3148 1 3148 3149 1 3149 3150 1 3150 3147 1 3147 3151 1 3151 3152 1
		 3152 3148 1 3147 3153 1 3153 3154 1 3154 3151 1 3072 3155 1 3155 3156 1 3156 3069 1
		 3074 3157 1 3157 3155 1 3075 3157 1 3158 3159 1 3159 3081 1 3080 3158 1 3160 3116 1
		 3116 3159 1 3158 3160 1 3161 3162 1 3162 3163 1 3163 3164 1 3164 3161 1 3161 3165 1
		 3165 3166 1 3166 3167 1 3167 3161 1 3164 3168 1 3168 3165 1 3169 3170 1 3170 3171 1
		 3171 3172 1 3172 3169 1 3169 3173 1 3173 3174 1 3174 3175 1 3175 3169 1 3172 3176 1
		 3176 3173 1 3177 3178 1 3178 3166 1 3165 3177 1 3179 3180 1 3180 3181 1 3181 3182 1
		 3182 3179 1 3179 3163 1 3163 3180 1 3182 3171 1 3170 3179 1 3180 3183 1 3183 3184 0
		 3184 3181 1 3180 3185 1 3185 3186 1 3186 3183 0 3187 3188 1 3188 3189 1 3189 3190 1
		 3190 3187 1 3191 3192 0 3192 3193 1 3193 3194 1 3194 3191 1 3195 3145 1 3146 3196 0
		 3196 3195 1 3197 3198 1 3198 3085 1 3085 3197 1 3197 3199 1 3199 3095 1 3095 3198 1
		 3199 3090 1 3090 3200 1 3200 3201 1 3201 3199 1 3202 3163 1 3163 3203 1 3203 3202 1
		 3203 3175 1 3175 3204 1 3204 3202 1 3204 3205 1 3205 3206 1 3206 3168 1 3168 3204 1
		 3207 3208 1 3208 3087 1 3087 3207 1 3209 3041 1 3041 3210 1 3210 3211 1 3211 3209 1
		 3212 3209 1 3209 3188 1 3188 3213 1 3213 3212 1 3214 3167 1 3167 3215 1 3215 3214 1
		 3216 3212 1 3213 3217 1 3217 3216 1 3218 3216 1 3217 3195 1 3195 3218 1 3219 3220 1;
	setAttr ".ed[6308:6473]" 3220 3108 1 3107 3219 0 3221 3222 1 3222 3223 1 3223 3224 1
		 3224 3221 1 3223 3225 1 3225 3226 1 3226 3224 1 3225 3207 1 3207 3227 1 3227 3226 1
		 3207 3108 1 3220 3227 1 3219 3186 0 3185 3220 1 3228 3229 1 3229 3230 1 3230 3231 1
		 3231 3228 1 3229 3232 1 3232 3233 1 3233 3230 1 3232 3234 1 3234 3214 1 3214 3233 1
		 3234 3220 1 3185 3214 1 3235 3236 1 3236 3237 1 3237 3109 1 3109 3235 1 3159 3236 1
		 3235 3159 1 3238 3239 1 3239 3063 1 3063 3240 1 3240 3238 1 3241 3187 1 3187 3242 1
		 3242 3243 1 3243 3241 1 3217 3241 1 3243 3217 1 3244 3245 1 3245 3149 1 3149 3246 1
		 3246 3244 1 3247 3248 1 3248 3240 1 3240 3249 1 3249 3247 1 3249 3068 1 3068 3250 1
		 3250 3247 1 3058 3251 1 3251 3252 1 3252 3237 1 3237 3058 1 3113 3240 1 3248 3113 1
		 3253 3254 1 3254 3245 1 3245 3255 1 3255 3253 1 3253 3256 1 3256 3153 1 3153 3254 1
		 3143 3242 1 3242 3257 1 3257 3258 1 3258 3143 1 3194 3255 1 3245 3194 1 3259 3260 1
		 3260 3261 1 3261 3262 1 3262 3259 1 3259 3263 1 3263 3264 1 3264 3260 1 3102 3262 1
		 3261 3102 1 3265 3266 1 3266 3267 1 3267 3268 1 3268 3265 1 3268 3269 1 3269 3270 1
		 3270 3265 1 3182 3267 1 3266 3182 1 3236 3055 1 3159 3059 1 3142 3243 1 3145 3217 1
		 3252 3110 1 3190 3257 1 3271 3272 0 3272 3195 1 3196 3271 0 3258 3044 1 3056 3130 0
		 3273 3117 0 3116 3274 1 3274 3273 0 3132 3251 1 3042 3144 0 3081 3235 1 3111 3077 1
		 3160 3275 1 3275 3274 0 3211 3189 1 3272 3276 0 3276 3218 1 3241 3213 1 3218 3035 1
		 3035 3216 1 3038 3212 1 3078 3133 1 3158 3124 1 3124 3160 1 3080 3127 1 3046 3210 1
		 3218 3049 1 3049 3035 1 3048 3036 1 3052 3039 1 3052 3277 1 3277 3047 1 3124 3138 1
		 3138 3160 1 3126 3135 1 3129 3139 1 3134 3278 1 3278 3139 1 3030 3277 1 3053 3051 1
		 3114 3218 1 3276 3115 0 3114 3050 1 3278 3121 1 3136 3140 1 3192 3275 0 3160 3193 1
		 3137 3193 1 3033 3250 1 3250 3279 1 3279 3034 1 3050 3248 1 3247 3054 1 3122 3280 1
		 3280 3256 1 3256 3123 1 3141 3253 1 3255 3137 1 3067 3279 1 3280 3154 1 3240 3062 1
		 3062 3249 1 3254 3150 1 3150 3245 1 3239 3281 1 3281 3064 1 3281 3282 1 3282 3065 1;
	setAttr ".ed[6474:6639]" 3113 3238 1 3148 3283 1 3283 3246 1 3152 3284 1 3284 3283 1
		 3244 3194 1 3260 3281 1 3239 3261 1 3264 3282 1 3102 3238 1 3113 3103 1 3112 3105 0
		 3267 3246 1 3283 3268 1 3284 3269 1 3181 3194 1 3244 3182 1 3184 3191 0 3092 3259 1
		 3262 3093 1 3098 3263 1 3171 3266 1 3265 3172 1 3270 3176 1 3201 3096 1 3174 3205 1
		 3198 3094 1 3170 3203 1 3084 3197 1 3202 3164 1 3099 3200 1 3104 3086 1 3206 3177 1
		 3162 3180 1 3208 3285 1 3285 3088 1 3285 3286 1 3286 3100 1 3166 3287 1 3287 3215 1
		 3178 3288 1 3288 3287 1 3207 3086 1 3162 3214 1 3222 3286 1 3285 3223 1 3208 3225 1
		 3230 3287 1 3288 3231 1 3233 3215 1 3070 3221 1 3224 3071 1 3226 3073 1 3227 3075 1
		 3220 3075 1 3155 3229 1 3228 3156 1 3157 3232 1 3075 3234 1 3029 3289 1 3289 3290 1
		 3290 3030 1 3034 3291 1 3291 3289 1 3044 3292 1 3292 3293 1 3293 3045 0 3047 3294 1
		 3294 3295 1 3295 3046 1 3065 3296 1 3296 3297 1 3297 3066 1 3297 3298 1 3298 3067 1
		 3069 3299 1 3299 3300 1 3300 3070 1 3077 3301 1 3301 3302 1 3302 3078 1 3096 3303 1
		 3303 3304 1 3304 3097 1 3304 3305 1 3305 3098 1 3100 3306 1 3306 3307 1 3307 3099 1
		 3110 3308 1 3308 3309 1 3309 3111 1 3121 3310 1 3310 3311 1 3311 3118 1 3311 3312 1
		 3312 3122 1 3131 3313 0 3313 3314 1 3314 3132 1 3133 3315 1 3315 3316 1 3316 3134 1
		 3151 3317 1 3317 3318 1 3318 3152 1 3154 3319 1 3319 3317 1 3156 3320 1 3320 3299 1
		 3173 3321 1 3321 3322 1 3322 3174 1 3176 3323 1 3323 3321 1 3177 3324 1 3324 3325 1
		 3325 3178 1 3189 3326 1 3326 3327 1 3327 3190 1 3200 3328 1 3328 3329 1 3329 3201 1
		 3205 3330 1 3330 3331 1 3331 3206 1 3210 3332 1 3332 3333 1 3333 3211 1 3221 3334 1
		 3334 3335 1 3335 3222 1 3231 3336 1 3336 3337 1 3337 3228 1 3251 3338 1 3338 3339 1
		 3339 3252 1 3257 3340 1 3340 3341 1 3341 3258 1 3263 3342 1 3342 3343 1 3343 3264 1
		 3269 3344 1 3344 3345 1 3345 3270 1 3339 3308 1 3327 3340 1 3341 3292 1 3314 3338 1
		 3309 3301 1 3333 3326 1 3302 3315 1 3295 3332 1 3277 3346 1 3346 3294 1 3316 3347 1
		 3347 3278 1 3290 3346 1 3347 3310 1 3279 3348 1 3348 3291 1 3312 3349 1 3349 3280 1;
	setAttr ".ed[6640:6805]" 3298 3348 1 3349 3319 1 3282 3350 1 3350 3296 1 3318 3351 1
		 3351 3284 1 3343 3350 1 3351 3344 1 3305 3342 1 3345 3323 1 3329 3303 1 3322 3330 1
		 3307 3328 1 3331 3324 1 3286 3352 1 3352 3306 1 3325 3353 1 3353 3288 1 3335 3352 1
		 3353 3336 1 3300 3334 1 3337 3320 1 3289 3354 1 3354 3355 1 3355 3290 1 3291 3356 1
		 3356 3354 1 3357 3358 1 3358 3359 1 3359 3357 1 3360 3357 1 3359 3360 1 3357 3361 1
		 3361 3362 1 3362 3358 1 3360 3363 1 3363 3361 1 3364 3293 0 3292 3365 1 3365 3364 1
		 3294 3362 1 3361 3295 1 3366 3367 1 3367 3368 1 3368 3369 1 3369 3366 1 3366 3370 1
		 3370 3355 1 3355 3367 1 3371 3368 1 3368 3372 1 3372 3371 1 3372 3354 1 3356 3371 1
		 3373 3374 1 3374 3375 1 3375 3376 1 3376 3373 1 3377 3373 1 3376 3378 0 3378 3377 1
		 3379 3380 1 3380 3381 1 3381 3382 1 3382 3379 1 3379 3297 1 3296 3380 1 3379 3383 1
		 3383 3298 1 3299 3384 1 3384 3385 1 3385 3300 1 3384 3386 1 3386 3387 1 3387 3385 1
		 3388 3387 1 3386 3388 1 3389 3390 1 3390 3302 1 3301 3389 1 3391 3389 1 3389 3392 1
		 3392 3393 1 3393 3391 1 3394 3395 1 3395 3396 1 3396 3397 1 3397 3394 1 3394 3398 1
		 3398 3399 1 3399 3400 1 3400 3394 1 3397 3401 1 3401 3398 1 3402 3403 1 3403 3404 1
		 3404 3405 1 3405 3402 1 3402 3304 1 3303 3406 1 3406 3402 1 3405 3305 1 3306 3399 1
		 3398 3307 1 3407 3408 1 3408 3409 1 3409 3410 1 3410 3407 1 3396 3408 1 3407 3396 1
		 3410 3404 1 3403 3407 1 3408 3411 1 3411 3412 0 3412 3409 1 3408 3413 1 3413 3414 1
		 3414 3411 0 3415 3392 1 3392 3309 1 3308 3415 1 3416 3417 0 3417 3418 1 3418 3419 1
		 3419 3416 1 3420 3377 1 3378 3421 0 3421 3420 1 3310 3422 1 3422 3423 1 3423 3311 1
		 3423 3424 1 3424 3312 1 3425 3426 1 3426 3427 1 3427 3425 1 3426 3428 1 3428 3427 1
		 3425 3429 1 3429 3430 1 3430 3426 1 3430 3390 1 3390 3428 1 3431 3375 1 3375 3314 1
		 3313 3431 0 3315 3430 1 3429 3316 1 3432 3433 1 3433 3434 1 3434 3435 1 3435 3432 1
		 3435 3422 1 3422 3436 1 3436 3432 1 3434 3437 1 3437 3438 1 3438 3434 1 3437 3424 1
		 3423 3438 1 3439 3440 1 3440 3365 1 3365 3441 1 3441 3439 1 3442 3443 1 3443 3440 0;
	setAttr ".ed[6806:6971]" 3439 3442 1 3444 3445 1 3445 3446 1 3446 3447 1 3447 3444 1
		 3447 3318 1 3317 3444 1 3319 3448 1 3448 3444 1 3320 3449 1 3449 3384 1 3449 3450 1
		 3450 3386 1 3450 3388 1 3451 3391 1 3393 3452 1 3452 3451 1 3453 3451 1 3452 3420 1
		 3420 3453 1 3454 3455 1 3455 3456 1 3456 3457 1 3457 3454 1 3454 3458 1 3458 3459 1
		 3459 3460 1 3460 3454 1 3460 3461 1 3461 3455 1 3462 3463 1 3463 3464 1 3464 3465 1
		 3465 3462 1 3462 3466 1 3466 3322 1 3321 3462 1 3323 3463 1 3324 3460 1 3459 3325 1
		 3467 3468 1 3468 3469 1 3469 3470 1 3470 3467 1 3470 3456 1 3456 3467 1 3467 3465 1
		 3464 3468 1 3469 3471 1 3471 3472 0 3472 3470 1 3472 3473 0 3473 3474 1 3474 3470 1
		 3475 3327 1 3326 3476 1 3476 3475 1 3477 3478 1 3478 3479 1 3479 3480 1 3480 3477 0
		 3481 3482 1 3482 3443 0 3442 3481 1 3396 3483 1 3483 3484 1 3484 3396 1 3483 3406 1
		 3406 3485 1 3485 3484 1 3485 3329 1 3328 3401 1 3401 3485 1 3486 3456 1 3456 3487 1
		 3487 3486 1 3487 3488 1 3488 3466 1 3466 3486 1 3488 3461 1 3461 3331 1 3330 3488 1
		 3400 3489 1 3489 3490 1 3490 3400 1 3491 3333 1 3332 3363 1 3363 3491 1 3492 3493 1
		 3493 3476 1 3476 3491 1 3491 3492 1 3494 3458 1 3458 3495 1 3495 3494 1 3496 3497 1
		 3497 3493 1 3492 3496 1 3498 3481 1 3481 3497 1 3496 3498 1 3499 3414 0 3413 3500 1
		 3500 3499 1 3334 3501 1 3501 3502 1 3502 3335 1 3501 3503 1 3503 3504 1 3504 3502 1
		 3503 3505 1 3505 3490 1 3490 3504 1 3505 3500 1 3413 3490 1 3500 3474 1 3473 3499 0
		 3336 3506 1 3506 3507 1 3507 3337 1 3506 3508 1 3508 3509 1 3509 3507 1 3508 3495 1
		 3495 3510 1 3510 3509 1 3495 3474 1 3500 3510 1 3511 3415 1 3415 3512 1 3512 3513 1
		 3513 3511 1 3513 3452 1 3452 3511 1 3514 3515 1 3515 3381 1 3381 3516 1 3516 3514 1
		 3517 3518 1 3518 3519 1 3519 3475 1 3475 3517 1 3517 3497 1 3497 3518 1 3520 3521 1
		 3521 3446 1 3446 3522 1 3522 3520 1 3523 3524 1 3524 3515 1 3515 3525 1 3525 3523 1
		 3523 3526 1 3526 3383 1 3383 3524 1 3374 3512 1 3512 3339 1 3338 3374 1 3515 3419 1
		 3419 3525 1 3527 3528 1 3528 3522 1 3522 3529 1 3529 3527 1 3529 3448 1 3448 3530 1;
	setAttr ".ed[6972:7137]" 3530 3527 1 3441 3341 1 3340 3519 1 3519 3441 1 3528 3478 1
		 3478 3522 1 3531 3532 1 3532 3533 1 3533 3534 1 3534 3531 1 3534 3343 1 3342 3531 1
		 3532 3410 1 3410 3533 1 3535 3536 1 3536 3537 1 3537 3538 1 3538 3535 1 3535 3345 1
		 3344 3536 1 3537 3468 1 3468 3538 1 3373 3513 1 3377 3452 1 3518 3439 1 3497 3442 1
		 3539 3482 0 3481 3540 1 3540 3539 0 3431 3376 0 3541 3542 0 3542 3420 1 3421 3541 0
		 3440 3364 0 3511 3393 1 3542 3543 0 3543 3453 1 3498 3544 1 3544 3540 0 3493 3517 1
		 3496 3359 1 3359 3498 1 3492 3360 1 3427 3451 1 3453 3427 1 3428 3391 1 3359 3369 1
		 3369 3498 1 3358 3366 1 3362 3370 1 3346 3370 1 3433 3427 1 3453 3433 1 3432 3425 1
		 3436 3429 1 3436 3347 1 3367 3372 1 3417 3544 0 3498 3418 1 3368 3418 1 3438 3435 1
		 3479 3453 1 3543 3480 0 3479 3434 1 3348 3526 1 3526 3356 1 3371 3523 1 3525 3368 1
		 3424 3530 1 3530 3349 1 3434 3528 1 3527 3437 1 3382 3515 1 3524 3382 1 3522 3445 1
		 3445 3529 1 3380 3545 1 3545 3516 1 3350 3545 1 3514 3419 1 3521 3546 1 3546 3447 1
		 3546 3351 1 3478 3520 1 3533 3516 1 3545 3534 1 3409 3419 1 3514 3410 1 3412 3416 0
		 3536 3546 1 3521 3537 1 3468 3520 1 3478 3469 1 3477 3471 0 3404 3532 1 3531 3405 1
		 3463 3535 1 3538 3464 1 3403 3483 1 3486 3465 1 3484 3397 1 3455 3487 1 3395 3408 1
		 3470 3457 1 3399 3547 1 3547 3489 1 3352 3547 1 3494 3548 1 3548 3459 1 3548 3353 1
		 3395 3490 1 3495 3457 1 3502 3547 1 3504 3489 1 3548 3506 1 3494 3508 1 3385 3501 1
		 3387 3503 1 3388 3505 1 3388 3500 1 3507 3449 1 3509 3450 1 3510 3388 1 3549 3573 0
		 1066 3549 1 3550 1332 0 1073 3550 1 1076 1331 1 3551 1331 0 1079 3551 1 3552 1333 0
		 1045 3552 1 3553 3552 0 1044 3553 1 3554 1336 0 1043 3554 1 3555 1337 0 2346 3555 1
		 3556 3555 0 2345 3556 1 3557 2599 0 2349 3557 1 3559 2597 0 2377 3559 1 3560 3559 0
		 2374 3560 1 3561 2596 0 2373 3561 1 3562 3561 0 2367 3562 1 3563 2600 0 2353 3563 1
		 3564 3563 0 2352 3564 1 3565 3574 0 2360 3565 1 3566 3565 0 2364 3566 1 3567 1339 0
		 1060 3567 1 3568 3567 0 1059 3568 1 3569 1335 0 1063 3569 1 3570 3569 0 1057 3570 1;
	setAttr ".ed[7138:7149]" 3571 1334 0 1053 3571 1 3572 3571 0 1049 3572 1 3573 1338 0
		 1065 3573 1 3574 2598 0 2358 3574 1 2348 2349 1 3558 3557 0 2343 2348 1 2348 3558 1;
	setAttr -s 3576 -ch 14108 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 2 3
		f 4 4 5 6 7
		mu 0 4 4 5 6 7
		f 4 8 9 10 11
		mu 0 4 8 9 10 11
		f 4 12 -6 13 14
		mu 0 4 12 6 5 13
		f 4 15 -10 16 17
		mu 0 4 14 10 9 15
		f 4 18 19 20 21
		mu 0 4 16 17 18 19
		f 4 22 23 -20 24
		mu 0 4 20 21 18 17
		f 4 25 26 27 28
		mu 0 4 22 23 24 25
		f 4 29 30 31 32
		mu 0 4 26 27 28 15
		f 4 33 34 35 -29
		mu 0 4 25 29 30 22
		f 4 36 37 38 39
		mu 0 4 31 32 33 34
		f 4 40 41 -37 42
		mu 0 4 35 36 32 31
		f 4 43 -5 44 45
		mu 0 4 37 5 4 38
		f 4 46 -46 47 -11
		mu 0 4 10 37 38 11
		f 4 -47 -16 48 49
		mu 0 4 37 10 14 39
		f 4 -44 -50 50 -14
		mu 0 4 5 37 39 13
		f 4 51 -40 52 53
		mu 0 4 40 31 34 41
		f 4 54 -54 55 56
		mu 0 4 42 40 41 43
		f 4 57 -43 -52 58
		mu 0 4 44 35 31 40
		f 4 59 -3 60 -22
		mu 0 4 19 3 2 16
		f 4 61 -61 62 63
		mu 0 4 45 16 2 23
		f 4 64 65 66 67
		mu 0 4 46 47 48 49
		f 4 68 -68 69 -4
		mu 0 4 3 46 49 0
		f 4 70 71 72 73
		mu 0 4 50 51 52 53
		f 4 74 75 76 77
		mu 0 4 54 55 56 57
		f 4 78 -78 79 -7
		mu 0 4 6 54 57 7
		f 4 80 -8 81 82
		mu 0 4 58 4 7 59
		f 4 83 -83 84 85
		mu 0 4 60 58 59 61
		f 4 86 -12 87 88
		mu 0 4 62 8 11 63
		f 4 89 -89 90 91
		mu 0 4 64 62 63 65
		f 4 92 93 94 95
		mu 0 4 66 67 68 69
		f 4 96 97 -82 -80
		mu 0 4 57 70 59 7
		f 4 98 99 -85 -98
		mu 0 4 70 71 61 59
		f 4 100 101 -97 -77
		mu 0 4 56 72 70 57
		f 4 102 103 -99 -102
		mu 0 4 72 73 71 70
		f 4 -79 -13 104 105
		mu 0 4 54 6 12 74
		f 4 -75 -106 106 107
		mu 0 4 55 54 74 75
		f 4 108 109 -87 110
		mu 0 4 76 77 8 62
		f 4 111 -111 -90 112
		mu 0 4 78 76 62 64
		f 4 113 114 115 116
		mu 0 4 79 80 81 67
		f 4 117 -117 -93 118
		mu 0 4 82 79 67 66
		f 4 119 120 121 122
		mu 0 4 83 84 85 86
		f 4 123 -123 124 -39
		mu 0 4 33 83 86 34
		f 4 -84 125 126 127
		mu 0 4 58 60 87 88
		f 4 -81 -128 128 -45
		mu 0 4 4 58 88 38
		f 4 -127 129 -91 130
		mu 0 4 88 87 65 63
		f 4 -129 -131 -88 -48
		mu 0 4 38 88 63 11
		f 4 -122 131 132 133
		mu 0 4 86 85 89 90
		f 4 -125 -134 134 -53
		mu 0 4 34 86 90 41
		f 4 -133 135 136 137
		mu 0 4 90 89 91 92
		f 4 -73 138 -65 139
		mu 0 4 53 52 47 46
		f 4 140 -140 -69 -60
		mu 0 4 19 53 46 3
		f 4 141 -64 -26 142
		mu 0 4 93 45 23 22
		f 4 143 144 -92 145
		mu 0 4 94 95 64 65
		f 4 146 147 -19 148
		mu 0 4 96 97 17 16
		f 4 149 150 -25 -148
		mu 0 4 97 98 20 17
		f 4 151 152 -113 -145
		mu 0 4 95 99 78 64
		f 4 153 154 155 -153
		mu 0 4 99 100 101 78
		f 4 156 157 158 -155
		mu 0 4 100 102 93 101
		f 4 159 160 -126 161
		mu 0 4 103 104 87 60
		f 4 162 -146 -130 -161
		mu 0 4 104 94 65 87
		f 4 163 164 -142 -158
		mu 0 4 102 105 45 93
		f 4 165 -149 -62 -165
		mu 0 4 105 96 16 45
		f 4 166 167 -144 168
		mu 0 4 106 107 95 94
		f 4 169 170 -147 171
		mu 0 4 108 109 97 96
		f 4 172 173 -150 -171
		mu 0 4 109 110 98 97
		f 4 174 175 -152 -168
		mu 0 4 107 111 99 95
		f 4 176 177 -154 -176
		mu 0 4 111 112 100 99
		f 4 178 179 -157 -178
		mu 0 4 112 113 102 100
		f 4 180 181 -160 182
		mu 0 4 114 115 104 103
		f 4 183 -169 -163 -182
		mu 0 4 115 106 94 104
		f 4 184 185 -164 -180
		mu 0 4 113 116 105 102
		f 4 186 -172 -166 -186
		mu 0 4 116 108 96 105
		f 4 187 188 189 190
		mu 0 4 117 118 69 119
		f 4 191 -191 192 -38
		mu 0 4 32 117 119 33
		f 4 193 194 -192 -42
		mu 0 4 36 120 117 32
		f 4 195 196 197 198
		mu 0 4 121 122 123 68
		f 4 199 -124 -193 200
		mu 0 4 123 83 33 119
		f 4 -198 -201 -190 -95
		mu 0 4 68 123 119 69
		f 4 201 202 -9 -110
		mu 0 4 77 124 9 8
		f 4 203 204 205 206
		mu 0 4 125 30 82 126
		f 4 -118 -205 207 -114
		mu 0 4 79 82 30 80
		f 4 -204 208 -143 -36
		mu 0 4 30 125 93 22
		f 4 -59 -55 209 210
		mu 0 4 44 40 42 127
		f 4 -209 211 -156 -159
		mu 0 4 93 125 78 101
		f 4 -112 -212 -207 212
		mu 0 4 76 78 125 126
		f 4 213 214 -58 215
		mu 0 4 128 129 35 44
		f 4 216 217 -41 -215
		mu 0 4 129 28 36 35
		f 4 -31 218 -194 -218
		mu 0 4 28 27 120 36
		f 4 219 220 -96 -189
		mu 0 4 118 130 66 69
		f 4 -221 221 -206 -119
		mu 0 4 66 130 126 82
		f 4 222 -33 -17 -203
		mu 0 4 124 26 15 9
		f 4 -138 223 -56 -135
		mu 0 4 90 92 43 41
		f 4 -217 224 -18 -32
		mu 0 4 28 129 14 15
		f 4 -222 225 -109 -213
		mu 0 4 126 130 77 76
		f 4 -195 226 -220 -188
		mu 0 4 117 120 130 118
		f 4 -226 227 -223 -202
		mu 0 4 77 130 26 124
		f 4 -30 -228 -227 -219
		mu 0 4 27 26 130 120
		f 4 -51 228 229 230
		mu 0 4 13 39 128 131
		f 4 -214 -229 -49 -225
		mu 0 4 129 128 39 14
		f 4 -230 231 232 233
		mu 0 4 131 128 132 133
		f 4 234 -232 -216 -211
		mu 0 4 127 132 128 44
		f 4 235 236 -235 -210
		mu 0 4 42 134 132 127
		f 4 237 238 -233 -237
		mu 0 4 134 75 133 132
		f 4 -231 239 -105 -15
		mu 0 4 13 131 74 12
		f 4 -107 -240 -234 -239
		mu 0 4 75 74 131 133
		f 4 240 -23 241 242
		mu 0 4 135 21 20 136
		f 4 243 -243 244 -86
		mu 0 4 61 135 136 60
		f 4 -244 -100 245 246
		mu 0 4 135 61 71 137
		f 4 -241 -247 247 248
		mu 0 4 21 135 137 51
		f 4 249 -162 -245 250
		mu 0 4 138 103 60 136
		f 4 251 -251 -242 -151
		mu 0 4 98 138 136 20
		f 4 252 -183 -250 253
		mu 0 4 139 114 103 138
		f 4 254 -254 -252 -174
		mu 0 4 110 139 138 98
		f 4 -246 255 -72 -248
		mu 0 4 137 71 52 51
		f 4 -116 256 -199 -94
		mu 0 4 67 81 121 68
		f 4 257 -120 -200 -197
		mu 0 4 122 84 83 123
		f 4 258 259 260 -1
		mu 0 4 0 140 141 1
		f 4 261 262 -260 263
		mu 0 4 142 143 141 140
		f 4 264 265 -262 266
		mu 0 4 144 145 143 142
		f 4 267 -63 -2 -261
		mu 0 4 141 23 2 1
		f 4 268 269 270 -266
		mu 0 4 145 146 24 143
		f 4 -271 -27 -268 -263
		mu 0 4 143 24 23 141
		f 4 271 272 -269 273
		mu 0 4 147 148 146 145
		f 4 274 275 -272 276
		mu 0 4 149 150 148 147
		f 4 -277 -274 -265 277
		mu 0 4 149 147 145 144
		f 4 278 -264 279 280
		mu 0 4 151 142 140 152
		f 4 281 -281 282 283
		mu 0 4 153 151 152 154
		f 4 284 -278 285 286
		mu 0 4 155 149 144 156
		f 4 287 -287 288 289
		mu 0 4 157 155 156 158
		f 4 -286 -267 -279 290
		mu 0 4 156 144 142 151
		f 4 -289 -291 -282 291
		mu 0 4 158 156 151 153
		f 4 292 -275 -285 293
		mu 0 4 159 150 149 155
		f 4 -280 -259 -70 294
		mu 0 4 152 140 0 49
		f 4 -283 -295 -67 295
		mu 0 4 154 152 49 48
		f 4 296 297 -294 -288
		mu 0 4 157 160 159 155
		f 4 298 299 300 301
		mu 0 4 161 162 163 164
		f 4 302 303 304 305
		mu 0 4 165 166 167 168
		f 4 306 -303 307 308
		mu 0 4 169 166 165 170
		f 4 309 310 -299 311
		mu 0 4 171 172 162 161
		f 4 312 -301 313 314
		mu 0 4 29 164 163 173
		f 4 -35 -315 315 -208
		mu 0 4 30 29 173 80
		f 4 316 -305 317 318
		mu 0 4 174 168 167 175
		f 4 319 -319 320 -257
		mu 0 4 81 174 175 121
		f 4 321 -273 322 323
		mu 0 4 176 146 148 177
		f 4 324 325 -323 -276
		mu 0 4 150 178 177 148
		f 4 -28 -270 -322 326
		mu 0 4 25 24 146 176
		f 4 -320 -115 -316 327
		mu 0 4 174 81 80 173
		f 4 -328 -314 328 -317
		mu 0 4 174 173 163 168
		f 4 -306 -329 -300 329
		mu 0 4 165 168 163 162
		f 4 -308 -330 -311 330
		mu 0 4 170 165 162 172
		f 4 331 -312 332 -326
		mu 0 4 178 171 161 177
		f 4 -324 -333 -302 333
		mu 0 4 176 177 161 164
		f 4 -327 -334 -313 -34
		mu 0 4 25 176 164 29
		f 4 334 -309 335 336
		mu 0 4 179 169 170 180
		f 4 337 -310 338 339
		mu 0 4 181 172 171 182
		f 4 340 -325 -293 341
		mu 0 4 183 178 150 159
		f 4 -336 -331 -338 342
		mu 0 4 180 170 172 181
		f 4 -339 -332 -341 343
		mu 0 4 182 171 178 183
		f 4 344 345 346 -304
		mu 0 4 166 184 185 167
		f 4 -345 -307 347 348
		mu 0 4 184 166 169 186
		f 4 -347 349 350 -318
		mu 0 4 167 185 187 175
		f 4 351 352 -258 353
		mu 0 4 187 188 84 122
		f 4 -351 -354 -196 -321
		mu 0 4 175 187 122 121
		f 4 354 355 -348 -335
		mu 0 4 179 189 186 169
		f 4 356 -337 357 358
		mu 0 4 190 179 180 191
		f 4 359 -340 360 361
		mu 0 4 192 181 182 193
		f 4 -358 -343 -360 362
		mu 0 4 191 180 181 192
		f 4 363 -361 -344 364
		mu 0 4 194 193 182 183
		f 4 365 366 367 368
		mu 0 4 195 196 189 197
		f 4 -368 -355 -357 369
		mu 0 4 197 189 179 190
		f 4 370 -359 371 372
		mu 0 4 198 190 191 199
		f 4 373 -373 374 375
		mu 0 4 200 198 199 201
		f 4 376 -362 377 378
		mu 0 4 202 192 193 203
		f 4 -372 -363 -377 379
		mu 0 4 199 191 192 202
		f 4 -375 -380 380 381
		mu 0 4 201 199 202 204
		f 4 382 -369 383 384
		mu 0 4 205 195 197 206
		f 4 385 -385 386 387
		mu 0 4 207 205 206 208
		f 4 -384 -370 -371 388
		mu 0 4 206 197 190 198
		f 4 -387 -389 -374 389
		mu 0 4 208 206 198 200
		f 4 390 -365 -342 -298
		mu 0 4 160 194 183 159
		f 4 -379 391 392 -381
		mu 0 4 202 203 209 204
		f 4 393 394 395 396
		mu 0 4 210 211 212 213
		f 4 397 -396 398 399
		mu 0 4 214 213 212 215
		f 4 400 -400 401 402
		mu 0 4 216 214 215 217
		f 4 -76 403 -401 404
		mu 0 4 56 55 214 216
		f 4 -108 405 -398 -404
		mu 0 4 55 75 213 214
		f 4 406 407 408 409
		mu 0 4 218 219 220 221
		f 4 410 411 412 413
		mu 0 4 222 223 224 225
		f 4 414 415 -411 416
		mu 0 4 226 227 223 222
		f 4 -407 417 418 419
		mu 0 4 219 218 228 229
		f 4 420 421 -409 422
		mu 0 4 230 188 221 220
		f 4 -421 423 -121 -353
		mu 0 4 188 230 85 84
		f 4 -413 424 425 426
		mu 0 4 225 224 231 232
		f 4 427 -417 428 429
		mu 0 4 233 226 222 234
		f 4 430 -430 431 -420
		mu 0 4 229 233 234 219
		f 4 -432 432 433 -408
		mu 0 4 219 234 235 220
		f 4 434 -433 -429 -414
		mu 0 4 225 235 234 222
		f 4 -435 -427 435 436
		mu 0 4 235 225 232 236
		f 4 437 -423 -434 -437
		mu 0 4 236 230 220 235
		f 4 -436 438 -136 439
		mu 0 4 236 232 91 89
		f 4 -438 -440 -132 -424
		mu 0 4 230 236 89 85
		f 4 -101 -405 440 441
		mu 0 4 72 56 216 237
		f 4 -103 -442 442 443
		mu 0 4 73 72 237 238
		f 4 444 445 446 -415
		mu 0 4 226 239 240 227
		f 4 447 448 449 -419
		mu 0 4 228 196 241 229
		f 4 -450 450 451 -431
		mu 0 4 229 241 242 233
		f 4 -452 452 -445 -428
		mu 0 4 233 242 239 226
		f 4 453 -410 454 -346
		mu 0 4 184 218 221 185
		f 4 455 -399 456 457
		mu 0 4 243 215 212 244
		f 4 458 -458 459 -412
		mu 0 4 223 243 244 224
		f 4 460 -402 -456 461
		mu 0 4 245 217 215 243
		f 4 462 -462 -459 -416
		mu 0 4 227 245 243 223
		f 4 -454 -349 463 -418
		mu 0 4 218 184 186 228
		f 4 -455 -422 -352 -350
		mu 0 4 185 221 188 187
		f 4 464 -457 -395 465
		mu 0 4 246 244 212 211
		f 4 -460 -465 466 -425
		mu 0 4 224 244 246 231
		f 4 467 468 -461 469
		mu 0 4 247 248 217 245
		f 4 470 -470 -463 -447
		mu 0 4 240 247 245 227
		f 4 -367 -448 -464 -356
		mu 0 4 189 196 228 186
		f 4 -238 471 -397 -406
		mu 0 4 75 134 210 213
		f 4 -467 472 -439 -426
		mu 0 4 231 246 91 232
		f 4 -466 473 -137 -473
		mu 0 4 246 211 92 91
		f 4 -394 474 -224 -474
		mu 0 4 211 210 43 92
		f 4 475 476 477 -446
		mu 0 4 239 249 250 240
		f 4 -366 478 479 -449
		mu 0 4 196 195 251 241
		f 4 -480 480 481 -451
		mu 0 4 241 251 252 242
		f 4 -482 482 -476 -453
		mu 0 4 242 252 249 239
		f 4 483 -471 -478 484
		mu 0 4 253 247 240 250
		f 4 485 486 487 488
		mu 0 4 254 255 256 257
		f 4 489 -489 490 -477
		mu 0 4 249 254 257 250
		f 4 -386 491 492 493
		mu 0 4 205 207 258 259
		f 4 -383 -494 494 -479
		mu 0 4 195 205 259 251
		f 4 -493 495 496 497
		mu 0 4 259 258 260 261
		f 4 -495 -498 498 -481
		mu 0 4 251 259 261 252
		f 4 -497 499 -486 500
		mu 0 4 261 260 255 254
		f 4 -499 -501 -490 -483
		mu 0 4 252 261 254 249
		f 4 501 502 -488 503
		mu 0 4 262 263 257 256
		f 4 -503 504 -485 -491
		mu 0 4 257 263 253 250
		f 4 -469 505 -441 -403
		mu 0 4 217 248 237 216
		f 4 -506 506 507 -443
		mu 0 4 237 248 264 238
		f 4 508 509 -505 -502
		mu 0 4 262 264 253 263
		f 4 -484 -510 -507 -468
		mu 0 4 247 253 264 248
		f 4 -475 -472 -236 -57
		mu 0 4 43 210 134 42
		f 4 -378 -364 510 511
		mu 0 4 203 193 194 265
		f 4 -170 512 513 -173
		mu 0 4 109 108 266 110
		f 4 514 -184 -181 515
		mu 0 4 266 106 115 114
		f 4 516 517 518 519
		mu 0 4 267 268 269 270
		f 4 520 521 522 523
		mu 0 4 271 272 273 274
		f 4 524 525 -523 526
		mu 0 4 275 276 274 273
		f 4 527 528 529 530
		mu 0 4 277 278 279 280
		f 4 -525 531 532 533
		mu 0 4 276 275 281 282
		f 4 534 535 536 537
		mu 0 4 283 284 285 286
		f 4 538 -530 539 -536
		mu 0 4 284 280 279 285
		f 4 540 541 542 -533
		mu 0 4 281 287 288 282
		f 4 543 -538 544 545
		mu 0 4 289 283 286 290
		f 4 546 -546 547 -520
		mu 0 4 270 289 290 267
		f 4 548 549 550 551
		mu 0 4 291 292 293 294
		f 4 552 -551 553 554
		mu 0 4 295 294 293 296
		f 4 555 556 557 -552
		mu 0 4 294 297 298 291
		f 4 -518 558 -524 559
		mu 0 4 269 268 271 274
		f 4 560 -519 -560 -526
		mu 0 4 276 270 269 274
		f 4 561 -547 -561 -534
		mu 0 4 282 289 270 276
		f 4 -544 -562 -543 562
		mu 0 4 283 289 282 288
		f 4 563 564 565 566
		mu 0 4 299 300 298 301
		f 4 567 -567 568 569
		mu 0 4 302 299 301 303
		f 4 570 -528 571 572
		mu 0 4 304 278 277 305
		f 4 573 -573 574 -570
		mu 0 4 303 304 305 302
		f 4 575 -550 576 577
		mu 0 4 306 293 292 307
		f 4 578 -578 579 -522
		mu 0 4 272 306 307 273
		f 4 580 -527 -580 581
		mu 0 4 308 275 273 307
		f 4 582 -582 -577 -549
		mu 0 4 291 308 307 292
		f 4 583 -541 584 585
		mu 0 4 309 287 281 310
		f 4 586 -586 587 -565
		mu 0 4 300 309 310 298
		f 4 -583 -558 -588 588
		mu 0 4 308 291 298 310
		f 4 -581 -589 -585 -532
		mu 0 4 275 308 310 281
		f 4 589 590 591 592
		mu 0 4 311 312 313 314
		f 4 593 594 -593 595
		mu 0 4 315 316 311 314
		f 4 596 -592 597 598
		mu 0 4 317 314 313 318
		f 4 599 -596 -597 600
		mu 0 4 319 315 314 317
		f 4 601 602 -601 603
		mu 0 4 320 321 319 317
		f 4 -604 -599 604 605
		mu 0 4 320 317 318 322
		f 4 606 -603 607 608
		mu 0 4 323 319 321 324
		f 4 609 610 611 612
		mu 0 4 325 326 327 328
		f 4 613 614 615 616
		mu 0 4 329 330 331 332
		f 4 -615 617 618 619
		mu 0 4 331 330 333 334
		f 4 620 621 -613 622
		mu 0 4 335 336 325 328
		f 4 623 -623 624 625
		mu 0 4 337 335 328 338
		f 4 626 -617 627 628
		mu 0 4 339 329 332 340
		f 4 629 630 -610 631
		mu 0 4 341 342 326 325
		f 4 632 633 -630 634
		mu 0 4 343 344 342 341
		f 4 635 636 637 638
		mu 0 4 345 336 346 347
		f 4 639 -639 640 641
		mu 0 4 348 345 347 349
		f 4 642 -635 643 -640
		mu 0 4 348 343 341 345
		f 4 -644 -632 -622 -636
		mu 0 4 345 341 325 336
		f 4 644 645 -611 -631
		mu 0 4 342 350 327 326
		f 4 646 647 -645 -634
		mu 0 4 344 351 350 342
		f 4 -256 648 649 650
		mu 0 4 52 71 352 353
		f 4 651 652 -649 -104
		mu 0 4 73 354 352 71
		f 4 653 654 655 656
		mu 0 4 355 356 357 358
		f 4 657 658 659 -529
		mu 0 4 278 359 360 279
		f 4 660 661 662 663
		mu 0 4 361 362 363 364
		f 4 664 -663 665 666
		mu 0 4 365 364 363 366
		f 4 667 668 669 670
		mu 0 4 367 368 369 370
		f 4 671 -667 672 673
		mu 0 4 371 365 366 372
		f 4 674 -537 675 -662
		mu 0 4 362 286 285 363
		f 4 -666 -676 -540 676
		mu 0 4 366 363 285 279
		f 4 -673 -677 -660 677
		mu 0 4 372 366 279 360
		f 4 678 -671 679 -655
		mu 0 4 356 367 370 357
		f 4 680 -658 -571 681
		mu 0 4 373 359 278 304
		f 4 -682 -574 682 683
		mu 0 4 373 304 303 374
		f 4 684 -657 685 686
		mu 0 4 375 355 358 376
		f 4 687 688 689 -687
		mu 0 4 376 377 378 375
		f 4 690 691 692 693
		mu 0 4 379 380 381 382
		f 4 694 695 696 -692
		mu 0 4 380 383 384 381
		f 4 697 -290 698 699
		mu 0 4 385 157 158 386
		f 4 -699 -292 700 701
		mu 0 4 386 158 153 387
		f 4 702 -297 -698 703
		mu 0 4 382 160 157 385
		f 4 704 705 -701 -284
		mu 0 4 154 388 387 153
		f 4 -705 -296 706 707
		mu 0 4 388 154 48 389
		f 4 708 709 -708 710
		mu 0 4 390 391 388 389
		f 4 -710 711 712 -706
		mu 0 4 388 391 392 387
		f 4 713 -695 714 715
		mu 0 4 393 383 380 394
		f 4 716 717 -707 -66
		mu 0 4 47 395 389 48
		f 4 718 719 720 721
		mu 0 4 396 397 398 399
		f 4 722 -721 723 724
		mu 0 4 400 399 398 401
		f 4 725 -724 726 727
		mu 0 4 402 401 398 403
		f 4 728 729 730 731
		mu 0 4 404 405 406 407
		f 4 732 733 -730 734
		mu 0 4 408 409 406 405
		f 4 735 -727 -720 736
		mu 0 4 410 403 398 397
		f 4 -722 737 738 739
		mu 0 4 396 399 411 412
		f 4 740 741 -738 -723
		mu 0 4 400 413 411 399
		f 4 742 743 744 745
		mu 0 4 414 415 416 417
		f 4 -728 746 -729 747
		mu 0 4 402 403 405 404
		f 4 -736 748 -735 -747
		mu 0 4 403 410 408 405
		f 4 749 -739 750 751
		mu 0 4 418 412 411 419
		f 4 752 -751 -742 753
		mu 0 4 420 419 411 413
		f 4 754 -752 755 756
		mu 0 4 421 418 419 422
		f 4 -753 757 758 -756
		mu 0 4 419 420 423 422
		f 4 759 760 761 762
		mu 0 4 424 425 426 427
		f 4 763 764 765 766
		mu 0 4 428 429 430 431
		f 4 767 768 769 -696
		mu 0 4 383 432 433 384
		f 4 770 -767 771 -769
		mu 0 4 432 428 431 433
		f 4 772 773 774 775
		mu 0 4 434 435 436 437
		f 4 776 777 778 -774
		mu 0 4 435 438 439 436
		f 4 779 -762 780 -778
		mu 0 4 438 427 426 439
		f 4 781 782 783 784
		mu 0 4 440 441 442 443
		f 4 785 786 -746 787
		mu 0 4 444 445 414 417
		f 4 788 789 -719 790
		mu 0 4 446 447 397 396
		f 4 791 -791 -740 792
		mu 0 4 448 446 396 412
		f 4 793 794 -737 -790
		mu 0 4 447 449 410 397
		f 4 795 796 -749 -795
		mu 0 4 449 450 408 410
		f 4 797 -793 -750 798
		mu 0 4 451 448 412 418
		f 4 799 -799 -755 800
		mu 0 4 452 451 418 421
		f 4 801 802 -733 -797
		mu 0 4 450 453 409 408
		f 4 803 804 805 -786
		mu 0 4 444 454 455 445
		f 4 806 -785 807 808
		mu 0 4 456 440 443 457
		f 4 809 -744 810 811
		mu 0 4 458 416 415 459
		f 4 812 -776 813 814
		mu 0 4 460 434 437 461
		f 4 815 -815 816 -765
		mu 0 4 429 460 461 430
		f 4 817 -809 818 819
		mu 0 4 462 456 457 463
		f 4 820 -820 821 -805
		mu 0 4 454 462 463 455
		f 4 822 823 824 825
		mu 0 4 464 465 466 467
		f 4 -825 826 827 828
		mu 0 4 467 466 468 469
		f 4 -828 829 -802 830
		mu 0 4 469 468 453 450
		f 4 831 832 -829 833
		mu 0 4 470 471 467 469
		f 4 -831 -796 834 -834
		mu 0 4 469 450 449 470
		f 4 -835 -794 835 836
		mu 0 4 470 449 447 472
		f 4 837 838 -832 -837
		mu 0 4 472 473 471 470
		f 4 839 840 -838 841
		mu 0 4 474 475 473 472
		f 4 -842 -836 -789 842
		mu 0 4 474 472 447 446
		f 4 843 -843 -792 844
		mu 0 4 476 474 446 448
		f 4 845 -845 -798 846
		mu 0 4 477 476 448 451
		f 4 -847 -800 847 848
		mu 0 4 477 451 452 478
		f 4 849 850 -840 -844
		mu 0 4 476 479 475 474
		f 4 851 -850 -846 852
		mu 0 4 480 479 476 477
		f 4 853 -853 -849 854
		mu 0 4 481 480 477 478
		f 4 -492 855 -775 856
		mu 0 4 258 207 437 436
		f 4 -496 -857 -779 857
		mu 0 4 260 258 436 439
		f 4 -390 858 -817 859
		mu 0 4 208 200 430 461
		f 4 -388 -860 -814 -856
		mu 0 4 207 208 461 437
		f 4 860 -731 861 862
		mu 0 4 482 407 406 483
		f 4 863 -863 864 -810
		mu 0 4 458 482 483 416
		f 4 -862 -734 865 866
		mu 0 4 483 406 409 484
		f 4 -865 -867 867 -745
		mu 0 4 416 483 484 417
		f 4 -866 -803 868 869
		mu 0 4 484 409 453 485
		f 4 -868 -870 870 -788
		mu 0 4 417 484 485 444
		f 4 871 -804 -871 872
		mu 0 4 486 454 444 485
		f 4 873 -873 -869 -830
		mu 0 4 468 486 485 453
		f 4 874 -821 -872 875
		mu 0 4 487 462 454 486
		f 4 876 -876 -874 -827
		mu 0 4 466 487 486 468
		f 4 877 -818 -875 878
		mu 0 4 488 456 462 487
		f 4 879 -879 -877 -824
		mu 0 4 465 488 487 466
		f 4 880 -807 -878 881
		mu 0 4 489 440 456 488
		f 4 882 -780 883 884
		mu 0 4 490 427 438 491
		f 4 885 -885 886 887
		mu 0 4 492 490 491 442
		f 4 -884 -777 888 889
		mu 0 4 491 438 435 493
		f 4 -887 -890 890 -784
		mu 0 4 442 491 493 443
		f 4 891 -743 892 893
		mu 0 4 393 415 414 494
		f 4 -714 -894 894 -768
		mu 0 4 383 393 494 432
		f 4 -893 -787 895 896
		mu 0 4 494 414 445 495
		f 4 -895 -897 897 -771
		mu 0 4 432 494 495 428
		f 4 898 -764 -898 899
		mu 0 4 496 429 428 495
		f 4 900 -900 -896 -806
		mu 0 4 455 496 495 445
		f 4 -889 -773 901 902
		mu 0 4 493 435 434 497
		f 4 -891 -903 903 -808
		mu 0 4 443 493 497 457
		f 4 904 -811 -892 -716
		mu 0 4 394 459 415 393
		f 4 -901 -822 905 906
		mu 0 4 496 455 463 498
		f 4 -899 -907 907 -816
		mu 0 4 429 496 498 460
		f 4 -906 -819 -904 908
		mu 0 4 498 463 457 497
		f 4 -908 -909 -902 -813
		mu 0 4 460 498 497 434
		f 4 909 910 911 912
		mu 0 4 499 500 501 502
		f 4 913 -912 914 915
		mu 0 4 503 502 501 504
		f 4 916 917 918 919
		mu 0 4 505 506 507 508
		f 4 920 921 922 923
		mu 0 4 509 510 511 512
		f 4 -916 924 -917 925
		mu 0 4 503 504 506 505
		f 4 -921 926 927 928
		mu 0 4 510 509 513 514
		f 4 929 930 931 -928
		mu 0 4 513 515 516 514
		f 4 932 933 -931 934
		mu 0 4 517 518 516 515
		f 4 935 -920 936 -922
		mu 0 4 510 505 508 511
		f 4 -926 -936 -929 937
		mu 0 4 503 505 510 514
		f 4 -932 938 -914 -938
		mu 0 4 514 516 502 503
		f 4 939 -913 -939 -934
		mu 0 4 518 499 502 516
		f 4 940 941 942 943
		mu 0 4 519 520 521 522
		f 4 944 945 946 947
		mu 0 4 523 524 525 526
		f 4 948 949 950 951
		mu 0 4 527 528 517 529
		f 4 952 953 -949 954
		mu 0 4 530 531 528 527
		f 4 955 -955 956 957
		mu 0 4 532 530 527 533
		f 4 958 -958 959 960
		mu 0 4 534 532 533 535
		f 4 961 962 963 -959
		mu 0 4 534 536 537 532
		f 4 964 965 966 -963
		mu 0 4 536 538 539 537
		f 4 -964 967 968 -956
		mu 0 4 532 537 540 530
		f 4 -953 -969 969 970
		mu 0 4 531 530 540 541
		f 4 -941 971 972 973
		mu 0 4 520 519 542 543
		f 4 974 -924 975 -946
		mu 0 4 524 509 512 525
		f 4 976 -927 -975 977
		mu 0 4 544 513 509 524
		f 4 -945 978 979 -978
		mu 0 4 524 523 545 544
		f 4 980 -930 -977 981
		mu 0 4 546 515 513 544
		f 4 982 -951 -935 -981
		mu 0 4 546 529 517 515
		f 4 -980 983 984 -982
		mu 0 4 544 545 547 546
		f 4 985 986 -957 -952
		mu 0 4 529 548 533 527
		f 4 -983 -985 987 -986
		mu 0 4 529 546 547 548
		f 4 988 989 990 -984
		mu 0 4 545 549 550 547
		f 4 -991 991 992 993
		mu 0 4 547 550 551 552
		f 4 994 -988 -994 995
		mu 0 4 553 548 547 552
		f 4 996 -960 -987 -995
		mu 0 4 553 535 533 548
		f 4 997 998 -976 999
		mu 0 4 554 555 525 512
		f 4 1000 1001 -947 -999
		mu 0 4 555 556 526 525
		f 4 1002 1003 1004 1005
		mu 0 4 557 558 559 554
		f 4 -1005 1006 1007 -998
		mu 0 4 554 559 560 555
		f 4 1008 -1001 -1008 1009
		mu 0 4 561 556 555 560
		f 4 1010 -962 1011 1012
		mu 0 4 562 536 534 563
		f 4 1013 1014 1015 1016
		mu 0 4 564 565 349 566
		f 4 1017 1018 -1014 1019
		mu 0 4 539 567 565 564
		f 4 1020 -642 -1015 1021
		mu 0 4 568 348 349 565
		f 4 1022 -1022 -1019 1023
		mu 0 4 569 568 565 567
		f 4 1024 -968 -967 -1020
		mu 0 4 564 540 537 539
		f 4 -1017 1025 -970 -1025
		mu 0 4 564 566 541 540
		f 4 -1018 -966 1026 1027
		mu 0 4 567 539 538 570
		f 4 -1024 -1028 1028 1029
		mu 0 4 569 567 570 571
		f 4 -1007 -1004 1030 -1010
		mu 0 4 560 559 558 561
		f 4 1031 -943 1032 -1031
		mu 0 4 558 522 521 561
		f 4 1033 1034 1035 1036
		mu 0 4 572 573 574 312
		f 4 1037 1038 1039 1040
		mu 0 4 575 576 577 578
		f 4 1041 1042 1043 1044
		mu 0 4 579 580 581 582
		f 4 -1040 1045 1046 1047
		mu 0 4 578 577 583 584
		f 4 -1034 1048 -1047 1049
		mu 0 4 573 572 584 583
		f 4 1050 1051 -1035 1052
		mu 0 4 585 586 574 573
		f 4 1053 1054 -1039 1055
		mu 0 4 587 588 577 576
		f 4 1056 1057 1058 -1043
		mu 0 4 580 589 590 581
		f 4 1059 1060 -1046 -1055
		mu 0 4 588 591 583 577
		f 4 1061 -1053 -1050 -1061
		mu 0 4 591 585 573 583
		f 4 1062 -648 1063 1064
		mu 0 4 592 350 351 593
		f 4 1065 -1065 1066 -1051
		mu 0 4 585 592 593 586
		f 4 1067 -646 -1063 1068
		mu 0 4 594 327 350 592
		f 4 1069 -1069 -1066 -1062
		mu 0 4 591 594 592 585
		f 4 -625 -612 -1068 1070
		mu 0 4 338 328 327 594
		f 4 1071 -1071 -1070 -1060
		mu 0 4 588 338 594 591
		f 4 1072 -626 -1072 -1054
		mu 0 4 587 337 338 588
		f 4 1073 -629 1074 -1058
		mu 0 4 589 339 340 590
		f 4 1075 1076 1077 1078
		mu 0 4 595 596 295 597
		f 4 1079 1080 1081 1082
		mu 0 4 598 599 600 601
		f 4 1083 1084 1085 1086
		mu 0 4 602 603 604 605
		f 4 1087 -1087 1088 -1081
		mu 0 4 599 602 605 600
		f 4 1089 -1078 -555 1090
		mu 0 4 606 597 295 296
		f 4 -556 -553 -1077 1091
		mu 0 4 297 294 295 596
		f 4 1092 -683 -569 1093
		mu 0 4 607 374 303 301
		f 4 1094 -689 1095 -1085
		mu 0 4 603 378 377 604
		f 4 -566 -557 1096 -1094
		mu 0 4 301 298 297 607
		f 4 1097 1098 -1076 1099
		mu 0 4 608 609 596 595
		f 4 -1097 -1092 -1099 1100
		mu 0 4 607 297 596 609
		f 4 1101 -1093 -1101 -1098
		mu 0 4 608 374 607 609
		f 4 1102 1103 1104 1105
		mu 0 4 610 611 612 613
		f 4 1106 -1048 1107 1108
		mu 0 4 614 578 584 615
		f 4 1109 -1045 1110 1111
		mu 0 4 616 579 582 617
		f 4 1112 -1041 -1107 1113
		mu 0 4 618 575 578 614
		f 4 1114 -1037 -590 1115
		mu 0 4 619 572 312 311
		f 4 1116 1117 -1109 1118
		mu 0 4 620 621 614 615
		f 4 1119 1120 -1116 -595
		mu 0 4 316 622 619 311
		f 4 1121 -1105 1122 -1120
		mu 0 4 316 613 612 622;
	setAttr ".fc[500:999]"
		f 4 1123 1124 -1117 1125
		mu 0 4 623 624 621 620
		f 4 -1124 1126 1127 1128
		mu 0 4 624 623 625 626
		f 4 1129 1130 -1128 1131
		mu 0 4 627 628 626 625
		f 4 -1131 1132 1133 1134
		mu 0 4 626 628 629 630
		f 4 1135 1136 1137 1138
		mu 0 4 631 632 633 634
		f 4 -1138 1139 1140 1141
		mu 0 4 634 633 635 636
		f 4 1142 1143 -1114 -1118
		mu 0 4 621 637 618 614
		f 4 -1141 1144 -1112 1145
		mu 0 4 636 635 616 617
		f 4 -1115 1146 -1108 -1049
		mu 0 4 572 619 615 584
		f 4 1147 -1119 -1147 -1121
		mu 0 4 622 620 615 619
		f 4 1148 1149 1150 -1132
		mu 0 4 625 611 542 627
		f 4 1151 -545 1152 1153
		mu 0 4 638 290 286 639
		f 4 1154 1155 1156 1157
		mu 0 4 640 641 642 643
		f 4 1158 -1158 1159 1160
		mu 0 4 638 640 643 644
		f 4 -992 1161 1162 1163
		mu 0 4 551 550 645 646
		f 4 1164 1165 -661 1166
		mu 0 4 647 648 362 361
		f 4 1167 1168 1169 1170
		mu 0 4 649 650 651 652
		f 4 -1170 1171 -1165 1172
		mu 0 4 652 651 648 647
		f 4 -1157 1173 1174 1175
		mu 0 4 643 642 653 654
		f 4 -1160 -1176 1176 1177
		mu 0 4 644 643 654 655
		f 4 -1159 -1154 1178 1179
		mu 0 4 640 638 639 656
		f 4 -1180 1180 1181 -1155
		mu 0 4 640 656 657 641
		f 4 1182 1183 -989 -979
		mu 0 4 523 658 549 545
		f 4 1184 -1181 1185 -1169
		mu 0 4 650 657 656 651
		f 4 -1186 -1179 1186 -1172
		mu 0 4 651 656 639 648
		f 4 -1187 -1153 -675 -1166
		mu 0 4 648 639 286 362
		f 4 -990 1187 1188 -1162
		mu 0 4 550 549 659 645
		f 4 -1184 1189 1190 -1188
		mu 0 4 549 658 660 659
		f 4 1191 1192 -1178 1193
		mu 0 4 661 267 644 655
		f 4 -548 -1152 -1161 -1193
		mu 0 4 267 290 638 644
		f 4 1194 1195 -1183 -948
		mu 0 4 526 662 658 523
		f 4 1196 -1195 -1002 1197
		mu 0 4 663 662 526 556
		f 4 -1196 1198 1199 -1190
		mu 0 4 658 662 664 660
		f 4 1200 -1199 -1197 1201
		mu 0 4 665 664 662 663
		f 4 1202 1203 1204 1205
		mu 0 4 666 667 268 668
		f 4 -517 -1192 1206 -1205
		mu 0 4 268 267 661 668
		f 4 1207 1208 1209 1210
		mu 0 4 669 670 671 672
		f 4 1211 1212 -1210 1213
		mu 0 4 673 674 672 671
		f 4 1214 1215 1216 1217
		mu 0 4 492 675 676 677
		f 4 1218 -1215 -888 -783
		mu 0 4 441 675 492 442
		f 4 1219 1220 1221 1222
		mu 0 4 678 679 680 681
		f 4 1223 -1223 1224 -760
		mu 0 4 424 678 681 425
		f 4 1225 1226 1227 -1217
		mu 0 4 676 682 683 677
		f 4 1228 1229 1230 -1226
		mu 0 4 676 684 685 682
		f 4 1231 1232 1233 1234
		mu 0 4 686 687 688 689
		f 4 -1234 1235 1236 1237
		mu 0 4 690 691 679 692
		f 4 1238 -763 -883 1239
		mu 0 4 693 424 427 490
		f 4 1240 -1240 -886 -1218
		mu 0 4 677 693 490 492
		f 4 -1237 -1220 1241 1242
		mu 0 4 692 679 678 694
		f 4 -1242 -1224 -1239 1243
		mu 0 4 694 678 424 693
		f 4 1244 -1244 -1241 -1228
		mu 0 4 683 694 693 677
		f 4 1245 1246 -1029 1247
		mu 0 4 695 687 571 570
		f 4 1248 -1248 -1027 1249
		mu 0 4 696 695 570 538
		f 4 -1249 1250 1251 1252
		mu 0 4 695 696 697 698
		f 4 -1246 -1253 1253 -1233
		mu 0 4 687 695 698 688
		f 4 1254 1255 -1221 -1236
		mu 0 4 691 699 680 679
		f 4 1256 1257 -1255 -1254
		mu 0 4 700 354 699 691
		f 4 -1252 1258 -653 -1257
		mu 0 4 700 701 352 354
		f 4 1259 -1122 -594 1260
		mu 0 4 702 613 316 315
		f 4 1261 1262 1263 1264
		mu 0 4 703 704 705 706
		f 4 1265 -1265 1266 1267
		mu 0 4 707 703 706 708
		f 4 1268 -609 1269 1270
		mu 0 4 709 323 324 710
		f 4 1271 -600 -607 1272
		mu 0 4 711 315 319 323
		f 4 1273 -1273 -1269 1274
		mu 0 4 712 711 323 709
		f 4 1275 -1261 -1272 1276
		mu 0 4 713 702 315 711
		f 4 1277 1278 1279 1280
		mu 0 4 714 715 716 717
		f 4 1281 1282 -1279 1283
		mu 0 4 718 719 716 715
		f 4 -1278 1284 1285 1286
		mu 0 4 715 714 720 721
		f 4 1287 -1286 1288 1289
		mu 0 4 722 721 720 723
		f 4 1290 1291 1292 1293
		mu 0 4 724 725 726 727
		f 4 -1294 1294 1295 1296
		mu 0 4 724 727 728 729
		f 4 1297 -1296 1298 1299
		mu 0 4 730 729 728 731
		f 4 1300 -1300 1301 -1282
		mu 0 4 718 730 731 719
		f 4 -1284 -1287 1302 1303
		mu 0 4 718 715 721 732
		f 4 1304 -1301 -1304 1305
		mu 0 4 733 730 718 732
		f 4 1306 -1298 -1305 1307
		mu 0 4 734 729 730 733
		f 4 1308 -1297 -1307 1309
		mu 0 4 735 724 729 734
		f 4 1310 -1291 -1309 1311
		mu 0 4 736 725 724 735
		f 4 1312 1313 -1306 1314
		mu 0 4 737 738 733 732
		f 4 1315 1316 -1308 -1314
		mu 0 4 738 739 734 733
		f 4 1317 1318 -1310 -1317
		mu 0 4 739 740 735 734
		f 4 1319 1320 1321 1322
		mu 0 4 741 742 743 736
		f 4 1323 -1323 -1312 -1319
		mu 0 4 740 741 736 735
		f 4 -1315 -1303 -1288 1324
		mu 0 4 737 732 721 722
		f 4 -823 1325 -1290 1326
		mu 0 4 465 464 722 723
		f 4 1327 1328 -1318 1329
		mu 0 4 744 745 740 739
		f 4 1330 1331 -1320 1332
		mu 0 4 746 747 742 741
		f 4 1333 -1333 -1324 -1329
		mu 0 4 745 746 741 740
		f 4 -1330 -1316 1334 1335
		mu 0 4 744 739 738 748
		f 4 -1335 -1313 1336 1337
		mu 0 4 748 738 737 749
		f 4 -1337 -1325 -1326 1338
		mu 0 4 749 737 722 464
		f 4 1339 -1339 -826 -833
		mu 0 4 471 749 464 467
		f 4 1340 -1338 -1340 -839
		mu 0 4 473 748 749 471
		f 4 1341 -1336 -1341 -841
		mu 0 4 475 744 748 473
		f 4 1342 -1328 -1342 -851
		mu 0 4 479 745 744 475
		f 4 1343 -1334 -1343 -852
		mu 0 4 480 746 745 479
		f 4 -854 1344 -1331 -1344
		mu 0 4 480 481 747 746
		f 4 1345 -1281 1346 1347
		mu 0 4 750 714 717 684
		f 4 1348 -1348 -1229 -1216
		mu 0 4 675 750 684 676
		f 4 -1349 -1219 1349 1350
		mu 0 4 750 675 441 751
		f 4 -1346 -1351 1351 -1285
		mu 0 4 714 750 751 720
		f 4 -1350 -782 -881 1352
		mu 0 4 751 441 440 489
		f 4 -1352 -1353 1353 -1289
		mu 0 4 720 751 489 723
		f 4 -1354 -882 -880 -1327
		mu 0 4 723 489 488 465
		f 4 1354 1355 1356 1357
		mu 0 4 752 753 754 755
		f 4 1358 -1358 1359 1360
		mu 0 4 756 752 755 757
		f 4 1361 1362 1363 -606
		mu 0 4 322 758 759 320
		f 4 1364 1365 -1361 1366
		mu 0 4 760 761 756 757
		f 4 -521 1367 1368 1369
		mu 0 4 272 271 762 763
		f 4 1370 -1198 -1009 1371
		mu 0 4 764 663 556 561
		f 4 1372 1373 1374 1375
		mu 0 4 765 766 767 768
		f 4 1376 -1369 1377 1378
		mu 0 4 769 763 762 770
		f 4 1379 1380 1381 1382
		mu 0 4 771 772 773 774
		f 4 1383 -1373 1384 1385
		mu 0 4 775 766 765 776
		f 4 -1033 1386 1387 -1372
		mu 0 4 561 521 777 764
		f 4 1388 -1380 1389 1390
		mu 0 4 778 772 771 779
		f 4 1391 -1386 1392 1393
		mu 0 4 780 775 776 781
		f 4 1394 1395 -1391 1396
		mu 0 4 782 783 778 779
		f 4 -1204 1397 -1368 -559
		mu 0 4 268 667 762 271
		f 4 1398 -1378 -1398 -1203
		mu 0 4 666 770 762 667
		f 4 1399 -1202 1400 -1383
		mu 0 4 774 665 663 771
		f 4 -1390 -1401 -1371 1401
		mu 0 4 779 771 663 764
		f 4 -1402 -1388 1402 -1397
		mu 0 4 779 764 777 782
		f 4 -579 -1370 1403 1404
		mu 0 4 306 272 763 784
		f 4 -576 -1405 1405 -554
		mu 0 4 293 306 784 296
		f 4 1406 -1083 1407 1408
		mu 0 4 785 598 601 786
		f 4 1409 -1409 1410 1411
		mu 0 4 787 785 786 788
		f 4 1412 -1091 -1406 1413
		mu 0 4 789 606 296 784
		f 4 1414 -1414 -1404 -1377
		mu 0 4 769 789 784 763
		f 4 1415 1416 1417 1418
		mu 0 4 790 791 792 793
		f 4 1419 1420 1421 1422
		mu 0 4 794 795 796 797
		f 4 1423 1424 1425 -1416
		mu 0 4 790 798 799 791
		f 4 1426 1427 1428 -1420
		mu 0 4 794 800 801 795
		f 4 1429 1430 -1418 1431
		mu 0 4 802 803 793 792
		f 4 1432 1433 -1430 1434
		mu 0 4 804 805 803 802
		f 4 1435 -1422 1436 1437
		mu 0 4 806 797 796 807
		f 4 -1438 1438 1439 1440
		mu 0 4 806 807 808 809
		f 4 1441 -1439 1442 -1434
		mu 0 4 805 808 807 803
		f 4 -1443 -1437 1443 -1431
		mu 0 4 803 807 796 793
		f 4 -1421 1444 -1419 -1444
		mu 0 4 796 795 790 793
		f 4 -1429 1445 -1424 -1445
		mu 0 4 795 801 798 790
		f 4 1446 1447 1448 1449
		mu 0 4 810 811 812 813
		f 4 1450 1451 1452 1453
		mu 0 4 814 815 816 507
		f 4 1454 1455 -1136 1456
		mu 0 4 817 818 632 631
		f 4 1457 1458 -1133 1459
		mu 0 4 819 820 629 628
		f 4 1460 1461 1462 1463
		mu 0 4 821 822 823 824
		f 4 1464 1465 -1458 1466
		mu 0 4 825 826 820 819
		f 4 -1463 1467 -1455 1468
		mu 0 4 824 823 818 817
		f 4 1469 -1461 1470 1471
		mu 0 4 827 822 821 828
		f 4 1472 -1472 1473 -1449
		mu 0 4 812 827 828 813
		f 4 1474 -1465 1475 1476
		mu 0 4 829 826 825 830
		f 4 1477 -1477 1478 -1452
		mu 0 4 815 829 830 816
		f 4 1479 1480 1481 -669
		mu 0 4 368 831 832 369
		f 4 1482 1483 -672 1484
		mu 0 4 833 834 365 371
		f 4 1485 1486 -665 -1484
		mu 0 4 834 835 364 365
		f 4 1487 1488 -664 -1487
		mu 0 4 835 836 361 364
		f 4 1489 1490 -1208 1491
		mu 0 4 837 838 670 669
		f 4 1492 1493 1494 1495
		mu 0 4 839 840 841 842
		f 4 1496 1497 1498 1499
		mu 0 4 839 843 844 845
		f 4 1500 1501 1502 1503
		mu 0 4 846 847 848 849
		f 4 1504 1505 -1504 1506
		mu 0 4 850 851 846 849
		f 4 -1503 1507 1508 1509
		mu 0 4 849 848 852 853
		f 4 1510 -1507 -1510 1511
		mu 0 4 854 850 849 853
		f 4 1512 1513 1514 -1506
		mu 0 4 851 855 842 846
		f 4 -1501 -1515 -1495 1515
		mu 0 4 847 846 842 841
		f 4 1516 -1498 1517 -1481
		mu 0 4 831 844 843 832
		f 4 1518 -1505 1519 -1486
		mu 0 4 834 851 850 835
		f 4 -1520 -1511 1520 -1488
		mu 0 4 835 850 854 836
		f 4 -1519 -1483 1521 -1513
		mu 0 4 851 834 833 855
		f 4 1522 -1013 1523 1524
		mu 0 4 856 562 563 857
		f 4 -1011 1525 -1250 -965
		mu 0 4 536 562 696 538
		f 4 1526 -1251 -1526 -1523
		mu 0 4 856 697 696 562
		f 4 -1259 -1527 1527 -650
		mu 0 4 352 701 858 353
		f 4 -1528 -1525 1528 1529
		mu 0 4 353 858 859 395
		f 4 1530 1531 -1432 1532
		mu 0 4 860 861 802 792
		f 4 -1532 1533 1534 -1435
		mu 0 4 802 861 862 804
		f 4 1535 1536 -1209 1537
		mu 0 4 863 864 671 670
		f 4 1538 -1538 -1491 1539
		mu 0 4 865 863 670 838
		f 4 1540 -1534 1541 -1539
		mu 0 4 865 862 861 863
		f 4 -1542 -1531 1542 -1536
		mu 0 4 863 861 860 864
		f 4 1543 1544 1545 1546
		mu 0 4 866 867 868 869
		f 4 1547 -1544 1548 1549
		mu 0 4 870 867 866 871
		f 4 1550 -1548 1551 1552
		mu 0 4 872 867 870 873
		f 4 1553 1554 -1545 -1551
		mu 0 4 872 874 868 867
		f 4 1555 1556 -633 1557
		mu 0 4 875 876 344 343
		f 4 1558 1559 -1556 1560
		mu 0 4 877 869 876 875
		f 4 1561 -1561 1562 -1023
		mu 0 4 569 877 875 568
		f 4 -1563 -1558 -643 -1021
		mu 0 4 568 875 343 348
		f 4 1563 1564 -647 -1557
		mu 0 4 876 878 351 344
		f 4 -1560 -1546 1565 -1564
		mu 0 4 876 869 868 878
		f 4 -1562 -1030 1566 1567
		mu 0 4 877 569 571 879
		f 4 -1559 -1568 1568 -1547
		mu 0 4 869 877 879 866
		f 4 1569 -1549 -1569 1570
		mu 0 4 686 871 866 879
		f 4 -1232 -1571 -1567 -1247
		mu 0 4 687 686 879 571
		f 4 1571 1572 1573 -1356
		mu 0 4 753 880 881 754
		f 4 1574 1575 1576 1577
		mu 0 4 882 883 884 885
		f 4 1578 -1268 1579 1580
		mu 0 4 886 707 708 887
		f 4 1581 1582 1583 1584
		mu 0 4 888 889 890 891
		f 4 1585 -1585 1586 -1573
		mu 0 4 880 888 891 881
		f 4 1587 1588 -1270 1589
		mu 0 4 892 893 710 324
		f 4 1590 -1590 -608 1591
		mu 0 4 894 892 324 321
		f 4 -1364 1592 -1592 -602
		mu 0 4 320 759 894 321
		f 4 -859 -376 1593 -766
		mu 0 4 430 200 201 431
		f 4 1594 -393 1595 -770
		mu 0 4 433 204 209 384
		f 4 1596 1597 -703 -693
		mu 0 4 381 265 160 382
		f 4 -1595 -772 -1594 -382
		mu 0 4 204 433 431 201
		f 4 -1597 -697 -1596 1598
		mu 0 4 265 381 384 209
		f 4 1599 1600 1601 1602
		mu 0 4 895 896 897 898
		f 4 1603 1604 1605 -1601
		mu 0 4 896 899 900 897
		f 4 1606 -1603 1607 1608
		mu 0 4 901 895 898 902
		f 4 1609 1610 1611 1612
		mu 0 4 903 904 905 906
		f 4 1613 1614 1615 1616
		mu 0 4 907 908 909 910
		f 4 1617 -1617 1618 -1605
		mu 0 4 899 907 910 900
		f 4 1619 1620 1621 -1609
		mu 0 4 902 911 912 901
		f 4 1622 1623 1624 1625
		mu 0 4 913 690 914 915
		f 4 1626 -1299 1627 1628
		mu 0 4 916 731 728 917
		f 4 1629 1630 1631 1632
		mu 0 4 918 919 920 921
		f 4 1633 -1283 1634 1635
		mu 0 4 922 716 719 923
		f 4 1636 1637 1638 1639
		mu 0 4 924 925 926 927
		f 4 -1635 -1302 -1627 1640
		mu 0 4 923 719 731 916
		f 4 1641 -1640 1642 -1631
		mu 0 4 919 924 927 920
		f 4 1643 1644 1645 1646
		mu 0 4 928 929 930 931
		f 4 1647 1648 1649 1650
		mu 0 4 932 933 934 935
		f 4 -1628 -1295 1651 1652
		mu 0 4 917 728 727 936
		f 4 1653 -1633 1654 1655
		mu 0 4 937 918 921 938
		f 4 -1652 -1293 1656 1657
		mu 0 4 936 727 726 939
		f 4 1658 -1656 1659 1660
		mu 0 4 940 937 938 941
		f 4 1661 -1280 -1634 1662
		mu 0 4 942 717 716 922
		f 4 1663 1664 1665 -1638
		mu 0 4 925 943 944 926
		f 4 1666 -1621 1667 1668
		mu 0 4 945 912 911 946
		f 4 1669 -1669 1670 1671
		mu 0 4 947 945 946 948
		f 4 -1347 -1662 1672 -1230
		mu 0 4 684 717 942 685
		f 4 1673 -1665 1674 1675
		mu 0 4 949 944 943 950
		f 4 1676 -1676 1677 1678
		mu 0 4 951 949 950 952
		f 4 1679 1680 -1167 -1489
		mu 0 4 836 953 647 361
		f 4 1681 1682 -1171 1683
		mu 0 4 954 955 649 652
		f 4 1684 -1684 -1173 -1681
		mu 0 4 953 954 652 647
		f 4 1685 1686 -1212 1687
		mu 0 4 956 957 674 673
		f 4 1688 1689 -1686 1690
		mu 0 4 958 959 957 956
		f 4 1691 1692 -1512 1693
		mu 0 4 960 961 854 853
		f 4 1694 -1694 -1509 1695
		mu 0 4 962 960 853 852
		f 4 1696 1697 1698 1699
		mu 0 4 963 964 965 966
		f 4 1700 -1699 1701 1702
		mu 0 4 967 966 965 968
		f 4 1703 -1692 1704 -1698
		mu 0 4 964 961 960 965
		f 4 -1702 -1705 -1695 1705
		mu 0 4 968 965 960 962
		f 4 1706 -1685 1707 -1704
		mu 0 4 964 954 953 961
		f 4 1708 -1682 -1707 -1697
		mu 0 4 963 955 954 964
		f 4 -1708 -1680 -1521 -1693
		mu 0 4 961 953 836 854
		f 4 1709 1710 1711 1712
		mu 0 4 969 970 971 500
		f 4 1713 1714 1715 1716
		mu 0 4 972 973 974 975
		f 4 1717 1718 -1714 1719
		mu 0 4 976 977 973 972
		f 4 1720 1721 -1710 1722
		mu 0 4 978 979 970 969
		f 4 -1721 1723 1724 1725
		mu 0 4 979 978 980 981
		f 4 1726 -1718 1727 1728
		mu 0 4 982 977 976 983
		f 4 1729 -1729 1730 1731
		mu 0 4 984 982 983 985
		f 4 1732 -1732 1733 -619
		mu 0 4 333 984 985 334
		f 4 -1725 1734 1735 1736
		mu 0 4 981 980 986 987
		f 4 1737 1738 -1736 1739
		mu 0 4 988 346 987 986
		f 4 1740 -1365 1741 1742
		mu 0 4 989 761 760 990
		f 4 1743 -1743 1744 1745
		mu 0 4 991 989 990 992
		f 4 1746 1747 1748 -1428
		mu 0 4 800 993 994 801
		f 4 1749 -1182 1750 1751
		mu 0 4 995 641 657 996
		f 4 1752 -1164 1753 1754
		mu 0 4 997 551 646 998
		f 4 1755 1756 -1174 1757
		mu 0 4 999 1000 653 642
		f 4 1758 1759 1760 -1747
		mu 0 4 800 1001 1002 993
		f 4 1761 1762 1763 -1425
		mu 0 4 798 1003 1004 799
		f 4 1764 -1758 -1156 -1750
		mu 0 4 995 999 642 641
		f 4 1765 -1168 1766 1767
		mu 0 4 1005 650 649 1006
		f 4 -1763 1768 -1768 1769
		mu 0 4 1004 1003 1005 1006
		f 4 -1748 1770 -1752 1771
		mu 0 4 994 993 995 996
		f 4 -1761 1772 -1765 -1771
		mu 0 4 993 1002 999 995
		f 4 -1446 -1749 1773 -1762
		mu 0 4 798 801 994 1003
		f 4 -1769 -1774 -1772 1774
		mu 0 4 1005 1003 994 996
		f 4 -1751 -1185 -1766 -1775
		mu 0 4 996 657 650 1005
		f 4 -1756 -1773 1775 1776
		mu 0 4 1000 999 1002 1007
		f 4 1777 -1776 -1760 1778
		mu 0 4 1008 1007 1002 1001
		f 4 1779 -993 -1753 1780
		mu 0 4 1009 552 551 997
		f 4 -996 -1780 1781 1782
		mu 0 4 553 552 1009 1010
		f 4 1783 1784 1785 1786
		mu 0 4 1011 1012 1013 1014
		f 4 1787 -1755 1788 -1785
		mu 0 4 1012 997 998 1013
		f 4 1789 1790 -1784 1791
		mu 0 4 1015 1016 1012 1011
		f 4 1792 -1781 -1788 -1791
		mu 0 4 1016 1009 997 1012
		f 4 1793 1794 -1790 1795
		mu 0 4 1017 1018 1016 1015
		f 4 1796 -1782 -1793 -1795
		mu 0 4 1018 1010 1009 1016
		f 4 1797 1798 -1797 1799
		mu 0 4 1019 1020 1010 1018
		f 4 1800 -1800 -1794 1801
		mu 0 4 1021 1019 1018 1017
		f 4 -997 -1783 -1799 1802
		mu 0 4 535 553 1010 1020
		f 4 1803 -1798 1804 -1524
		mu 0 4 563 1020 1019 857
		f 4 -1012 -961 -1803 -1804
		mu 0 4 563 534 535 1020
		f 4 1805 -1805 -1801 1806
		mu 0 4 1022 857 1019 1021
		f 4 -718 -1529 -1806 -711
		mu 0 4 389 395 859 390
		f 4 1807 -1713 -910 1808
		mu 0 4 1023 969 500 499
		f 4 1809 1810 -933 -950
		mu 0 4 528 1024 518 517
		f 4 1811 1812 -1810 -954
		mu 0 4 531 1025 1024 528
		f 4 1813 -1723 -1808 1814
		mu 0 4 1026 978 969 1023
		f 4 -971 1815 1816 -1812
		mu 0 4 531 541 1027 1025
		f 4 1817 1818 -1724 -1814
		mu 0 4 1026 1028 980 978
		f 4 1819 -1809 -940 -1811
		mu 0 4 1024 1023 499 518
		f 4 1820 -1815 -1820 -1813
		mu 0 4 1025 1026 1023 1024
		f 4 -1818 -1821 -1817 1821
		mu 0 4 1028 1026 1025 1027
		f 4 1822 -638 -1738 1823
		mu 0 4 1029 347 346 988
		f 4 -1016 -641 -1823 1824
		mu 0 4 566 349 347 1029
		f 4 -1825 1825 -1816 -1026
		mu 0 4 566 1029 1027 541
		f 4 1826 -1822 -1826 -1824
		mu 0 4 988 1028 1027 1029
		f 4 -1740 -1735 -1819 -1827
		mu 0 4 988 986 980 1028
		f 4 -1712 1827 1828 -911
		mu 0 4 500 971 1030 501
		f 4 -1716 1829 1830 1831
		mu 0 4 975 974 1031 1032
		f 4 -1831 1832 1833 1834
		mu 0 4 1032 1031 1033 1034
		f 4 -915 -1829 1835 1836
		mu 0 4 504 501 1030 1035
		f 4 1837 1838 -1454 -918
		mu 0 4 506 1036 814 507
		f 4 1839 1840 -1447 1841
		mu 0 4 1037 1038 811 810
		f 4 -1834 1842 -1840 1843
		mu 0 4 1034 1033 1038 1037
		f 4 -1837 1844 -1838 -925
		mu 0 4 504 1035 1036 506
		f 4 1845 1846 1847 1848
		mu 0 4 1039 1040 1041 1042
		f 4 -1846 1849 1850 1851
		mu 0 4 1040 1039 1043 1044
		f 4 1852 1853 1854 1855
		mu 0 4 1045 1046 1047 1048
		f 4 1856 -1848 1857 -1853
		mu 0 4 1045 1042 1041 1046
		f 4 1858 -1852 1859 1860
		mu 0 4 1049 1040 1044 1050
		f 4 -1847 -1859 1861 1862
		mu 0 4 1041 1040 1049 1051
		f 4 1863 1864 1865 -1854
		mu 0 4 1046 1052 1053 1047
		f 4 -1864 -1858 -1863 1866
		mu 0 4 1052 1046 1041 1051
		f 4 1867 -732 1868 1869
		mu 0 4 1054 404 407 1055
		f 4 1870 -1870 1871 1872
		mu 0 4 1056 1054 1055 1057
		f 4 -905 1873 1874 -812
		mu 0 4 459 394 1058 458
		f 4 1875 -748 -1868 1876
		mu 0 4 1059 402 404 1054
		f 4 1877 -1877 -1871 1878
		mu 0 4 1060 1059 1054 1056
		f 4 1879 -726 -1876 1880
		mu 0 4 1061 401 402 1059
		f 4 1881 -1881 -1878 1882
		mu 0 4 1062 1061 1059 1060
		f 4 1883 -725 -1880 1884
		mu 0 4 1063 400 401 1061
		f 4 1885 -1885 -1882 1886
		mu 0 4 1064 1063 1061 1062
		f 4 1887 1888 1889 1890
		mu 0 4 1065 1066 1067 1068
		f 4 1891 -1891 1892 -758
		mu 0 4 420 1065 1068 423
		f 4 -1892 -754 1893 1894
		mu 0 4 1065 420 413 1069
		f 4 -1888 -1895 1895 1896
		mu 0 4 1066 1065 1069 1070
		f 4 -1894 -741 -1884 1897
		mu 0 4 1069 413 400 1063
		f 4 -1896 -1898 -1886 1898
		mu 0 4 1070 1069 1063 1064
		f 4 -1869 -861 1899 1900
		mu 0 4 1055 407 482 1071
		f 4 -1872 -1901 1901 1902
		mu 0 4 1057 1055 1071 1072
		f 4 -1900 -864 -1875 1903
		mu 0 4 1071 482 458 1058
		f 4 -1902 -1904 1904 1905
		mu 0 4 1072 1071 1058 1073
		f 4 1906 1907 1908 1909
		mu 0 4 1074 379 1075 1076
		f 4 -1909 1910 1911 1912
		mu 0 4 1076 1075 1077 1078
		f 4 -715 -691 -1907 1913
		mu 0 4 394 380 379 1074
		f 4 -1914 1914 -1905 -1874
		mu 0 4 394 1074 1073 1058
		f 4 -1910 1915 1916 -1915
		mu 0 4 1074 1076 1079 1073
		f 4 1917 1918 -1916 -1913
		mu 0 4 1078 1080 1079 1076
		f 4 1919 -1912 1920 1921
		mu 0 4 1081 1078 1077 1082
		f 4 1922 1923 -1918 -1920
		mu 0 4 1081 1083 1080 1078
		f 4 1924 -1922 1925 1926
		mu 0 4 1084 1081 1082 1085
		f 4 -1925 1927 1928 -1923
		mu 0 4 1081 1084 1086 1083
		f 4 -1866 1929 -1928 1930
		mu 0 4 1087 1088 1086 1084
		f 4 -1931 -1927 1931 -1855
		mu 0 4 1087 1084 1085 1089
		f 4 -704 1932 1933 1934
		mu 0 4 382 385 1090 1077
		f 4 -694 -1935 -1911 -1908
		mu 0 4 379 382 1077 1075
		f 4 1935 -1441 1936 1937
		mu 0 4 1091 806 809 1092
		f 4 -1436 -1936 1938 1939
		mu 0 4 797 806 1091 1093
		f 4 1940 1941 1942 1943
		mu 0 4 1094 1095 1096 1097
		f 4 1944 1945 1946 1947
		mu 0 4 1098 1099 1100 1101
		f 4 1948 1949 1950 -1946
		mu 0 4 1099 1102 1103 1100
		f 4 1951 -1938 1952 1953
		mu 0 4 1104 1091 1092 1105
		f 4 1954 -1939 -1952 1955
		mu 0 4 1106 1093 1091 1104
		f 4 1956 1957 -1941 1958
		mu 0 4 1107 1108 1095 1094
		f 4 -1949 1959 -1958 1960
		mu 0 4 1102 1099 1095 1108
		f 4 -1960 -1945 1961 -1942
		mu 0 4 1095 1099 1098 1096
		f 4 -1423 -1940 1962 1963
		mu 0 4 794 797 1093 1109
		f 4 -1427 -1964 1964 -1759
		mu 0 4 800 794 1109 1001
		f 4 1965 -1779 -1965 1966
		mu 0 4 1110 1008 1001 1109
		f 4 1967 -1957 1968 1969
		mu 0 4 1111 1108 1107 1112
		f 4 -1967 -1963 -1955 1970
		mu 0 4 1110 1109 1093 1106
		f 4 1971 1972 -1961 -1968
		mu 0 4 1111 1113 1102 1108
		f 4 -1973 1973 1974 -1950
		mu 0 4 1102 1113 1114 1103
		f 4 1975 -1787 1976 -1974
		mu 0 4 1113 1011 1014 1114
		f 4 1977 -1767 -1683 1978
		mu 0 4 1115 1006 649 955
		f 4 1979 1980 -1533 -1417
		mu 0 4 791 1116 860 792
		f 4 -1980 -1426 1981 1982
		mu 0 4 1116 791 799 1117
		f 4 1983 -1982 -1764 1984
		mu 0 4 1118 1117 799 1004
		f 4 -1985 -1770 -1978 1985
		mu 0 4 1118 1004 1006 1115
		f 4 1986 1987 -1688 1988
		mu 0 4 1119 1120 956 673
		f 4 1989 1990 -1691 -1988
		mu 0 4 1120 1121 958 956
		f 4 1991 1992 -1700 1993
		mu 0 4 1122 1123 963 966
		f 4 1994 -1994 -1701 1995
		mu 0 4 1124 1122 966 967
		f 4 1996 -1989 -1214 -1537
		mu 0 4 864 1119 673 671
		f 4 1997 -1992 1998 -1991
		mu 0 4 1121 1123 1122 958
		f 4 -1689 -1999 -1995 1999
		mu 0 4 959 958 1122 1124
		f 4 2000 -1979 -1709 -1993
		mu 0 4 1123 1115 955 963
		f 4 2001 -1997 -1543 -1981
		mu 0 4 1116 1119 864 860
		f 4 -2002 -1983 2002 -1987
		mu 0 4 1119 1116 1117 1120
		f 4 2003 -1990 -2003 -1984
		mu 0 4 1118 1121 1120 1117
		f 4 -2004 -1986 -2001 -1998
		mu 0 4 1121 1118 1115 1123
		f 4 -1036 2004 2005 -591
		mu 0 4 312 574 1125 313
		f 4 -598 -2006 2006 2007
		mu 0 4 318 313 1125 1126
		f 4 -605 -2008 2008 2009
		mu 0 4 322 318 1126 1127
		f 4 2010 2011 -1362 -2010
		mu 0 4 1127 1128 758 322
		f 4 2012 2013 -2005 -1052
		mu 0 4 586 1129 1125 574
		f 4 2014 2015 -2007 -2014
		mu 0 4 1129 1130 1126 1125
		f 4 2016 2017 -2009 -2016
		mu 0 4 1130 1131 1127 1126
		f 4 2018 2019 -2011 -2018
		mu 0 4 1131 1132 1128 1127
		f 4 2020 -1553 2021 -2019
		mu 0 4 1131 872 873 1132
		f 4 2022 -1554 -2021 -2017
		mu 0 4 1130 874 872 1131
		f 4 2023 -1566 -1555 2024
		mu 0 4 1133 878 868 874
		f 4 2025 -2025 -2023 -2015
		mu 0 4 1129 1133 874 1130
		f 4 -1064 -1565 -2024 2026
		mu 0 4 593 351 878 1133
		f 4 -1067 -2027 -2026 -2013
		mu 0 4 586 593 1133 1129
		f 4 2027 2028 2029 -1850
		mu 0 4 1134 1135 1136 1137
		f 4 2030 2031 -2028 -1849
		mu 0 4 1138 1139 1135 1134
		f 4 2032 -1959 2033 -2032
		mu 0 4 1139 1107 1094 1135
		f 4 -2034 -1944 2034 -2029
		mu 0 4 1135 1094 1097 1136
		f 4 2035 2036 -2031 -1857
		mu 0 4 1140 1141 1139 1138
		f 4 2037 -1969 -2033 -2037
		mu 0 4 1141 1112 1107 1139
		f 4 -1856 2038 2039 -2036
		mu 0 4 1140 1142 1143 1141
		f 4 2040 2041 2042 2043
		mu 0 4 610 1144 1145 543
		f 4 2044 2045 -1387 -942
		mu 0 4 520 1146 777 521
		f 4 -1106 -1260 2046 -2041
		mu 0 4 610 613 702 1144
		f 4 -974 -2043 2047 -2045
		mu 0 4 520 543 1145 1146
		f 4 2048 2049 2050 2051
		mu 0 4 1147 1148 1149 1150
		f 4 2052 2053 2054 2055
		mu 0 4 1151 1152 1153 1154
		f 4 2056 -2056 2057 2058
		mu 0 4 1155 1151 1154 1156
		f 4 2059 -2050 2060 -1395
		mu 0 4 782 1149 1148 783
		f 4 2061 -1394 2062 -2054
		mu 0 4 1152 780 781 1153
		f 4 -2060 -1403 -2046 2063
		mu 0 4 1149 782 777 1146
		f 4 -2064 -2048 2064 -2051
		mu 0 4 1149 1146 1145 1150
		f 4 2065 2066 2067 -2052
		mu 0 4 1150 1157 1158 1147
		f 4 -2066 -2065 -2042 2068
		mu 0 4 1157 1150 1145 1144
		f 4 2069 2070 2071 -1263
		mu 0 4 704 1159 1160 705
		f 4 2072 -2059 2073 -2071
		mu 0 4 1159 1155 1156 1160
		f 4 2074 2075 -2067 2076
		mu 0 4 713 1161 1158 1157
		f 4 -1277 -1274 2077 -2075
		mu 0 4 713 711 712 1161
		f 4 -2069 -2047 -1276 -2077
		mu 0 4 1157 1144 702 713
		f 4 -919 -1453 2078 2079
		mu 0 4 508 507 816 1162
		f 4 -2044 -973 -1150 -1103
		mu 0 4 610 543 542 611
		f 4 2080 -1460 -1130 2081
		mu 0 4 1163 819 628 627
		f 4 2082 -1467 -2081 2083
		mu 0 4 1164 825 819 1163
		f 4 -1000 -923 2084 -1006
		mu 0 4 554 512 511 557
		f 4 -1476 -2083 2085 2086
		mu 0 4 830 825 1164 1165
		f 4 -1479 -2087 2087 -2079
		mu 0 4 816 830 1165 1162
		f 4 -1003 2088 -2088 2089
		mu 0 4 558 557 1162 1165
		f 4 -2085 -937 -2080 -2089
		mu 0 4 557 511 508 1162
		f 4 -2082 -1151 -972 2090
		mu 0 4 1163 627 542 519
		f 4 -944 2091 -2084 -2091
		mu 0 4 519 522 1164 1163
		f 4 -2090 -2086 -2092 -1032
		mu 0 4 558 1165 1164 522
		f 4 -1934 2092 2093 -1921
		mu 0 4 1166 1167 1168 1169
		f 4 -1926 -2094 2094 2095
		mu 0 4 1170 1169 1168 1171
		f 4 2096 2097 2098 -2093
		mu 0 4 1167 1172 1173 1168
		f 4 -2096 2099 -2039 -1932
		mu 0 4 1170 1171 1143 1142
		f 4 2100 2101 2102 -2100
		mu 0 4 1171 1174 1175 1143
		f 4 -2099 2103 -2101 -2095
		mu 0 4 1168 1173 1174 1171
		f 4 -2040 -2103 2104 -2038
		mu 0 4 1141 1143 1175 1112
		f 4 2105 -1970 -2105 2106
		mu 0 4 1176 1111 1112 1175
		f 4 2107 -1972 -2106 2108
		mu 0 4 1177 1113 1111 1176
		f 4 -2098 2109 2110 2111
		mu 0 4 1173 1172 1178 1179
		f 4 2112 -2104 -2112 2113
		mu 0 4 1180 1174 1173 1179
		f 4 2114 -2109 2115 2116
		mu 0 4 1181 1177 1176 1180
		f 4 -2107 -2102 -2113 -2116
		mu 0 4 1176 1175 1174 1180
		f 4 2117 2118 -2117 -2114
		mu 0 4 1179 1182 1181 1180
		f 4 2119 -1792 -1976 -2108
		mu 0 4 1177 1015 1011 1113
		f 4 -2120 -2115 2120 -1796
		mu 0 4 1015 1177 1181 1017
		f 4 -1802 -2121 -2119 2121
		mu 0 4 1021 1017 1181 1182
		f 4 -1807 -2122 2122 -709
		mu 0 4 1022 1021 1182 1183
		f 4 -2118 -2111 -712 -2123
		mu 0 4 1182 1179 1178 1183
		f 4 -702 -713 -2110 2123
		mu 0 4 386 387 392 1184
		f 4 -2124 -2097 -1933 -700
		mu 0 4 386 1184 1090 385
		f 4 -487 2124 -761 2125
		mu 0 4 256 255 426 425
		f 4 -500 -858 -781 -2125
		mu 0 4 255 260 439 426
		f 4 -508 2126 -1256 2127
		mu 0 4 238 264 680 699
		f 4 -504 -2126 -1225 2128
		mu 0 4 262 256 425 681
		f 4 -509 -2129 -1222 -2127
		mu 0 4 264 262 681 680
		f 4 -1258 -652 -444 -2128
		mu 0 4 699 354 73 238
		f 4 2129 2130 2131 2132
		mu 0 4 1185 1186 1187 1188
		f 4 2133 -2133 2134 2135
		mu 0 4 1189 1185 1188 1190
		f 4 2136 -2136 2137 2138
		mu 0 4 1191 1189 1190 1192
		f 4 2139 2140 2141 2142
		mu 0 4 1193 1194 1195 1196
		f 4 2143 2144 2145 2146
		mu 0 4 1197 1198 1199 1200
		f 4 2147 -2147 2148 2149
		mu 0 4 1201 1197 1200 1202
		f 4 2150 2151 2152 -2131
		mu 0 4 1186 1203 1204 1187
		f 4 2153 -2150 2154 -2152
		mu 0 4 1203 1201 1202 1204
		f 4 2155 -2143 2156 2157
		mu 0 4 1205 1193 1196 1206
		f 4 2158 -2158 2159 -2145
		mu 0 4 1198 1205 1206 1199
		f 4 -2132 2160 -531 2161
		mu 0 4 1188 1187 277 280
		f 4 -2135 -2162 -539 2162
		mu 0 4 1190 1188 280 284
		f 4 -2138 -2163 -535 2163
		mu 0 4 1192 1190 284 283
		f 4 2164 -2164 -563 2165
		mu 0 4 1195 1192 283 288
		f 4 -2142 -2166 -542 2166
		mu 0 4 1196 1195 288 287
		f 4 -2157 -2167 -584 2167
		mu 0 4 1206 1196 287 309
		f 4 -2160 -2168 -587 2168
		mu 0 4 1199 1206 309 300
		f 4 -2146 -2169 -564 2169
		mu 0 4 1200 1199 300 299
		f 4 -2149 -2170 -568 2170
		mu 0 4 1202 1200 299 302
		f 4 -2155 -2171 -575 2171
		mu 0 4 1204 1202 302 305
		f 4 -2153 -2172 -572 -2161
		mu 0 4 1187 1204 305 277
		f 4 -2165 -2141 2172 -2139
		mu 0 4 1192 1195 1194 1191
		f 4 -139 -651 -1530 -717
		mu 0 4 47 52 353 395
		f 3 -391 -1598 -511
		mu 0 3 194 160 265
		f 3 -512 -1599 -392
		mu 0 3 203 265 209
		f 4 -141 -21 2173 -74
		mu 0 4 53 19 18 50
		f 4 -24 -249 -71 -2174
		mu 0 4 18 21 51 50
		f 4 -1135 2174 2175 -1129
		mu 0 4 626 630 1207 624
		f 4 -2176 2176 -1143 -1125
		mu 0 4 624 1207 637 621
		f 4 -1148 -1123 2177 -1126
		mu 0 4 620 622 612 623
		f 4 -1127 -2178 -1104 -1149
		mu 0 4 625 623 612 611
		f 4 -628 2178 -624 2179
		mu 0 4 340 332 335 337
		f 4 -1075 -2180 -1073 2180
		mu 0 4 590 340 337 587;
	setAttr ".fc[1000:1499]"
		f 4 -2181 -1056 2181 -1059
		mu 0 4 590 587 576 581
		f 4 -1044 -2182 -1038 2182
		mu 0 4 582 581 576 575
		f 4 -1111 -2183 -1113 2183
		mu 0 4 617 582 575 618
		f 4 -1144 2184 -1146 -2184
		mu 0 4 618 637 636 617
		f 4 -2177 2185 -1142 -2185
		mu 0 4 637 1207 634 636
		f 4 -2175 2186 -1139 -2186
		mu 0 4 1207 630 631 634
		f 4 -1134 2187 -1457 -2187
		mu 0 4 630 629 817 631
		f 4 -1459 2188 -1469 -2188
		mu 0 4 629 820 824 817
		f 4 -1466 2189 -1464 -2189
		mu 0 4 820 826 821 824
		f 4 -1471 -2190 -1475 2190
		mu 0 4 828 821 826 829
		f 4 -1474 -2191 -1478 2191
		mu 0 4 813 828 829 815
		f 4 -1451 2192 -1450 -2192
		mu 0 4 815 814 810 813
		f 4 -1839 2193 -1842 -2193
		mu 0 4 814 1036 1037 810
		f 4 -1845 2194 -1844 -2194
		mu 0 4 1036 1035 1034 1037
		f 4 -1836 2195 -1835 -2195
		mu 0 4 1035 1030 1032 1034
		f 4 -1828 2196 -1832 -2196
		mu 0 4 1030 971 975 1032
		f 4 -1711 2197 -1717 -2197
		mu 0 4 971 970 972 975
		f 4 -1722 2198 -1720 -2198
		mu 0 4 970 979 976 972
		f 4 -2199 -1726 2199 -1728
		mu 0 4 976 979 981 983
		f 4 -1731 -2200 -1737 2200
		mu 0 4 985 983 981 987
		f 4 -1734 -2201 -1739 2201
		mu 0 4 334 985 987 346
		f 4 -637 2202 -620 -2202
		mu 0 4 346 336 331 334
		f 4 -616 -2203 -621 -2179
		mu 0 4 332 331 336 335
		f 4 2203 2204 -2130 2205
		mu 0 4 1208 1209 1186 1185
		f 4 2206 -2206 -2134 2207
		mu 0 4 1210 1208 1185 1189
		f 4 2208 -2208 -2137 2209
		mu 0 4 1211 1210 1189 1191
		f 4 2210 2211 -2140 2212
		mu 0 4 1212 1213 1194 1193
		f 4 2213 2214 -2144 2215
		mu 0 4 1214 1215 1198 1197
		f 4 2216 -2216 -2148 2217
		mu 0 4 1216 1214 1197 1201
		f 4 2218 2219 -2151 -2205
		mu 0 4 1209 1217 1203 1186
		f 4 2220 -2218 -2154 -2220
		mu 0 4 1217 1216 1201 1203
		f 4 2221 -2213 -2156 2222
		mu 0 4 1218 1212 1193 1205
		f 4 2223 -2223 -2159 -2215
		mu 0 4 1215 1218 1205 1198
		f 4 2224 -2210 -2173 -2212
		mu 0 4 1213 1211 1191 1194
		f 4 -2224 -2214 2225 2226
		mu 0 4 1218 1215 1214 1219
		f 4 -2211 2227 2228 -2225
		mu 0 4 1213 1212 1220 1211
		f 4 -2222 -2227 2229 -2228
		mu 0 4 1212 1218 1219 1220
		f 4 -2217 -2221 2230 -2226
		mu 0 4 1214 1216 1217 1219
		f 4 -2231 -2219 2231 -2230
		mu 0 4 1219 1217 1209 1220
		f 4 -2232 -2204 -2207 2232
		mu 0 4 1220 1209 1208 1210
		f 3 -2233 -2209 -2229
		mu 0 3 1220 1210 1211
		f 4 2233 2234 -618 2235
		mu 0 4 1221 1222 333 330
		f 4 2236 -2236 -614 2237
		mu 0 4 1223 1221 330 329
		f 4 2238 -2238 -627 2239
		mu 0 4 1224 1223 329 339
		f 4 2240 2241 -1042 2242
		mu 0 4 1225 1226 580 579
		f 4 2243 2244 -1057 -2242
		mu 0 4 1226 1227 589 580
		f 4 2245 -2240 -1074 -2245
		mu 0 4 1227 1224 339 589
		f 4 2246 -2243 -1110 2247
		mu 0 4 1228 1225 579 616
		f 4 2248 2249 -1137 2250
		mu 0 4 1229 1230 633 632
		f 4 2251 2252 -1140 -2250
		mu 0 4 1230 1231 635 633
		f 4 2253 -2248 -1145 -2253
		mu 0 4 1231 1228 616 635
		f 4 2254 2255 -1448 2256
		mu 0 4 1232 1233 812 811
		f 4 2257 -2251 -1456 2258
		mu 0 4 1234 1229 632 818
		f 4 2259 2260 -1462 2261
		mu 0 4 1235 1236 823 822
		f 4 2262 -2259 -1468 -2261
		mu 0 4 1236 1234 818 823
		f 4 2263 -2262 -1470 2264
		mu 0 4 1237 1235 822 827
		f 4 2265 -2265 -1473 -2256
		mu 0 4 1233 1237 827 812
		f 4 2266 2267 -1715 2268
		mu 0 4 1238 1239 974 973
		f 4 2269 -2269 -1719 2270
		mu 0 4 1240 1238 973 977
		f 4 2271 -2271 -1727 2272
		mu 0 4 1241 1240 977 982
		f 4 2273 2274 -1733 -2235
		mu 0 4 1222 1242 984 333
		f 4 2275 -2273 -1730 -2275
		mu 0 4 1242 1241 982 984
		f 4 2276 2277 -1830 -2268
		mu 0 4 1239 1243 1031 974
		f 4 2278 2279 -1833 -2278
		mu 0 4 1243 1244 1033 1031
		f 4 2280 -2257 -1841 2281
		mu 0 4 1245 1232 811 1038
		f 4 2282 -2282 -1843 -2280
		mu 0 4 1244 1245 1038 1033
		f 4 2283 2284 -2234 2285
		mu 0 4 1246 1247 1222 1221
		f 4 2286 -2286 -2237 2287
		mu 0 4 1248 1246 1221 1223
		f 4 2288 -2288 -2239 2289
		mu 0 4 1249 1248 1223 1224
		f 4 2290 2291 -2241 2292
		mu 0 4 1250 1251 1226 1225
		f 4 2293 2294 -2244 -2292
		mu 0 4 1251 1252 1227 1226
		f 4 2295 -2290 -2246 -2295
		mu 0 4 1252 1249 1224 1227
		f 4 2296 -2293 -2247 2297
		mu 0 4 1253 1250 1225 1228
		f 4 2298 2299 -2249 2300
		mu 0 4 1254 1255 1230 1229
		f 4 2301 2302 -2252 -2300
		mu 0 4 1255 1256 1231 1230
		f 4 2303 -2298 -2254 -2303
		mu 0 4 1256 1253 1228 1231
		f 4 2304 2305 -2255 2306
		mu 0 4 1257 1258 1233 1232
		f 4 2307 -2301 -2258 2308
		mu 0 4 1259 1254 1229 1234
		f 4 2309 2310 -2260 2311
		mu 0 4 1260 1261 1236 1235
		f 4 2312 -2309 -2263 -2311
		mu 0 4 1261 1259 1234 1236
		f 4 2313 -2312 -2264 2314
		mu 0 4 1262 1260 1235 1237
		f 4 2315 -2315 -2266 -2306
		mu 0 4 1258 1262 1237 1233
		f 4 2316 2317 -2267 2318
		mu 0 4 1263 1264 1239 1238
		f 4 2319 -2319 -2270 2320
		mu 0 4 1265 1263 1238 1240
		f 4 2321 -2321 -2272 2322
		mu 0 4 1266 1265 1240 1241
		f 4 2323 2324 -2274 -2285
		mu 0 4 1247 1267 1242 1222
		f 4 2325 -2323 -2276 -2325
		mu 0 4 1267 1266 1241 1242
		f 4 2326 2327 -2277 -2318
		mu 0 4 1264 1268 1243 1239
		f 4 2328 2329 -2279 -2328
		mu 0 4 1268 1269 1244 1243
		f 4 2330 -2307 -2281 2331
		mu 0 4 1270 1257 1232 1245
		f 4 2332 -2332 -2283 -2330
		mu 0 4 1269 1270 1245 1244
		f 4 -1754 2333 -1757 2334
		mu 0 4 998 646 653 1000
		f 4 -1789 -2335 -1777 2335
		mu 0 4 1013 998 1000 1007
		f 4 -2336 -1778 2336 -1786
		mu 0 4 1013 1007 1008 1014
		f 4 -1977 -2337 -1966 2337
		mu 0 4 1114 1014 1008 1110
		f 4 -1975 -2338 -1971 2338
		mu 0 4 1103 1114 1110 1106
		f 4 -1951 -2339 -1956 2339
		mu 0 4 1100 1103 1106 1104
		f 4 -2340 -1954 2340 -1947
		mu 0 4 1100 1104 1105 1101
		f 4 2341 -1412 2342 -1375
		mu 0 4 767 787 788 768
		f 4 2343 -1379 2344 -1382
		mu 0 4 773 769 770 774
		f 4 -1399 2345 -1400 -2345
		mu 0 4 770 666 665 774
		f 4 -1206 2346 -1201 -2346
		mu 0 4 666 668 664 665
		f 4 -2347 -1207 2347 -1200
		mu 0 4 664 668 661 660
		f 4 -2348 -1194 2348 -1191
		mu 0 4 660 661 655 659
		f 4 -1189 -2349 -1177 2349
		mu 0 4 645 659 655 654
		f 4 -2350 -1175 -2334 -1163
		mu 0 4 645 654 653 646
		f 4 2350 2351 -1490 2352
		mu 0 4 1271 1272 838 837
		f 4 2353 2354 -1540 -2352
		mu 0 4 1272 1273 865 838
		f 4 2355 2356 -1541 -2355
		mu 0 4 1273 1274 862 865
		f 4 -2357 2357 2358 -1535
		mu 0 4 862 1274 1275 804
		f 4 2359 2360 -1433 -2359
		mu 0 4 1275 1276 805 804
		f 4 2361 2362 -1442 -2361
		mu 0 4 1276 1277 808 805
		f 4 -1440 -2363 2363 2364
		mu 0 4 809 808 1277 1278
		f 4 -2365 2365 2366 -1937
		mu 0 4 809 1278 1279 1092
		f 4 -1953 -2367 2367 2368
		mu 0 4 1105 1092 1279 1280
		f 4 -2341 -2369 2369 2370
		mu 0 4 1101 1105 1280 1281
		f 4 2371 2372 -1948 -2371
		mu 0 4 1281 1282 1098 1101
		f 4 -2373 2373 2374 -1962
		mu 0 4 1098 1282 1283 1096
		f 4 -2375 2375 2376 -1943
		mu 0 4 1096 1283 1284 1097
		f 4 -2035 -2377 2377 2378
		mu 0 4 1136 1097 1284 1285
		f 4 -2030 -2379 2379 2380
		mu 0 4 1137 1136 1285 1286
		f 4 -2381 2381 2382 -1851
		mu 0 4 1043 1287 1288 1044
		f 4 -2383 2383 2384 -1860
		mu 0 4 1044 1288 1289 1050
		f 4 2385 2386 2387 2388
		mu 0 4 1290 1291 1292 692
		f 4 2389 2390 -1625 2391
		mu 0 4 948 991 915 914
		f 4 2392 -1550 2393 2394
		mu 0 4 1293 870 871 1294
		f 4 -1570 -1235 -1623 -2394
		mu 0 4 871 686 689 1294
		f 4 2395 -1575 2396 -1612
		mu 0 4 905 883 882 906
		f 4 -1616 2397 -1582 2398
		mu 0 4 910 909 889 888
		f 4 -1619 -2399 -1586 2399
		mu 0 4 900 910 888 880
		f 4 -1606 -2400 -1572 2400
		mu 0 4 897 900 880 753
		f 4 -1602 -2401 -1355 2401
		mu 0 4 898 897 753 752
		f 4 -1608 -2402 -1359 2402
		mu 0 4 902 898 752 756
		f 4 -1366 2403 -1620 -2403
		mu 0 4 756 761 911 902
		f 4 -1668 -2404 -1741 2404
		mu 0 4 946 911 761 989
		f 4 -1671 -2405 -1744 -2390
		mu 0 4 948 946 989 991
		f 4 2405 -1581 2406 -1577
		mu 0 4 1295 886 887 1296
		f 4 -1584 2407 -1588 2408
		mu 0 4 1297 1298 893 892
		f 4 -1587 -2409 -1591 2409
		mu 0 4 1299 1297 892 894
		f 4 -1574 -2410 -1593 2410
		mu 0 4 1300 1299 894 759
		f 4 -1357 -2411 -1363 2411
		mu 0 4 1301 1300 759 758
		f 4 -1360 -2412 -2012 2412
		mu 0 4 1302 1301 758 1128
		f 4 -2020 2413 -1367 -2413
		mu 0 4 1128 1132 1303 1302
		f 4 -1742 -2414 -2022 2414
		mu 0 4 1304 1303 1132 873
		f 4 -1745 -2415 -1552 -2393
		mu 0 4 1293 1304 873 870
		f 4 -2391 -1746 -2395 -1626
		mu 0 4 915 991 992 913
		f 4 -2389 -1243 -1245 2415
		mu 0 4 1290 692 694 683
		f 4 -1227 2416 2417 -2416
		mu 0 4 683 682 951 1290
		f 4 2418 2419 2420 -2387
		mu 0 4 1291 952 947 1292
		f 4 -1624 -1238 -2388 2421
		mu 0 4 914 690 692 1292
		f 4 -1231 2422 -1677 -2417
		mu 0 4 682 685 949 951
		f 4 -1673 2423 -1674 -2423
		mu 0 4 685 942 944 949
		f 4 -2424 -1663 2424 -1666
		mu 0 4 944 942 922 926
		f 4 -2425 -1636 2425 -1639
		mu 0 4 926 922 923 927
		f 4 -2426 -1641 2426 -1643
		mu 0 4 927 923 916 920
		f 4 -2427 -1629 2427 -1632
		mu 0 4 920 916 917 921
		f 4 -2428 -1653 2428 -1655
		mu 0 4 921 917 936 938
		f 4 -2429 -1658 2429 -1660
		mu 0 4 938 936 939 941
		f 4 -1649 2430 -1647 2431
		mu 0 4 934 933 928 931
		f 4 -1678 2432 -1670 -2420
		mu 0 4 952 950 945 947
		f 4 -1675 2433 -1667 -2433
		mu 0 4 950 943 912 945
		f 4 -2434 -1664 2434 -1622
		mu 0 4 912 943 925 901
		f 4 -1637 2435 -1607 -2435
		mu 0 4 925 924 895 901
		f 4 -1642 2436 -1600 -2436
		mu 0 4 924 919 896 895
		f 4 -1630 2437 -1604 -2437
		mu 0 4 919 918 899 896
		f 4 -1654 2438 -1618 -2438
		mu 0 4 918 937 907 899
		f 4 -1659 2439 -1614 -2439
		mu 0 4 937 940 908 907
		f 4 -1645 2440 -1610 2441
		mu 0 4 930 929 904 903
		f 4 -2421 -1672 -2392 -2422
		mu 0 4 1292 947 948 914
		f 4 -1679 -2419 -2386 -2418
		mu 0 4 951 952 1291 1290
		f 4 2442 2443 -1213 2444
		mu 0 4 1305 1306 672 674
		f 4 2445 -2353 2446 2447
		mu 0 4 1307 1271 837 1308
		f 4 2448 2449 -1211 -2444
		mu 0 4 1306 1309 669 672
		f 4 2450 2451 -1690 2452
		mu 0 4 1310 1311 957 959
		f 4 2453 -2445 -1687 -2452
		mu 0 4 1311 1305 674 957
		f 4 2454 2455 -1494 2456
		mu 0 4 1312 1313 841 840
		f 4 2457 2458 -1516 -2456
		mu 0 4 1313 1314 847 841
		f 4 2459 2460 -1502 -2459
		mu 0 4 1314 1315 848 847
		f 4 2461 2462 -1508 -2461
		mu 0 4 1315 1316 852 848
		f 4 2463 2464 -1706 2465
		mu 0 4 1317 1318 968 962
		f 4 2466 2467 -1703 -2465
		mu 0 4 1318 1319 967 968
		f 4 2468 -2466 -1696 -2463
		mu 0 4 1316 1317 962 852
		f 4 2469 2470 -1996 -2468
		mu 0 4 1319 1320 1124 967
		f 4 2471 -2453 -2000 -2471
		mu 0 4 1320 1310 959 1124
		f 4 2472 -2447 -1492 -2450
		mu 0 4 1309 1308 837 669
		f 4 -2443 2473 2474 -2449
		mu 0 4 1306 1305 1321 1309
		f 4 2475 2476 -2451 2477
		mu 0 4 1322 1323 1311 1310
		f 4 2478 -2474 -2454 -2477
		mu 0 4 1323 1321 1305 1311
		f 4 2479 2480 2481 -2455
		mu 0 4 1312 1324 1325 1313
		f 4 2482 2483 -2458 -2482
		mu 0 4 1325 1326 1314 1313
		f 4 -2460 -2484 2484 -2462
		mu 0 4 1315 1314 1326 1316
		f 4 -2464 2485 2486 -2467
		mu 0 4 1318 1317 1327 1319
		f 4 2487 -2486 -2469 -2485
		mu 0 4 1326 1327 1317 1316
		f 4 2488 2489 -2470 -2487
		mu 0 4 1327 1328 1320 1319
		f 4 2490 -2478 -2472 -2490
		mu 0 4 1328 1322 1310 1320
		f 4 2491 2492 -2473 -2475
		mu 0 4 1321 1329 1308 1309
		f 4 2493 2494 -2476 2495
		mu 0 4 1330 1331 1323 1322
		f 4 2496 2497 -2479 -2495
		mu 0 4 1331 1332 1321 1323
		f 4 2498 2499 -2483 2500
		mu 0 4 1333 1334 1326 1325
		f 4 2501 2502 -2488 -2500
		mu 0 4 1334 1335 1327 1326
		f 4 2503 2504 -2489 -2503
		mu 0 4 1335 1336 1328 1327
		f 4 2505 -2496 -2491 -2505
		mu 0 4 1336 1330 1322 1328
		f 4 2506 2507 -2492 -2498
		mu 0 4 1332 1337 1329 1321
		f 4 2508 2509 -2494 2510
		mu 0 4 1338 1339 1331 1330
		f 4 2511 2512 -2497 -2510
		mu 0 4 1339 1340 1332 1331
		f 4 2513 2514 -2499 2515
		mu 0 4 1341 1342 1334 1333
		f 4 2516 2517 -2502 -2515
		mu 0 4 1342 1343 1335 1334
		f 4 2518 2519 -2504 -2518
		mu 0 4 1343 1344 1336 1335
		f 4 2520 -2511 -2506 -2520
		mu 0 4 1344 1338 1330 1336
		f 4 2521 2522 -2507 -2513
		mu 0 4 1340 1345 1337 1332
		f 4 2523 2524 -2509 2525
		mu 0 4 1346 1347 1339 1338
		f 4 2526 2527 -2512 -2525
		mu 0 4 1347 1348 1340 1339
		f 4 2528 2529 -2514 2530
		mu 0 4 1349 1350 1342 1341
		f 4 2531 2532 -2517 -2530
		mu 0 4 1350 1351 1343 1342
		f 4 2533 2534 -2519 -2533
		mu 0 4 1351 1352 1344 1343
		f 4 2535 -2526 -2521 -2535
		mu 0 4 1352 1346 1338 1344
		f 4 2536 2537 -2522 -2528
		mu 0 4 1348 1353 1345 1340
		f 4 2538 2539 -2524 2540
		mu 0 4 1354 1355 1347 1346
		f 4 2541 2542 -2527 -2540
		mu 0 4 1355 1356 1348 1347
		f 4 2543 2544 -2529 2545
		mu 0 4 1357 1358 1350 1349
		f 4 2546 2547 -2532 -2545
		mu 0 4 1358 1359 1351 1350
		f 4 2548 2549 -2534 -2548
		mu 0 4 1359 1360 1352 1351
		f 4 2550 -2541 -2536 -2550
		mu 0 4 1360 1354 1346 1352
		f 4 2551 2552 -2537 -2543
		mu 0 4 1356 1361 1353 1348
		f 4 2553 2554 2555 2556
		mu 0 4 1362 1363 1364 1365
		f 4 -2544 2557 -2557 2558
		mu 0 4 1358 1357 1362 1365
		f 4 2559 -2552 2560 -2555
		mu 0 4 1363 1361 1356 1364
		f 4 -2542 -2539 2561 -2561
		mu 0 4 1356 1355 1354 1364
		f 4 -2556 -2562 -2551 2562
		mu 0 4 1365 1364 1354 1360
		f 4 -2549 -2547 -2559 -2563
		mu 0 4 1360 1359 1358 1365
		f 4 -1919 7098 7097 2564
		mu 0 4 1079 1080 3742 1367
		f 4 -1930 2565 2569 -7102
		mu 0 4 1086 1088 1368 3743
		f 5 7135 7134 2574 -7134 -1897
		mu 0 5 1070 3761 1370 3760 1066
		f 4 -2566 -1865 7103 7102
		mu 0 4 1371 1053 1052 3744
		f 4 -1917 -2565 2575 -7097
		mu 0 4 1073 1079 1367 3741
		f 4 2568 -1883 7139 7138
		mu 0 4 1369 1062 1060 3763
		f 4 -2385 2570 2576 -7108
		mu 0 4 1050 1289 1373 3746
		f 4 -1873 2572 2573 -7142
		mu 0 4 1056 1057 1374 3764
		f 4 7131 7130 -5115 -4477
		mu 0 4 1067 3759 1375 2405
		f 4 7143 7142 -2573 -1903
		mu 0 4 1072 3765 1374 1057
		f 4 -2572 -1861 7107 7106
		mu 0 4 1372 1049 1050 3746
		f 4 2577 2578 -1292 2579
		mu 0 4 1376 935 726 725
		f 4 2580 -1651 -2578 2581
		mu 0 4 1377 932 935 1376
		f 4 2582 2583 -1493 -1500
		mu 0 4 845 1378 840 839
		f 4 -1518 2584 -1522 2585
		mu 0 4 832 843 855 833
		f 4 -1482 -2586 -1485 2586
		mu 0 4 369 832 833 371
		f 4 -2587 -674 2587 -670
		mu 0 4 369 371 372 370
		f 4 -2588 -678 2588 -680
		mu 0 4 370 372 360 357
		f 4 -656 -2589 -659 2589
		mu 0 4 358 357 360 359
		f 4 -686 -2590 -681 2590
		mu 0 4 376 358 359 373
		f 4 -684 2591 -688 -2591
		mu 0 4 373 374 377 376
		f 4 -2592 -1102 2592 -1096
		mu 0 4 377 374 608 604
		f 4 -1086 -2593 -1100 2593
		mu 0 4 605 604 608 595
		f 4 -2594 -1079 2594 -1089
		mu 0 4 605 595 597 600
		f 4 -1082 -2595 -1090 2595
		mu 0 4 601 600 597 606
		f 4 -1408 -2596 -1413 2596
		mu 0 4 786 601 606 789
		f 4 -1411 -2597 -1415 2597
		mu 0 4 788 786 789 769
		f 4 -2343 -2598 -2344 2598
		mu 0 4 768 788 769 773
		f 4 -1381 2599 -1376 -2599
		mu 0 4 773 772 765 768
		f 4 -1385 -2600 -1389 2600
		mu 0 4 776 765 772 778
		f 4 -1393 -2601 -1396 2601
		mu 0 4 781 776 778 783
		f 4 -2602 -2061 2602 -2063
		mu 0 4 781 783 1148 1153
		f 4 -2055 -2603 -2049 2603
		mu 0 4 1154 1153 1148 1147
		f 4 -2058 -2604 -2068 2604
		mu 0 4 1156 1154 1147 1158
		f 4 -2074 -2605 -2076 2605
		mu 0 4 1160 1156 1158 1161
		f 4 -2606 -2078 2606 -2072
		mu 0 4 1160 1161 712 705
		f 4 -1264 -2607 -1275 2607
		mu 0 4 706 705 712 709
		f 4 -1267 -2608 -1271 2608
		mu 0 4 708 706 709 710
		f 4 -2609 -1589 2609 -1580
		mu 0 4 708 710 893 887
		f 4 -2407 -2610 -2408 2610
		mu 0 4 1296 887 893 1298
		f 4 -1583 2611 -1578 -2611
		mu 0 4 890 889 882 885
		f 4 -2397 -2612 -2398 2612
		mu 0 4 906 882 889 909
		f 4 -1615 2613 -1613 -2613
		mu 0 4 909 908 903 906
		f 4 -2440 2614 -2442 -2614
		mu 0 4 908 940 930 903
		f 4 -1646 -2615 -1661 2615
		mu 0 4 931 930 940 941
		f 4 -2430 2616 -2432 -2616
		mu 0 4 941 939 934 931
		f 4 -1514 -2585 -1497 -1496
		mu 0 4 842 855 843 839
		f 4 -1650 -2617 -1657 -2579
		mu 0 4 935 934 939 726
		f 4 2617 -2480 -2457 -2584
		mu 0 4 1378 1324 1312 840
		f 4 2618 -1322 2619 -2582
		mu 0 4 1376 736 743 1377
		f 3 -1311 -2619 -2580
		mu 0 3 725 736 1376
		f 4 -253 -255 -514 -516
		mu 0 4 114 139 110 266
		f 4 2620 -175 -167 -515
		mu 0 4 266 111 107 106
		f 4 -177 -2621 2621 -179
		mu 0 4 112 111 266 113
		f 4 -185 -2622 -513 -187
		mu 0 4 116 113 266 108
		f 4 2622 2623 2624 2625
		mu 0 4 1379 1380 1381 1382
		f 4 2626 2627 2628 2629
		mu 0 4 1383 1384 1385 1386
		f 4 2630 2631 2632 2633
		mu 0 4 1387 1388 1389 1390
		f 4 2634 2635 -2629 2636
		mu 0 4 1391 1392 1386 1385
		f 4 2637 2638 -2633 2639
		mu 0 4 1393 1394 1390 1389
		f 4 2640 2641 2642 2643
		mu 0 4 1395 1396 1397 1398
		f 4 2644 -2643 2645 2646
		mu 0 4 1399 1398 1397 1400
		f 4 2647 2648 2649 2650
		mu 0 4 1401 1402 1403 1404
		f 4 2651 2652 2653 2654
		mu 0 4 1405 1394 1406 1407
		f 4 -2648 2655 2656 2657
		mu 0 4 1402 1401 1408 1409
		f 4 2658 2659 2660 2661
		mu 0 4 1410 1411 1412 1413
		f 4 2662 -2662 2663 2664
		mu 0 4 1414 1410 1413 1415
		f 4 2665 2666 -2630 2667
		mu 0 4 1416 1417 1383 1386
		f 4 -2632 2668 -2666 2669
		mu 0 4 1389 1388 1417 1416
		f 4 2670 2671 -2640 -2670
		mu 0 4 1416 1418 1393 1389
		f 4 -2636 2672 -2671 -2668
		mu 0 4 1386 1392 1418 1416
		f 4 2673 2674 -2659 2675
		mu 0 4 1419 1420 1411 1410
		f 4 2676 2677 -2674 2678
		mu 0 4 1421 1422 1420 1419
		f 4 2679 -2676 -2663 2680
		mu 0 4 1423 1419 1410 1414
		f 4 -2641 2681 -2624 2682
		mu 0 4 1396 1395 1381 1380
		f 4 2683 2684 -2682 2685
		mu 0 4 1424 1404 1381 1395
		f 4 2686 2687 2688 2689
		mu 0 4 1425 1426 1427 1428
		f 4 -2623 2690 -2687 2691
		mu 0 4 1380 1379 1426 1425
		f 4 2692 2693 2694 2695
		mu 0 4 1429 1430 1431 1432
		f 4 2696 2697 2698 2699
		mu 0 4 1433 1434 1435 1436
		f 4 -2628 2700 -2697 2701
		mu 0 4 1385 1384 1434 1433
		f 4 2702 2703 -2627 2704
		mu 0 4 1437 1438 1384 1383
		f 4 2705 2706 -2703 2707
		mu 0 4 1439 1440 1438 1437
		f 4 2708 2709 -2631 2710
		mu 0 4 1441 1442 1388 1387
		f 4 2711 2712 -2709 2713
		mu 0 4 1443 1444 1442 1441
		f 4 2714 2715 2716 2717
		mu 0 4 1445 1446 1447 1448
		f 4 -2701 -2704 2718 2719
		mu 0 4 1434 1384 1438 1449
		f 4 -2719 -2707 2720 2721
		mu 0 4 1449 1438 1440 1450
		f 4 -2698 -2720 2722 2723
		mu 0 4 1435 1434 1449 1451
		f 4 -2723 -2722 2724 2725
		mu 0 4 1451 1449 1450 1452
		f 4 2726 2727 -2637 -2702
		mu 0 4 1433 1453 1391 1385
		f 4 2728 2729 -2727 -2700
		mu 0 4 1436 1454 1453 1433
		f 4 2730 -2711 2731 2732
		mu 0 4 1455 1441 1387 1456
		f 4 2733 -2714 -2731 2734
		mu 0 4 1457 1443 1441 1455
		f 4 2735 2736 2737 2738
		mu 0 4 1458 1448 1459 1460
		f 4 2739 -2718 -2736 2740
		mu 0 4 1461 1445 1448 1458
		f 4 2741 2742 2743 2744
		mu 0 4 1462 1463 1464 1465
		f 4 -2660 2745 -2742 2746
		mu 0 4 1412 1411 1463 1462
		f 4 2747 2748 2749 -2708
		mu 0 4 1437 1466 1467 1439
		f 4 -2667 2750 -2748 -2705
		mu 0 4 1383 1417 1466 1437
		f 4 2751 -2713 2752 -2749
		mu 0 4 1466 1442 1444 1467
		f 4 -2669 -2710 -2752 -2751
		mu 0 4 1417 1388 1442 1466
		f 4 2753 2754 2755 -2743
		mu 0 4 1463 1468 1469 1464
		f 4 -2675 2756 -2754 -2746
		mu 0 4 1411 1420 1468 1463
		f 4 2757 2758 2759 -2755
		mu 0 4 1468 1470 1471 1469
		f 4 2760 -2690 2761 -2694
		mu 0 4 1430 1425 1428 1431
		f 4 -2683 -2692 -2761 2762
		mu 0 4 1396 1380 1425 1430
		f 4 2763 -2651 -2684 2764
		mu 0 4 1472 1401 1404 1424
		f 4 2765 -2712 2766 2767
		mu 0 4 1473 1444 1443 1474
		f 4 2768 -2644 2769 2770
		mu 0 4 1475 1395 1398 1476
		f 4 -2770 -2645 2771 2772
		mu 0 4 1476 1398 1399 1477
		f 4 -2767 -2734 2773 2774
		mu 0 4 1474 1443 1457 1478
		f 4 -2774 2775 2776 2777
		mu 0 4 1478 1457 1479 1480
		f 4 -2777 2778 2779 2780
		mu 0 4 1480 1479 1472 1481
		f 4 2781 -2750 2782 2783
		mu 0 4 1482 1439 1467 1483
		f 4 -2783 -2753 -2766 2784
		mu 0 4 1483 1467 1444 1473
		f 4 -2780 -2765 2785 2786
		mu 0 4 1481 1472 1424 1484
		f 4 -2786 -2686 -2769 2787
		mu 0 4 1484 1424 1395 1475
		f 4 2788 -2768 2789 2790
		mu 0 4 1485 1473 1474 1486
		f 4 2791 -2771 2792 2793
		mu 0 4 1487 1475 1476 1488
		f 4 -2793 -2773 2794 2795
		mu 0 4 1488 1476 1477 1489
		f 4 -2790 -2775 2796 2797
		mu 0 4 1486 1474 1478 1490
		f 4 -2797 -2778 2798 2799
		mu 0 4 1490 1478 1480 1491
		f 4 -2799 -2781 2800 2801
		mu 0 4 1491 1480 1481 1492
		f 4 2802 -2784 2803 2804
		mu 0 4 1493 1482 1483 1494
		f 4 -2804 -2785 -2789 2805
		mu 0 4 1494 1483 1473 1485
		f 4 -2801 -2787 2806 2807
		mu 0 4 1492 1481 1484 1495
		f 4 -2807 -2788 -2792 2808
		mu 0 4 1495 1484 1475 1487
		f 4 2809 2810 2811 2812
		mu 0 4 1496 1497 1446 1498
		f 4 -2661 2813 -2810 2814
		mu 0 4 1413 1412 1497 1496
		f 4 -2664 -2815 2815 2816
		mu 0 4 1415 1413 1496 1499
		f 4 2817 2818 2819 2820
		mu 0 4 1500 1447 1501 1502
		f 4 2821 -2814 -2747 2822
		mu 0 4 1501 1497 1412 1462
		f 4 -2716 -2811 -2822 -2819
		mu 0 4 1447 1446 1497 1501
		f 4 -2732 -2634 2823 2824
		mu 0 4 1456 1387 1390 1503
		f 4 2825 2826 2827 2828
		mu 0 4 1504 1505 1461 1408
		f 4 -2739 2829 -2828 -2741
		mu 0 4 1458 1460 1408 1461
		f 4 -2656 -2764 2830 -2829
		mu 0 4 1408 1401 1472 1504
		f 4 2831 2832 -2679 -2680
		mu 0 4 1423 1506 1421 1419
		f 4 -2779 -2776 2833 -2831
		mu 0 4 1472 1479 1457 1504
		f 4 2834 -2826 -2834 -2735
		mu 0 4 1455 1505 1504 1457
		f 4 2835 -2681 2836 2837
		mu 0 4 1507 1423 1414 1508
		f 4 -2837 -2665 2838 2839
		mu 0 4 1508 1414 1415 1406
		f 4 -2839 -2817 2840 -2654
		mu 0 4 1406 1415 1499 1407
		f 4 -2812 -2715 2841 2842
		mu 0 4 1498 1446 1445 1509
		f 4 -2740 -2827 2843 -2842
		mu 0 4 1445 1461 1505 1509
		f 4 -2824 -2639 -2652 2844
		mu 0 4 1503 1390 1394 1405
		f 4 -2757 -2678 2845 -2758
		mu 0 4 1468 1420 1422 1470
		f 4 -2653 -2638 2846 -2840
		mu 0 4 1406 1394 1393 1508
		f 4 -2835 -2733 2847 -2844
		mu 0 4 1505 1455 1456 1509
		f 4 -2813 -2843 2848 -2816
		mu 0 4 1496 1498 1509 1499
		f 4 -2825 -2845 2849 -2848
		mu 0 4 1456 1503 1405 1509
		f 4 -2841 -2849 -2850 -2655
		mu 0 4 1407 1499 1509 1405
		f 4 2850 2851 2852 -2673
		mu 0 4 1392 1510 1507 1418
		f 4 -2847 -2672 -2853 -2838
		mu 0 4 1508 1393 1418 1507
		f 4 2853 2854 2855 -2852
		mu 0 4 1510 1511 1512 1507
		f 4 -2832 -2836 -2856 2856
		mu 0 4 1506 1423 1507 1512
		f 4 -2833 -2857 2857 2858
		mu 0 4 1421 1506 1512 1513
		f 4 -2858 -2855 2859 2860
		mu 0 4 1513 1512 1511 1454
		f 4 -2635 -2728 2861 -2851
		mu 0 4 1392 1391 1453 1510
		f 4 -2860 -2854 -2862 -2730
		mu 0 4 1454 1511 1510 1453
		f 4 2862 2863 -2647 2864
		mu 0 4 1514 1515 1399 1400
		f 4 -2706 2865 -2863 2866
		mu 0 4 1440 1439 1515 1514
		f 4 2867 2868 -2721 -2867
		mu 0 4 1514 1516 1450 1440
		f 4 2869 2870 -2868 -2865
		mu 0 4 1400 1432 1516 1514
		f 4 2871 -2866 -2782 2872
		mu 0 4 1517 1515 1439 1482
		f 4 -2772 -2864 -2872 2873
		mu 0 4 1477 1399 1515 1517
		f 4 2874 -2873 -2803 2875
		mu 0 4 1518 1517 1482 1493
		f 4 -2795 -2874 -2875 2876
		mu 0 4 1489 1477 1517 1518
		f 4 -2871 -2695 2877 -2869
		mu 0 4 1516 1432 1431 1450
		f 4 -2717 -2818 2878 -2737
		mu 0 4 1448 1447 1500 1459
		f 4 -2820 -2823 -2745 2879
		mu 0 4 1502 1501 1462 1465
		f 4 -2626 2880 2881 2882
		mu 0 4 1379 1382 1519 1520
		f 4 2883 -2882 2884 2885
		mu 0 4 1521 1520 1519 1522
		f 4 2886 -2886 2887 2888
		mu 0 4 1523 1521 1522 1524
		f 4 -2881 -2625 -2685 2889
		mu 0 4 1519 1382 1381 1404
		f 4 -2888 2890 2891 2892
		mu 0 4 1524 1522 1403 1525
		f 4 -2885 -2890 -2650 -2891
		mu 0 4 1522 1519 1404 1403
		f 4 2893 -2893 2894 2895
		mu 0 4 1526 1524 1525 1527
		f 4 2896 -2896 2897 2898
		mu 0 4 1528 1526 1527 1529
		f 4 2899 -2889 -2894 -2897
		mu 0 4 1528 1523 1524 1526
		f 4 2900 2901 -2884 2902
		mu 0 4 1530 1531 1520 1521
		f 4 2903 2904 -2901 2905
		mu 0 4 1532 1533 1531 1530
		f 4 2906 2907 -2900 2908
		mu 0 4 1534 1535 1523 1528
		f 4 2909 2910 -2907 2911
		mu 0 4 1536 1537 1535 1534
		f 4 2912 -2903 -2887 -2908
		mu 0 4 1535 1530 1521 1523
		f 4 2913 -2906 -2913 -2911
		mu 0 4 1537 1532 1530 1535
		f 4 2914 -2909 -2899 2915
		mu 0 4 1538 1534 1528 1529
		f 4 2916 -2691 -2883 -2902
		mu 0 4 1531 1426 1379 1520
		f 4 2917 -2688 -2917 -2905
		mu 0 4 1533 1427 1426 1531
		f 4 -2912 -2915 2918 2919
		mu 0 4 1536 1534 1538 1539
		f 4 2920 2921 2922 2923
		mu 0 4 1540 1541 1542 1543
		f 4 2924 2925 2926 2927
		mu 0 4 1544 1545 1546 1547
		f 4 2928 2929 -2928 2930
		mu 0 4 1548 1549 1544 1547
		f 4 2931 -2924 2932 2933
		mu 0 4 1550 1540 1543 1551
		f 4 2934 2935 -2922 2936
		mu 0 4 1409 1552 1542 1541
		f 4 -2830 2937 -2935 -2657
		mu 0 4 1408 1460 1552 1409
		f 4 2938 2939 -2926 2940
		mu 0 4 1553 1554 1546 1545
		f 4 -2879 2941 -2939 2942
		mu 0 4 1459 1500 1554 1553
		f 4 2943 2944 -2895 2945
		mu 0 4 1555 1556 1527 1525
		f 4 -2898 -2945 2946 2947
		mu 0 4 1529 1527 1556 1557
		f 4 2948 -2946 -2892 -2649
		mu 0 4 1402 1555 1525 1403
		f 4 2949 -2938 -2738 -2943
		mu 0 4 1553 1552 1460 1459
		f 4 -2941 2950 -2936 -2950
		mu 0 4 1553 1545 1542 1552
		f 4 2951 -2923 -2951 -2925
		mu 0 4 1544 1543 1542 1545
		f 4 2952 -2933 -2952 -2930
		mu 0 4 1549 1551 1543 1544
		f 4 -2947 2953 -2932 2954
		mu 0 4 1557 1556 1540 1550
		f 4 2955 -2921 -2954 -2944
		mu 0 4 1555 1541 1540 1556
		f 4 -2658 -2937 -2956 -2949
		mu 0 4 1402 1409 1541 1555
		f 4 2956 2957 -2929 2958
		mu 0 4 1558 1559 1549 1548
		f 4 2959 2960 -2934 2961
		mu 0 4 1560 1561 1550 1551
		f 4 2962 -2916 -2948 2963
		mu 0 4 1562 1538 1529 1557
		f 4 2964 -2962 -2953 -2958
		mu 0 4 1559 1560 1551 1549
		f 4 2965 -2964 -2955 -2961
		mu 0 4 1561 1562 1557 1550
		f 4 -2927 2966 2967 2968
		mu 0 4 1547 1546 1563 1564
		f 4 2969 2970 -2931 -2969
		mu 0 4 1564 1565 1548 1547
		f 4 -2940 2971 2972 -2967
		mu 0 4 1546 1554 1566 1563
		f 4 2973 -2880 2974 2975
		mu 0 4 1566 1502 1465 1567
		f 4 -2942 -2821 -2974 -2972
		mu 0 4 1554 1500 1502 1566
		f 4 -2959 -2971 2976 2977
		mu 0 4 1558 1548 1565 1568
		f 4 2978 2979 -2957 2980
		mu 0 4 1569 1570 1559 1558
		f 4 2981 2982 -2960 2983
		mu 0 4 1571 1572 1561 1560
		f 4 2984 -2984 -2965 -2980
		mu 0 4 1570 1571 1560 1559
		f 4 2985 -2966 -2983 2986
		mu 0 4 1573 1562 1561 1572
		f 4 2987 2988 2989 2990
		mu 0 4 1574 1575 1568 1576
		f 4 2991 -2981 -2978 -2989
		mu 0 4 1575 1569 1558 1568
		f 4 2992 2993 -2979 2994
		mu 0 4 1577 1578 1570 1569
		f 4 2995 2996 -2993 2997
		mu 0 4 1579 1580 1578 1577
		f 4 2998 2999 -2982 3000
		mu 0 4 1581 1582 1572 1571
		f 4 3001 -3001 -2985 -2994
		mu 0 4 1578 1581 1571 1570
		f 4 3002 3003 -3002 -2997
		mu 0 4 1580 1583 1581 1578
		f 4 3004 3005 -2988 3006
		mu 0 4 1584 1585 1575 1574
		f 4 3007 3008 -3005 3009
		mu 0 4 1586 1587 1585 1584
		f 4 3010 -2995 -2992 -3006
		mu 0 4 1585 1577 1569 1575
		f 4 3011 -2998 -3011 -3009
		mu 0 4 1587 1579 1577 1585
		f 4 -2919 -2963 -2986 3012
		mu 0 4 1539 1538 1562 1573
		f 4 -3004 3013 3014 -2999
		mu 0 4 1581 1583 1588 1582
		f 4 3015 3016 3017 3018
		mu 0 4 1589 1590 1591 1592
		f 4 3019 3020 -3017 3021
		mu 0 4 1593 1594 1591 1590
		f 4 3022 3023 -3020 3024
		mu 0 4 1595 1596 1594 1593
		f 4 3025 -3025 3026 -2699
		mu 0 4 1435 1595 1593 1436
		f 4 -3027 -3022 3027 -2729
		mu 0 4 1436 1593 1590 1454
		f 4 3028 3029 3030 3031
		mu 0 4 1597 1598 1599 1600
		f 4 3032 3033 3034 3035
		mu 0 4 1601 1602 1603 1604
		f 4 3036 -3036 3037 3038
		mu 0 4 1605 1601 1604 1606
		f 4 3039 3040 3041 -3032
		mu 0 4 1600 1607 1608 1597
		f 4 3042 -3030 3043 3044
		mu 0 4 1609 1599 1598 1567
		f 4 -2975 -2744 3045 -3045
		mu 0 4 1567 1465 1464 1609
		f 4 3046 3047 3048 -3034
		mu 0 4 1602 1610 1611 1603
		f 4 3049 3050 -3037 3051
		mu 0 4 1612 1613 1601 1605
		f 4 -3040 3052 -3050 3053
		mu 0 4 1607 1600 1613 1612
		f 4 -3031 3054 3055 -3053
		mu 0 4 1600 1599 1614 1613
		f 4 -3033 -3051 -3056 3056
		mu 0 4 1602 1601 1613 1614
		f 4 3057 3058 -3047 -3057
		mu 0 4 1614 1615 1610 1602
		f 4 -3058 -3055 -3043 3059
		mu 0 4 1615 1614 1599 1609
		f 4 3060 -2760 3061 -3059
		mu 0 4 1615 1469 1471 1610
		f 4 -3046 -2756 -3061 -3060
		mu 0 4 1609 1464 1469 1615
		f 4 3062 3063 -3026 -2724
		mu 0 4 1451 1616 1595 1435
		f 4 3064 3065 -3063 -2726
		mu 0 4 1452 1617 1616 1451
		f 4 -3039 3066 3067 3068
		mu 0 4 1605 1606 1618 1619
		f 4 -3041 3069 3070 3071
		mu 0 4 1608 1607 1620 1576
		f 4 -3054 3072 3073 -3070
		mu 0 4 1607 1612 1621 1620
		f 4 -3052 -3069 3074 -3073
		mu 0 4 1612 1605 1619 1621
		f 4 -2968 3075 -3029 3076
		mu 0 4 1564 1563 1598 1597
		f 4 3077 3078 -3021 3079
		mu 0 4 1622 1623 1591 1594
		f 4 -3035 3080 -3078 3081
		mu 0 4 1604 1603 1623 1622
		f 4 3082 -3080 -3024 3083
		mu 0 4 1624 1622 1594 1596
		f 4 -3038 -3082 -3083 3084
		mu 0 4 1606 1604 1622 1624
		f 4 -3042 3085 -2970 -3077
		mu 0 4 1597 1608 1565 1564
		f 4 -2973 -2976 -3044 -3076
		mu 0 4 1563 1566 1567 1598;
	setAttr ".fc[1500:1999]"
		f 4 3086 -3018 -3079 3087
		mu 0 4 1625 1592 1591 1623
		f 4 -3049 3088 -3088 -3081
		mu 0 4 1603 1611 1625 1623
		f 4 3089 -3084 3090 3091
		mu 0 4 1626 1624 1596 1627
		f 4 -3067 -3085 -3090 3092
		mu 0 4 1618 1606 1624 1626
		f 4 -2977 -3086 -3072 -2990
		mu 0 4 1568 1565 1608 1576
		f 4 -3028 -3016 3093 -2861
		mu 0 4 1454 1590 1589 1513
		f 4 -3048 -3062 3094 -3089
		mu 0 4 1611 1610 1471 1625
		f 4 -3095 -2759 3095 -3087
		mu 0 4 1625 1471 1470 1592
		f 4 -3096 -2846 3096 -3019
		mu 0 4 1592 1470 1422 1589
		f 4 -3068 3097 3098 3099
		mu 0 4 1619 1618 1628 1629
		f 4 -3071 3100 3101 -2991
		mu 0 4 1576 1620 1630 1574
		f 4 -3074 3102 3103 -3101
		mu 0 4 1620 1621 1631 1630
		f 4 -3075 -3100 3104 -3103
		mu 0 4 1621 1619 1629 1631
		f 4 3105 -3098 -3093 3106
		mu 0 4 1632 1628 1618 1626
		f 4 3107 3108 3109 3110
		mu 0 4 1633 1634 1635 1636
		f 4 -3099 3111 -3108 3112
		mu 0 4 1629 1628 1634 1633
		f 4 3113 3114 3115 -3010
		mu 0 4 1584 1637 1638 1586
		f 4 -3102 3116 -3114 -3007
		mu 0 4 1574 1630 1637 1584
		f 4 3117 3118 3119 -3115
		mu 0 4 1637 1639 1640 1638
		f 4 -3104 3120 -3118 -3117
		mu 0 4 1630 1631 1639 1637
		f 4 3121 -3111 3122 -3119
		mu 0 4 1639 1633 1636 1640
		f 4 -3105 -3113 -3122 -3121
		mu 0 4 1631 1629 1633 1639
		f 4 3123 -3109 3124 3125
		mu 0 4 1641 1635 1634 1642
		f 4 -3112 -3106 3126 -3125
		mu 0 4 1634 1628 1632 1642
		f 4 -3023 -3064 3127 -3091
		mu 0 4 1596 1595 1616 1627
		f 4 -3066 3128 3129 -3128
		mu 0 4 1616 1617 1643 1627
		f 4 -3126 -3127 3130 3131
		mu 0 4 1641 1642 1632 1643
		f 4 -3092 -3130 -3131 -3107
		mu 0 4 1626 1627 1643 1632
		f 4 -2677 -2859 -3094 -3097
		mu 0 4 1422 1421 1513 1589
		f 4 3132 3133 -2987 -3000
		mu 0 4 1582 1644 1573 1572
		f 4 -2796 3134 3135 -2794
		mu 0 4 1488 1489 1645 1487
		f 4 3136 -2805 -2806 3137
		mu 0 4 1645 1493 1494 1485
		f 4 3138 3139 3140 3141
		mu 0 4 1646 1647 1648 1649
		f 4 3142 3143 3144 3145
		mu 0 4 1650 1651 1652 1653
		f 4 3146 -3144 3147 3148
		mu 0 4 1654 1652 1651 1655
		f 4 3149 3150 3151 3152
		mu 0 4 1656 1657 1658 1659
		f 4 3153 3154 3155 -3149
		mu 0 4 1655 1660 1661 1654
		f 4 3156 3157 3158 3159
		mu 0 4 1662 1663 1664 1665
		f 4 -3159 3160 -3151 3161
		mu 0 4 1665 1664 1658 1657
		f 4 -3155 3162 3163 3164
		mu 0 4 1661 1660 1666 1667
		f 4 3165 3166 -3157 3167
		mu 0 4 1668 1669 1663 1662
		f 4 -3139 3168 -3166 3169
		mu 0 4 1647 1646 1669 1668
		f 4 3170 3171 3172 3173
		mu 0 4 1670 1671 1672 1673
		f 4 3174 3175 -3172 3176
		mu 0 4 1674 1675 1672 1671
		f 4 -3171 3177 3178 3179
		mu 0 4 1671 1670 1676 1677
		f 4 3180 -3143 3181 -3141
		mu 0 4 1648 1651 1650 1649
		f 4 -3148 -3181 -3140 3182
		mu 0 4 1655 1651 1648 1647
		f 4 -3154 -3183 -3170 3183
		mu 0 4 1660 1655 1647 1668
		f 4 3184 -3163 -3184 -3168
		mu 0 4 1662 1666 1660 1668
		f 4 3185 3186 3187 3188
		mu 0 4 1678 1679 1676 1680
		f 4 3189 3190 -3186 3191
		mu 0 4 1681 1682 1679 1678
		f 4 3192 3193 -3153 3194
		mu 0 4 1683 1684 1656 1659
		f 4 -3190 3195 -3193 3196
		mu 0 4 1682 1681 1684 1683
		f 4 3197 3198 -3173 3199
		mu 0 4 1685 1686 1673 1672
		f 4 -3145 3200 -3198 3201
		mu 0 4 1653 1652 1686 1685
		f 4 3202 -3201 -3147 3203
		mu 0 4 1687 1686 1652 1654
		f 4 -3174 -3199 -3203 3204
		mu 0 4 1670 1673 1686 1687
		f 4 3205 3206 -3165 3207
		mu 0 4 1688 1689 1661 1667
		f 4 -3188 3208 -3206 3209
		mu 0 4 1680 1676 1689 1688
		f 4 3210 -3209 -3178 -3205
		mu 0 4 1687 1689 1676 1670
		f 4 -3156 -3207 -3211 -3204
		mu 0 4 1654 1661 1689 1687
		f 4 3211 3212 3213 3214
		mu 0 4 1690 1691 1692 1693
		f 4 3215 -3212 3216 3217
		mu 0 4 1694 1691 1690 1695
		f 4 3218 3219 -3213 3220
		mu 0 4 1696 1697 1692 1691
		f 4 3221 -3221 -3216 3222
		mu 0 4 1698 1696 1691 1694
		f 4 3223 -3222 3224 3225
		mu 0 4 1699 1696 1698 1700
		f 4 3226 3227 -3219 -3224
		mu 0 4 1699 1701 1697 1696
		f 4 3228 3229 -3225 3230
		mu 0 4 1702 1703 1700 1698
		f 4 3231 3232 3233 3234
		mu 0 4 1704 1705 1706 1707
		f 4 3235 3236 3237 3238
		mu 0 4 1708 1709 1710 1711
		f 4 3239 3240 3241 -3238
		mu 0 4 1710 1712 1713 1711
		f 4 3242 -3232 3243 3244
		mu 0 4 1714 1705 1704 1715
		f 4 3245 3246 -3243 3247
		mu 0 4 1716 1717 1705 1714
		f 4 3248 3249 -3236 3250
		mu 0 4 1718 1719 1709 1708
		f 4 3251 -3235 3252 3253
		mu 0 4 1720 1704 1707 1721
		f 4 3254 -3254 3255 3256
		mu 0 4 1722 1720 1721 1723
		f 4 3257 3258 3259 3260
		mu 0 4 1724 1725 1726 1715
		f 4 3261 3262 -3258 3263
		mu 0 4 1727 1728 1725 1724
		f 4 -3264 3264 -3255 3265
		mu 0 4 1727 1724 1720 1722
		f 4 -3261 -3244 -3252 -3265
		mu 0 4 1724 1715 1704 1720
		f 4 -3253 -3234 3266 3267
		mu 0 4 1721 1707 1706 1729
		f 4 -3256 -3268 3268 3269
		mu 0 4 1723 1721 1729 1730
		f 4 3270 3271 3272 -2878
		mu 0 4 1431 1731 1732 1450
		f 4 -2725 -3273 3273 3274
		mu 0 4 1452 1450 1732 1733
		f 4 3275 3276 3277 -654
		mu 0 4 355 1734 1735 356
		f 4 -3152 3278 3279 3280
		mu 0 4 1659 1658 1736 1737
		f 4 3281 3282 3283 3284
		mu 0 4 1738 1739 1740 1741
		f 4 3285 3286 -3283 3287
		mu 0 4 1742 1743 1740 1739
		f 4 3288 3289 3290 -668
		mu 0 4 367 1744 1745 368
		f 4 3291 3292 -3286 3293
		mu 0 4 1746 1747 1743 1742
		f 4 -3284 3294 -3158 3295
		mu 0 4 1741 1740 1664 1663
		f 4 3296 -3161 -3295 -3287
		mu 0 4 1743 1658 1664 1740
		f 4 3297 -3279 -3297 -3293
		mu 0 4 1747 1736 1658 1743
		f 4 -3278 3298 -3289 -679
		mu 0 4 356 1735 1744 367
		f 4 3299 -3195 -3281 3300
		mu 0 4 1748 1683 1659 1737
		f 4 3301 3302 -3197 -3300
		mu 0 4 1748 1749 1682 1683
		f 4 3303 3304 -3276 -685
		mu 0 4 375 1750 1734 355
		f 4 -3304 -690 3305 3306
		mu 0 4 1750 375 378 1751
		f 4 3307 3308 3309 3310
		mu 0 4 1752 1753 1754 1755
		f 4 -3310 3311 3312 3313
		mu 0 4 1755 1754 1756 1757
		f 4 3314 3315 -2910 3316
		mu 0 4 1758 1759 1537 1536
		f 4 3317 3318 -2914 -3316
		mu 0 4 1759 1760 1532 1537
		f 4 3319 -3317 -2920 3320
		mu 0 4 1753 1758 1536 1539
		f 4 -2904 -3319 3321 3322
		mu 0 4 1533 1532 1760 1761
		f 4 3323 3324 -2918 -3323
		mu 0 4 1761 1762 1427 1533
		f 4 3325 -3324 3326 3327
		mu 0 4 1763 1762 1761 1764
		f 4 -3322 3328 3329 -3327
		mu 0 4 1761 1760 1765 1764
		f 4 3330 3331 -3314 3332
		mu 0 4 1766 1767 1755 1757
		f 4 -2689 -3325 3333 3334
		mu 0 4 1428 1427 1762 1768
		f 4 3335 3336 3337 3338
		mu 0 4 1769 1770 1771 1772
		f 4 3339 3340 -3337 3341
		mu 0 4 1773 1774 1771 1770
		f 4 3342 3343 -3341 3344
		mu 0 4 1775 1776 1771 1774
		f 4 3345 3346 3347 3348
		mu 0 4 1777 1778 1779 1780
		f 4 3349 -3348 3350 3351
		mu 0 4 1781 1780 1779 1782
		f 4 3352 -3338 -3344 3353
		mu 0 4 1783 1772 1771 1776
		f 4 3354 3355 3356 -3336
		mu 0 4 1769 1784 1785 1770
		f 4 -3342 -3357 3357 3358
		mu 0 4 1773 1770 1785 1786
		f 4 3359 3360 3361 3362
		mu 0 4 1787 1788 1789 1790
		f 4 3363 -3349 3364 -3343
		mu 0 4 1775 1777 1780 1776
		f 4 -3365 -3350 3365 -3354
		mu 0 4 1776 1780 1781 1783
		f 4 3366 3367 -3356 3368
		mu 0 4 1791 1792 1785 1784
		f 4 3369 -3358 -3368 3370
		mu 0 4 1793 1786 1785 1792
		f 4 -757 3371 -3367 3372
		mu 0 4 421 422 1792 1791
		f 4 -3372 -759 3373 -3371
		mu 0 4 1792 422 423 1793
		f 4 3374 3375 3376 3377
		mu 0 4 1794 1795 1796 1797
		f 4 3378 3379 3380 3381
		mu 0 4 1798 1799 1800 1801
		f 4 -3313 3382 3383 3384
		mu 0 4 1757 1756 1802 1803
		f 4 -3384 3385 -3379 3386
		mu 0 4 1803 1802 1799 1798
		f 4 3387 3388 3389 3390
		mu 0 4 1804 1805 1806 1807
		f 4 -3390 3391 3392 3393
		mu 0 4 1807 1806 1808 1809
		f 4 -3393 3394 -3376 3395
		mu 0 4 1809 1808 1796 1795
		f 4 3396 3397 3398 3399
		mu 0 4 1810 1811 1812 1813
		f 4 3400 -3360 3401 3402
		mu 0 4 1814 1788 1787 1815
		f 4 3403 -3339 3404 3405
		mu 0 4 1816 1769 1772 1817
		f 4 3406 -3355 -3404 3407
		mu 0 4 1818 1784 1769 1816
		f 4 -3405 -3353 3408 3409
		mu 0 4 1817 1772 1783 1819
		f 4 -3409 -3366 3410 3411
		mu 0 4 1819 1783 1781 1820
		f 4 3412 -3369 -3407 3413
		mu 0 4 1821 1791 1784 1818
		f 4 -801 -3373 -3413 3414
		mu 0 4 452 421 1791 1821
		f 4 -3411 -3352 3415 3416
		mu 0 4 1820 1781 1782 1822
		f 4 -3403 3417 3418 3419
		mu 0 4 1814 1815 1823 1824
		f 4 3420 3421 -3397 3422
		mu 0 4 1825 1826 1811 1810
		f 4 3423 3424 -3362 3425
		mu 0 4 1827 1828 1790 1789
		f 4 3426 3427 -3388 3428
		mu 0 4 1829 1830 1805 1804
		f 4 -3381 3429 -3427 3430
		mu 0 4 1801 1800 1830 1829
		f 4 3431 3432 -3421 3433
		mu 0 4 1831 1832 1826 1825
		f 4 -3419 3434 -3432 3435
		mu 0 4 1824 1823 1832 1831
		f 4 3436 3437 3438 3439
		mu 0 4 1833 1834 1835 1836
		f 4 3440 3441 3442 -3438
		mu 0 4 1834 1837 1838 1835
		f 4 3443 -3417 3444 -3442
		mu 0 4 1837 1820 1822 1838
		f 4 3445 -3441 3446 3447
		mu 0 4 1839 1837 1834 1840
		f 4 -3446 3448 -3412 -3444
		mu 0 4 1837 1839 1819 1820
		f 4 3449 3450 -3410 -3449
		mu 0 4 1839 1841 1817 1819
		f 4 -3450 -3448 3451 3452
		mu 0 4 1841 1839 1840 1842
		f 4 3453 -3453 3454 3455
		mu 0 4 1843 1841 1842 1844
		f 4 3456 -3406 -3451 -3454
		mu 0 4 1843 1816 1817 1841
		f 4 3457 -3408 -3457 3458
		mu 0 4 1845 1818 1816 1843
		f 4 3459 -3414 -3458 3460
		mu 0 4 1846 1821 1818 1845
		f 4 3461 -848 -3415 -3460
		mu 0 4 1846 478 452 1821
		f 4 -3459 -3456 3462 3463
		mu 0 4 1845 1843 1844 1847
		f 4 3464 -3461 -3464 3465
		mu 0 4 1848 1846 1845 1847
		f 4 -855 -3462 -3465 3466
		mu 0 4 481 478 1846 1848
		f 4 3467 -3389 3468 -3116
		mu 0 4 1638 1806 1805 1586
		f 4 3469 -3392 -3468 -3120
		mu 0 4 1640 1808 1806 1638
		f 4 3470 -3430 3471 -3012
		mu 0 4 1587 1830 1800 1579
		f 4 -3469 -3428 -3471 -3008
		mu 0 4 1586 1805 1830 1587
		f 4 3472 3473 -3347 3474
		mu 0 4 1849 1850 1779 1778
		f 4 -3426 3475 -3473 3476
		mu 0 4 1827 1789 1850 1849
		f 4 3477 3478 -3351 -3474
		mu 0 4 1850 1851 1782 1779
		f 4 -3361 3479 -3478 -3476
		mu 0 4 1789 1788 1851 1850
		f 4 3480 3481 -3416 -3479
		mu 0 4 1851 1852 1822 1782
		f 4 -3401 3482 -3481 -3480
		mu 0 4 1788 1814 1852 1851
		f 4 3483 -3483 -3420 3484
		mu 0 4 1853 1852 1814 1824
		f 4 -3445 -3482 -3484 3485
		mu 0 4 1838 1822 1852 1853
		f 4 3486 -3485 -3436 3487
		mu 0 4 1854 1853 1824 1831
		f 4 -3443 -3486 -3487 3488
		mu 0 4 1835 1838 1853 1854
		f 4 3489 -3488 -3434 3490
		mu 0 4 1855 1854 1831 1825
		f 4 -3439 -3489 -3490 3491
		mu 0 4 1836 1835 1854 1855
		f 4 3492 -3491 -3423 3493
		mu 0 4 1856 1855 1825 1810
		f 4 3494 3495 -3396 3496
		mu 0 4 1857 1858 1809 1795
		f 4 3497 3498 -3495 3499
		mu 0 4 1859 1812 1858 1857
		f 4 3500 3501 -3394 -3496
		mu 0 4 1858 1860 1807 1809
		f 4 -3398 3502 -3501 -3499
		mu 0 4 1812 1811 1860 1858
		f 4 3503 3504 -3363 3505
		mu 0 4 1766 1861 1787 1790
		f 4 -3385 3506 -3504 -3333
		mu 0 4 1757 1803 1861 1766
		f 4 3507 3508 -3402 -3505
		mu 0 4 1861 1862 1815 1787
		f 4 -3387 3509 -3508 -3507
		mu 0 4 1803 1798 1862 1861
		f 4 3510 -3510 -3382 3511
		mu 0 4 1863 1862 1798 1801
		f 4 -3418 -3509 -3511 3512
		mu 0 4 1823 1815 1862 1863
		f 4 3513 3514 -3391 -3502
		mu 0 4 1860 1864 1804 1807
		f 4 -3422 3515 -3514 -3503
		mu 0 4 1811 1826 1864 1860
		f 4 -3331 -3506 -3425 3516
		mu 0 4 1767 1766 1790 1828
		f 4 3517 3518 -3435 -3513
		mu 0 4 1863 1865 1832 1823
		f 4 -3431 3519 -3518 -3512
		mu 0 4 1801 1829 1865 1863
		f 4 3520 -3516 -3433 -3519
		mu 0 4 1865 1864 1826 1832
		f 4 -3429 -3515 -3521 -3520
		mu 0 4 1829 1804 1864 1865
		f 4 3521 3522 3523 3524
		mu 0 4 1866 1867 1868 1869
		f 4 3525 3526 -3523 3527
		mu 0 4 1870 1871 1868 1867
		f 4 3528 3529 3530 3531
		mu 0 4 1872 1873 1874 1875
		f 4 3532 3533 3534 3535
		mu 0 4 1876 1877 1878 1879
		f 4 3536 -3532 3537 -3526
		mu 0 4 1870 1872 1875 1871
		f 4 3538 3539 3540 -3536
		mu 0 4 1879 1880 1881 1876
		f 4 -3540 3541 3542 3543
		mu 0 4 1881 1880 1882 1883
		f 4 3544 -3543 3545 3546
		mu 0 4 1884 1883 1882 1885
		f 4 -3535 3547 -3529 3548
		mu 0 4 1879 1878 1873 1872
		f 4 3549 -3539 -3549 -3537
		mu 0 4 1870 1880 1879 1872
		f 4 -3550 -3528 3550 -3542
		mu 0 4 1880 1870 1867 1882
		f 4 -3546 -3551 -3522 3551
		mu 0 4 1885 1882 1867 1866
		f 4 3552 3553 3554 3555
		mu 0 4 1886 1887 1888 1889
		f 4 3556 3557 3558 3559
		mu 0 4 1890 1891 1892 1893
		f 4 3560 3561 3562 3563
		mu 0 4 1894 1895 1884 1896
		f 4 3564 -3564 3565 3566
		mu 0 4 1897 1894 1896 1898
		f 4 3567 3568 -3565 3569
		mu 0 4 1899 1900 1894 1897
		f 4 3570 3571 -3568 3572
		mu 0 4 1901 1902 1900 1899
		f 4 -3573 3573 3574 3575
		mu 0 4 1901 1899 1903 1904
		f 4 -3575 3576 3577 3578
		mu 0 4 1904 1903 1905 1906
		f 4 -3570 3579 3580 -3574
		mu 0 4 1899 1897 1907 1903
		f 4 3581 3582 -3580 -3567
		mu 0 4 1898 1908 1907 1897
		f 4 3583 3584 3585 -3556
		mu 0 4 1889 1909 1910 1886
		f 4 -3559 3586 -3533 3587
		mu 0 4 1893 1892 1877 1876
		f 4 3588 -3588 -3541 3589
		mu 0 4 1911 1893 1876 1881
		f 4 -3589 3590 3591 -3560
		mu 0 4 1893 1911 1912 1890
		f 4 3592 -3590 -3544 3593
		mu 0 4 1913 1911 1881 1883
		f 4 -3594 -3545 -3562 3594
		mu 0 4 1913 1883 1884 1895
		f 4 -3593 3595 3596 -3591
		mu 0 4 1911 1913 1914 1912
		f 4 -3561 -3569 3597 3598
		mu 0 4 1895 1894 1900 1915
		f 4 -3599 3599 -3596 -3595
		mu 0 4 1895 1915 1914 1913
		f 4 -3597 3600 3601 3602
		mu 0 4 1912 1914 1916 1917
		f 4 3603 3604 3605 -3601
		mu 0 4 1914 1918 1919 1916
		f 4 3606 -3604 -3600 3607
		mu 0 4 1920 1918 1914 1915
		f 4 -3608 -3598 -3572 3608
		mu 0 4 1920 1915 1900 1902
		f 4 3609 -3587 3610 3611
		mu 0 4 1921 1877 1892 1922
		f 4 -3611 -3558 3612 3613
		mu 0 4 1922 1892 1891 1923
		f 4 3614 3615 3616 3617
		mu 0 4 1924 1921 1925 1926
		f 4 -3612 3618 3619 -3616
		mu 0 4 1921 1922 1927 1925
		f 4 3620 -3619 -3614 3621
		mu 0 4 1928 1927 1922 1923
		f 4 3622 3623 -3576 3624
		mu 0 4 1929 1930 1901 1904
		f 4 3625 3626 3627 3628
		mu 0 4 1931 1932 1728 1933
		f 4 3629 -3629 3630 3631
		mu 0 4 1905 1931 1933 1934
		f 4 3632 -3628 -3262 3633
		mu 0 4 1935 1933 1728 1727
		f 4 3634 -3631 -3633 3635
		mu 0 4 1936 1934 1933 1935
		f 4 -3630 -3577 -3581 3636
		mu 0 4 1931 1905 1903 1907
		f 4 -3637 -3583 3637 -3626
		mu 0 4 1931 1907 1908 1932
		f 4 3638 3639 -3578 -3632
		mu 0 4 1934 1937 1906 1905
		f 4 3640 3641 -3639 -3635
		mu 0 4 1936 1938 1937 1934
		f 4 -3621 3642 -3617 -3620
		mu 0 4 1927 1928 1926 1925
		f 4 -3643 3643 -3554 3644
		mu 0 4 1926 1928 1888 1887
		f 4 3645 3646 3647 3648
		mu 0 4 1939 1693 1940 1941
		f 4 3649 3650 3651 3652
		mu 0 4 1942 1943 1944 1945
		f 4 3653 3654 3655 3656
		mu 0 4 1946 1947 1948 1949
		f 4 3657 3658 3659 -3651
		mu 0 4 1943 1950 1951 1944
		f 4 3660 -3659 3661 -3649
		mu 0 4 1941 1951 1950 1939
		f 4 3662 -3648 3663 3664
		mu 0 4 1952 1941 1940 1953
		f 4 3665 -3652 3666 3667
		mu 0 4 1954 1945 1944 1955
		f 4 -3656 3668 3669 3670
		mu 0 4 1949 1948 1956 1957
		f 4 -3667 -3660 3671 3672
		mu 0 4 1955 1944 1951 1958
		f 4 -3672 -3661 -3663 3673
		mu 0 4 1958 1951 1941 1952
		f 4 3674 3675 -3269 3676
		mu 0 4 1959 1960 1730 1729
		f 4 -3665 3677 -3675 3678
		mu 0 4 1952 1953 1960 1959
		f 4 3679 -3677 -3267 3680
		mu 0 4 1961 1959 1729 1706
		f 4 -3674 -3679 -3680 3681
		mu 0 4 1958 1952 1959 1961
		f 4 3682 -3681 -3233 -3247
		mu 0 4 1717 1961 1706 1705
		f 4 -3673 -3682 -3683 3683
		mu 0 4 1955 1958 1961 1717
		f 4 -3668 -3684 -3246 3684
		mu 0 4 1954 1955 1717 1716
		f 4 -3670 3685 -3249 3686
		mu 0 4 1957 1956 1719 1718
		f 4 3687 3688 3689 3690
		mu 0 4 1962 1963 1674 1964
		f 4 3691 3692 3693 -1080
		mu 0 4 598 1965 1966 599
		f 4 3694 3695 3696 -1084
		mu 0 4 602 1967 1968 603
		f 4 -3694 3697 -3695 -1088
		mu 0 4 599 1966 1967 602
		f 4 3698 -3175 -3689 3699
		mu 0 4 1969 1675 1674 1963
		f 4 3700 -3690 -3177 -3180
		mu 0 4 1677 1964 1674 1671
		f 4 3701 -3191 -3303 3702
		mu 0 4 1970 1679 1682 1749
		f 4 -3697 3703 -3306 -1095
		mu 0 4 603 1968 1751 378
		f 4 -3702 3704 -3179 -3187
		mu 0 4 1679 1970 1677 1676
		f 4 3705 -3691 3706 3707
		mu 0 4 1971 1962 1964 1972
		f 4 3708 -3707 -3701 -3705
		mu 0 4 1970 1972 1964 1677
		f 4 -3708 -3709 -3703 3709
		mu 0 4 1971 1972 1970 1749
		f 4 3710 3711 3712 3713
		mu 0 4 1973 1974 1975 1976
		f 4 3714 3715 -3658 3716
		mu 0 4 1977 1978 1950 1943
		f 4 3717 3718 -3654 3719
		mu 0 4 1979 1980 1947 1946
		f 4 3720 -3717 -3650 3721
		mu 0 4 1981 1977 1943 1942
		f 4 3722 -3215 -3646 3723
		mu 0 4 1982 1690 1693 1939
		f 4 3724 -3715 3725 3726
		mu 0 4 1983 1978 1977 1984
		f 4 -3217 -3723 3727 3728
		mu 0 4 1695 1690 1982 1985
		f 4 -3729 3729 -3712 3730
		mu 0 4 1695 1985 1975 1974
		f 4 3731 -3727 3732 3733
		mu 0 4 1986 1983 1984 1987
		f 4 3734 3735 3736 -3734
		mu 0 4 1987 1988 1989 1986
		f 4 3737 -3736 3738 3739
		mu 0 4 1990 1989 1988 1991
		f 4 3740 3741 3742 -3739
		mu 0 4 1988 1992 1993 1991
		f 4 3743 3744 3745 3746
		mu 0 4 1994 1995 1996 1997
		f 4 3747 3748 3749 -3745
		mu 0 4 1995 1998 1999 1996
		f 4 -3726 -3721 3750 3751
		mu 0 4 1984 1977 1981 2000
		f 4 3752 -3718 3753 -3749
		mu 0 4 1998 1980 1979 1999
		f 4 -3662 -3716 3754 -3724
		mu 0 4 1939 1950 1978 1982
		f 4 -3728 -3755 -3725 3755
		mu 0 4 1985 1982 1978 1983
		f 4 -3738 3756 3757 3758
		mu 0 4 1989 1990 1910 1976
		f 4 3759 3760 -3167 3761
		mu 0 4 2001 2002 1663 1669
		f 4 3762 3763 3764 3765
		mu 0 4 2003 2004 2005 2006
		f 4 3766 3767 -3763 3768
		mu 0 4 2001 2007 2004 2003
		f 4 3769 3770 3771 -3606
		mu 0 4 1919 2008 2009 1916
		f 4 3772 -3285 3773 3774
		mu 0 4 2010 1738 1741 2011
		f 4 3775 3776 3777 3778
		mu 0 4 2012 2013 2014 2015
		f 4 3779 -3775 3780 -3777
		mu 0 4 2013 2010 2011 2014
		f 4 3781 3782 3783 -3764
		mu 0 4 2004 2016 2017 2005
		f 4 3784 3785 -3782 -3768
		mu 0 4 2007 2018 2016 2004
		f 4 3786 3787 -3760 -3769
		mu 0 4 2003 2019 2002 2001
		f 4 -3766 3788 3789 -3787
		mu 0 4 2003 2006 2020 2019
		f 4 -3592 -3603 3790 3791
		mu 0 4 1890 1912 1917 2021
		f 4 -3778 3792 -3790 3793
		mu 0 4 2015 2014 2019 2020
		f 4 -3781 3794 -3788 -3793
		mu 0 4 2014 2011 2002 2019
		f 4 -3774 -3296 -3761 -3795
		mu 0 4 2011 1741 1663 2002
		f 4 -3772 3795 3796 -3602
		mu 0 4 1916 2009 2022 1917
		f 4 -3797 3797 3798 -3791
		mu 0 4 1917 2022 2023 2021
		f 4 3799 -3785 3800 3801
		mu 0 4 2024 2018 2007 1646
		f 4 -3801 -3767 -3762 -3169
		mu 0 4 1646 2007 2001 1669
		f 4 -3557 -3792 3802 3803
		mu 0 4 1891 1890 2021 2025
		f 4 3804 -3613 -3804 3805
		mu 0 4 2026 1923 1891 2025
		f 4 -3799 3806 3807 -3803
		mu 0 4 2021 2023 2027 2025
		f 4 3808 -3806 -3808 3809
		mu 0 4 2028 2026 2025 2027
		f 4 3810 3811 3812 3813
		mu 0 4 2029 2030 1649 2031
		f 4 -3812 3814 -3802 -3142
		mu 0 4 1649 2030 2024 1646
		f 4 3815 3816 3817 3818
		mu 0 4 2032 2033 2034 2035
		f 4 3819 -3817 3820 3821
		mu 0 4 2036 2034 2033 2037
		f 4 3822 3823 3824 3825
		mu 0 4 1859 2038 2039 2040
		f 4 -3399 -3498 -3826 3826
		mu 0 4 1813 1812 1859 2040
		f 4 3827 3828 3829 3830
		mu 0 4 2041 2042 2043 2044
		f 4 -3378 3831 -3828 3832
		mu 0 4 1794 1797 2042 2041
		f 4 -3824 3833 3834 3835
		mu 0 4 2039 2038 2045 2046
		f 4 -3836 3836 3837 3838
		mu 0 4 2039 2046 2047 2048
		f 4 3839 3840 3841 3842
		mu 0 4 2049 2050 2051 2052
		f 4 3843 3844 3845 -3841
		mu 0 4 2053 2054 2044 2055
		f 4 3846 -3497 -3375 3847
		mu 0 4 2056 1857 1795 1794
		f 4 -3823 -3500 -3847 3848
		mu 0 4 2038 1859 1857 2056
		f 4 3849 3850 -3831 -3845
		mu 0 4 2054 2057 2041 2044
		f 4 3851 -3848 -3833 -3851
		mu 0 4 2057 2056 1794 2041
		f 4 -3834 -3849 -3852 3852
		mu 0 4 2045 2038 2056 2057
		f 4 3853 -3642 3854 3855
		mu 0 4 2058 1937 1938 2052
		f 4 3856 -3640 -3854 3857
		mu 0 4 2059 1906 1937 2058
		f 4 3858 3859 3860 -3858
		mu 0 4 2058 2060 2061 2059
		f 4 -3842 3861 -3859 -3856
		mu 0 4 2052 2051 2060 2058
		f 4 -3846 -3830 3862 3863
		mu 0 4 2055 2044 2043 2062
		f 4 -3862 -3864 3864 3865
		mu 0 4 2063 2055 2062 1733
		f 4 -3866 -3274 3866 -3860
		mu 0 4 2063 1733 1732 2064
		f 4 3867 -3218 -3731 3868
		mu 0 4 2065 1694 1695 1974
		f 4 3869 3870 3871 -1262
		mu 0 4 703 2066 2067 704
		f 4 3872 3873 -3870 -1266
		mu 0 4 707 2068 2066 703
		f 4 3874 3875 -3229 3876
		mu 0 4 2069 2070 1703 1702
		f 4 3877 -3231 -3223 3878
		mu 0 4 2071 1702 1698 1694
		f 4 3879 -3877 -3878 3880
		mu 0 4 2072 2069 1702 2071
		f 4 3881 -3879 -3868 3882
		mu 0 4 2073 2071 1694 2065
		f 4 3883 3884 3885 3886
		mu 0 4 2074 2075 2076 2077
		f 4 3887 -3886 3888 3889
		mu 0 4 2078 2077 2076 2079
		f 4 3890 3891 3892 -3887
		mu 0 4 2077 2080 2081 2074
		f 4 3893 3894 -3892 3895
		mu 0 4 2082 2083 2081 2080
		f 4 3896 3897 3898 3899
		mu 0 4 2084 2085 2086 2087
		f 4 3900 3901 3902 -3897
		mu 0 4 2084 2088 2089 2085
		f 4 3903 3904 -3902 3905
		mu 0 4 2090 2091 2089 2088
		f 4 -3890 3906 -3904 3907
		mu 0 4 2078 2079 2091 2090
		f 4 3908 3909 -3891 -3888
		mu 0 4 2078 2092 2080 2077
		f 4 3910 -3909 -3908 3911
		mu 0 4 2093 2092 2078 2090
		f 4 3912 -3912 -3906 3913
		mu 0 4 2094 2093 2090 2088
		f 4 3914 -3914 -3901 3915
		mu 0 4 2095 2094 2088 2084
		f 4 3916 -3916 -3900 3917
		mu 0 4 2096 2095 2084 2087
		f 4 3918 -3911 3919 3920
		mu 0 4 2097 2092 2093 2098
		f 4 -3920 -3913 3921 3922
		mu 0 4 2098 2093 2094 2099
		f 4 -3922 -3915 3923 3924
		mu 0 4 2099 2094 2095 2100
		f 4 3925 3926 -1321 3927
		mu 0 4 2101 2096 743 742
		f 4 -3924 -3917 -3926 3928
		mu 0 4 2100 2095 2096 2101
		f 4 3929 -3896 -3910 -3919
		mu 0 4 2097 2082 2080 2092
		f 4 3930 -3894 3931 -3440
		mu 0 4 1836 2083 2082 1833
		f 4 3932 -3925 3933 3934
		mu 0 4 2102 2099 2100 2103
		f 4 3935 -3928 -1332 3936
		mu 0 4 2104 2101 742 747
		f 4 -3934 -3929 -3936 3937
		mu 0 4 2103 2100 2101 2104
		f 4 3938 3939 -3923 -3933
		mu 0 4 2102 2105 2098 2099
		f 4 3940 3941 -3921 -3940
		mu 0 4 2105 2106 2097 2098
		f 4 3942 -3932 -3930 -3942
		mu 0 4 2106 1833 2082 2097
		f 4 -3447 -3437 -3943 3943
		mu 0 4 1840 1834 1833 2106
		f 4 -3452 -3944 -3941 3944
		mu 0 4 1842 1840 2106 2105
		f 4 -3455 -3945 -3939 3945
		mu 0 4 1844 1842 2105 2102
		f 4 -3463 -3946 -3935 3946
		mu 0 4 1847 1844 2102 2103
		f 4 -3466 -3947 -3938 3947
		mu 0 4 1848 1847 2103 2104
		f 4 -3948 -3937 -1345 -3467
		mu 0 4 1848 2104 747 481
		f 4 3948 3949 -3884 3950
		mu 0 4 2107 2048 2075 2074
		f 4 -3825 -3839 -3949 3951
		mu 0 4 2040 2039 2048 2107
		f 4 3952 3953 -3827 -3952
		mu 0 4 2107 2108 1813 2040
		f 4 -3893 3954 -3953 -3951
		mu 0 4 2074 2081 2108 2107
		f 4 3955 -3494 -3400 -3954
		mu 0 4 2108 1856 1810 1813
		f 4 -3895 3956 -3956 -3955
		mu 0 4 2081 2083 1856 2108
		f 4 -3931 -3492 -3493 -3957
		mu 0 4 2083 1836 1855 1856
		f 4 3957 3958 3959 3960
		mu 0 4 2109 2110 2111 2112
		f 4 3961 3962 -3958 3963
		mu 0 4 2113 2114 2110 2109
		f 4 -3227 3964 3965 3966
		mu 0 4 1701 1699 2115 2116
		f 4 3967 -3962 3968 3969
		mu 0 4 2117 2114 2113 2118
		f 4 3970 3971 3972 -3146
		mu 0 4 1653 2119 2120 1650
		f 4 3973 -3622 -3805 3974
		mu 0 4 2121 1928 1923 2026
		f 4 3975 3976 -1374 3977
		mu 0 4 2122 2123 767 766
		f 4 3978 3979 -3972 3980
		mu 0 4 2124 2125 2120 2119
		f 4 3981 3982 3983 3984
		mu 0 4 2126 2127 2128 2129
		f 4 3985 3986 -3978 -1384
		mu 0 4 775 2130 2122 766
		f 4 -3974 3987 3988 -3644
		mu 0 4 1928 2121 2131 1888
		f 4 3989 3990 -3985 3991
		mu 0 4 2132 2133 2126 2129
		f 4 3992 3993 -3986 -1392
		mu 0 4 780 2134 2130 775
		f 4 3994 -3990 3995 3996
		mu 0 4 2135 2133 2132 2136
		f 4 -3182 -3973 3997 -3813
		mu 0 4 1649 1650 2120 2031
		f 4 -3814 -3998 -3980 3998
		mu 0 4 2029 2031 2120 2125
		f 4 -3982 3999 -3809 4000
		mu 0 4 2127 2126 2026 2028
		f 4 4001 -3975 -4000 -3991
		mu 0 4 2133 2121 2026 2126
		f 4 -3995 4002 -3988 -4002
		mu 0 4 2133 2135 2131 2121
		f 4 4003 4004 -3971 -3202
		mu 0 4 1685 2137 2119 1653
		f 4 -3176 4005 -4004 -3200
		mu 0 4 1672 1675 2137 1685
		f 4 4006 4007 -3692 -1407
		mu 0 4 785 2138 1965 598
		f 4 4008 4009 -4007 -1410
		mu 0 4 787 2139 2138 785
		f 4 4010 -4006 -3699 4011
		mu 0 4 2140 2137 1675 1969
		f 4 -3981 -4005 -4011 4012
		mu 0 4 2124 2119 2137 2140
		f 4 4013 4014 4015 4016
		mu 0 4 2141 2142 2143 2144
		f 4 4017 4018 4019 4020
		mu 0 4 2145 2146 2147 2148
		f 4 -4017 4021 4022 4023
		mu 0 4 2141 2144 2149 2150
		f 4 -4021 4024 4025 4026
		mu 0 4 2145 2148 2151 2152
		f 4 4027 -4015 4028 4029
		mu 0 4 2153 2143 2142 2154
		f 4 4030 -4030 4031 4032
		mu 0 4 2155 2153 2154 2156
		f 4 4033 4034 -4019 4035
		mu 0 4 2157 2158 2147 2146
		f 4 4036 4037 4038 -4034
		mu 0 4 2157 2159 2160 2158
		f 4 -4032 4039 -4039 4040
		mu 0 4 2156 2154 2158 2160
		f 4 -4029 4041 -4035 -4040
		mu 0 4 2154 2142 2147 2158
		f 4 -4042 -4014 4042 -4020
		mu 0 4 2147 2142 2141 2148
		f 4 -4043 -4024 4043 -4025
		mu 0 4 2148 2141 2150 2151
		f 4 4044 4045 4046 4047
		mu 0 4 2161 2162 2163 2164
		f 4 4048 4049 4050 4051
		mu 0 4 2165 1874 2166 2167
		f 4 4052 -3747 4053 4054
		mu 0 4 2168 1994 1997 2169
		f 4 4055 -3743 4056 4057
		mu 0 4 2170 1991 1993 2171
		f 4 4058 4059 4060 4061
		mu 0 4 2172 2173 2174 2175
		f 4 4062 -4058 4063 4064
		mu 0 4 2176 2170 2171 2177
		f 4 4065 -4055 4066 -4060
		mu 0 4 2173 2168 2169 2174
		f 4 4067 4068 -4062 4069
		mu 0 4 2178 2179 2172 2175
		f 4 -4046 4070 -4068 4071
		mu 0 4 2163 2162 2179 2178
		f 4 4072 4073 -4065 4074
		mu 0 4 2180 2181 2176 2177
		f 4 -4051 4075 -4073 4076
		mu 0 4 2167 2166 2181 2180
		f 4 -3291 4077 4078 -1480
		mu 0 4 368 1745 2182 831
		f 4 4079 -3294 4080 4081
		mu 0 4 2183 1746 1742 2184
		f 4 -4081 -3288 4082 4083
		mu 0 4 2184 1742 1739 2185
		f 4 -4083 -3282 4084 4085
		mu 0 4 2185 1739 1738 2186
		f 4 4086 -3819 4087 4088
		mu 0 4 2187 2032 2035 2188
		f 4 4089 4090 4091 4092
		mu 0 4 2189 2190 2191 2192
		f 4 4093 -1499 4094 4095
		mu 0 4 2189 845 844 2193
		f 4 4096 4097 4098 4099
		mu 0 4 2194 2195 2196 2197
		f 4 4100 -4097 4101 4102
		mu 0 4 2198 2195 2194 2199
		f 4 4103 4104 4105 -4098
		mu 0 4 2195 2200 2201 2196
		f 4 4106 -4104 -4101 4107
		mu 0 4 2202 2200 2195 2198
		f 4 -4102 4108 4109 4110
		mu 0 4 2199 2194 2190 2203
		f 4 4111 -4091 -4109 -4100
		mu 0 4 2197 2191 2190 2194
		f 4 -4079 4112 -4095 -1517
		mu 0 4 831 2182 2193 844
		f 4 -4084 4113 -4103 4114
		mu 0 4 2184 2185 2198 2199
		f 4 -4086 4115 -4108 -4114
		mu 0 4 2185 2186 2202 2198
		f 4 -4111 4116 -4082 -4115
		mu 0 4 2199 2203 2183 2184
		f 4 4117 4118 -3623 4119
		mu 0 4 2204 2205 1930 1929
		f 4 -3579 -3857 4120 -3625
		mu 0 4 1904 1906 2059 1929
		f 4 -4120 -4121 -3861 4121
		mu 0 4 2204 1929 2059 2061
		f 4 -3272 4122 -4122 -3867
		mu 0 4 1732 1731 2206 2064
		f 4 4123 4124 -4118 -4123
		mu 0 4 1731 1768 2207 2206
		f 4 4125 -4028 4126 4127
		mu 0 4 2208 2143 2153 2209
		f 4 -4031 4128 4129 -4127
		mu 0 4 2153 2155 2210 2209
		f 4 4130 -3818 4131 4132
		mu 0 4 2211 2035 2034 2212
		f 4 4133 -4088 -4131 4134
		mu 0 4 2213 2188 2035 2211
		f 4 -4135 4135 -4130 4136
		mu 0 4 2213 2211 2209 2210
		f 4 -4133 4137 -4128 -4136
		mu 0 4 2211 2212 2208 2209
		f 4 4138 4139 4140 4141
		mu 0 4 2214 2215 2216 2217
		f 4 4142 4143 -4142 4144
		mu 0 4 2218 2219 2214 2217
		f 4 4145 4146 -4145 4147
		mu 0 4 2220 2221 2218 2217
		f 4 -4148 -4141 4148 4149
		mu 0 4 2220 2217 2216 2222
		f 4 4150 -3257 4151 4152
		mu 0 4 2223 1722 1723 2224
		f 4 4153 -4153 4154 4155
		mu 0 4 2225 2223 2224 2215
		f 4 -3636 4156 -4154 4157
		mu 0 4 1936 1935 2223 2225
		f 4 -3634 -3266 -4151 -4157
		mu 0 4 1935 1727 1722 2223
		f 4 -4152 -3270 4158 4159
		mu 0 4 2224 1723 1730 2226
		f 4 -4160 4160 -4140 -4155
		mu 0 4 2224 2226 2216 2215
		f 4 4161 4162 -3641 -4158
		mu 0 4 2225 2227 1938 1936
		f 4 -4139 4163 -4162 -4156
		mu 0 4 2215 2214 2227 2225
		f 4 4164 -4164 -4144 4165
		mu 0 4 2049 2227 2214 2219
		f 4 -3855 -4163 -4165 -3843
		mu 0 4 2052 1938 2227 2049
		f 4 -3960 4166 4167 4168
		mu 0 4 2112 2111 2228 2229
		f 4 4169 4170 -1576 4171
		mu 0 4 2230 2231 884 883
		f 4 4172 4173 -3873 -1579
		mu 0 4 886 2232 2068 707
		f 4 4174 4175 4176 4177
		mu 0 4 2233 2234 2235 2236
		f 4 -4168 4178 -4175 4179
		mu 0 4 2229 2228 2234 2233
		f 4 4180 -3876 4181 4182
		mu 0 4 2237 1703 2070 2238
		f 4 4183 -3230 -4181 4184
		mu 0 4 2239 1700 1703 2237
		f 4 -3226 -4184 4185 -3965
		mu 0 4 1699 1700 2239 2115
		f 4 -3380 4186 -2996 -3472
		mu 0 4 1800 1799 1580 1579
		f 4 -3383 4187 -3014 4188
		mu 0 4 1802 1756 1588 1583
		f 4 -3309 -3321 4189 4190
		mu 0 4 1754 1753 1539 1644
		f 4 -3003 -4187 -3386 -4189
		mu 0 4 1583 1580 1799 1802
		f 4 4191 -4188 -3312 -4191
		mu 0 4 1644 1588 1756 1754
		f 4 4192 4193 4194 4195
		mu 0 4 2240 2241 2242 2243
		f 4 -4195 4196 4197 4198
		mu 0 4 2243 2242 2244 2245
		f 4 4199 4200 -4193 4201
		mu 0 4 2246 2247 2241 2240
		f 4 4202 4203 -1611 4204
		mu 0 4 2248 2249 905 904
		f 4 4205 4206 4207 4208
		mu 0 4 2250 2251 2252 2253
		f 4 -4198 4209 -4206 4210
		mu 0 4 2245 2244 2251 2250
		f 4 -4200 4211 4212 4213
		mu 0 4 2247 2246 2254 2255
		f 4 4214 4215 4216 4217
		mu 0 4 2256 2257 2258 2053;
	setAttr ".fc[2000:2499]"
		f 4 4218 4219 -3905 4220
		mu 0 4 2259 2260 2089 2091
		f 4 4221 4222 4223 4224
		mu 0 4 2261 2262 2263 2264
		f 4 4225 4226 -3889 4227
		mu 0 4 2265 2266 2079 2076
		f 4 4228 4229 4230 4231
		mu 0 4 2267 2268 2269 2270
		f 4 4232 -4221 -3907 -4227
		mu 0 4 2266 2259 2091 2079
		f 4 -4224 4233 -4229 4234
		mu 0 4 2264 2263 2268 2267
		f 4 4235 4236 4237 -1644
		mu 0 4 928 2271 2272 929
		f 4 4238 4239 4240 -1648
		mu 0 4 932 2273 2274 933
		f 4 4241 4242 -3903 -4220
		mu 0 4 2260 2275 2085 2089
		f 4 4243 4244 -4222 4245
		mu 0 4 2276 2277 2262 2261
		f 4 4246 4247 -3898 -4243
		mu 0 4 2275 2278 2086 2085
		f 4 4248 4249 -4244 4250
		mu 0 4 2279 2280 2277 2276
		f 4 4251 -4228 -3885 4252
		mu 0 4 2281 2265 2076 2075
		f 4 -4231 4253 4254 4255
		mu 0 4 2270 2269 2282 2283
		f 4 4256 4257 -4213 4258
		mu 0 4 2284 2285 2255 2254
		f 4 4259 4260 -4257 4261
		mu 0 4 2286 2287 2285 2284
		f 4 -3838 4262 -4253 -3950
		mu 0 4 2048 2047 2281 2075
		f 4 4263 4264 -4255 4265
		mu 0 4 2288 2289 2283 2282
		f 4 4266 4267 -4264 4268
		mu 0 4 2290 2291 2289 2288
		f 4 -4085 -3773 4269 4270
		mu 0 4 2186 1738 2010 2292
		f 4 4271 -3776 4272 4273
		mu 0 4 2293 2013 2012 2294
		f 4 -4270 -3780 -4272 4274
		mu 0 4 2292 2010 2013 2293
		f 4 4275 -3822 4276 4277
		mu 0 4 2295 2036 2037 2296
		f 4 4278 -4278 4279 4280
		mu 0 4 2297 2295 2296 2298
		f 4 4281 -4107 4282 4283
		mu 0 4 2299 2200 2202 2300
		f 4 4284 -4105 -4282 4285
		mu 0 4 2301 2201 2200 2299
		f 4 4286 4287 4288 4289
		mu 0 4 2302 2303 2304 2305
		f 4 4290 4291 -4288 4292
		mu 0 4 2306 2307 2304 2303
		f 4 -4289 4293 -4284 4294
		mu 0 4 2305 2304 2299 2300
		f 4 4295 -4286 -4294 -4292
		mu 0 4 2307 2301 2299 2304
		f 4 -4295 4296 -4275 4297
		mu 0 4 2305 2300 2292 2293
		f 4 -4290 -4298 -4274 4298
		mu 0 4 2302 2305 2293 2294
		f 4 -4283 -4116 -4271 -4297
		mu 0 4 2300 2202 2186 2292
		f 4 4299 4300 4301 4302
		mu 0 4 2308 1869 2309 2310
		f 4 4303 4304 4305 4306
		mu 0 4 2311 2312 2313 2314
		f 4 4307 -4307 4308 4309
		mu 0 4 2315 2311 2314 2316
		f 4 4310 -4303 4311 4312
		mu 0 4 2317 2308 2310 2318
		f 4 4313 4314 4315 -4313
		mu 0 4 2318 2319 2320 2317
		f 4 4316 4317 -4310 4318
		mu 0 4 2321 2322 2315 2316
		f 4 4319 4320 -4317 4321
		mu 0 4 2323 2324 2322 2321
		f 4 -3241 4322 -4320 4323
		mu 0 4 1713 1712 2324 2323
		f 4 4324 4325 4326 -4315
		mu 0 4 2319 2325 2326 2320
		f 4 4327 -4326 4328 4329
		mu 0 4 2327 2326 2325 1726
		f 4 4330 4331 -3970 4332
		mu 0 4 2328 2329 2117 2118
		f 4 4333 4334 -4331 4335
		mu 0 4 2330 2331 2329 2328
		f 4 -4026 4336 4337 4338
		mu 0 4 2152 2151 2332 2333
		f 4 4339 4340 -3789 4341
		mu 0 4 2334 2335 2020 2006
		f 4 4342 4343 -3770 4344
		mu 0 4 2336 2337 2008 1919
		f 4 4345 -3784 4346 4347
		mu 0 4 2338 2005 2017 2339
		f 4 -4339 4348 4349 4350
		mu 0 4 2152 2333 2340 2341
		f 4 -4023 4351 4352 4353
		mu 0 4 2150 2149 2342 2343
		f 4 -4342 -3765 -4346 4354
		mu 0 4 2334 2006 2005 2338
		f 4 4355 4356 -3779 4357
		mu 0 4 2344 2345 2012 2015
		f 4 4358 -4356 4359 -4353
		mu 0 4 2342 2345 2344 2343
		f 4 4360 -4340 4361 -4338
		mu 0 4 2332 2335 2334 2333
		f 4 -4362 -4355 4362 -4349
		mu 0 4 2333 2334 2338 2340
		f 4 -4354 4363 -4337 -4044
		mu 0 4 2150 2343 2332 2151
		f 4 4364 -4361 -4364 -4360
		mu 0 4 2344 2335 2332 2343
		f 4 -4365 -4358 -3794 -4341
		mu 0 4 2335 2344 2015 2020
		f 4 4365 4366 -4363 -4348
		mu 0 4 2339 2346 2340 2338
		f 4 4367 -4350 -4367 4368
		mu 0 4 2347 2341 2340 2346
		f 4 4369 -4345 -3605 4370
		mu 0 4 2348 2336 1919 1918
		f 4 4371 4372 -4371 -3607
		mu 0 4 1920 2349 2348 1918
		f 4 4373 4374 4375 4376
		mu 0 4 2350 2351 2352 2353
		f 4 -4376 4377 -4343 4378
		mu 0 4 2353 2352 2337 2336
		f 4 4379 -4377 4380 4381
		mu 0 4 2354 2350 2353 2355
		f 4 -4381 -4379 -4370 4382
		mu 0 4 2355 2353 2336 2348
		f 4 4383 -4382 4384 4385
		mu 0 4 2356 2354 2355 2357
		f 4 -4385 -4383 -4373 4386
		mu 0 4 2357 2355 2348 2349
		f 4 4387 -4387 4388 4389
		mu 0 4 2358 2357 2349 2359
		f 4 4390 -4386 -4388 4391
		mu 0 4 2360 2356 2357 2358
		f 4 4392 -4389 -4372 -3609
		mu 0 4 1902 2359 2349 1920
		f 4 -4119 4393 -4390 4394
		mu 0 4 1930 2205 2358 2359
		f 4 -4395 -4393 -3571 -3624
		mu 0 4 1930 2359 1902 1901
		f 4 4395 -4392 -4394 4396
		mu 0 4 2361 2360 2358 2205
		f 4 -3326 -4397 -4125 -3334
		mu 0 4 1762 1763 2207 1768
		f 4 4397 -3525 -4300 4398
		mu 0 4 2362 1866 1869 2308
		f 4 -3563 -3547 4399 4400
		mu 0 4 1896 1884 1885 2363
		f 4 -3566 -4401 4401 4402
		mu 0 4 1898 1896 2363 2364
		f 4 4403 -4399 -4311 4404
		mu 0 4 2365 2362 2308 2317
		f 4 -4403 4405 4406 -3582
		mu 0 4 1898 2364 2366 1908
		f 4 -4405 -4316 4407 4408
		mu 0 4 2365 2317 2320 2367
		f 4 -4400 -3552 -4398 4409
		mu 0 4 2363 1885 1866 2362
		f 4 -4402 -4410 -4404 4410
		mu 0 4 2364 2363 2362 2365
		f 4 4411 -4406 -4411 -4409
		mu 0 4 2367 2366 2364 2365
		f 4 4412 -4330 -3259 4413
		mu 0 4 2368 2327 1726 1725
		f 4 4414 -4414 -3263 -3627
		mu 0 4 1932 2368 1725 1728
		f 4 -3638 -4407 4415 -4415
		mu 0 4 1932 1908 2366 2368
		f 4 -4413 -4416 -4412 4416
		mu 0 4 2327 2368 2366 2367
		f 4 -4417 -4408 -4327 -4328
		mu 0 4 2327 2367 2320 2326
		f 4 -3524 4417 4418 -4301
		mu 0 4 1869 1868 2369 2309
		f 4 4419 4420 4421 -4305
		mu 0 4 2312 2370 2371 2313
		f 4 4422 4423 4424 -4421
		mu 0 4 2370 2372 2373 2371
		f 4 4425 4426 -4418 -3527
		mu 0 4 1871 2374 2369 1868
		f 4 -3531 -4049 4427 4428
		mu 0 4 1875 1874 2165 2375
		f 4 4429 -4048 4430 4431
		mu 0 4 2376 2161 2164 2377
		f 4 4432 -4432 4433 -4424
		mu 0 4 2372 2376 2377 2373
		f 4 -3538 -4429 4434 -4426
		mu 0 4 1871 1875 2375 2374
		f 4 4435 4436 4437 4438
		mu 0 4 2378 2379 2380 2381
		f 4 4439 4440 4441 -4439
		mu 0 4 2381 2382 2383 2378
		f 4 4442 4443 4444 4445
		mu 0 4 2384 2385 2386 2387
		f 4 -4446 4446 -4437 4447
		mu 0 4 2384 2387 2380 2379
		f 4 4448 4449 -4440 4450
		mu 0 4 2388 2389 2382 2381
		f 4 4451 4452 -4451 -4438
		mu 0 4 2380 2390 2388 2381
		f 4 -4445 7148 7146 4453
		mu 0 4 2387 2386 2391 2392
		f 4 4454 -4452 -4447 -4454
		mu 0 4 2392 2390 2380 2387
		f 4 4455 4456 -3346 4457
		mu 0 4 2393 2394 1778 1777
		f 4 4458 4459 -4456 4460
		mu 0 4 2395 2396 2394 2393
		f 4 -3424 4461 4462 -3517
		mu 0 4 1828 1827 2397 1767
		f 4 4463 -4458 -3364 4464
		mu 0 4 2398 2393 1777 1775
		f 4 4465 -4461 -4464 4466
		mu 0 4 2399 2395 2393 2398
		f 4 4467 -4465 -3345 4468
		mu 0 4 2400 2398 1775 1774
		f 4 4469 -4467 -4468 4470
		mu 0 4 2401 2399 2398 2400
		f 4 4471 -4469 -3340 4472
		mu 0 4 2402 2400 1774 1773
		f 4 4473 -4471 -4472 4474
		mu 0 4 2403 2401 2400 2402
		f 4 4475 -1890 4476 4477
		mu 0 4 2404 1068 1067 2405
		f 4 -3374 -1893 -4476 4478
		mu 0 4 1793 423 1068 2404
		f 4 4479 4480 -3370 -4479
		mu 0 4 2404 2406 1786 1793
		f 4 4481 4482 -4480 -4478
		mu 0 4 2405 2407 2406 2404
		f 4 4483 -4473 -3359 -4481
		mu 0 4 2406 2402 1773 1786
		f 4 4484 -4475 -4484 -4483
		mu 0 4 2407 2403 2402 2406
		f 4 4485 4486 -3475 -4457
		mu 0 4 2394 2408 1849 1778
		f 4 4487 4488 -4486 -4460
		mu 0 4 2396 2409 2408 2394
		f 4 4489 -4462 -3477 -4487
		mu 0 4 2408 2397 1827 1849
		f 4 4490 4491 -4490 -4489
		mu 0 4 2409 2410 2397 2408
		f 4 4492 4493 4494 4495
		mu 0 4 2411 2412 2413 1752
		f 4 4496 4497 4498 -4494
		mu 0 4 2412 2414 2415 2413
		f 4 4499 -4496 -3311 -3332
		mu 0 4 1767 2411 1752 1755
		f 4 -4463 -4492 4500 -4500
		mu 0 4 1767 2397 2410 2411
		f 4 -4501 4501 4502 -4493
		mu 0 4 2411 2410 2416 2412
		f 4 -4497 -4503 4503 4504
		mu 0 4 2414 2412 2416 2417
		f 4 4505 4506 -4498 4507
		mu 0 4 2418 2419 2415 2414
		f 4 -4508 -4505 4508 4509
		mu 0 4 2418 2414 2417 2420
		f 4 4510 4511 -4506 4512
		mu 0 4 2421 2422 2419 2418
		f 4 -4510 4513 4514 -4513
		mu 0 4 2418 2420 2423 2421
		f 4 -4444 4517 -4511 -4516
		mu 0 4 2386 2385 2422 2421
		f 4 4518 4519 4520 -3320
		mu 0 4 1753 2415 2424 1758
		f 4 -4495 -4499 -4519 -3308
		mu 0 4 1752 2413 2415 1753
		f 4 4521 4522 -4037 4523
		mu 0 4 2425 2426 2159 2157
		f 4 4524 4525 -4524 -4036
		mu 0 4 2146 2427 2425 2157
		f 4 4526 4527 4528 4529
		mu 0 4 2428 2429 2430 2431
		f 4 4530 4531 4532 4533
		mu 0 4 2432 2433 2434 2435
		f 4 -4533 4534 4535 4536
		mu 0 4 2435 2434 2436 2437
		f 4 4537 4538 -4522 4539
		mu 0 4 2438 2439 2426 2425
		f 4 4540 -4540 -4526 4541
		mu 0 4 2440 2438 2425 2427
		f 4 4542 -4530 4543 4544
		mu 0 4 2441 2428 2431 2442
		f 4 4545 -4544 4546 -4537
		mu 0 4 2437 2442 2431 2435
		f 4 -4529 4547 -4534 -4547
		mu 0 4 2431 2430 2432 2435
		f 4 4548 4549 -4525 -4018
		mu 0 4 2145 2443 2427 2146
		f 4 -4351 4550 -4549 -4027
		mu 0 4 2152 2341 2443 2145
		f 4 4551 -4551 -4368 4552
		mu 0 4 2444 2443 2341 2347
		f 4 4553 4554 -4545 4555
		mu 0 4 2445 2446 2441 2442
		f 4 4556 -4542 -4550 -4552
		mu 0 4 2444 2440 2427 2443
		f 4 -4556 -4546 4557 4558
		mu 0 4 2445 2442 2437 2447
		f 4 -4536 4559 4560 -4558
		mu 0 4 2437 2436 2448 2447
		f 4 -4561 4561 -4374 4562
		mu 0 4 2447 2448 2351 2350
		f 4 4563 -4273 -4357 4564
		mu 0 4 2449 2294 2012 2345
		f 4 -4016 -4126 4565 4566
		mu 0 4 2144 2143 2208 2450
		f 4 4567 4568 -4022 -4567
		mu 0 4 2450 2451 2149 2144
		f 4 4569 -4352 -4569 4570
		mu 0 4 2452 2342 2149 2451
		f 4 4571 -4565 -4359 -4570
		mu 0 4 2452 2449 2345 2342
		f 4 4572 -4276 4573 4574
		mu 0 4 2453 2036 2295 2454
		f 4 -4574 -4279 4575 4576
		mu 0 4 2454 2295 2297 2455
		f 4 4577 -4287 4578 4579
		mu 0 4 2456 2303 2302 2457
		f 4 4580 -4293 -4578 4581
		mu 0 4 2458 2306 2303 2456
		f 4 -4132 -3820 -4573 4582
		mu 0 4 2212 2034 2036 2453
		f 4 -4576 4583 -4580 4584
		mu 0 4 2455 2297 2456 2457
		f 4 4585 -4582 -4584 -4281
		mu 0 4 2298 2458 2456 2297
		f 4 -4579 -4299 -4564 4586
		mu 0 4 2457 2302 2294 2449
		f 4 -4566 -4138 -4583 4587
		mu 0 4 2450 2208 2212 2453
		f 4 -4575 4588 -4568 -4588
		mu 0 4 2453 2454 2451 2450
		f 4 -4571 -4589 -4577 4589
		mu 0 4 2452 2451 2454 2455
		f 4 -4585 -4587 -4572 -4590
		mu 0 4 2455 2457 2449 2452
		f 4 -3214 4590 4591 -3647
		mu 0 4 1693 1692 2459 1940
		f 4 4592 4593 -4591 -3220
		mu 0 4 1697 2460 2459 1692
		f 4 4594 4595 -4593 -3228
		mu 0 4 1701 2461 2460 1697
		f 4 -4595 -3967 4596 4597
		mu 0 4 2461 1701 2116 2462
		f 4 -3664 -4592 4598 4599
		mu 0 4 1953 1940 2459 2463
		f 4 -4599 -4594 4600 4601
		mu 0 4 2463 2459 2460 2464
		f 4 -4601 -4596 4602 4603
		mu 0 4 2464 2460 2461 2465
		f 4 -4603 -4598 4604 4605
		mu 0 4 2465 2461 2462 2466
		f 4 -4606 4606 -4146 4607
		mu 0 4 2465 2466 2221 2220
		f 4 -4604 -4608 -4150 4608
		mu 0 4 2464 2465 2220 2222
		f 4 4609 -4149 -4161 4610
		mu 0 4 2467 2222 2216 2226
		f 4 -4602 -4609 -4610 4611
		mu 0 4 2463 2464 2222 2467
		f 4 4612 -4611 -4159 -3676
		mu 0 4 1960 2467 2226 1730
		f 4 -4600 -4612 -4613 -3678
		mu 0 4 1953 2463 2467 1960
		f 4 -4442 4613 4614 4615
		mu 0 4 2468 2469 2470 2471
		f 4 -4436 -4616 4616 4617
		mu 0 4 2472 2468 2471 2473
		f 4 -4617 4618 -4543 4619
		mu 0 4 2473 2471 2428 2441
		f 4 -4615 4620 -4527 -4619
		mu 0 4 2471 2470 2429 2428
		f 4 -4448 -4618 4621 4622
		mu 0 4 2474 2472 2473 2475
		f 4 -4622 -4620 -4555 4623
		mu 0 4 2475 2473 2441 2446
		f 4 -4623 4624 4625 -4443
		mu 0 4 2474 2475 2476 2477
		f 4 4626 4627 4628 4629
		mu 0 4 1973 1909 2478 2479
		f 4 -3555 -3989 4630 4631
		mu 0 4 1889 1888 2131 2480
		f 4 -4630 4632 -3869 -3711
		mu 0 4 1973 2479 2065 1974
		f 4 -4632 4633 -4628 -3584
		mu 0 4 1889 2480 2478 1909
		f 4 4634 4635 4636 4637
		mu 0 4 2481 2482 2483 2484
		f 4 4638 4639 4640 -2053
		mu 0 4 1151 2485 2486 1152
		f 4 4641 4642 -4639 -2057
		mu 0 4 1155 2487 2485 1151
		f 4 -3997 4643 -4637 4644
		mu 0 4 2135 2136 2484 2483
		f 4 -4641 4645 -3993 -2062
		mu 0 4 1152 2486 2134 780
		f 4 4646 -4631 -4003 -4645
		mu 0 4 2483 2480 2131 2135
		f 4 -4636 4647 -4634 -4647
		mu 0 4 2483 2482 2478 2480
		f 4 -4635 4648 4649 4650
		mu 0 4 2482 2481 2488 2489
		f 4 4651 -4629 -4648 -4651
		mu 0 4 2489 2479 2478 2482
		f 4 -3872 4652 4653 -2070
		mu 0 4 704 2067 2490 1159
		f 4 -4654 4654 -4642 -2073
		mu 0 4 1159 2490 2487 1155
		f 4 4655 -4650 4656 4657
		mu 0 4 2073 2489 2488 2491
		f 4 -4658 4658 -3881 -3882
		mu 0 4 2073 2491 2072 2071
		f 4 -4656 -3883 -4633 -4652
		mu 0 4 2489 2073 2065 2479
		f 4 4659 4660 -4050 -3530
		mu 0 4 1873 2492 2166 1874
		f 4 -3714 -3758 -3585 -4627
		mu 0 4 1973 1976 1910 1909
		f 4 4661 -3740 -4056 4662
		mu 0 4 2493 1990 1991 2170
		f 4 4663 -4663 -4063 4664
		mu 0 4 2494 2493 2170 2176
		f 4 -3615 4665 -3534 -3610
		mu 0 4 1921 1924 1878 1877
		f 4 4666 4667 -4665 -4074
		mu 0 4 2181 2495 2494 2176
		f 4 -4661 4668 -4667 -4076
		mu 0 4 2166 2492 2495 2181
		f 4 4669 -4669 4670 -3618
		mu 0 4 1926 2495 2492 1924
		f 4 -4671 -4660 -3548 -4666
		mu 0 4 1924 2492 1873 1878
		f 4 4671 -3586 -3757 -4662
		mu 0 4 2493 1886 1910 1990
		f 4 -4672 -4664 4672 -3553
		mu 0 4 1886 2493 2494 1887
		f 4 -3645 -4673 -4668 -4670
		mu 0 4 1926 1887 2494 2495
		f 4 -4507 4673 4674 -4520
		mu 0 4 2496 2497 2498 2499
		f 4 4675 4676 -4674 -4512
		mu 0 4 2500 2501 2498 2497
		f 4 -4675 4677 4678 4679
		mu 0 4 2499 2498 2502 2503
		f 4 -4518 -4626 4680 -4676
		mu 0 4 2500 2477 2476 2501
		f 4 -4681 4681 4682 4683
		mu 0 4 2501 2476 2504 2505
		f 4 -4677 -4684 4684 -4678
		mu 0 4 2498 2501 2505 2502
		f 4 -4624 4685 -4682 -4625
		mu 0 4 2475 2446 2504 2476
		f 4 4686 -4686 -4554 4687
		mu 0 4 2506 2504 2446 2445
		f 4 4688 -4688 -4559 4689
		mu 0 4 2507 2506 2445 2447
		f 4 4690 4691 4692 -4679
		mu 0 4 2502 2508 2509 2503
		f 4 4693 -4691 -4685 4694
		mu 0 4 2510 2508 2502 2505
		f 4 4695 4696 -4689 4697
		mu 0 4 2511 2510 2506 2507
		f 4 -4697 -4695 -4683 -4687
		mu 0 4 2506 2510 2505 2504
		f 4 -4694 -4696 4698 4699
		mu 0 4 2508 2510 2511 2512
		f 4 -4690 -4563 -4380 4700
		mu 0 4 2507 2447 2350 2354
		f 4 -4384 4701 -4698 -4701
		mu 0 4 2354 2356 2511 2507
		f 4 4702 -4699 -4702 -4391
		mu 0 4 2360 2512 2511 2356
		f 4 -3328 4703 -4703 -4396
		mu 0 4 2361 2513 2512 2360
		f 4 -4704 -3330 -4692 -4700
		mu 0 4 2512 2513 2509 2508
		f 4 4704 -4693 -3329 -3318
		mu 0 4 1759 2514 1765 1760
		f 4 -3315 -4521 -4680 -4705
		mu 0 4 1759 1758 2424 2514
		f 4 4705 -3377 4706 -3110
		mu 0 4 1635 1797 1796 1636
		f 4 -4707 -3395 -3470 -3123
		mu 0 4 1636 1796 1808 1640
		f 4 4707 -3863 4708 -3129
		mu 0 4 1617 2062 2043 1643
		f 4 4709 -3832 -4706 -3124
		mu 0 4 1641 2042 1797 1635
		f 4 -4709 -3829 -4710 -3132
		mu 0 4 1643 2043 2042 1641
		f 4 -4708 -3065 -3275 -3865
		mu 0 4 2062 1617 1452 1733
		f 4 4710 4711 4712 4713
		mu 0 4 2515 2516 2517 2518
		f 4 4714 4715 -4711 4716
		mu 0 4 2519 2520 2516 2515
		f 4 4717 4718 -4715 4719
		mu 0 4 2521 2522 2520 2519
		f 4 4720 4721 4722 4723
		mu 0 4 2523 2524 2525 2526
		f 4 4724 4725 4726 4727
		mu 0 4 2527 2528 2529 2530
		f 4 4728 4729 -4725 4730
		mu 0 4 2531 2532 2528 2527
		f 4 -4713 4731 4732 4733
		mu 0 4 2518 2517 2533 2534
		f 4 -4733 4734 -4729 4735
		mu 0 4 2534 2533 2532 2531
		f 4 4736 4737 -4721 4738
		mu 0 4 2535 2536 2524 2523
		f 4 -4727 4739 -4737 4740
		mu 0 4 2530 2529 2536 2535
		f 4 4741 -3150 4742 -4712
		mu 0 4 2516 1657 1656 2517
		f 4 4743 -3162 -4742 -4716
		mu 0 4 2520 1665 1657 2516
		f 4 4744 -3160 -4744 -4719
		mu 0 4 2522 1662 1665 2520
		f 4 4745 -3185 -4745 4746
		mu 0 4 2525 1666 1662 2522
		f 4 4747 -3164 -4746 -4722
		mu 0 4 2524 1667 1666 2525
		f 4 4748 -3208 -4748 -4738
		mu 0 4 2536 1688 1667 2524
		f 4 4749 -3210 -4749 -4740
		mu 0 4 2529 1680 1688 2536
		f 4 4750 -3189 -4750 -4726
		mu 0 4 2528 1678 1680 2529
		f 4 4751 -3192 -4751 -4730
		mu 0 4 2532 1681 1678 2528
		f 4 4752 -3196 -4752 -4735
		mu 0 4 2533 1684 1681 2532
		f 4 -4743 -3194 -4753 -4732
		mu 0 4 2517 1656 1684 2533
		f 4 -4718 4753 -4723 -4747
		mu 0 4 2522 2521 2526 2525
		f 4 -3335 -4124 -3271 -2762
		mu 0 4 1428 1768 1731 1431
		f 3 -3134 -4190 -3013
		mu 0 3 1573 1644 1539
		f 3 -3015 -4192 -3133
		mu 0 3 1582 1588 1644
		f 4 -2693 4754 -2642 -2763
		mu 0 4 1430 1429 1397 1396
		f 4 -4755 -2696 -2870 -2646
		mu 0 4 1397 1429 1432 1400
		f 4 -3735 4755 4756 -3741
		mu 0 4 1988 1987 2537 1992
		f 4 -3733 -3752 4757 -4756
		mu 0 4 1987 1984 2000 2537
		f 4 -3732 4758 -3730 -3756
		mu 0 4 1983 1986 1975 1985
		f 4 -3759 -3713 -4759 -3737
		mu 0 4 1989 1976 1975 1986
		f 4 4759 -3248 4760 -3250
		mu 0 4 1719 1716 1714 1709
		f 4 4761 -3685 -4760 -3686
		mu 0 4 1956 1954 1716 1719
		f 4 -3669 4762 -3666 -4762
		mu 0 4 1956 1948 1945 1954
		f 4 4763 -3653 -4763 -3655
		mu 0 4 1947 1942 1945 1948
		f 4 4764 -3722 -4764 -3719
		mu 0 4 1980 1981 1942 1947
		f 4 -4765 -3753 4765 -3751
		mu 0 4 1981 1980 1998 2000
		f 4 -4766 -3748 4766 -4758
		mu 0 4 2000 1998 1995 2537
		f 4 -4767 -3744 4767 -4757
		mu 0 4 2537 1995 1994 1992
		f 4 -4768 -4053 4768 -3742
		mu 0 4 1992 1994 2168 1993
		f 4 -4769 -4066 4769 -4057
		mu 0 4 1993 2168 2173 2171
		f 4 -4770 -4059 4770 -4064
		mu 0 4 2171 2173 2172 2177
		f 4 4771 -4075 -4771 -4069
		mu 0 4 2179 2180 2177 2172
		f 4 4772 -4077 -4772 -4071
		mu 0 4 2162 2167 2180 2179
		f 4 -4773 -4045 4773 -4052
		mu 0 4 2167 2162 2161 2165
		f 4 -4774 -4430 4774 -4428
		mu 0 4 2165 2161 2376 2375
		f 4 -4775 -4433 4775 -4435
		mu 0 4 2375 2376 2372 2374
		f 4 -4776 -4423 4776 -4427
		mu 0 4 2374 2372 2370 2369
		f 4 -4777 -4420 4777 -4419
		mu 0 4 2369 2370 2312 2309
		f 4 -4778 -4304 4778 -4302
		mu 0 4 2309 2312 2311 2310
		f 4 -4779 -4308 4779 -4312
		mu 0 4 2310 2311 2315 2318
		f 4 -4318 4780 -4314 -4780
		mu 0 4 2315 2322 2319 2318
		f 4 4781 -4325 -4781 -4321
		mu 0 4 2324 2325 2319 2322
		f 4 4782 -4329 -4782 -4323
		mu 0 4 1712 1726 2325 2324
		f 4 -4783 -3240 4783 -3260
		mu 0 4 1726 1712 1710 1715
		f 4 -4761 -3245 -4784 -3237
		mu 0 4 1709 1714 1715 1710
		f 4 4784 -4714 4785 4786
		mu 0 4 2538 2515 2518 2539
		f 4 4787 -4717 -4785 4788
		mu 0 4 2540 2519 2515 2538
		f 4 4789 -4720 -4788 4790
		mu 0 4 2541 2521 2519 2540
		f 4 4791 -4724 4792 4793
		mu 0 4 2542 2523 2526 2543
		f 4 4794 -4728 4795 4796
		mu 0 4 2544 2527 2530 2545
		f 4 4797 -4731 -4795 4798
		mu 0 4 2546 2531 2527 2544
		f 4 -4786 -4734 4799 4800
		mu 0 4 2539 2518 2534 2547
		f 4 -4800 -4736 -4798 4801
		mu 0 4 2547 2534 2531 2546
		f 4 4802 -4739 -4792 4803
		mu 0 4 2548 2535 2523 2542
		f 4 -4796 -4741 -4803 4804
		mu 0 4 2545 2530 2535 2548
		f 4 -4793 -4754 -4790 4805
		mu 0 4 2543 2526 2521 2541
		f 4 4806 4807 -4797 -4805
		mu 0 4 2548 2549 2544 2545
		f 4 -4806 4808 4809 -4794
		mu 0 4 2543 2541 2550 2542
		f 4 -4810 4810 -4807 -4804
		mu 0 4 2542 2550 2549 2548
		f 4 -4808 4811 -4802 -4799
		mu 0 4 2544 2549 2547 2546
		f 4 -4811 4812 -4801 -4812
		mu 0 4 2549 2550 2539 2547
		f 4 4813 -4789 -4787 -4813
		mu 0 4 2550 2540 2538 2539
		f 3 -4809 -4791 -4814
		mu 0 3 2550 2541 2540
		f 4 4814 -3242 4815 4816
		mu 0 4 2551 1711 1713 2552
		f 4 4817 -3239 -4815 4818
		mu 0 4 2553 1708 1711 2551
		f 4 4819 -3251 -4818 4820
		mu 0 4 2554 1718 1708 2553
		f 4 4821 -3657 4822 4823
		mu 0 4 2555 1946 1949 2556
		f 4 -4823 -3671 4824 4825
		mu 0 4 2556 1949 1957 2557
		f 4 -4825 -3687 -4820 4826
		mu 0 4 2557 1957 1718 2554
		f 4 4827 -3720 -4822 4828
		mu 0 4 2558 1979 1946 2555
		f 4 4829 -3746 4830 4831
		mu 0 4 2559 1997 1996 2560
		f 4 -4831 -3750 4832 4833
		mu 0 4 2560 1996 1999 2561
		f 4 -4833 -3754 -4828 4834
		mu 0 4 2561 1999 1979 2558
		f 4 4835 -4047 4836 4837
		mu 0 4 2562 2164 2163 2563
		f 4 4838 -4054 -4830 4839
		mu 0 4 2564 2169 1997 2559
		f 4 4840 -4061 4841 4842
		mu 0 4 2565 2175 2174 2566
		f 4 -4842 -4067 -4839 4843
		mu 0 4 2566 2174 2169 2564
		f 4 4844 -4070 -4841 4845
		mu 0 4 2567 2178 2175 2565
		f 4 -4837 -4072 -4845 4846
		mu 0 4 2563 2163 2178 2567
		f 4 4847 -4306 4848 4849
		mu 0 4 2568 2314 2313 2569
		f 4 4850 -4309 -4848 4851
		mu 0 4 2570 2316 2314 2568
		f 4 4852 -4319 -4851 4853
		mu 0 4 2571 2321 2316 2570
		f 4 -4816 -4324 4854 4855
		mu 0 4 2552 1713 2323 2572
		f 4 -4855 -4322 -4853 4856
		mu 0 4 2572 2323 2321 2571
		f 4 -4849 -4422 4857 4858
		mu 0 4 2569 2313 2371 2573
		f 4 -4858 -4425 4859 4860
		mu 0 4 2573 2371 2373 2574
		f 4 4861 -4431 -4836 4862
		mu 0 4 2575 2377 2164 2562
		f 4 -4860 -4434 -4862 4863
		mu 0 4 2574 2373 2377 2575
		f 4 4864 -4817 4865 4866
		mu 0 4 2576 2551 2552 2577
		f 4 4867 -4819 -4865 4868
		mu 0 4 2578 2553 2551 2576
		f 4 4869 -4821 -4868 4870
		mu 0 4 2579 2554 2553 2578
		f 4 4871 -4824 4872 4873
		mu 0 4 2580 2555 2556 2581
		f 4 -4873 -4826 4874 4875
		mu 0 4 2581 2556 2557 2582
		f 4 -4875 -4827 -4870 4876
		mu 0 4 2582 2557 2554 2579
		f 4 4877 -4829 -4872 4878
		mu 0 4 2583 2558 2555 2580
		f 4 4879 -4832 4880 4881
		mu 0 4 2584 2559 2560 2585
		f 4 -4881 -4834 4882 4883
		mu 0 4 2585 2560 2561 2586
		f 4 -4883 -4835 -4878 4884
		mu 0 4 2586 2561 2558 2583
		f 4 4885 -4838 4886 4887
		mu 0 4 2587 2562 2563 2588
		f 4 4888 -4840 -4880 4889
		mu 0 4 2589 2564 2559 2584
		f 4 4890 -4843 4891 4892
		mu 0 4 2590 2565 2566 2591
		f 4 -4892 -4844 -4889 4893
		mu 0 4 2591 2566 2564 2589
		f 4 4894 -4846 -4891 4895
		mu 0 4 2592 2567 2565 2590
		f 4 -4887 -4847 -4895 4896
		mu 0 4 2588 2563 2567 2592
		f 4 4897 -4850 4898 4899
		mu 0 4 2593 2568 2569 2594
		f 4 4900 -4852 -4898 4901
		mu 0 4 2595 2570 2568 2593
		f 4 4902 -4854 -4901 4903
		mu 0 4 2596 2571 2570 2595
		f 4 -4866 -4856 4904 4905
		mu 0 4 2577 2552 2572 2597
		f 4 -4905 -4857 -4903 4906
		mu 0 4 2597 2572 2571 2596
		f 4 -4899 -4859 4907 4908
		mu 0 4 2594 2569 2573 2598
		f 4 -4908 -4861 4909 4910
		mu 0 4 2598 2573 2574 2599
		f 4 4911 -4863 -4886 4912
		mu 0 4 2600 2575 2562 2587
		f 4 -4910 -4864 -4912 4913
		mu 0 4 2599 2574 2575 2600
		f 4 4914 -4347 4915 -4344
		mu 0 4 2337 2339 2017 2008
		f 4 4916 -4366 -4915 -4378
		mu 0 4 2352 2346 2339 2337
		f 4 -4375 4917 -4369 -4917
		mu 0 4 2352 2351 2347 2346
		f 4 4918 -4553 -4918 -4562
		mu 0 4 2448 2444 2347 2351
		f 4 4919 -4557 -4919 -4560
		mu 0 4 2436 2440 2444 2448
		f 4 4920 -4541 -4920 -4535
		mu 0 4 2434 2438 2440 2436
		f 4 -4532 4921 -4538 -4921
		mu 0 4 2434 2433 2439 2438
		f 4 -3977 4922 -4009 -2342
		mu 0 4 767 2123 2139 787
		f 4 -3983 4923 -3979 4924
		mu 0 4 2128 2127 2125 2124
		f 4 -4924 -4001 4925 -3999
		mu 0 4 2125 2127 2028 2029
		f 4 -4926 -3810 4926 -3811
		mu 0 4 2029 2028 2027 2030
		f 4 -3807 4927 -3815 -4927
		mu 0 4 2027 2023 2024 2030
		f 4 -3798 4928 -3800 -4928
		mu 0 4 2023 2022 2018 2024
		f 4 4929 -3786 -4929 -3796
		mu 0 4 2009 2016 2018 2022
		f 4 -3771 -4916 -3783 -4930
		mu 0 4 2009 2008 2017 2016
		f 4 4930 -4089 4931 -2351
		mu 0 4 1271 2187 2188 1272
		f 4 -4932 -4134 4932 -2354
		mu 0 4 1272 2188 2213 1273
		f 4 -4933 -4137 4933 -2356
		mu 0 4 1273 2213 2210 1274
		f 4 -4129 4934 -2358 -4934
		mu 0 4 2210 2155 1275 1274
		f 4 -4935 -4033 4935 -2360
		mu 0 4 1275 2155 2156 1276
		f 4 -4936 -4041 4936 -2362
		mu 0 4 1276 2156 2160 1277
		f 4 4937 -2364 -4937 -4038
		mu 0 4 2159 1278 1277 2160
		f 4 -4523 4938 -2366 -4938
		mu 0 4 2159 2426 1279 1278
		f 4 4939 -2368 -4939 -4539
		mu 0 4 2439 1280 1279 2426
		f 4 4940 -2370 -4940 -4922
		mu 0 4 2433 1281 1280 2439
		f 4 -4941 -4531 4941 -2372
		mu 0 4 1281 2433 2432 1282
		f 4 -4548 4942 -2374 -4942
		mu 0 4 2432 2430 1283 1282
		f 4 -4528 4943 -2376 -4943
		mu 0 4 2430 2429 1284 1283
		f 4 4944 -2378 -4944 -4621
		mu 0 4 2470 1285 1284 2429
		f 4 4945 -2380 -4945 -4614
		mu 0 4 2469 1286 1285 2470
		f 4 -4441 4946 -2382 -4946
		mu 0 4 2383 2382 1288 1287
		f 4 -4450 4947 -2384 -4947
		mu 0 4 2382 2389 1289 1288
		f 4 4948 4949 4950 4951
		mu 0 4 2601 2054 2602 2603
		f 4 4952 -4216 4953 4954
		mu 0 4 2287 2258 2257 2330
		f 4 4955 4956 -4143 4957
		mu 0 4 2604 2605 2219 2218
		f 4 -4957 -4218 -3840 -4166
		mu 0 4 2219 2605 2050 2049
		f 4 -4204 4958 -4172 -2396
		mu 0 4 905 2249 2230 883
		f 4 4959 -4178 4960 -4207
		mu 0 4 2251 2233 2236 2252
		f 4 4961 -4180 -4960 -4210
		mu 0 4 2244 2229 2233 2251
		f 4 4962 -4169 -4962 -4197
		mu 0 4 2242 2112 2229 2244
		f 4 4963 -3961 -4963 -4194
		mu 0 4 2241 2109 2112 2242
		f 4 4964 -3964 -4964 -4201
		mu 0 4 2247 2113 2109 2241
		f 4 -4965 -4214 4965 -3969
		mu 0 4 2113 2247 2255 2118
		f 4 4966 -4333 -4966 -4258
		mu 0 4 2285 2328 2118 2255
		f 4 -4955 -4336 -4967 -4261
		mu 0 4 2287 2330 2328 2285
		f 4 -4171 4967 -4173 -2406
		mu 0 4 1295 2606 2232 886
		f 4 4968 -4183 4969 -4176
		mu 0 4 2607 2237 2238 2608
		f 4 4970 -4185 -4969 -4179
		mu 0 4 2609 2239 2237 2607
		f 4 4971 -4186 -4971 -4167
		mu 0 4 2610 2115 2239 2609
		f 4 4972 -3966 -4972 -3959
		mu 0 4 2611 2116 2115 2610
		f 4 4973 -4597 -4973 -3963
		mu 0 4 2612 2462 2116 2611
		f 4 -4974 -3968 4974 -4605
		mu 0 4 2462 2612 2613 2466
		f 4 4975 -4607 -4975 -4332
		mu 0 4 2614 2221 2466 2613
		f 4 -4958 -4147 -4976 -4335
		mu 0 4 2604 2218 2221 2614
		f 4 -4215 -4956 -4334 -4954
		mu 0 4 2257 2256 2331 2330
		f 4 4976 -3853 -3850 -4949
		mu 0 4 2601 2045 2057 2054
		f 4 -4977 4977 4978 -3835
		mu 0 4 2045 2601 2290 2046
		f 4 -4951 4979 4980 4981
		mu 0 4 2603 2602 2286 2291
		f 4 4982 -4950 -3844 -4217
		mu 0 4 2258 2602 2054 2053
		f 4 -4979 -4269 4983 -3837
		mu 0 4 2046 2290 2288 2047
		f 4 -4984 -4266 4984 -4263
		mu 0 4 2047 2288 2282 2281
		f 4 -4254 4985 -4252 -4985
		mu 0 4 2282 2269 2265 2281
		f 4 -4230 4986 -4226 -4986
		mu 0 4 2269 2268 2266 2265
		f 4 -4234 4987 -4233 -4987
		mu 0 4 2268 2263 2259 2266
		f 4 -4223 4988 -4219 -4988
		mu 0 4 2263 2262 2260 2259
		f 4 -4245 4989 -4242 -4989
		mu 0 4 2262 2277 2275 2260
		f 4 -4250 4990 -4247 -4990
		mu 0 4 2277 2280 2278 2275
		f 4 4991 -4236 -2431 -4241
		mu 0 4 2274 2271 928 933
		f 4 -4981 -4262 4992 -4268
		mu 0 4 2291 2286 2284 2289
		f 4 -4993 -4259 4993 -4265
		mu 0 4 2289 2284 2254 2283
		f 4 -4212 4994 -4256 -4994
		mu 0 4 2254 2246 2270 2283
		f 4 -4995 -4202 4995 -4232
		mu 0 4 2270 2246 2240 2267
		f 4 -4996 -4196 4996 -4235
		mu 0 4 2267 2240 2243 2264
		f 4 -4997 -4199 4997 -4225
		mu 0 4 2264 2243 2245 2261
		f 4 -4998 -4211 4998 -4246
		mu 0 4 2261 2245 2250 2276
		f 4 -4999 -4209 4999 -4251
		mu 0 4 2276 2250 2253 2279
		f 4 5000 -4205 -2441 -4238
		mu 0 4 2272 2248 904 929
		f 4 -4983 -4953 -4260 -4980
		mu 0 4 2602 2258 2287 2286
		f 4 -4978 -4952 -4982 -4267
		mu 0 4 2290 2601 2603 2291
		f 4 5001 -3821 5002 5003
		mu 0 4 2615 2037 2033 2616
		f 4 -5003 -3816 5004 5005
		mu 0 4 2616 2033 2032 2617
		f 4 5006 -4280 5007 5008
		mu 0 4 2618 2298 2296 2619
		f 4 -5008 -4277 -5002 5009
		mu 0 4 2619 2296 2037 2615
		f 4 5010 -4092 5011 5012
		mu 0 4 2620 2192 2191 2621
		f 4 -5012 -4112 5013 5014
		mu 0 4 2621 2191 2197 2622
		f 4 -5014 -4099 5015 5016
		mu 0 4 2622 2197 2196 2623
		f 4 -5016 -4106 5017 5018
		mu 0 4 2623 2196 2201 2624
		f 4 5019 -4296 5020 5021
		mu 0 4 2625 2301 2307 2626
		f 4 -5021 -4291 5022 5023
		mu 0 4 2626 2307 2306 2627
		f 4 -5018 -4285 -5020 5024
		mu 0 4 2624 2201 2301 2625
		f 4 -5023 -4581 5025 5026
		mu 0 4 2627 2306 2458 2628
		f 4 -5026 -4586 -5007 5027
		mu 0 4 2628 2458 2298 2618
		f 4 -5005 -4087 5028 5029
		mu 0 4 2617 2032 2187 2629
		f 4 -5006 5030 5031 -5004
		mu 0 4 2616 2617 2630 2615
		f 4 5032 -5009 5033 5034
		mu 0 4 2631 2618 2619 2632
		f 4 -5034 -5010 -5032 5035
		mu 0 4 2632 2619 2615 2630
		f 4 -5013 5036 -2481 5037
		mu 0 4 2620 2621 1325 1324
		f 4 -5037 -5015 5038 5039
		mu 0 4 1325 2621 2622 2633
		f 4 -5019 5040 -5039 -5017
		mu 0 4 2623 2624 2633 2622
		f 4 -5024 5041 5042 -5022
		mu 0 4 2626 2627 2634 2625
		f 4 -5041 -5025 -5043 5043
		mu 0 4 2633 2624 2625 2634
		f 4 -5042 -5027 5044 5045
		mu 0 4 2634 2627 2628 2635
		f 4 -5045 -5028 -5033 5046
		mu 0 4 2635 2628 2618 2631
		f 4 -5031 -5030 5047 5048
		mu 0 4 2630 2617 2629 1329
		f 4 5049 -5035 5050 5051
		mu 0 4 2636 2631 2632 2637
		f 4 -5051 -5036 5052 5053
		mu 0 4 2637 2632 2630 2638
		f 4 -2501 -5040 5054 5055
		mu 0 4 1333 1325 2633 2639
		f 4 -5055 -5044 5056 5057
		mu 0 4 2639 2633 2634 2640
		f 4 -5057 -5046 5058 5059
		mu 0 4 2640 2634 2635 2641
		f 4 -5059 -5047 -5050 5060
		mu 0 4 2641 2635 2631 2636
		f 4 -5053 -5049 -2508 5061
		mu 0 4 2638 2630 1329 1337
		f 4 5062 -5052 5063 5064
		mu 0 4 2642 2636 2637 2643
		f 4 -5064 -5054 5065 5066
		mu 0 4 2643 2637 2638 2644
		f 4 -2516 -5056 5067 5068
		mu 0 4 1341 1333 2639 2645
		f 4 -5068 -5058 5069 5070
		mu 0 4 2645 2639 2640 2646
		f 4 -5070 -5060 5071 5072
		mu 0 4 2646 2640 2641 2647
		f 4 -5072 -5061 -5063 5073
		mu 0 4 2647 2641 2636 2642
		f 4 -5066 -5062 -2523 5074
		mu 0 4 2644 2638 1337 1345
		f 4 5075 -5065 5076 5077
		mu 0 4 2648 2642 2643 2649
		f 4 -5077 -5067 5078 5079
		mu 0 4 2649 2643 2644 2650
		f 4 -2531 -5069 5080 5081
		mu 0 4 1349 1341 2645 2651
		f 4 -5081 -5071 5082 5083
		mu 0 4 2651 2645 2646 2652
		f 4 -5083 -5073 5084 5085
		mu 0 4 2652 2646 2647 2653
		f 4 -5085 -5074 -5076 5086
		mu 0 4 2653 2647 2642 2648
		f 4 -5079 -5075 -2538 5087
		mu 0 4 2650 2644 1345 1353;
	setAttr ".fc[2500:2999]"
		f 4 5088 -5078 5089 5090
		mu 0 4 2654 2648 2649 2655
		f 4 -5090 -5080 5091 5092
		mu 0 4 2655 2649 2650 2656
		f 4 -2546 -5082 5093 5094
		mu 0 4 1357 1349 2651 2657
		f 4 -5094 -5084 5095 5096
		mu 0 4 2657 2651 2652 2658
		f 4 -5096 -5086 5097 5098
		mu 0 4 2658 2652 2653 2659
		f 4 -5098 -5087 -5089 5099
		mu 0 4 2659 2653 2648 2654
		f 4 -5092 -5088 -2553 5100
		mu 0 4 2656 2650 1353 1361
		f 4 5101 5102 5103 -2554
		mu 0 4 1362 2660 2661 1363
		f 4 5104 -5102 -2558 -5095
		mu 0 4 2657 2660 1362 1357
		f 4 -5104 5105 -5101 -2560
		mu 0 4 1363 2661 2656 1361
		f 4 -5106 5106 -5091 -5093
		mu 0 4 2656 2661 2654 2655
		f 4 5107 -5100 -5107 -5103
		mu 0 4 2660 2659 2654 2661
		f 4 -5108 -5105 -5097 -5099
		mu 0 4 2659 2660 2657 2658
		f 5 -4504 7119 7118 5115 -7118
		mu 0 5 2417 2416 3753 2662 3752
		f 4 7113 7112 5111 -4455
		mu 0 4 2392 3749 2665 2390
		f 4 5113 -4470 7145 7144
		mu 0 4 2664 2399 2401 3766
		f 4 -5109 -4514 7115 7114
		mu 0 4 2663 2423 2420 3751
		f 4 -2571 -4948 7109 7108
		mu 0 4 1373 1289 2389 3747
		f 4 -4453 -5112 5118 -7112
		mu 0 4 2388 2390 2665 3748
		f 4 7123 7122 -5118 -4488
		mu 0 4 2396 3755 2666 2409
		f 4 5119 -3899 5120 5121
		mu 0 4 2667 2087 2086 2273
		f 4 5122 -5122 -4239 -2581
		mu 0 4 1377 2667 2273 932
		f 4 -4094 -4093 5123 -2583
		mu 0 4 845 2189 2192 1378
		f 4 5124 -4117 5125 -4113
		mu 0 4 2182 2183 2203 2193
		f 4 5126 -4080 -5125 -4078
		mu 0 4 1745 1746 2183 2182
		f 4 -3290 5127 -3292 -5127
		mu 0 4 1745 1744 1747 1746
		f 4 -3299 5128 -3298 -5128
		mu 0 4 1744 1735 1736 1747
		f 4 5129 -3280 -5129 -3277
		mu 0 4 1734 1737 1736 1735
		f 4 5130 -3301 -5130 -3305
		mu 0 4 1750 1748 1737 1734
		f 4 -5131 -3307 5131 -3302
		mu 0 4 1748 1750 1751 1749
		f 4 -3704 5132 -3710 -5132
		mu 0 4 1751 1968 1971 1749
		f 4 5133 -3706 -5133 -3696
		mu 0 4 1967 1962 1971 1968
		f 4 -3698 5134 -3688 -5134
		mu 0 4 1967 1966 1963 1962
		f 4 5135 -3700 -5135 -3693
		mu 0 4 1965 1969 1963 1966
		f 4 5136 -4012 -5136 -4008
		mu 0 4 2138 2140 1969 1965
		f 4 5137 -4013 -5137 -4010
		mu 0 4 2139 2124 2140 2138
		f 4 5138 -4925 -5138 -4923
		mu 0 4 2123 2128 2124 2139
		f 4 -5139 -3976 5139 -3984
		mu 0 4 2128 2123 2122 2129
		f 4 5140 -3992 -5140 -3987
		mu 0 4 2130 2132 2129 2122
		f 4 5141 -3996 -5141 -3994
		mu 0 4 2134 2136 2132 2130
		f 4 -4646 5142 -4644 -5142
		mu 0 4 2134 2486 2484 2136
		f 4 5143 -4638 -5143 -4640
		mu 0 4 2485 2481 2484 2486
		f 4 5144 -4649 -5144 -4643
		mu 0 4 2487 2488 2481 2485
		f 4 5145 -4657 -5145 -4655
		mu 0 4 2490 2491 2488 2487
		f 4 -4653 5146 -4659 -5146
		mu 0 4 2490 2067 2072 2491
		f 4 5147 -3880 -5147 -3871
		mu 0 4 2066 2069 2072 2067
		f 4 5148 -3875 -5148 -3874
		mu 0 4 2068 2070 2069 2066
		f 4 -4174 5149 -4182 -5149
		mu 0 4 2068 2232 2238 2070
		f 4 5150 -4970 -5150 -4968
		mu 0 4 2606 2608 2238 2232
		f 4 -5151 -4170 5151 -4177
		mu 0 4 2235 2231 2230 2236
		f 4 5152 -4961 -5152 -4959
		mu 0 4 2249 2252 2236 2230
		f 4 -5153 -4203 5153 -4208
		mu 0 4 2252 2249 2248 2253
		f 4 -5154 -5001 5154 -5000
		mu 0 4 2253 2248 2272 2279
		f 4 5155 -4249 -5155 -4237
		mu 0 4 2271 2280 2279 2272
		f 4 -5156 -4992 5156 -4991
		mu 0 4 2280 2271 2274 2278
		f 4 -4090 -4096 -5126 -4110
		mu 0 4 2190 2189 2193 2203
		f 4 -5121 -4248 -5157 -4240
		mu 0 4 2273 2086 2278 2274
		f 4 -5124 -5011 -5038 -2618
		mu 0 4 1378 2192 2620 1324
		f 4 -5123 -2620 -3927 5157
		mu 0 4 2667 1377 743 2096
		f 3 -5120 -5158 -3918
		mu 0 3 2087 2667 2096
		f 4 -3137 -3135 -2877 -2876
		mu 0 4 1493 1645 1489 1518
		f 4 -3138 -2791 -2798 5158
		mu 0 4 1645 1485 1486 1490
		f 4 -2802 5159 -5159 -2800
		mu 0 4 1491 1492 1645 1490
		f 4 -2809 -3136 -5160 -2808
		mu 0 4 1495 1487 1645 1492
		f 4 5160 -5029 -4931 -2446
		mu 0 4 1307 2629 2187 1271
		f 3 -5048 -5161 5161
		mu 0 3 1329 2629 1307
		f 3 -2493 -5162 -2448
		mu 0 3 1308 1329 1307
		f 3 5162 5163 5164
		mu 0 3 2668 2669 2670
		f 4 -5164 5165 5166 5167
		mu 0 4 2670 2669 2671 2672
		f 4 5168 5169 5170 5171
		mu 0 4 2673 2674 2675 2676
		f 4 5172 5173 5174 5175
		mu 0 4 2677 2678 2679 2680
		f 4 5176 5177 5178 -5172
		mu 0 4 2676 2681 2682 2673
		f 3 5179 5180 5181
		mu 0 3 2683 2684 2685
		f 4 5182 5183 5184 5185
		mu 0 4 2686 2687 2688 2689
		f 4 5186 5187 5188 5189
		mu 0 4 2690 2691 2692 2693
		f 4 5190 5191 5192 5193
		mu 0 4 2694 2695 2696 2697
		f 4 5194 5195 -5176 5196
		mu 0 4 2698 2699 2677 2680
		f 4 5197 5198 5199 5200
		mu 0 4 2700 2701 2702 2703
		f 4 5201 5202 5203 -5201
		mu 0 4 2703 2704 2705 2700
		f 3 5204 5205 -5204
		mu 0 3 2705 2706 2700
		f 3 5206 5207 5208
		mu 0 3 2707 2708 2709
		f 3 -5209 5209 5210
		mu 0 3 2707 2709 2710
		f 4 -5208 5211 5212 5213
		mu 0 4 2709 2708 2711 2712
		f 4 -5214 5214 5215 -5210
		mu 0 4 2709 2712 2713 2710
		f 4 5216 5217 5218 5219
		mu 0 4 2714 2715 2716 2717
		f 4 -5220 5220 5221 5222
		mu 0 4 2714 2717 2718 2719
		f 3 5223 5224 5225
		mu 0 3 2720 2721 2722
		f 3 -5226 5226 5227
		mu 0 3 2720 2722 2723
		f 4 -5228 5228 5229 5230
		mu 0 4 2720 2723 2724 2725
		f 3 5231 5232 5233
		mu 0 3 2726 2727 2728
		f 4 -5234 5234 -5169 5235
		mu 0 4 2726 2728 2674 2673
		f 4 5236 5237 5238 5239
		mu 0 4 2729 2727 2730 2731
		f 4 5240 -5236 -5179 5241
		mu 0 4 2732 2726 2673 2682
		f 3 5242 -5183 5243
		mu 0 3 2728 2687 2686
		f 4 5244 5245 5246 5247
		mu 0 4 2733 2727 2734 2735
		f 4 -5248 5248 -5188 5249
		mu 0 4 2733 2735 2692 2691
		f 3 5250 5251 -5192
		mu 0 3 2695 2735 2696
		f 4 -5191 5252 -5189 5253
		mu 0 4 2695 2694 2693 2692
		f 4 5254 5255 -5181 5256
		mu 0 4 2736 2737 2685 2684
		f 4 5257 5258 5259 -5178
		mu 0 4 2681 2738 2739 2682
		f 4 5260 5261 5262 5263
		mu 0 4 2740 2741 2742 2743
		f 4 5264 5265 5266 5267
		mu 0 4 2744 2745 2746 2747
		f 4 5268 5269 5270 5271
		mu 0 4 2748 2749 2750 2751
		f 4 5272 -5246 -5237 5273
		mu 0 4 2752 2734 2727 2729
		f 3 5274 5275 -5247
		mu 0 3 2734 2753 2735
		f 4 5276 -5257 5277 -5266
		mu 0 4 2745 2736 2684 2746
		f 3 -5219 5278 5279
		mu 0 3 2717 2716 2704
		f 3 -5244 5280 -5235
		mu 0 3 2728 2686 2674
		f 3 -5165 5281 5282
		mu 0 3 2668 2670 2754
		f 4 -5168 5283 5284 -5282
		mu 0 4 2670 2672 2755 2754
		f 4 5285 5286 -5196 5287
		mu 0 4 2756 2741 2677 2699
		f 4 -5281 -5186 5288 -5170
		mu 0 4 2674 2686 2689 2675
		f 4 5289 5290 5291 -5256
		mu 0 4 2737 2757 2758 2685
		f 4 5292 5293 5294 5295
		mu 0 4 2759 2760 2761 2762
		f 4 5296 -5269 5297 5298
		mu 0 4 2763 2749 2748 2764
		f 4 5299 5300 5301 5302
		mu 0 4 2765 2766 2767 2768
		f 4 5303 5304 5305 -5303
		mu 0 4 2768 2769 2770 2765
		f 3 5306 5307 5308
		mu 0 3 2771 2772 2773
		f 3 5309 5310 -5307
		mu 0 3 2771 2774 2772
		f 4 5311 5312 5313 -5308
		mu 0 4 2772 2775 2776 2773
		f 4 -5311 5314 5315 -5312
		mu 0 4 2772 2774 2777 2775
		f 4 5316 5317 5318 5319
		mu 0 4 2778 2779 2780 2781
		f 4 5320 5321 5322 -5317
		mu 0 4 2778 2782 2783 2779
		f 3 5323 5324 5325
		mu 0 3 2784 2785 2786
		f 3 5326 5327 -5324
		mu 0 3 2784 2787 2785
		f 4 5328 5329 5330 -5327
		mu 0 4 2784 2788 2789 2787
		f 4 5331 5332 -5331 5333
		mu 0 4 2790 2791 2787 2789
		f 4 5334 5335 -5239 5336
		mu 0 4 2792 2793 2731 2730
		f 4 5337 -5267 5338 -5288
		mu 0 4 2699 2747 2746 2756
		f 3 -5182 -5292 5339
		mu 0 3 2683 2685 2758
		f 4 5340 5341 -5262 5342
		mu 0 4 2794 2795 2742 2741
		f 4 5343 -5295 5344 -5341
		mu 0 4 2794 2762 2761 2795
		f 3 -5298 5345 5346
		mu 0 3 2764 2748 2795
		f 4 5347 -5294 5348 -5299
		mu 0 4 2764 2761 2760 2763
		f 4 -5272 5349 5350 -5346
		mu 0 4 2748 2751 2796 2795
		f 4 -5173 -5287 -5261 5351
		mu 0 4 2678 2677 2741 2740
		f 4 5352 5353 5354 -5268
		mu 0 4 2747 2797 2798 2744
		f 4 5355 5356 5357 -5354
		mu 0 4 2797 2799 2800 2798
		f 3 5358 5359 -5318
		mu 0 3 2779 2770 2780
		f 4 5360 5361 -5198 5362
		mu 0 4 2801 2802 2701 2700
		f 4 5363 5364 5365 -5363
		mu 0 4 2700 2803 2707 2801
		f 4 5366 5367 5368 5369
		mu 0 4 2803 2706 2804 2805
		f 4 -5369 5370 5371 5372
		mu 0 4 2805 2804 2806 2807
		f 3 -5242 -5260 5373
		mu 0 3 2732 2682 2739
		f 4 -5302 5374 5375 5376
		mu 0 4 2768 2767 2808 2809
		f 4 5377 5378 5379 -5377
		mu 0 4 2809 2771 2810 2768
		f 4 5380 5381 5382 5383
		mu 0 4 2810 2811 2812 2813
		f 4 5384 5385 5386 -5382
		mu 0 4 2811 2814 2815 2812
		f 4 5387 5388 5389 -5193
		mu 0 4 2696 2816 2817 2697
		f 3 5390 5391 5392
		mu 0 3 2706 2818 2819
		f 4 -5392 5393 5394 5395
		mu 0 4 2819 2818 2820 2821
		f 3 5396 5397 5398
		mu 0 3 2813 2822 2823
		f 4 5399 5400 5401 -5398
		mu 0 4 2822 2824 2825 2823
		f 4 -5339 -5278 -5180 5402
		mu 0 4 2756 2746 2684 2683
		f 4 -5252 -5276 5403 -5388
		mu 0 4 2696 2735 2753 2816
		f 4 -5335 5404 -5200 5405
		mu 0 4 2793 2792 2703 2702
		f 4 5406 5407 5408 5409
		mu 0 4 2826 2827 2721 2828
		f 4 5410 5411 5412 5413
		mu 0 4 2827 2718 2704 2829
		f 4 -5413 -5202 -5405 5414
		mu 0 4 2829 2704 2703 2792
		f 3 5415 -5353 -5338
		mu 0 3 2699 2797 2747
		f 4 -5300 5416 -5175 5417
		mu 0 4 2766 2765 2680 2679
		f 4 5418 5419 5420 5421
		mu 0 4 2830 2831 2786 2832
		f 4 5422 5423 5424 5425
		mu 0 4 2832 2833 2770 2783
		f 4 5426 -5417 -5306 -5424
		mu 0 4 2833 2680 2765 2770
		f 4 5427 5428 5429 5430
		mu 0 4 2834 2835 2836 2837
		f 3 5431 5432 5433
		mu 0 3 2838 2722 2792
		f 3 5434 -5356 -5416
		mu 0 3 2699 2799 2797
		f 4 5435 5436 -5429 5437
		mu 0 4 2838 2732 2836 2835
		f 4 5438 -5357 5439 -5332
		mu 0 4 2790 2800 2799 2791
		f 4 5440 -5430 5441 -5259
		mu 0 4 2738 2837 2836 2739
		f 4 5442 -5440 -5435 -5195
		mu 0 4 2698 2791 2799 2699
		f 4 5443 -5229 5444 -5428
		mu 0 4 2834 2724 2723 2835
		f 4 5445 5446 5447 -5366
		mu 0 4 2707 2839 2840 2801
		f 4 -5211 5448 5449 -5446
		mu 0 4 2707 2710 2841 2839
		f 4 -5216 5450 5451 -5449
		mu 0 4 2710 2713 2842 2841
		f 4 -5361 -5448 5452 5453
		mu 0 4 2802 2801 2840 2843
		f 4 5454 -5187 5455 -5184
		mu 0 4 2687 2691 2690 2688
		f 4 -5378 5456 5457 5458
		mu 0 4 2771 2809 2840 2844
		f 4 -5459 5459 5460 -5310
		mu 0 4 2771 2844 2845 2774
		f 4 -5461 5461 5462 -5315
		mu 0 4 2774 2845 2846 2777
		f 3 -5345 -5348 -5347
		mu 0 3 2795 2761 2764
		f 4 5463 -5453 -5457 -5376
		mu 0 4 2808 2843 2840 2809
		f 3 -5374 -5442 -5437
		mu 0 3 2732 2739 2836
		f 4 5464 -5450 5465 -5163
		mu 0 4 2668 2839 2841 2669
		f 4 -5466 -5452 5466 -5166
		mu 0 4 2669 2841 2842 2671
		f 4 -5283 5467 -5460 5468
		mu 0 4 2668 2754 2845 2844
		f 4 -5285 5469 -5462 -5468
		mu 0 4 2754 2755 2846 2845
		f 4 -5365 -5370 5470 -5207
		mu 0 4 2707 2803 2805 2708
		f 4 -5471 -5373 5471 -5212
		mu 0 4 2708 2805 2807 2711
		f 3 -5251 -5254 -5249
		mu 0 3 2735 2695 2692
		f 4 -5309 5472 -5381 -5379
		mu 0 4 2771 2773 2811 2810
		f 4 -5314 5473 -5385 -5473
		mu 0 4 2773 2776 2814 2811
		f 3 -5393 5474 -5368
		mu 0 3 2706 2819 2804
		f 4 -5475 -5396 5475 -5371
		mu 0 4 2804 2819 2821 2806
		f 3 -5383 5476 -5397
		mu 0 3 2813 2812 2822
		f 4 -5387 5477 -5400 -5477
		mu 0 4 2812 2815 2824 2822
		f 3 -5367 -5364 -5206
		mu 0 3 2706 2803 2700
		f 4 -5205 5478 5479 -5391
		mu 0 4 2706 2705 2847 2818
		f 4 -5480 5480 5481 -5394
		mu 0 4 2818 2847 2848 2820
		f 4 -5399 5482 5483 5484
		mu 0 4 2813 2823 2849 2769
		f 4 -5402 5485 5486 -5483
		mu 0 4 2823 2825 2850 2849
		f 4 -5340 5487 -5344 5488
		mu 0 4 2683 2758 2762 2794
		f 4 5489 -5481 5490 -5218
		mu 0 4 2715 2848 2847 2716
		f 4 -5491 -5479 -5203 -5279
		mu 0 4 2716 2847 2705 2704
		f 4 5491 -5296 -5488 -5291
		mu 0 4 2757 2759 2762 2758
		f 4 -5319 5492 -5487 5493
		mu 0 4 2781 2780 2849 2850
		f 4 -5360 -5305 -5484 -5493
		mu 0 4 2780 2770 2769 2849
		f 4 -5222 -5411 -5407 5494
		mu 0 4 2719 2718 2827 2826
		f 4 5495 -5422 -5426 -5322
		mu 0 4 2782 2830 2832 2783
		f 3 -5221 -5280 -5412
		mu 0 3 2718 2717 2704
		f 3 -5425 -5359 -5323
		mu 0 3 2783 2770 2779
		f 4 -5408 -5414 5496 -5225
		mu 0 4 2721 2827 2829 2722
		f 3 -5497 -5415 -5433
		mu 0 3 2722 2829 2792
		f 4 -5325 5497 -5423 -5421
		mu 0 4 2786 2785 2833 2832
		f 4 -5409 -5224 -5231 5498
		mu 0 4 2828 2721 2720 2725
		f 4 5499 -5329 -5326 -5420
		mu 0 4 2831 2788 2784 2786
		f 4 5500 -5250 -5455 -5243
		mu 0 4 2728 2733 2691 2687
		f 4 -5227 -5432 -5438 -5445
		mu 0 4 2723 2722 2838 2835
		f 3 -5233 -5245 -5501
		mu 0 3 2728 2727 2733
		f 4 -5333 -5443 5501 -5328
		mu 0 4 2787 2791 2698 2785
		f 3 5502 5503 5504
		mu 0 3 2851 2852 2853
		f 4 5505 5506 5507 -5503
		mu 0 4 2851 2854 2855 2852
		f 4 5508 5509 5510 -5507
		mu 0 4 2854 2856 2857 2855
		f 4 5511 -5510 5512 -5167
		mu 0 4 2858 2857 2856 2859
		f 4 5513 5514 5515 5516
		mu 0 4 2860 2861 2862 2863
		f 4 5517 5518 5519 5520
		mu 0 4 2864 2865 2866 2867
		f 4 -5517 5521 5522 5523
		mu 0 4 2860 2863 2868 2869
		f 4 5524 5525 -5524 5526
		mu 0 4 2870 2871 2860 2869
		f 4 5527 -5525 5528 -5177
		mu 0 4 2872 2871 2870 2873
		f 3 5529 5530 5531
		mu 0 3 2874 2875 2876
		f 4 5532 5533 5534 5535
		mu 0 4 2877 2878 2879 2880
		f 4 5536 5537 5538 -5533
		mu 0 4 2877 2881 2882 2878
		f 4 5539 -5538 5540 -5185
		mu 0 4 2883 2882 2881 2884
		f 4 5541 5542 5543 5544
		mu 0 4 2885 2886 2887 2888
		f 4 5545 -5542 5546 -5190
		mu 0 4 2889 2886 2885 2890
		f 4 5547 5548 5549 5550
		mu 0 4 2891 2892 2893 2894
		f 4 5551 -5548 5552 -5194
		mu 0 4 2895 2892 2891 2896
		f 3 5553 5554 5555
		mu 0 3 2897 2898 2864
		f 4 -5526 5556 5557 -5514
		mu 0 4 2860 2871 2899 2861
		f 4 5558 -5557 -5528 -5171
		mu 0 4 2900 2899 2871 2872
		f 4 5559 5560 5561 5562
		mu 0 4 2901 2902 2903 2904
		f 4 5563 5564 5565 -5563
		mu 0 4 2904 2905 2906 2901
		f 3 5566 5567 5568
		mu 0 3 2907 2908 2909
		f 3 5569 -5569 5570
		mu 0 3 2910 2907 2909
		f 4 5571 5572 5573 -5567
		mu 0 4 2907 2911 2912 2908
		f 4 -5570 5574 5575 -5572
		mu 0 4 2907 2910 2913 2911
		f 4 5576 5577 5578 -5573
		mu 0 4 2911 2914 2915 2912
		f 4 5579 -5578 5580 -5213
		mu 0 4 2916 2915 2914 2917
		f 4 -5576 5581 5582 -5577
		mu 0 4 2911 2913 2918 2914
		f 4 -5581 -5583 5583 -5215
		mu 0 4 2917 2914 2918 2919
		f 4 5584 5585 5586 5587
		mu 0 4 2920 2921 2922 2923
		f 4 5588 -5588 5589 -5217
		mu 0 4 2924 2920 2923 2925
		f 4 5590 5591 5592 -5585
		mu 0 4 2920 2926 2927 2921
		f 4 5593 -5591 -5589 -5223
		mu 0 4 2928 2926 2920 2924
		f 4 5594 5595 5596 -5586
		mu 0 4 2921 2929 2930 2922
		f 4 -5593 5597 5598 -5595
		mu 0 4 2921 2927 2931 2929
		f 3 5599 5600 5601
		mu 0 3 2932 2933 2934
		f 3 5602 -5602 5603
		mu 0 3 2935 2932 2934
		f 4 5604 5605 5606 -5604
		mu 0 4 2934 2936 2937 2935
		f 4 5607 5608 5609 5610
		mu 0 4 2938 2939 2940 2941
		f 4 5611 -5516 5612 5613
		mu 0 4 2938 2863 2862 2942
		f 4 5614 -5609 5615 5616
		mu 0 4 2943 2940 2939 2944
		f 4 5617 -5522 -5612 -5611
		mu 0 4 2941 2868 2863 2938
		f 3 -5535 5618 5619
		mu 0 3 2880 2879 2942
		f 4 5620 5621 5622 5623
		mu 0 4 2945 2946 2947 2939
		f 4 5624 5625 5626 -5621
		mu 0 4 2945 2948 2949 2946
		f 3 5627 5628 5629
		mu 0 3 2950 2946 2951
		f 4 5630 -5550 5631 -5630
		mu 0 4 2951 2894 2893 2950
		f 4 5632 5633 5634 -5631
		mu 0 4 2951 2949 2887 2894
		f 4 5635 5636 5637 5638
		mu 0 4 2952 2953 2954 2955
		f 4 5639 -5638 5640 -5255
		mu 0 4 2956 2955 2954 2957
		f 4 -5523 5641 5642 5643
		mu 0 4 2869 2868 2958 2959
		f 4 5644 5645 5646 5647
		mu 0 4 2960 2961 2962 2963
		f 4 5648 5649 5650 5651
		mu 0 4 2964 2965 2966 2967
		f 4 5652 -5652 5653 -5265
		mu 0 4 2968 2964 2967 2969
		f 4 5654 5655 5656 5657
		mu 0 4 2970 2971 2972 2973
		f 4 -5616 -5623 5658 5659
		mu 0 4 2944 2939 2947 2974
		f 4 5660 -5530 5661 -5636
		mu 0 4 2952 2875 2874 2953
		f 4 5662 5663 -5661 5664
		mu 0 4 2966 2975 2875 2952
		f 3 5665 -5596 5666
		mu 0 3 2906 2930 2929
		f 3 5667 -5620 -5613
		mu 0 3 2862 2880 2942
		f 3 5668 -5505 5669
		mu 0 3 2976 2851 2853
		f 4 -5669 5670 5671 -5506
		mu 0 4 2851 2976 2977 2854
		f 4 -5672 5672 5673 -5509
		mu 0 4 2854 2977 2978 2856
		f 4 -5513 -5674 5674 -5284
		mu 0 4 2859 2856 2978 2979
		f 4 -5665 -5639 5675 -5651
		mu 0 4 2966 2952 2955 2967
		f 4 -5654 -5676 -5640 -5277
		mu 0 4 2969 2967 2955 2956
		f 3 5676 5677 5678
		mu 0 3 2980 2962 2876
		f 4 -5650 5679 5680 -5663
		mu 0 4 2966 2965 2981 2975
		f 4 -5558 5681 -5537 5682
		mu 0 4 2861 2899 2881 2877
		f 4 -5541 -5682 -5559 -5289
		mu 0 4 2884 2881 2899 2900
		f 4 -5662 5683 5684 5685
		mu 0 4 2953 2874 2982 2983
		f 4 -5686 5686 5687 -5637
		mu 0 4 2953 2983 2984 2954
		f 4 -5641 -5688 5688 -5290
		mu 0 4 2957 2954 2984 2985
		f 4 5689 5690 5691 5692
		mu 0 4 2986 2987 2988 2989
		f 4 5693 -5693 5694 -5293
		mu 0 4 2990 2986 2989 2991
		f 4 5695 5696 5697 5698
		mu 0 4 2992 2993 2973 2994
		f 4 5699 -5699 5700 -5297
		mu 0 4 2995 2992 2994 2996
		f 4 -5683 -5536 -5668 -5515
		mu 0 4 2861 2877 2880 2862
		f 4 5701 5702 5703 5704
		mu 0 4 2997 2998 2999 3000
		f 4 5705 5706 5707 -5705
		mu 0 4 3000 3001 3002 2997
		f 3 5708 5709 -5708
		mu 0 3 3002 3003 2997
		f 3 5710 5711 5712
		mu 0 3 3004 3005 3006
		f 3 5713 5714 -5712
		mu 0 3 3005 3007 3006
		f 4 -5711 5715 5716 5717
		mu 0 4 3005 3004 3008 3009
		f 4 -5718 5718 5719 -5714
		mu 0 4 3005 3009 3010 3007
		f 4 -5717 5720 5721 5722
		mu 0 4 3009 3008 3011 3012
		f 4 5723 -5722 5724 -5313
		mu 0 4 3013 3012 3011 3014
		f 4 -5723 5725 5726 -5719
		mu 0 4 3009 3012 3015 3010
		f 4 5727 -5726 -5724 -5316
		mu 0 4 3016 3015 3012 3013
		f 4 5728 5729 5730 5731
		mu 0 4 3017 3018 3019 3020
		f 4 5732 -5729 5733 -5320
		mu 0 4 3021 3018 3017 3022
		f 4 -5732 5734 5735 5736
		mu 0 4 3017 3020 3023 3024
		f 4 -5734 -5737 5737 -5321
		mu 0 4 3022 3017 3024 3025
		f 4 -5731 5738 5739 5740
		mu 0 4 3020 3019 3026 3027
		f 4 -5741 5741 5742 -5735
		mu 0 4 3020 3027 3028 3023
		f 3 5743 5744 5745
		mu 0 3 3029 2898 3030
		f 3 5746 5747 -5745
		mu 0 3 2898 3031 3030
		f 4 -5748 5748 5749 5750
		mu 0 4 3030 3031 3032 3033
		f 4 5751 5752 5753 5754
		mu 0 4 3034 3035 3032 3036
		f 4 5755 -5752 5756 -5334
		mu 0 4 3037 3035 3034 3038
		f 4 -5615 5757 5758 5759
		mu 0 4 2940 2943 3039 3040
		f 4 5760 5761 -5681 5762
		mu 0 4 3041 2980 2975 2981
		f 3 -5684 -5532 5763
		mu 0 3 2982 2874 2876
		f 4 5764 -5646 5765 5766
		mu 0 4 3042 2962 2961 3043
		f 4 -5767 5767 5768 5769
		mu 0 4 3042 3043 3044 3045
		f 3 5770 5771 5772
		mu 0 3 3043 2970 3046
		f 4 -5772 -5658 -5697 5773
		mu 0 4 3046 2970 2973 2993
		f 4 -5774 5774 5775 5776
		mu 0 4 3046 2993 2988 3044
		f 4 5777 -5527 -5644 5778
		mu 0 4 3047 2870 2869 2959
		f 4 -5529 -5778 5779 -5258
		mu 0 4 2873 2870 3047 3048
		f 4 -5771 5780 5781 -5655
		mu 0 4 2970 3043 3049 2971
		f 4 -5647 5782 -5520 5783
		mu 0 4 2963 2962 2867 2866
		f 4 -5698 -5657 5784 5785
		mu 0 4 2994 2973 2972 3050
		f 4 -5701 -5786 5786 -5270
		mu 0 4 2996 2994 3050 3051
		f 3 5787 -5781 -5766
		mu 0 3 2961 3049 3043
		f 4 5788 5789 5790 -5680
		mu 0 4 2965 3052 3053 2981
		f 4 5791 5792 5793 -5790
		mu 0 4 3052 3054 3055 3053
		f 3 5794 5795 -5740
		mu 0 3 3026 3001 3027
		f 4 -5562 5796 5797 5798
		mu 0 4 2904 2903 3056 3057
		f 4 5799 5800 5801 -5799
		mu 0 4 3057 2909 3058 2904
		f 4 5802 5803 5804 5805
		mu 0 4 3058 3059 3060 3061
		f 4 5806 5807 5808 -5804
		mu 0 4 3059 3062 3063 3060
		f 4 5809 5810 5811 -5808
		mu 0 4 3062 3064 3065 3063
		f 4 5812 -5811 5813 -5372
		mu 0 4 3066 3065 3064 3067
		f 3 -5642 -5618 5814
		mu 0 3 2958 2868 2941
		f 4 5815 5816 -5702 5817
		mu 0 4 3068 3069 2998 2997
		f 4 5818 5819 5820 -5818
		mu 0 4 2997 3070 3006 3068
		f 4 5821 5822 5823 5824
		mu 0 4 3070 3003 3071 3072
		f 4 -5824 5825 5826 5827
		mu 0 4 3072 3071 3073 3074
		f 4 -5827 5828 5829 5830
		mu 0 4 3074 3073 3075 3076
		f 4 5831 -5830 5832 -5386
		mu 0 4 3077 3076 3075 3078
		f 4 -5632 5833 5834 5835
		mu 0 4 2950 2893 3079 3080
		f 4 5836 -5789 -5649 5837
		mu 0 4 3081 3052 2965 2964
		f 4 5838 -5838 -5653 -5355
		mu 0 4 3082 3081 2964 2968
		f 3 5839 5840 5841
		mu 0 3 3083 3084 3061
		f 4 5842 5843 5844 -5840
		mu 0 4 3083 3085 3086 3084
		f 4 5845 5846 5847 -5844
		mu 0 4 3085 3087 3088 3086
		f 4 5848 -5847 5849 -5395
		mu 0 4 3089 3088 3087 3090
		f 3 5850 5851 5852
		mu 0 3 3091 3092 3003
		f 4 -5851 5853 5854 5855
		mu 0 4 3092 3091 3093 3094
		f 4 -5855 5856 5857 5858
		mu 0 4 3094 3093 3095 3096
		f 4 5859 -5858 5860 -5401
		mu 0 4 3097 3096 3095 3098
		f 4 -5679 -5531 -5664 -5762
		mu 0 4 2980 2876 2875 2975
		f 4 -5836 5861 5862 -5628
		mu 0 4 2950 3080 3099 2946
		f 4 -5560 5863 -5759 5864
		mu 0 4 2902 2901 3040 3039
		f 4 5865 5866 5867 5868
		mu 0 4 3100 3101 3102 3103
		f 4 5869 -5866 5870 -5410
		mu 0 4 3104 3101 3100 3105
		f 4 -5868 5871 5872 5873
		mu 0 4 3103 3102 2933 3106
		f 4 5874 5875 5876 5877
		mu 0 4 3106 3107 2906 2931
		f 4 5878 -5864 -5566 -5876
		mu 0 4 3107 3040 2901 2906
		f 3 -5791 5879 -5763
		mu 0 3 2981 3053 3041
		f 4 5880 5881 -5834 -5549
		mu 0 4 2892 3108 3079 2893
		f 4 5882 -5881 -5552 -5390
		mu 0 4 3109 3108 2892 2895
		f 4 -5518 5883 -5704 5884
		mu 0 4 2865 2864 3000 2999
		f 4 5885 5886 5887 5888
		mu 0 4 3110 3111 3112 3113
		f 4 5889 -5889 5890 -5419
		mu 0 4 3114 3110 3113 3115
		f 4 5891 5892 5893 -5887
		mu 0 4 3111 3116 3029 3112
		f 4 5894 5895 5896 5897
		mu 0 4 3116 3028 3001 3117
		f 4 -5897 -5706 -5884 5898
		mu 0 4 3117 3001 3000 2864
		f 4 5899 5900 5901 5902
		mu 0 4 3118 3119 3120 3121
		f 4 5903 -5900 5904 -5431
		mu 0 4 3122 3119 3118 3123
		f 4 5905 -5610 -5760 5906
		mu 0 4 3124 2941 2940 3040
		f 3 -5794 5907 -5880
		mu 0 3 3053 3055 3041
		f 4 5908 5909 5910 -5906
		mu 0 4 3124 3125 3126 2941
		f 4 -5755 5911 5912 5913
		mu 0 4 3034 3036 3054 3127
		f 4 -5757 -5914 5914 -5439
		mu 0 4 3038 3034 3127 3128
		f 4 -5643 5915 5916 5917
		mu 0 4 2959 2958 3126 3120
		f 4 -5917 -5910 5918 -5902
		mu 0 4 3120 3126 3125 3121
		f 4 5919 -5908 5920 5921
		mu 0 4 2897 3041 3055 3129
		f 4 -5913 -5792 -5837 5922
		mu 0 4 3127 3054 3052 3081
		f 4 -5915 -5923 -5839 -5358
		mu 0 4 3128 3127 3081 3082
		f 4 -5903 5923 5924 5925
		mu 0 4 3118 3121 2937 3130
		f 4 -5905 -5926 5926 -5444
		mu 0 4 3123 3118 3130 3131
		f 4 -5800 5927 5928 5929
		mu 0 4 2909 3057 3132 3133
		f 4 -5930 5930 5931 -5571
		mu 0 4 2909 3133 3134 2910
		f 4 -5932 5932 5933 -5575
		mu 0 4 2910 3134 3135 2913
		f 4 -5934 5934 5935 -5582
		mu 0 4 2913 3135 3136 2918
		f 4 -5584 -5936 5936 -5451
		mu 0 4 2919 2918 3136 3137
		f 4 -5776 -5691 5937 -5769
		mu 0 4 3044 2988 2987 3045
		f 4 5938 5939 -5928 -5798
		mu 0 4 3056 3138 3132 3057
		f 4 5940 5941 5942 -5534
		mu 0 4 2878 2888 2948 2879
		f 4 5943 5944 5945 -5821
		mu 0 4 3006 3139 3132 3068
		f 4 -5715 5946 5947 -5944
		mu 0 4 3006 3007 3140 3139
		f 4 -5720 5948 5949 -5947
		mu 0 4 3007 3010 3141 3140
		f 4 -5727 5950 5951 -5949
		mu 0 4 3010 3015 3142 3141
		f 4 5952 -5951 -5728 -5463
		mu 0 4 3143 3142 3015 3016
		f 3 -5777 -5768 -5773
		mu 0 3 3046 3044 3043
		f 4 -5816 -5946 -5940 5953
		mu 0 4 3069 3068 3132 3138
		f 3 -5916 -5815 -5911
		mu 0 3 3126 2958 2941
		f 4 -5692 -5775 -5696 5954
		mu 0 4 2989 2988 2993 2992
		f 4 -5695 -5955 -5700 -5349
		mu 0 4 2991 2989 2992 2995
		f 3 5955 5956 -5929
		mu 0 3 3132 2853 3133
		f 4 -5504 5957 -5931 -5957
		mu 0 4 2853 2852 3134 3133
		f 4 -5508 5958 -5933 -5958
		mu 0 4 2852 2855 3135 3134
		f 4 -5511 5959 -5935 -5959
		mu 0 4 2855 2857 3136 3135
		f 4 -5937 -5960 -5512 -5467
		mu 0 4 3137 3136 2857 2858
		f 4 5960 -5779 -5918 -5901
		mu 0 4 3119 3047 2959 3120
		f 4 -5780 -5961 -5904 -5441
		mu 0 4 3048 3047 3119 3122
		f 4 -5626 -5942 -5544 -5634
		mu 0 4 2949 2948 2888 2887
		f 3 -5945 5961 -5956
		mu 0 3 3132 3139 2853
		f 4 -5962 -5948 5962 -5670
		mu 0 4 2853 3139 3140 2976
		f 4 -5963 -5950 5963 -5671
		mu 0 4 2976 3140 3141 2977
		f 4 -5964 -5952 5964 -5673
		mu 0 4 2977 3141 3142 2978
		f 4 -5675 -5965 -5953 -5470
		mu 0 4 2979 2978 3142 3143
		f 4 -5568 5965 -5803 -5801
		mu 0 4 2909 2908 3059 3058
		f 4 -5574 5966 -5807 -5966
		mu 0 4 2908 2912 3062 3059
		f 4 -5579 5967 -5810 -5967
		mu 0 4 2912 2915 3064 3062
		f 4 -5814 -5968 -5580 -5472
		mu 0 4 3067 3064 2915 2916
		f 3 -5633 -5629 -5627
		mu 0 3 2949 2951 2946
		f 4 -5912 5968 -5921 -5793
		mu 0 4 3054 3036 3129 3055
		f 4 -5820 -5825 5969 -5713
		mu 0 4 3006 3070 3072 3004
		f 4 -5970 -5828 5970 -5716
		mu 0 4 3004 3072 3074 3008
		f 4 -5971 -5831 5971 -5721
		mu 0 4 3008 3074 3076 3011
		f 4 -5725 -5972 -5832 -5474
		mu 0 4 3014 3011 3076 3077
		f 4 5972 -5551 -5635 -5543
		mu 0 4 2886 2891 2894 2887
		f 4 -5553 -5973 -5546 -5253
		mu 0 4 2896 2891 2886 2889
		f 4 -5539 5973 -5545 -5941
		mu 0 4 2878 2882 2885 2888
		f 4 -5547 -5974 -5540 -5456
		mu 0 4 2890 2885 2882 2883
		f 3 5974 -5842 -5805
		mu 0 3 3060 3083 3061
		f 4 -5809 5975 -5843 -5975
		mu 0 4 3060 3063 3085 3083
		f 4 -5812 5976 -5846 -5976
		mu 0 4 3063 3065 3087 3085
		f 4 -5850 -5977 -5813 -5476
		mu 0 4 3090 3087 3065 3066
		f 3 5977 -5823 -5852
		mu 0 3 3092 3071 3003
		f 4 -5978 -5856 5978 -5826
		mu 0 4 3071 3092 3094 3073
		f 4 -5979 -5859 5979 -5829
		mu 0 4 3073 3094 3096 3075
		f 4 -5833 -5980 -5860 -5478
		mu 0 4 3078 3075 3096 3097
		f 3 -5710 -5822 -5819
		mu 0 3 2997 3003 3070
		f 4 -5841 5980 5981 5982
		mu 0 4 3061 3084 3144 2905
		f 4 -5845 5983 5984 -5981
		mu 0 4 3084 3086 3145 3144
		f 4 -5848 5985 5986 -5984
		mu 0 4 3086 3088 3146 3145
		f 4 5987 -5986 -5849 -5482
		mu 0 4 3147 3146 3088 3089
		f 4 -5709 5988 5989 -5853
		mu 0 4 3003 3002 3148 3091
		f 4 -5990 5990 5991 -5854
		mu 0 4 3091 3148 3149 3093
		f 4 -5992 5992 5993 -5857
		mu 0 4 3093 3149 3150 3095
		f 4 -5861 -5994 5994 -5486
		mu 0 4 3098 3095 3150 3151
		f 4 5995 -5770 5996 -5764
		mu 0 4 2876 3042 3045 2982
		f 4 -5925 -5606 5997 5998
		mu 0 4 3130 2937 2936 3152
		f 4 -5927 -5999 5999 -5230
		mu 0 4 3131 3130 3152 3153
		f 3 -5678 -5765 -5996
		mu 0 3 2876 2962 3042
		f 4 -5587 6000 -5987 6001
		mu 0 4 2923 2922 3145 3146
		f 4 -5590 -6002 -5988 -5490
		mu 0 4 2925 2923 3146 3147
		f 4 -5597 6002 -5985 -6001
		mu 0 4 2922 2930 3144 3145
		f 4 -5666 -5565 -5982 -6003
		mu 0 4 2930 2906 2905 3144
		f 4 6003 -5690 6004 -5687
		mu 0 4 2983 2987 2986 2984
		f 4 -5689 -6005 -5694 -5492
		mu 0 4 2985 2984 2986 2990
		f 4 6005 -5993 6006 -5730
		mu 0 4 3018 3150 3149 3019
		f 4 -5995 -6006 -5733 -5494
		mu 0 4 3151 3150 3018 3021
		f 4 -6007 -5991 6007 -5739
		mu 0 4 3019 3149 3148 3026
		f 4 -6008 -5989 -5707 -5795
		mu 0 4 3026 3148 3002 3001
		f 4 6008 -5869 6009 -5592
		mu 0 4 2926 3100 3103 2927
		f 4 -5871 -6009 -5594 -5495
		mu 0 4 3105 3100 2926 2928
		f 4 -6010 -5874 -5878 -5598
		mu 0 4 2927 3103 3106 2931
		f 4 -5736 6010 -5886 6011
		mu 0 4 3024 3023 3111 3110
		f 4 -5738 -6012 -5890 -5496
		mu 0 4 3025 3024 3110 3114
		f 4 -5743 -5895 -5892 -6011
		mu 0 4 3023 3028 3116 3111
		f 3 -5667 -5599 -5877
		mu 0 3 2906 2929 2931
		f 3 -5796 -5896 -5742
		mu 0 3 3027 3001 3028
		f 4 6012 6013 -5750 -5753
		mu 0 4 3035 3154 3033 3032
		f 4 6014 -6013 -5756 -5330
		mu 0 4 3155 3154 3035 3037
		f 4 -5685 -5997 -5938 -6004
		mu 0 4 2983 2982 3045 2987
		f 4 -5600 6015 -5875 -5873
		mu 0 4 2933 2932 3107 3106
		f 4 6016 -5969 -5754 -5749
		mu 0 4 3031 3129 3036 3032
		f 4 -5893 -5898 6017 -5744
		mu 0 4 3029 3116 3117 2898
		f 3 -6018 -5899 -5555
		mu 0 3 2898 3117 2864
		f 4 6018 -5998 6019 -5867
		mu 0 4 3101 3152 2936 3102
		f 4 -6000 -6019 -5870 -5499
		mu 0 4 3153 3152 3101 3104
		f 4 -6020 -5605 -5601 -5872
		mu 0 4 3102 2936 2934 2933
		f 4 -5888 6020 -6014 6021
		mu 0 4 3113 3112 3033 3154
		f 4 -5891 -6022 -6015 -5500
		mu 0 4 3115 3113 3154 3155
		f 4 -5894 -5746 -5751 -6021
		mu 0 4 3112 3029 3030 3033
		f 4 -5619 -5943 -5625 6022
		mu 0 4 2942 2879 2948 2945
		f 4 6023 -5909 6024 -5603
		mu 0 4 2935 3125 3124 2932
		f 4 -5607 -5924 -5919 -6024
		mu 0 4 2935 2937 3121 3125
		f 4 -5747 -5554 -5922 -6017
		mu 0 4 3031 2898 2897 3129
		f 3 -5465 6025 -5447
		mu 0 3 2839 2668 2840
		f 3 -6026 -5469 -5458
		mu 0 3 2840 2668 2844
		f 4 -5337 6026 -5436 -5434
		mu 0 4 2792 2730 2732 2838
		f 4 -5241 -6027 -5238 -5232
		mu 0 4 2726 2732 2730 2727
		f 3 -5384 6027 -5380
		mu 0 3 2810 2813 2768;
	setAttr ".fc[3000:3499]"
		f 3 -6028 -5485 -5304
		mu 0 3 2768 2813 2769
		f 3 -5498 6028 -5427
		mu 0 3 2833 2785 2680
		f 3 -6029 -5502 -5197
		mu 0 3 2680 2785 2698
		f 3 -5403 6029 -5286
		mu 0 3 2756 2683 2741
		f 3 -6030 -5489 -5343
		mu 0 3 2741 2683 2794
		f 3 -5351 6030 -5342
		mu 0 3 2795 2796 2742
		f 4 -5521 6031 -5920 -5556
		mu 0 4 2864 2867 3041 2897
		f 4 -5761 -6032 -5783 -5677
		mu 0 4 2980 3041 2867 2962
		f 3 -5806 6032 -5802
		mu 0 3 3058 3061 2904
		f 3 -6033 -5983 -5564
		mu 0 3 2904 3061 2905
		f 3 -6016 6033 -5879
		mu 0 3 3107 2932 3040
		f 3 -6034 -6025 -5907
		mu 0 3 3040 2932 3124
		f 3 -5614 6034 -5608
		mu 0 3 2938 2942 2939
		f 3 -6035 -6023 -5624
		mu 0 3 2939 2942 2945
		f 3 -5863 6035 -5622
		mu 0 3 2946 3099 2947
		f 4 6036 6037 6038 6039
		mu 0 4 3156 3157 3158 3159
		f 4 -6040 6040 6041 6042
		mu 0 4 3156 3159 3160 3161
		f 3 6043 6044 6045
		mu 0 3 3162 3163 3164
		f 3 -6046 6046 6047
		mu 0 3 3162 3164 3165
		f 4 -6045 6048 6049 6050
		mu 0 4 3164 3163 3166 3167
		f 4 -6051 6051 6052 -6047
		mu 0 4 3164 3167 3168 3165
		f 4 6053 6054 6055 6056
		mu 0 4 3169 3170 3171 3172
		f 4 6057 -6050 6058 6059
		mu 0 4 3173 3167 3166 3174
		f 4 6060 6061 6062 6063
		mu 0 4 3175 3176 3177 3178
		f 4 -6064 6064 6065 6066
		mu 0 4 3175 3178 3158 3179
		f 3 6067 6068 6069
		mu 0 3 3180 3177 3181
		f 4 -6070 6070 -6041 6071
		mu 0 4 3180 3181 3160 3159
		f 4 6072 6073 6074 6075
		mu 0 4 3182 3183 3184 3185
		f 4 6076 6077 -6073 6078
		mu 0 4 3186 3187 3183 3182
		f 4 6079 6080 6081 6082
		mu 0 4 3188 3189 3190 3191
		f 4 -6083 6083 6084 6085
		mu 0 4 3188 3191 3192 3193
		f 4 -6086 6086 6087 6088
		mu 0 4 3188 3193 3194 3195
		f 4 6089 6090 6091 6092
		mu 0 4 3196 3197 3198 3199
		f 4 -6092 6093 6094 6095
		mu 0 4 3199 3198 3200 3201
		f 3 -6095 6096 6097
		mu 0 3 3201 3200 3202
		f 4 6098 6099 6100 6101
		mu 0 4 3203 3204 3205 3206
		f 4 6102 6103 6104 6105
		mu 0 4 3207 3208 3209 3203
		f 4 6106 6107 6108 6109
		mu 0 4 3210 3211 3212 3213
		f 4 6110 6111 6112 6113
		mu 0 4 3210 3214 3215 3216
		f 4 -6114 6114 6115 -6107
		mu 0 4 3210 3216 3217 3211
		f 4 6116 6117 6118 6119
		mu 0 4 3218 3219 3220 3221
		f 4 6120 6121 6122 6123
		mu 0 4 3218 3222 3223 3224
		f 4 -6124 6124 6125 -6117
		mu 0 4 3218 3224 3225 3219
		f 4 6126 -6113 6127 6128
		mu 0 4 3226 3216 3215 3227
		f 4 6129 6130 6131 6132
		mu 0 4 3228 3229 3230 3231
		f 3 -6133 6133 6134
		mu 0 3 3228 3231 3212
		f 4 6135 -6119 6136 -6130
		mu 0 4 3228 3221 3220 3229
		f 4 -6132 6137 6138 6139
		mu 0 4 3231 3230 3232 3233
		f 4 6140 6141 6142 -6140
		mu 0 4 3233 3234 3235 3231
		f 4 6143 6144 6145 6146
		mu 0 4 3236 3237 3238 3209
		f 4 6147 6148 6149 6150
		mu 0 4 3239 3240 3241 3242
		f 4 6151 6152 -6077 6153
		mu 0 4 3243 3244 3187 3186
		f 4 6154 6155 6156 6157
		mu 0 4 3245 3246 3247 3248
		f 4 6158 6159 6160 -6155
		mu 0 4 3245 3249 3250 3246
		f 3 6161 6162 6163
		mu 0 3 3251 3252 3253
		f 3 6164 6165 -6162
		mu 0 3 3251 3254 3252
		f 4 6166 6167 6168 -6163
		mu 0 4 3252 3255 3256 3253
		f 4 -6166 6169 6170 -6167
		mu 0 4 3252 3254 3206 3255
		f 4 6171 6172 6173 6174
		mu 0 4 3257 3258 3259 3184
		f 4 6175 6176 -6168 6177
		mu 0 4 3260 3261 3256 3255
		f 4 6178 6179 6180 6181
		mu 0 4 3262 3263 3264 3265
		f 4 6182 6183 6184 -6179
		mu 0 4 3262 3266 3247 3263
		f 3 6185 6186 6187
		mu 0 3 3267 3268 3264
		f 4 6188 -6161 6189 -6186
		mu 0 4 3267 3246 3250 3268
		f 4 6190 6191 6192 6193
		mu 0 4 3269 3270 3170 3271
		f 4 6194 -6194 6195 6196
		mu 0 4 3272 3269 3271 3273
		f 4 6197 6198 6199 6200
		mu 0 4 3274 3275 3276 3277
		f 4 6201 6202 6203 -6198
		mu 0 4 3274 3278 3279 3275
		f 4 6204 6205 6206 -6202
		mu 0 4 3274 3280 3281 3278
		f 4 -6093 6207 6208 6209
		mu 0 4 3196 3199 3282 3283
		f 4 -6096 6210 6211 -6208
		mu 0 4 3199 3201 3284 3282
		f 3 -6098 6212 -6211
		mu 0 3 3201 3202 3284
		f 4 6213 6214 -6103 6215
		mu 0 4 3285 3286 3208 3207
		f 4 6216 6217 -6214 6218
		mu 0 4 3287 3243 3286 3285
		f 4 6219 6220 6221 6222
		mu 0 4 3288 3289 3290 3291
		f 4 6223 6224 6225 6226
		mu 0 4 3288 3292 3293 3294
		f 4 -6223 6227 6228 -6224
		mu 0 4 3288 3291 3295 3292
		f 4 6229 6230 6231 6232
		mu 0 4 3296 3297 3298 3299
		f 4 6233 6234 6235 6236
		mu 0 4 3296 3300 3301 3302
		f 4 -6233 6237 6238 -6234
		mu 0 4 3296 3299 3303 3300
		f 4 6239 6240 -6225 6241
		mu 0 4 3304 3305 3293 3292
		f 4 6242 6243 6244 6245
		mu 0 4 3306 3307 3308 3309
		f 3 6246 6247 -6243
		mu 0 3 3306 3290 3307
		f 4 -6246 6248 -6231 6249
		mu 0 4 3306 3309 3298 3297
		f 4 6250 6251 6252 -6244
		mu 0 4 3307 3310 3311 3308
		f 4 -6251 6253 6254 6255
		mu 0 4 3310 3307 3312 3313
		f 4 6256 6257 6258 6259
		mu 0 4 3314 3315 3316 3317
		f 4 6260 6261 6262 6263
		mu 0 4 3318 3319 3320 3321
		f 4 6264 -6197 6265 6266
		mu 0 4 3322 3272 3273 3323
		f 3 6267 6268 6269
		mu 0 3 3324 3325 3212
		f 4 6270 6271 6272 -6268
		mu 0 4 3324 3326 3222 3325
		f 4 6273 6274 6275 6276
		mu 0 4 3326 3217 3327 3328
		f 3 6277 6278 6279
		mu 0 3 3329 3290 3330
		f 4 -6280 6280 6281 6282
		mu 0 4 3329 3330 3302 3331
		f 4 6283 6284 6285 6286
		mu 0 4 3331 3332 3333 3295
		f 3 6287 6288 6289
		mu 0 3 3334 3335 3214
		f 4 6290 6291 6292 6293
		mu 0 4 3336 3168 3337 3338
		f 4 6294 6295 6296 6297
		mu 0 4 3339 3336 3315 3340
		f 3 6298 6299 6300
		mu 0 3 3341 3294 3342
		f 4 6301 -6298 6302 6303
		mu 0 4 3343 3339 3340 3344
		f 4 6304 -6304 6305 6306
		mu 0 4 3345 3343 3344 3322
		f 4 6307 6308 -6142 6309
		mu 0 4 3346 3347 3235 3234
		f 4 6310 6311 6312 6313
		mu 0 4 3348 3349 3350 3351
		f 4 -6313 6314 6315 6316
		mu 0 4 3351 3350 3352 3353
		f 4 -6316 6317 6318 6319
		mu 0 4 3353 3352 3334 3354
		f 4 -6319 6320 -6309 6321
		mu 0 4 3354 3334 3235 3347
		f 4 6322 -6255 6323 -6308
		mu 0 4 3346 3313 3312 3347
		f 4 6324 6325 6326 6327
		mu 0 4 3355 3356 3357 3358
		f 4 6328 6329 6330 -6326
		mu 0 4 3356 3359 3360 3357
		f 4 6331 6332 6333 -6330
		mu 0 4 3359 3361 3341 3360
		f 4 6334 -6324 6335 -6333
		mu 0 4 3361 3347 3312 3341
		f 4 6336 6337 6338 6339
		mu 0 4 3362 3363 3364 3236
		f 3 6340 -6337 6341
		mu 0 3 3286 3363 3362
		f 4 6342 6343 6344 6345
		mu 0 4 3365 3366 3190 3367
		f 4 6346 6347 6348 6349
		mu 0 4 3368 3314 3369 3370
		f 3 6350 -6350 6351
		mu 0 3 3344 3368 3370
		f 4 6352 6353 6354 6355
		mu 0 4 3371 3372 3276 3373
		f 4 6356 6357 6358 6359
		mu 0 4 3374 3375 3367 3376
		f 4 -6360 6360 6361 6362
		mu 0 4 3374 3376 3195 3377
		f 4 6363 6364 6365 6366
		mu 0 4 3185 3378 3379 3364
		f 3 6367 -6358 6368
		mu 0 3 3240 3367 3375
		f 4 6369 6370 6371 6372
		mu 0 4 3380 3381 3372 3382
		f 4 6373 6374 6375 -6370
		mu 0 4 3380 3383 3280 3381
		f 4 6376 6377 6378 6379
		mu 0 4 3270 3369 3384 3385
		f 3 6380 -6372 6381
		mu 0 3 3321 3382 3372
		f 4 6382 6383 6384 6385
		mu 0 4 3386 3387 3388 3389
		f 4 6386 6387 6388 -6383
		mu 0 4 3386 3390 3391 3387
		f 3 6389 -6385 6390
		mu 0 3 3229 3389 3388
		f 4 6391 6392 6393 6394
		mu 0 4 3392 3393 3394 3395
		f 4 -6395 6395 6396 6397
		mu 0 4 3392 3395 3396 3397
		f 3 6398 -6393 6399
		mu 0 3 3309 3394 3393
		f 4 6400 -6076 -6367 -6338
		mu 0 4 3363 3182 3185 3364
		f 4 6401 -6079 -6401 -6341
		mu 0 4 3286 3186 3182 3363
		f 3 -6154 -6402 -6218
		mu 0 3 3243 3186 3286
		f 4 -6349 -6377 -6191 6402
		mu 0 4 3370 3369 3270 3269
		f 4 -6352 -6403 -6195 6403
		mu 0 4 3344 3370 3269 3272
		f 3 -6306 -6404 -6265
		mu 0 3 3322 3344 3272
		f 4 -6366 6404 -6144 -6339
		mu 0 4 3364 3379 3237 3236
		f 4 -6348 -6260 6405 -6378
		mu 0 4 3369 3314 3317 3384
		f 4 6406 6407 -6267 6408
		mu 0 4 3398 3399 3322 3323
		f 4 -6192 -6380 6409 -6055
		mu 0 4 3170 3270 3385 3171
		f 3 6410 -6175 -6074
		mu 0 3 3183 3257 3184
		f 4 6411 -6152 6412 6413
		mu 0 4 3400 3244 3243 3401
		f 4 -6174 6414 -6364 -6075
		mu 0 4 3184 3259 3378 3185
		f 3 -6193 -6054 6415
		mu 0 3 3271 3170 3169
		f 4 6416 -6340 -6147 -6104
		mu 0 4 3208 3362 3236 3209
		f 4 -6146 6417 -6099 -6105
		mu 0 4 3209 3238 3204 3203
		f 4 -6413 -6217 6418 6419
		mu 0 4 3401 3243 3287 3402
		f 3 -6342 -6417 -6215
		mu 0 3 3286 3362 3208
		f 4 -6296 -6294 6420 -6258
		mu 0 4 3315 3336 3338 3316
		f 4 6421 6422 -6307 -6408
		mu 0 4 3399 3403 3345 3322
		f 4 -6297 -6257 -6347 6423
		mu 0 4 3340 3315 3314 3368
		f 3 -6303 -6424 -6351
		mu 0 3 3344 3340 3368
		f 3 6424 6425 -6305
		mu 0 3 3345 3162 3343
		f 4 -6048 6426 -6302 -6426
		mu 0 4 3162 3165 3339 3343
		f 4 -6053 -6291 -6295 -6427
		mu 0 4 3165 3168 3336 3339
		f 4 -6101 6427 -6178 -6171
		mu 0 4 3206 3205 3260 3255
		f 3 -6219 6428 6429
		mu 0 3 3287 3285 3251
		f 4 -6429 -6216 6430 -6165
		mu 0 4 3251 3285 3207 3254
		f 4 -6431 -6106 -6102 -6170
		mu 0 4 3254 3207 3203 3206
		f 4 -6052 -6058 6431 -6292
		mu 0 4 3168 3167 3173 3337
		f 3 6432 6433 -6425
		mu 0 3 3345 3176 3162
		f 4 -6434 -6061 6434 -6044
		mu 0 4 3162 3176 3175 3163
		f 4 -6435 -6067 6435 -6049
		mu 0 4 3163 3175 3179 3166
		f 4 -6059 -6436 6436 6437
		mu 0 4 3174 3166 3179 3404
		f 3 -6430 6438 6439
		mu 0 3 3287 3251 3265
		f 4 -6164 6440 -6182 -6439
		mu 0 4 3251 3253 3262 3265
		f 4 -6169 6441 -6183 -6441
		mu 0 4 3253 3256 3266 3262
		f 4 6442 6443 -6442 -6177
		mu 0 4 3261 3405 3266 3256
		f 4 6444 -6437 -6066 -6038
		mu 0 4 3157 3404 3179 3158
		f 3 -6063 -6068 6445
		mu 0 3 3178 3177 3180
		f 4 -6446 -6072 -6039 -6065
		mu 0 4 3178 3180 3159 3158
		f 4 -6150 6446 -6423 6447
		mu 0 4 3242 3241 3345 3403
		f 4 6448 -6062 -6433 -6447
		mu 0 4 3241 3177 3176 3345
		f 4 -6157 -6184 -6444 6449
		mu 0 4 3248 3247 3266 3405
		f 3 6450 -6188 -6180
		mu 0 3 3263 3267 3264
		f 4 -6185 -6156 -6189 -6451
		mu 0 4 3263 3247 3246 3267
		f 4 6451 -6419 6452 -6262
		mu 0 4 3319 3402 3287 3320
		f 4 -6453 -6440 -6181 6453
		mu 0 4 3320 3287 3265 3264
		f 4 -6042 6454 6455 6456
		mu 0 4 3161 3160 3377 3406
		f 4 -6069 6457 -6357 6458
		mu 0 4 3181 3177 3375 3374
		f 4 -6459 -6363 -6455 -6071
		mu 0 4 3181 3374 3377 3160
		f 4 -6149 -6369 -6458 -6449
		mu 0 4 3241 3240 3375 3177
		f 4 6459 6460 6461 -6160
		mu 0 4 3249 3407 3383 3250
		f 4 6462 -6373 6463 -6187
		mu 0 4 3268 3380 3382 3264
		f 4 -6190 -6462 -6374 -6463
		mu 0 4 3268 3250 3383 3380
		f 4 -6454 -6464 -6381 -6263
		mu 0 4 3320 3264 3382 3321
		f 4 -6088 6464 -6456 -6362
		mu 0 4 3195 3194 3406 3377
		f 4 -6375 -6461 6465 -6206
		mu 0 4 3280 3383 3407 3281
		f 3 -6359 6466 6467
		mu 0 3 3376 3367 3189
		f 4 -6468 -6080 -6089 -6361
		mu 0 4 3376 3189 3188 3195
		f 3 6468 6469 -6371
		mu 0 3 3381 3277 3372
		f 4 -6376 -6205 -6201 -6469
		mu 0 4 3381 3280 3274 3277
		f 4 -6082 -6344 6470 6471
		mu 0 4 3191 3190 3366 3408
		f 4 -6472 6472 6473 -6084
		mu 0 4 3191 3408 3409 3192
		f 3 6474 -6346 -6368
		mu 0 3 3240 3365 3367
		f 4 6475 6476 -6355 -6199
		mu 0 4 3275 3410 3373 3276
		f 4 -6204 6477 6478 -6476
		mu 0 4 3275 3279 3411 3410
		f 3 -6382 -6353 6479
		mu 0 3 3321 3372 3371
		f 3 -6345 -6081 -6467
		mu 0 3 3367 3190 3189
		f 3 -6470 -6200 -6354
		mu 0 3 3372 3277 3276
		f 4 6480 -6471 6481 -6384
		mu 0 4 3387 3408 3366 3388
		f 4 -6389 6482 -6473 -6481
		mu 0 4 3387 3391 3409 3408
		f 4 6483 -6475 6484 -6131
		mu 0 4 3229 3365 3240 3230
		f 4 -6391 -6482 -6343 -6484
		mu 0 4 3229 3388 3366 3365
		f 4 -6485 -6148 6485 -6138
		mu 0 4 3230 3240 3239 3232
		f 4 -6394 6486 -6477 6487
		mu 0 4 3395 3394 3373 3410
		f 4 -6488 -6479 6488 -6396
		mu 0 4 3395 3410 3411 3396
		f 4 -6245 6489 -6480 6490
		mu 0 4 3309 3308 3321 3371
		f 4 -6491 -6356 -6487 -6399
		mu 0 4 3309 3371 3373 3394
		f 4 -6253 6491 -6264 -6490
		mu 0 4 3308 3311 3318 3321
		f 4 6492 -6386 6493 -6118
		mu 0 4 3219 3386 3389 3220
		f 4 -6126 6494 -6387 -6493
		mu 0 4 3219 3225 3390 3386
		f 3 -6137 -6494 -6390
		mu 0 3 3229 3220 3389
		f 4 -6232 6495 -6392 6496
		mu 0 4 3299 3298 3393 3392
		f 4 -6497 -6398 6497 -6238
		mu 0 4 3299 3392 3397 3303
		f 3 -6400 -6496 -6249
		mu 0 3 3309 3393 3298
		f 4 -6272 -6277 6498 -6122
		mu 0 4 3222 3326 3328 3223
		f 4 -6236 6499 -6284 -6282
		mu 0 4 3302 3301 3332 3331
		f 4 6500 -6136 -6135 -6269
		mu 0 4 3325 3221 3228 3212
		f 4 -6273 -6121 -6120 -6501
		mu 0 4 3325 3222 3218 3221
		f 4 -6279 -6247 -6250 6501
		mu 0 4 3330 3290 3306 3297
		f 4 -6502 -6230 -6237 -6281
		mu 0 4 3330 3297 3296 3302
		f 3 6502 -6270 -6108
		mu 0 3 3211 3324 3212
		f 4 -6116 -6274 -6271 -6503
		mu 0 4 3211 3217 3326 3324
		f 3 -6222 -6278 6503
		mu 0 3 3291 3290 3329
		f 4 -6504 -6283 -6287 -6228
		mu 0 4 3291 3329 3331 3295
		f 4 -6115 -6127 6504 -6275
		mu 0 4 3217 3216 3226 3327
		f 3 -6134 6505 -6109
		mu 0 3 3212 3231 3213
		f 4 -6286 6506 -6242 -6229
		mu 0 4 3295 3333 3304 3292
		f 3 -6221 6507 -6248
		mu 0 3 3290 3289 3307
		f 4 -6289 6508 6509 -6112
		mu 0 4 3214 3335 3412 3215
		f 4 -6128 -6510 6510 6511
		mu 0 4 3227 3215 3412 3413
		f 4 -6226 6512 6513 -6300
		mu 0 4 3294 3293 3414 3342
		f 4 6514 6515 -6513 -6241
		mu 0 4 3305 3415 3414 3293
		f 4 6516 -6506 -6143 -6321
		mu 0 4 3334 3213 3231 3235
		f 4 -6290 -6111 -6110 -6517
		mu 0 4 3334 3214 3210 3213
		f 4 -6336 -6254 -6508 6517
		mu 0 4 3341 3312 3307 3289
		f 4 -6518 -6220 -6227 -6299
		mu 0 4 3341 3289 3288 3294
		f 4 6518 -6511 6519 -6312
		mu 0 4 3349 3413 3412 3350
		f 4 -6520 -6509 6520 -6315
		mu 0 4 3350 3412 3335 3352
		f 3 -6521 -6288 -6318
		mu 0 3 3352 3335 3334
		f 4 -6327 6521 -6516 6522
		mu 0 4 3358 3357 3414 3415
		f 4 -6331 6523 -6514 -6522
		mu 0 4 3357 3360 3342 3414
		f 3 -6334 -6301 -6524
		mu 0 3 3360 3341 3342
		f 4 6524 -6314 6525 -6091
		mu 0 4 3197 3348 3351 3198
		f 4 -6526 -6317 6526 -6094
		mu 0 4 3198 3351 3353 3200
		f 4 -6527 -6320 6527 -6097
		mu 0 4 3200 3353 3354 3202
		f 3 -6528 -6322 6528
		mu 0 3 3202 3354 3347
		f 4 -6209 6529 -6325 6530
		mu 0 4 3283 3282 3356 3355
		f 4 -6212 6531 -6329 -6530
		mu 0 4 3282 3284 3359 3356
		f 4 -6213 6532 -6332 -6532
		mu 0 4 3284 3202 3361 3359
		f 3 -6529 -6335 -6533
		mu 0 3 3202 3347 3361
		f 4 6533 6534 6535 -6037
		mu 0 4 3416 3417 3418 3419
		f 4 6536 6537 -6534 -6043
		mu 0 4 3420 3421 3417 3416
		f 4 6538 6539 6540 -6056
		mu 0 4 3422 3423 3424 3425
		f 4 6541 6542 6543 -6060
		mu 0 4 3426 3427 3428 3429
		f 4 6544 6545 6546 -6085
		mu 0 4 3430 3431 3432 3433
		f 4 -6547 6547 6548 -6087
		mu 0 4 3433 3432 3434 3435
		f 4 6549 6550 6551 -6090
		mu 0 4 3436 3437 3438 3439
		f 4 6552 6553 6554 -6100
		mu 0 4 3440 3441 3442 3443
		f 4 6555 6556 6557 -6123
		mu 0 4 3444 3445 3446 3447
		f 4 -6558 6558 6559 -6125
		mu 0 4 3447 3446 3448 3449
		f 4 6560 6561 6562 -6129
		mu 0 4 3450 3451 3452 3453
		f 4 6563 6564 6565 -6145
		mu 0 4 3454 3455 3456 3457
		f 4 6566 6567 6568 -6158
		mu 0 4 3458 3459 3460 3461
		f 4 -6569 6569 6570 -6159
		mu 0 4 3461 3460 3462 3463
		f 4 6571 6572 6573 -6173
		mu 0 4 3464 3465 3466 3467
		f 4 6574 6575 6576 -6176
		mu 0 4 3468 3469 3470 3471
		f 4 6577 6578 6579 -6203
		mu 0 4 3472 3473 3474 3475
		f 4 6580 6581 -6578 -6207
		mu 0 4 3476 3477 3473 3472
		f 4 6582 6583 -6550 -6210
		mu 0 4 3478 3479 3437 3436
		f 4 6584 6585 6586 -6235
		mu 0 4 3480 3481 3482 3483
		f 4 6587 6588 -6585 -6239
		mu 0 4 3484 3485 3481 3480
		f 4 6589 6590 6591 -6240
		mu 0 4 3486 3487 3488 3489
		f 4 6592 6593 6594 -6259
		mu 0 4 3490 3491 3492 3493
		f 4 6595 6596 6597 -6276
		mu 0 4 3494 3495 3496 3497
		f 4 6598 6599 6600 -6285
		mu 0 4 3498 3499 3500 3501
		f 4 6601 6602 6603 -6293
		mu 0 4 3502 3503 3504 3505
		f 4 6604 6605 6606 -6311
		mu 0 4 3506 3507 3508 3509
		f 4 6607 6608 6609 -6328
		mu 0 4 3510 3511 3512 3513
		f 4 6610 6611 6612 -6365
		mu 0 4 3514 3515 3516 3517
		f 4 6613 6614 6615 -6379
		mu 0 4 3518 3519 3520 3521
		f 4 6616 6617 6618 -6388
		mu 0 4 3522 3523 3524 3525
		f 4 6619 6620 6621 -6397
		mu 0 4 3526 3527 3528 3529
		f 4 -6613 6622 -6564 -6405
		mu 0 4 3517 3516 3455 3454
		f 4 -6595 6623 -6614 -6406
		mu 0 4 3493 3492 3519 3518
		f 4 -6616 6624 -6539 -6410
		mu 0 4 3521 3520 3423 3422
		f 4 -6574 6625 -6611 -6415
		mu 0 4 3467 3466 3515 3514
		f 4 -6566 6626 -6553 -6418
		mu 0 4 3457 3456 3441 3440
		f 4 -6604 6627 -6593 -6421
		mu 0 4 3505 3504 3491 3490
		f 4 -6555 6628 -6575 -6428
		mu 0 4 3443 3442 3469 3468
		f 4 -6544 6629 -6602 -6432
		mu 0 4 3429 3428 3503 3502
		f 4 6630 6631 -6542 -6438
		mu 0 4 3530 3531 3427 3426
		f 4 -6577 6632 6633 -6443
		mu 0 4 3471 3470 3532 3533
		f 4 -6536 6634 -6631 -6445
		mu 0 4 3419 3418 3531 3530
		f 4 -6634 6635 -6567 -6450
		mu 0 4 3533 3532 3459 3458
		f 4 6636 6637 -6537 -6457
		mu 0 4 3534 3535 3421 3420
		f 4 -6571 6638 6639 -6460
		mu 0 4 3463 3462 3536 3537
		f 4 -6549 6640 -6637 -6465
		mu 0 4 3435 3434 3535 3534
		f 4 -6640 6641 -6581 -6466
		mu 0 4 3537 3536 3477 3476
		f 4 6642 6643 -6545 -6474
		mu 0 4 3538 3539 3431 3430
		f 4 -6580 6644 6645 -6478
		mu 0 4 3475 3474 3540 3541
		f 4 -6619 6646 -6643 -6483
		mu 0 4 3525 3524 3539 3538
		f 4 -6646 6647 -6620 -6489
		mu 0 4 3541 3540 3527 3526
		f 4 -6560 6648 -6617 -6495
		mu 0 4 3449 3448 3523 3522
		f 4 -6622 6649 -6588 -6498
		mu 0 4 3529 3528 3485 3484
		f 4 -6598 6650 -6556 -6499
		mu 0 4 3497 3496 3445 3444
		f 4 -6587 6651 -6599 -6500
		mu 0 4 3483 3482 3499 3498
		f 4 -6563 6652 -6596 -6505
		mu 0 4 3453 3452 3495 3494
		f 4 -6601 6653 -6590 -6507
		mu 0 4 3501 3500 3487 3486
		f 4 6654 6655 -6561 -6512
		mu 0 4 3542 3543 3451 3450
		f 4 -6592 6656 6657 -6515
		mu 0 4 3489 3488 3544 3545
		f 4 -6607 6658 -6655 -6519
		mu 0 4 3509 3508 3543 3542
		f 4 -6658 6659 -6608 -6523
		mu 0 4 3545 3544 3511 3510
		f 4 -6552 6660 -6605 -6525
		mu 0 4 3439 3438 3507 3506
		f 4 -6610 6661 -6583 -6531
		mu 0 4 3513 3512 3479 3478
		f 4 6662 6663 6664 -6535
		mu 0 4 3417 3546 3547 3418
		f 4 -6538 6665 6666 -6663
		mu 0 4 3417 3421 3548 3546
		f 3 6667 6668 6669
		mu 0 3 3549 3550 3551
		f 3 6670 -6670 6671
		mu 0 3 3552 3549 3551
		f 4 6672 6673 6674 -6668
		mu 0 4 3549 3553 3554 3550
		f 4 -6671 6675 6676 -6673
		mu 0 4 3549 3552 3555 3553
		f 4 6677 -6540 6678 6679
		mu 0 4 3556 3424 3423 3557
		f 4 -6543 6680 -6674 6681
		mu 0 4 3428 3427 3554 3553
		f 4 6682 6683 6684 6685
		mu 0 4 3558 3559 3560 3561
		f 4 6686 6687 6688 -6683
		mu 0 4 3558 3562 3547 3559
		f 3 6689 6690 6691
		mu 0 3 3563 3560 3564
		f 4 6692 -6667 6693 -6692
		mu 0 4 3564 3546 3548 3563
		f 4 6694 6695 6696 6697
		mu 0 4 3565 3566 3567 3568
		f 4 6698 -6698 6699 6700
		mu 0 4 3569 3565 3568 3570
		f 4 6701 6702 6703 6704
		mu 0 4 3571 3572 3573 3574
		f 4 6705 -6546 6706 -6702
		mu 0 4 3571 3432 3431 3572
		f 4 6707 6708 -6548 -6706
		mu 0 4 3571 3575 3434 3432
		f 4 6709 6710 6711 -6551
		mu 0 4 3437 3576 3577 3438
		f 4 6712 6713 6714 -6711
		mu 0 4 3576 3578 3579 3577
		f 3 6715 -6714 6716
		mu 0 3 3580 3579 3578
		f 4 6717 6718 -6554 6719
		mu 0 4 3581 3582 3442 3441
		f 4 6720 6721 6722 6723
		mu 0 4 3583 3581 3584 3585
		f 4 6724 6725 6726 6727
		mu 0 4 3586 3587 3588 3589
		f 4 6728 6729 6730 6731
		mu 0 4 3586 3590 3591 3592
		f 4 -6728 6732 6733 -6729
		mu 0 4 3586 3589 3593 3590
		f 4 6734 6735 6736 6737
		mu 0 4 3594 3595 3596 3597
		f 4 6738 -6557 6739 6740
		mu 0 4 3594 3446 3445 3598
		f 4 -6738 6741 -6559 -6739
		mu 0 4 3594 3597 3448 3446
		f 4 -6562 6742 -6730 6743
		mu 0 4 3452 3451 3591 3590
		f 4 6744 6745 6746 6747
		mu 0 4 3599 3600 3601 3602
		f 3 6748 -6745 6749
		mu 0 3 3588 3600 3599
		f 4 -6748 6750 -6736 6751
		mu 0 4 3599 3602 3596 3595
		f 4 6752 6753 6754 -6746
		mu 0 4 3600 3603 3604 3601
		f 4 -6753 6755 6756 6757
		mu 0 4 3603 3600 3605 3606
		f 4 6758 6759 -6565 6760
		mu 0 4 3607 3584 3456 3455
		f 4 6761 6762 6763 6764
		mu 0 4 3608 3609 3610 3611
		f 4 6765 -6701 6766 6767
		mu 0 4 3612 3569 3570 3613
		f 4 -6568 6768 6769 6770
		mu 0 4 3460 3459 3614 3615
		f 4 -6771 6771 6772 -6570
		mu 0 4 3460 3615 3616 3462
		f 3 6773 6774 6775
		mu 0 3 3617 3618 3619
		f 3 6776 6777 -6775
		mu 0 3 3618 3620 3619
		f 4 -6774 6778 6779 6780
		mu 0 4 3618 3617 3621 3622
		f 4 -6781 6781 6782 -6777
		mu 0 4 3618 3622 3582 3620
		f 4 6783 6784 -6573 6785
		mu 0 4 3623 3567 3466 3465
		f 4 6786 -6780 6787 -6576
		mu 0 4 3469 3622 3621 3470
		f 4 6788 6789 6790 6791
		mu 0 4 3624 3625 3626 3627
		f 4 -6792 6792 6793 6794
		mu 0 4 3624 3627 3614 3628
		f 3 6795 6796 6797
		mu 0 3 3626 3629 3630
		f 4 -6797 6798 -6772 6799
		mu 0 4 3630 3629 3616 3615
		f 4 6800 6801 6802 6803
		mu 0 4 3631 3632 3557 3633
		f 4 6804 6805 -6801 6806
		mu 0 4 3634 3635 3632 3631
		f 4 6807 6808 6809 6810
		mu 0 4 3636 3637 3638 3639
		f 4 -6811 6811 -6579 6812
		mu 0 4 3636 3639 3474 3473
		f 4 -6813 -6582 6813 6814
		mu 0 4 3636 3473 3477 3640
		f 4 -6584 6815 6816 -6710
		mu 0 4 3437 3479 3641 3576
		f 4 -6817 6817 6818 -6713
		mu 0 4 3576 3641 3642 3578
		f 3 6819 -6717 -6819
		mu 0 3 3642 3580 3578
		f 4 6820 -6724 6821 6822
		mu 0 4 3643 3583 3585 3644
		f 4 6823 -6823 6824 6825
		mu 0 4 3645 3643 3644 3612
		f 4 6826 6827 6828 6829
		mu 0 4 3646 3647 3648 3649
		f 4 6830 6831 6832 6833
		mu 0 4 3646 3650 3651 3652
		f 4 -6834 6834 6835 -6827
		mu 0 4 3646 3652 3653 3647
		f 4 6836 6837 6838 6839
		mu 0 4 3654 3655 3656 3657
		f 4 6840 6841 -6586 6842
		mu 0 4 3654 3658 3482 3481
		f 4 -6843 -6589 6843 -6837
		mu 0 4 3654 3481 3485 3655
		f 4 6844 -6833 6845 -6591
		mu 0 4 3487 3652 3651 3488
		f 4 6846 6847 6848 6849
		mu 0 4 3659 3660 3661 3662
		f 3 6850 6851 -6850
		mu 0 3 3662 3648 3659
		f 4 6852 -6839 6853 -6847
		mu 0 4 3659 3657 3656 3660
		f 4 -6849 6854 6855 6856
		mu 0 4 3662 3661 3663 3664
		f 4 6857 6858 6859 -6857
		mu 0 4 3664 3665 3666 3662
		f 4 6860 -6594 6861 6862
		mu 0 4 3667 3492 3491 3668
		f 4 6863 6864 6865 6866
		mu 0 4 3669 3670 3671 3672
		f 4 6867 6868 -6805 6869
		mu 0 4 3673 3674 3635 3634
		f 3 6870 6871 6872
		mu 0 3 3588 3675 3676
		f 4 -6872 6873 6874 6875
		mu 0 4 3676 3675 3598 3677
		f 4 6876 -6597 6877 6878
		mu 0 4 3677 3496 3495 3593
		f 3 6879 6880 6881
		mu 0 3 3678 3648 3679
		f 4 6882 6883 6884 -6882
		mu 0 4 3679 3680 3658 3678
		f 4 6885 6886 -6600 6887
		mu 0 4 3680 3653 3500 3499
		f 3 6888 6889 6890
		mu 0 3 3592 3681 3682
		f 4 6891 -6603 6892 6893
		mu 0 4 3683 3504 3503 3555
		f 4 6894 6895 6896 6897
		mu 0 4 3684 3685 3668 3683
		f 3 6898 6899 6900
		mu 0 3 3686 3650 3687
		f 4 6901 6902 -6895 6903
		mu 0 4 3688 3689 3685 3684
		f 4 6904 6905 -6902 6906
		mu 0 4 3690 3673 3689 3688
		f 4 6907 -6757 6908 6909
		mu 0 4 3691 3606 3605 3692
		f 4 6910 6911 6912 -6606
		mu 0 4 3507 3693 3694 3508
		f 4 6913 6914 6915 -6912
		mu 0 4 3693 3695 3696 3694
		f 4 6916 6917 6918 -6915
		mu 0 4 3695 3697 3682 3696
		f 4 6919 -6909 6920 -6918
		mu 0 4 3697 3692 3605 3682
		f 4 -6910 6921 -6859 6922
		mu 0 4 3691 3692 3666 3665
		f 4 -6609 6923 6924 6925
		mu 0 4 3512 3511 3698 3699
		f 4 -6925 6926 6927 6928
		mu 0 4 3699 3698 3700 3701
		f 4 -6928 6929 6930 6931
		mu 0 4 3701 3700 3687 3702
		f 4 -6931 6932 -6922 6933
		mu 0 4 3702 3687 3666 3692
		f 4 6934 6935 6936 6937
		mu 0 4 3703 3607 3704 3705
		f 3 -6938 6938 6939
		mu 0 3 3703 3705 3644
		f 4 6940 6941 6942 6943
		mu 0 4 3706 3707 3573 3708
		f 4 6944 6945 6946 6947
		mu 0 4 3709 3710 3711 3667
		f 3 -6945 6948 6949
		mu 0 3 3710 3709 3689
		f 4 6950 6951 6952 6953
		mu 0 4 3712 3713 3638 3714
		f 4 6954 6955 6956 6957
		mu 0 4 3715 3716 3707 3717
		f 4 6958 6959 6960 -6955
		mu 0 4 3715 3718 3575 3716
		f 4 6961 6962 -6612 6963
		mu 0 4 3566 3704 3516 3515
		f 3 -6957 6964 6965
		mu 0 3 3717 3707 3611
		f 4 6966 6967 6968 6969
		mu 0 4 3719 3720 3714 3721
		f 4 -6970 6970 6971 6972
		mu 0 4 3719 3721 3640 3722
		f 4 6973 -6615 6974 6975
		mu 0 4 3633 3520 3519 3711
		f 3 -6968 6976 6977
		mu 0 3 3714 3720 3670
		f 4 6978 6979 6980 6981
		mu 0 4 3723 3724 3725 3726
		f 4 -6982 6982 -6618 6983
		mu 0 4 3723 3726 3524 3523
		f 3 -6980 6984 6985
		mu 0 3 3725 3724 3602
		f 4 6986 6987 6988 6989
		mu 0 4 3727 3728 3729 3730
		f 4 6990 -6621 6991 -6987
		mu 0 4 3727 3528 3527 3728
		f 3 -6989 6992 6993
		mu 0 3 3730 3729 3660
		f 4 -6937 -6962 -6695 6994
		mu 0 4 3705 3704 3566 3565
		f 4 -6939 -6995 -6699 6995
		mu 0 4 3644 3705 3565 3569
		f 3 -6996 -6766 -6825
		mu 0 3 3644 3569 3612
		f 4 6996 -6804 -6976 -6946
		mu 0 4 3710 3631 3633 3711
		f 4 6997 -6807 -6997 -6950
		mu 0 4 3689 3634 3631 3710
		f 3 -6998 -6906 -6870
		mu 0 3 3634 3689 3673
		f 4 -6936 -6761 -6623 -6963
		mu 0 4 3704 3607 3455 3516
		f 4 -6975 -6624 -6861 -6947
		mu 0 4 3711 3519 3492 3667
		f 4 6998 -6868 6999 7000
		mu 0 4 3731 3674 3673 3732
		f 4 -6679 -6625 -6974 -6803
		mu 0 4 3557 3423 3520 3633
		f 3 -6784 7001 -6697
		mu 0 3 3567 3623 3568
		f 4 7002 7003 -6768 7004
		mu 0 4 3733 3734 3612 3613
		f 4 -6696 -6964 -6626 -6785
		mu 0 4 3567 3566 3515 3466
		f 3 -6680 -6802 7005
		mu 0 3 3556 3557 3632
		f 4 -6723 -6759 -6935 7006
		mu 0 4 3585 3584 3607 3703
		f 4 -6722 -6720 -6627 -6760
		mu 0 4 3584 3581 3441 3456
		f 4 7007 7008 -6826 -7004
		mu 0 4 3734 3735 3645 3612
		f 3 -7007 -6940 -6822
		mu 0 3 3585 3703 3644
		f 4 -6862 -6628 -6892 -6897
		mu 0 4 3668 3491 3504 3683
		f 4 -7000 -6905 7009 7010
		mu 0 4 3732 3673 3690 3736
		f 4 7011 -6948 -6863 -6896
		mu 0 4 3685 3709 3667 3668
		f 3 -7012 -6903 -6949
		mu 0 3 3709 3685 3689
		f 3 7012 7013 -6907
		mu 0 3 3688 3551 3690
		f 4 -7013 -6904 7014 -6672
		mu 0 4 3551 3688 3684 3552
		f 4 -7015 -6898 -6894 -6676
		mu 0 4 3552 3684 3683 3555
		f 4 -6782 -6787 -6629 -6719
		mu 0 4 3582 3622 3469 3442
		f 3 7015 -6824 7016
		mu 0 3 3619 3643 3645
		f 4 -6778 7017 -6821 -7016
		mu 0 4 3619 3620 3583 3643
		f 4 -6783 -6718 -6721 -7018
		mu 0 4 3620 3582 3581 3583
		f 4 -6893 -6630 -6682 -6677
		mu 0 4 3555 3503 3428 3553
		f 3 7018 7019 -7014
		mu 0 3 3551 3561 3690
		f 4 -6669 7020 -6686 -7019
		mu 0 4 3551 3550 3558 3561
		f 4 -6675 7021 -6687 -7021
		mu 0 4 3550 3554 3562 3558
		f 4 -6632 7022 -7022 -6681
		mu 0 4 3427 3531 3562 3554
		f 3 7023 -7017 7024
		mu 0 3 3625 3619 3645
		f 4 -7024 -6789 7025 -6776
		mu 0 4 3619 3625 3624 3617
		f 4 -7026 -6795 7026 -6779
		mu 0 4 3617 3624 3628 3621
		f 4 -6788 -7027 7027 -6633
		mu 0 4 3470 3621 3628 3532
		f 4 -6665 -6688 -7023 -6635
		mu 0 4 3418 3547 3562 3531
		f 3 -6691 -6684 7028
		mu 0 3 3564 3560 3559
		f 4 -6689 -6664 -6693 -7029
		mu 0 4 3559 3547 3546 3564
		f 4 7029 -7010 7030 -6763
		mu 0 4 3609 3736 3690 3610
		f 4 -7031 -7020 -6685 7031
		mu 0 4 3610 3690 3561 3560
		f 4 -6636 -7028 -6794 -6769
		mu 0 4 3459 3532 3628 3614
		f 3 -6798 7032 -6791
		mu 0 3 3626 3630 3627
		f 4 -7033 -6800 -6770 -6793
		mu 0 4 3627 3630 3615 3614
		f 4 -6866 7033 -7009 7034
		mu 0 4 3672 3671 3645 3735
		f 4 7035 -6790 -7025 -7034
		mu 0 4 3671 3626 3625 3645
		f 4 -6638 7036 7037 -6666
		mu 0 4 3421 3535 3718 3548
		f 4 7038 -6958 7039 -6690
		mu 0 4 3563 3715 3717 3560
		f 4 -6694 -7038 -6959 -7039
		mu 0 4 3563 3548 3718 3715
		f 4 -7032 -7040 -6966 -6764
		mu 0 4 3610 3560 3717 3611
		f 4 -6773 7040 7041 -6639
		mu 0 4 3462 3616 3722 3536
		f 4 -6796 7042 -6967 7043
		mu 0 4 3629 3626 3720 3719
		f 4 -7044 -6973 -7041 -6799
		mu 0 4 3629 3719 3722 3616
		f 4 -6865 -6977 -7043 -7036
		mu 0 4 3671 3670 3720 3626
		f 4 -6960 -7037 -6641 -6709
		mu 0 4 3575 3718 3535 3434
		f 4 -6814 -6642 -7042 -6972
		mu 0 4 3640 3477 3536 3722
		f 3 7044 -6956 7045
		mu 0 3 3574 3707 3716
		f 4 -6961 -6708 -6705 -7046
		mu 0 4 3716 3575 3571 3574
		f 3 7046 7047 -6969
		mu 0 3 3714 3637 3721
		f 4 -7048 -6808 -6815 -6971
		mu 0 4 3721 3637 3636 3640
		f 4 7048 7049 -6943 -6703
		mu 0 4 3572 3737 3708 3573
		f 4 -6707 -6644 7050 -7049
		mu 0 4 3572 3431 3539 3737
		f 3 -6941 7051 -6965
		mu 0 3 3707 3706 3611
		f 4 -6810 -6952 7052 7053
		mu 0 4 3639 3638 3713 3738
		f 4 -7054 7054 -6645 -6812
		mu 0 4 3639 3738 3540 3474;
	setAttr ".fc[3500:3575]"
		f 3 -6954 -6978 7055
		mu 0 3 3712 3714 3670
		f 3 -6704 -6942 -7045
		mu 0 3 3574 3573 3707
		f 3 -6809 -7047 -6953
		mu 0 3 3638 3637 3714
		f 4 -6981 7056 -7050 7057
		mu 0 4 3726 3725 3708 3737
		f 4 -7058 -7051 -6647 -6983
		mu 0 4 3726 3737 3539 3524
		f 4 -6747 7058 -7052 7059
		mu 0 4 3602 3601 3611 3706
		f 4 -7060 -6944 -7057 -6986
		mu 0 4 3602 3706 3708 3725
		f 4 -6755 7060 -6765 -7059
		mu 0 4 3601 3604 3608 3611
		f 4 7061 -7053 7062 -6988
		mu 0 4 3728 3738 3713 3729
		f 4 -6992 -6648 -7055 -7062
		mu 0 4 3728 3527 3540 3738
		f 4 7063 -7056 7064 -6848
		mu 0 4 3660 3712 3670 3661
		f 4 -6993 -7063 -6951 -7064
		mu 0 4 3660 3729 3713 3712
		f 4 -7065 -6864 7065 -6855
		mu 0 4 3661 3670 3669 3663
		f 4 -6737 7066 -6979 7067
		mu 0 4 3597 3596 3724 3723
		f 4 -7068 -6984 -6649 -6742
		mu 0 4 3597 3723 3523 3448
		f 3 -7067 -6751 -6985
		mu 0 3 3724 3596 3602
		f 4 7068 -6990 7069 -6838
		mu 0 4 3655 3727 3730 3656
		f 4 -6844 -6650 -6991 -7069
		mu 0 4 3655 3485 3528 3727
		f 3 -7070 -6994 -6854
		mu 0 3 3656 3730 3660
		f 4 -6740 -6651 -6877 -6875
		mu 0 4 3598 3445 3496 3677
		f 4 -6884 -6888 -6652 -6842
		mu 0 4 3658 3680 3499 3482
		f 4 -6871 -6750 -6752 7070
		mu 0 4 3675 3588 3599 3595
		f 4 -7071 -6735 -6741 -6874
		mu 0 4 3675 3595 3594 3598
		f 4 7071 -6853 -6852 -6880
		mu 0 4 3678 3657 3659 3648
		f 4 -6885 -6841 -6840 -7072
		mu 0 4 3678 3658 3654 3657
		f 3 -6873 7072 -6727
		mu 0 3 3588 3676 3589
		f 4 -7073 -6876 -6879 -6733
		mu 0 4 3589 3676 3677 3593
		f 3 -6881 -6828 7073
		mu 0 3 3679 3648 3647
		f 4 -6836 -6886 -6883 -7074
		mu 0 4 3647 3653 3680 3679
		f 4 -6878 -6653 -6744 -6734
		mu 0 4 3593 3495 3452 3590
		f 3 7074 -6749 -6726
		mu 0 3 3587 3600 3588
		f 4 -6835 -6845 -6654 -6887
		mu 0 4 3653 3652 3487 3500
		f 3 7075 -6829 -6851
		mu 0 3 3662 3649 3648
		f 4 -6731 7076 7077 -6889
		mu 0 4 3592 3591 3739 3681
		f 4 -6656 7078 -7077 -6743
		mu 0 4 3451 3543 3739 3591
		f 4 -6899 7079 7080 -6832
		mu 0 4 3650 3686 3740 3651
		f 4 -6846 -7081 7081 -6657
		mu 0 4 3488 3651 3740 3544
		f 4 -6921 -6756 -7075 7082
		mu 0 4 3682 3605 3600 3587
		f 4 -7083 -6725 -6732 -6891
		mu 0 4 3682 3587 3586 3592
		f 4 7083 -7076 -6860 -6933
		mu 0 4 3687 3649 3662 3666
		f 4 -6900 -6831 -6830 -7084
		mu 0 4 3687 3650 3646 3649
		f 4 -6913 7084 -7079 -6659
		mu 0 4 3508 3694 3739 3543
		f 4 -6916 7085 -7078 -7085
		mu 0 4 3694 3696 3681 3739
		f 3 -6890 -7086 -6919
		mu 0 3 3682 3681 3696
		f 4 -6660 -7082 7086 -6924
		mu 0 4 3511 3544 3740 3698
		f 4 -7087 -7080 7087 -6927
		mu 0 4 3698 3740 3686 3700
		f 3 -6901 -6930 -7088
		mu 0 3 3686 3687 3700
		f 4 -6712 7088 -6911 -6661
		mu 0 4 3438 3577 3693 3507
		f 4 -6715 7089 -6914 -7089
		mu 0 4 3577 3579 3695 3693
		f 4 -6716 7090 -6917 -7090
		mu 0 4 3579 3580 3697 3695
		f 3 -6920 -7091 7091
		mu 0 3 3692 3697 3580
		f 4 -6662 -6926 7092 -6816
		mu 0 4 3479 3512 3699 3641
		f 4 -7093 -6929 7093 -6818
		mu 0 4 3641 3699 3701 3642
		f 4 -7094 -6932 7094 -6820
		mu 0 4 3642 3701 3702 3580
		f 3 -6934 -7092 -7095
		mu 0 3 3702 3692 3580
		f 4 2563 -7099 -1924 7099
		mu 0 4 1366 3742 1080 1083
		f 4 7101 7100 -7100 -1929
		mu 0 4 1086 3743 1366 1083
		f 4 -7104 -1867 7105 7104
		mu 0 4 3744 1052 1051 3745
		f 4 2567 -7106 -1862 2571
		mu 0 4 1372 3745 1051 1049
		f 4 7111 7110 -7110 -4449
		mu 0 4 2388 3748 3747 2389
		f 4 -7114 -7147 7149 7147
		mu 0 4 3749 2392 2391 3750
		f 4 7117 7116 -7116 -4509
		mu 0 4 2417 3752 3751 2420
		f 4 7121 7120 -7120 -4502
		mu 0 4 2410 3754 3753 2416
		f 4 5112 -7122 -4491 5117
		mu 0 4 2666 3754 2410 2409
		f 4 -7124 -4459 7125 7124
		mu 0 4 3755 2396 2395 3756
		f 4 5116 -7126 -4466 -5114
		mu 0 4 2664 3756 2395 2399
		f 4 -7128 -4485 7129 7128
		mu 0 4 3757 2403 2407 3758
		f 4 5109 -7130 -4482 5114
		mu 0 4 1375 3758 2407 2405
		f 4 7133 7132 -7132 -1889
		mu 0 4 1066 3760 3759 1067
		f 4 7137 7136 -7136 -1899
		mu 0 4 1064 3762 3761 1070
		f 4 2566 -7138 -1887 -2569
		mu 0 4 1369 3762 1064 1062
		f 4 7141 7140 -7140 -1879
		mu 0 4 1056 3764 3763 1060
		f 4 -1906 7096 7095 -7144
		mu 0 4 1072 1073 3741 3765
		f 4 -7146 -4474 7127 7126
		mu 0 4 3766 2401 2403 3757
		f 4 -7149 4515 -4515 4516
		mu 0 4 2391 2386 2421 2423
		f 4 -7150 -4517 5108 5110
		mu 0 4 3750 2391 2423 2663;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode joint -n "R_Eye_SkinJnt";
	rename -uid "6BDCDC33-4E28-AFEC-E2BD-FE92FBF29E82";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_Eye_SkinJnt_pointConstraint1" -p "R_Eye_SkinJnt";
	rename -uid "D450F6B6-422A-4FA4-9AFD-64B2828BF0EA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_Eye_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_Eye_SkinJnt_orientConstraint1" -p "R_Eye_SkinJnt";
	rename -uid "53623A7F-4DF9-3236-E165-13816780A37E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_Eye_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_UpBrow_In_SkinJnt";
	rename -uid "232FE826-47FF-516B-E95D-5090F924EDF1";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_UpBrow_In_SkinJnt_pointConstraint1" -p "R_UpBrow_In_SkinJnt";
	rename -uid "28B78A48-45E5-1634-1E1D-609CAC720BB1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpBrow_In_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.7517168521881104 -11.814376831054688 176.61866760253906 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_UpBrow_In_SkinJnt_orientConstraint1" -p "R_UpBrow_In_SkinJnt";
	rename -uid "FF76586C-4D53-FE2F-C9C2-53B52CD22E71";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpBrow_In_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_UpBrow_Mid_SkinJnt";
	rename -uid "356E0D50-4682-5355-6DA1-4490965066A6";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_UpBrow_Mid_SkinJnt_pointConstraint1" -p "R_UpBrow_Mid_SkinJnt";
	rename -uid "4C2955E1-440E-E307-59C6-7997EF48DF32";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpBrow_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -5.8357455157973739 -10.817544637078356 176.36947391945884 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_UpBrow_Mid_SkinJnt_orientConstraint1" -p "R_UpBrow_Mid_SkinJnt";
	rename -uid "322AC981-4041-E574-CCF2-6AA83674DFBD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpBrow_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_UpBrow_Out_SkinJnt";
	rename -uid "3D2C88A4-4B48-E968-E67D-209F77497506";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_UpBrow_Out_SkinJnt_pointConstraint1" -p "R_UpBrow_Out_SkinJnt";
	rename -uid "B61D12F6-4DEA-3287-619C-FEA9E8890934";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpBrow_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -7.4746522108449014 -8.874995488669601 175.66173468480028 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_UpBrow_Out_SkinJnt_orientConstraint1" -p "R_UpBrow_Out_SkinJnt";
	rename -uid "9CDD4D25-4502-45AE-5093-48819A6A17B7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpBrow_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_DownBrow_In_SkinJnt";
	rename -uid "EDC082A9-4EAC-7801-DD4C-8EBE8F36B75F";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_DownBrow_In_SkinJnt_pointConstraint1" -p "R_DownBrow_In_SkinJnt";
	rename -uid "0FBDE589-40D3-CA33-5A91-6CACAF82A0E8";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownBrow_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.5353375953408754 -11.979391359528449 173.58525160013122 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_DownBrow_In_SkinJnt_orientConstraint1" -p "R_DownBrow_In_SkinJnt";
	rename -uid "D72A69B1-4182-D247-830F-A6A48BD7BE55";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownBrow_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_DownBrow_Mid_SkinJnt";
	rename -uid "BD49B965-4A22-5F6A-228F-15A7DCA68E6D";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_DownBrow_Mid_SkinJnt_pointConstraint1" -p "R_DownBrow_Mid_SkinJnt";
	rename -uid "C0F9E583-40A3-AADC-196D-5EBA20729E62";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownBrow_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -5.4977708836506149 -11.225475178985828 173.92613645437271 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_DownBrow_Mid_SkinJnt_orientConstraint1" -p "R_DownBrow_Mid_SkinJnt";
	rename -uid "3335F1A5-484E-1EB1-61C4-619BA93A2FF5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownBrow_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_DownBrow_Out_SkinJnt";
	rename -uid "E2297725-4A0C-B690-15CF-15AB16E8D2A7";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_DownBrow_Out_SkinJnt_pointConstraint1" -p "R_DownBrow_Out_SkinJnt";
	rename -uid "38E63565-42A5-6090-F5F7-0B986EF0711B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownBrow_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -7.0335822105407715 -9.68701171875 173.15353393554688 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_DownBrow_Out_SkinJnt_orientConstraint1" -p "R_DownBrow_Out_SkinJnt";
	rename -uid "39001C9F-4235-68E9-D847-36B2DEEA7CC9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownBrow_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_Nose_Coner_SkinJnt";
	rename -uid "9AE4C292-4B28-A0D5-E2E3-C487491738C5";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.61326880588507005;
createNode pointConstraint -n "R_Nose_Coner_SkinJnt_pointConstraint1" -p "R_Nose_Coner_SkinJnt";
	rename -uid "3905390F-403E-B080-D902-1A95B163AAB3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_Nose_Coner_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.1658878852766286 -11.601131416602101 168.48519435534271 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_Nose_Coner_SkinJnt_orientConstraint1" -p "R_Nose_Coner_SkinJnt";
	rename -uid "CE09EE80-493B-A7EA-79E9-2E8E0A524BF2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_Nose_Coner_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_Nose_Mid_SkinJnt";
	rename -uid "6AA4174E-4E15-8CFA-54CA-82AA12D20887";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_Nose_Mid_SkinJnt_pointConstraint1" -p "R_Nose_Mid_SkinJnt";
	rename -uid "7BA42A2D-4FFE-DE25-24BC-32ADB3DA8F20";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_Nose_Mid_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -2.936068283595056 -11.919106001275388 171.01740322096967 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_Nose_Mid_SkinJnt_orientConstraint1" -p "R_Nose_Mid_SkinJnt";
	rename -uid "F3D30F2D-44D6-425D-8AF6-6BB6D555FBDD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_Nose_Mid_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_Nose_Hole_SkinJnt";
	rename -uid "40952782-4C59-100A-3545-878EBAB16FFD";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "R_Nose_Hole_SkinJnt_pointConstraint1" -p "R_Nose_Hole_SkinJnt";
	rename -uid "0DABCAC5-411C-8A5C-F463-EB9C4C8B3A73";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_Nose_Hole_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -2.4255050549126214 -12.482219649138528 168.6418895881533 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_Nose_Hole_SkinJnt_orientConstraint1" -p "R_Nose_Hole_SkinJnt";
	rename -uid "D52C89D9-4AE3-B817-5414-7492D2F4D54F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_Nose_Hole_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_UpCheek_In_SkinJnt";
	rename -uid "3B8B5924-4A13-A142-8B51-BC87F2B614B8";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_UpCheek_In_SkinJnt_pointConstraint1" -p "R_UpCheek_In_SkinJnt";
	rename -uid "9A61B28A-4446-A9D0-3677-9093C8B7B984";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpCheek_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.0206847190856934 -10.375961303710938 171.01698303222656 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_UpCheek_In_SkinJnt_orientConstraint1" -p "R_UpCheek_In_SkinJnt";
	rename -uid "56B77E2E-405F-4CFA-1A9B-E89EA8B324F6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpCheek_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_UpCheek_Mid_SkinJnt";
	rename -uid "F02F0A09-4B19-DD26-6910-92AB39AE4DB2";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_UpCheek_Mid_SkinJnt_pointConstraint1" -p "R_UpCheek_Mid_SkinJnt";
	rename -uid "2D96D3F0-47CA-7678-2FF0-E894648FFA19";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpCheek_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -6.3875302135556735 -9.4967803955078125 170.57197316367882 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_UpCheek_Mid_SkinJnt_orientConstraint1" -p "R_UpCheek_Mid_SkinJnt";
	rename -uid "96777A82-443A-1B5B-BA3D-60B4A6227419";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpCheek_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_UpCheek_Out_SkinJnt";
	rename -uid "74A9ED27-4F0B-0DFC-0E27-FDBB694D10E2";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_UpCheek_Out_SkinJnt_pointConstraint1" -p "R_UpCheek_Out_SkinJnt";
	rename -uid "82BE1628-4C6C-D0D4-EBE0-74A44AD7C68B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpCheek_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -7.3739256858825684 -8.265655517578125 171.70579528808594 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_UpCheek_Out_SkinJnt_orientConstraint1" -p "R_UpCheek_Out_SkinJnt";
	rename -uid "E5121BFD-40D6-1706-9709-11A04CB5A81A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpCheek_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_MidCheek_In_SkinJnt";
	rename -uid "4C21343B-495C-8457-5D14-E693FEFAF645";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_MidCheek_In_SkinJnt_pointConstraint1" -p "R_MidCheek_In_SkinJnt";
	rename -uid "E4DC2039-411C-EA1D-89B8-8FA580481E3F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_MidCheek_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.4604015350341797 -10.6324462890625 169.18833923339844 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_MidCheek_In_SkinJnt_orientConstraint1" -p "R_MidCheek_In_SkinJnt";
	rename -uid "08951D49-405A-CC10-50D7-608007C4A947";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_MidCheek_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_MidCheek_Mid_SkinJnt";
	rename -uid "9468FF34-4E5D-F182-9A22-DB8AB1D8EFD3";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_MidCheek_Mid_SkinJnt_pointConstraint1" -p "R_MidCheek_Mid_SkinJnt";
	rename -uid "F06C078B-4441-8ECD-BF9C-31A382B6C329";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_MidCheek_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -6.6101061991182961 -9.1417488461902074 168.97740962258493 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_MidCheek_Mid_SkinJnt_orientConstraint1" -p "R_MidCheek_Mid_SkinJnt";
	rename -uid "20A80399-43D7-0D43-61B4-9E9883C715CD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_MidCheek_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_MidCheek_Out_SkinJnt";
	rename -uid "09C3E852-4E5C-0705-52B3-BD97C3D8CE3B";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_MidCheek_Out_SkinJnt_pointConstraint1" -p "R_MidCheek_Out_SkinJnt";
	rename -uid "212692F6-44F9-F35B-DDEE-BA9662655072";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_MidCheek_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -8.1555351478500064 -6.095742468427467 169.88292186167942 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_MidCheek_Out_SkinJnt_orientConstraint1" -p "R_MidCheek_Out_SkinJnt";
	rename -uid "032562FD-4DB5-6408-C057-6F800AE77957";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_MidCheek_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_DownCheek_In_SkinJnt";
	rename -uid "5A3BD4B9-42F7-DE10-C99C-92BA24580276";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_DownCheek_In_SkinJnt_pointConstraint1" -p "R_DownCheek_In_SkinJnt";
	rename -uid "B77E9988-4264-48BC-1C72-738DD136C299";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownCheek_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -5.8300023078918457 -9.03533935546875 166.40879821777344 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_DownCheek_In_SkinJnt_orientConstraint1" -p "R_DownCheek_In_SkinJnt";
	rename -uid "FFBB7B0A-40A8-41BB-5EE9-68A33D45C9A2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownCheek_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_DownCheek_Mid_SkinJnt";
	rename -uid "1DE0C95D-4312-7109-7DFE-8CA8D1EDD078";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_DownCheek_Mid_SkinJnt_pointConstraint1" -p "R_DownCheek_Mid_SkinJnt";
	rename -uid "62DBA6A5-4494-10A2-4BAA-59A040DA6974";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownCheek_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -6.9399024297010001 -6.9079212950890287 166.60686459547665 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_DownCheek_Mid_SkinJnt_orientConstraint1" -p "R_DownCheek_Mid_SkinJnt";
	rename -uid "0CB92C57-4AF8-4363-3D3F-43A27B22270D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownCheek_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_DownCheek_Out_SkinJnt";
	rename -uid "96965601-49DA-FB74-B0CE-A2943C1F3DEB";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_DownCheek_Out_SkinJnt_pointConstraint1" -p "R_DownCheek_Out_SkinJnt";
	rename -uid "36DAABDD-495D-1100-244D-61A43A62FE32";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownCheek_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -7.351894693030296 -4.6280170071202846 165.58941650390625 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_DownCheek_Out_SkinJnt_orientConstraint1" -p "R_DownCheek_Out_SkinJnt";
	rename -uid "EC9B6509-42F6-73A9-8155-7BB50272D8E9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownCheek_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_UpLip_Mid_SkinJnt";
	rename -uid "DECEC667-458C-B3A4-BD56-E59362A51E4B";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "R_UpLip_Mid_SkinJnt_pointConstraint1" -p "R_UpLip_Mid_SkinJnt";
	rename -uid "AD5FE3E6-4380-719B-72BD-C6B8DDCA6CB3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpLip_Mid_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.1267597675323486 -11.9334716796875 166.40066528320313 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_UpLip_Mid_SkinJnt_orientConstraint1" -p "R_UpLip_Mid_SkinJnt";
	rename -uid "DEB3A61B-43FB-7643-C963-A1982A4B84CB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpLip_Mid_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_UpLip_Out_SkinJnt";
	rename -uid "1027098A-4A35-74CF-825B-C2B65414E19D";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "R_UpLip_Out_SkinJnt_pointConstraint1" -p "R_UpLip_Out_SkinJnt";
	rename -uid "9158469C-444F-B8A6-2A8B-A386142FDB44";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpLip_Out_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.4567766189575195 -10.137725830078125 166.00627136230469 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_UpLip_Out_SkinJnt_orientConstraint1" -p "R_UpLip_Out_SkinJnt";
	rename -uid "A1722CC4-4D87-5B3C-965E-B4BF2AD5DC45";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpLip_Out_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_DownLip_Mid_SkinJnt";
	rename -uid "AB29EF49-46F6-75E8-67C0-1390E2EEECFB";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "R_DownLip_Mid_SkinJnt_pointConstraint1" -p "R_DownLip_Mid_SkinJnt";
	rename -uid "45BD5004-48EF-593D-86BA-268BC175D652";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownLip_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -3.2354159355163574 -11.589659062989504 165.16393170843543 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_DownLip_Mid_SkinJnt_orientConstraint1" -p "R_DownLip_Mid_SkinJnt";
	rename -uid "9FB2FFE5-41DA-9D3D-C846-80A3F7928D30";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownLip_Mid_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_DownLip_Out_SkinJnt";
	rename -uid "6477E4C1-4A68-5304-A10B-198EFE03AB92";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.3;
createNode pointConstraint -n "R_DownLip_Out_SkinJnt_pointConstraint1" -p "R_DownLip_Out_SkinJnt";
	rename -uid "A4B8B2E1-43EE-5845-55BD-7E920D880819";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownLip_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.4333925247192383 -10.037307739257813 165.90223693847656 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_DownLip_Out_SkinJnt_orientConstraint1" -p "R_DownLip_Out_SkinJnt";
	rename -uid "5DE9B5B9-4CAC-9A87-948F-1CA504E83D0C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownLip_Out_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_BottomCheek_In_SkinJnt";
	rename -uid "3F2114CC-4A87-0B36-9AB3-05A81AF261E3";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_BottomCheek_In_SkinJnt_pointConstraint1" -p "R_BottomCheek_In_SkinJnt";
	rename -uid "2772D09B-4178-15A4-1F35-24B8D04B913D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_BottomCheek_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -5.1453890800476074 -8.2677001953125 163.25880432128906 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_BottomCheek_In_SkinJnt_orientConstraint1" -p "R_BottomCheek_In_SkinJnt";
	rename -uid "0E784BE6-49C2-69A4-1EAA-9F9EE6996D9B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_BottomCheek_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_Temple_SkinJnt";
	rename -uid "FAB42542-4477-B50C-19B8-4998FEDCD062";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode pointConstraint -n "R_Temple_SkinJnt_pointConstraint1" -p "R_Temple_SkinJnt";
	rename -uid "B446C8C8-4CBC-D8A0-A9E4-D284BC0F553C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_Temple_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -8.3571850570887811 -5.5058700018798135 172.59735888585095 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_Temple_SkinJnt_orientConstraint1" -p "R_Temple_SkinJnt";
	rename -uid "C369181D-4925-55D2-7F17-B8BAA10A1130";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_Temple_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "C_Throut_SkinJnt";
	rename -uid "3DB7054E-4092-F846-B32B-D6A07B3C317D";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.61326880588507005;
createNode pointConstraint -n "C_Throut_SkinJnt_pointConstraint1" -p "C_Throut_SkinJnt";
	rename -uid "9C5F767B-4A1A-1587-EFCD-7AA27383A916";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_Throut_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -1.1885522603988647 -6.9104156494140625 159.87300109863281 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "C_Throut_SkinJnt_orientConstraint1" -p "C_Throut_SkinJnt";
	rename -uid "759C9AC5-4797-AE01-F062-B1ACEE65EAE2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_Throut_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "C_DownChin_SkinJnt";
	rename -uid "160A7ED8-41B8-76F1-4B98-DDA565866182";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.61326880588507005;
createNode pointConstraint -n "C_DownChin_SkinJnt_pointConstraint1" -p "C_DownChin_SkinJnt";
	rename -uid "902C7287-4D1A-2C8E-29C6-3F97CC555D2E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_DownChin_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -1.2539234837321325 -8.4173077023686762 160.86437534520803 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "C_DownChin_SkinJnt_orientConstraint1" -p "C_DownChin_SkinJnt";
	rename -uid "2F41AABA-485C-16E1-7630-DDB157825E0A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_DownChin_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "C_UpChin_SkinJnt";
	rename -uid "B2491B32-4005-8101-AC76-A4BEB3953D6C";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.61326880588507005;
createNode pointConstraint -n "C_UpChin_SkinJnt_pointConstraint1" -p "C_UpChin_SkinJnt";
	rename -uid "58914319-4523-532D-3BED-479C27641F21";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_UpChin_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -1.5325970649719238 -11.607284545898438 164.12983703613281 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "C_UpChin_SkinJnt_orientConstraint1" -p "C_UpChin_SkinJnt";
	rename -uid "D3DDEFBB-4A7E-1993-4214-45B7EE418D1E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_UpChin_LocW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_EyeLid_InCorner_ParJnt";
	rename -uid "566FD081-4C9D-369D-5D63-118E1D94519A";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "L_EyeLid_InCorner_SkinJnt" -p "L_EyeLid_InCorner_ParJnt";
	rename -uid "75A436A2-4EC1-A1DE-30FB-8E8D51D2B146";
	setAttr ".t" -type "double3" -1.2596925015095621 -1.20703125 -0.04108428955078125 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "L_EyeLid_InCorner_ParJnt_pointConstraint1" -p "L_EyeLid_InCorner_ParJnt";
	rename -uid "E248FC50-4446-ED8F-D4C3-AAA9D8735BAE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_EyeLid_InCorner_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_EyeLid_InCorner_ParJnt_orientConstraint1" -p "L_EyeLid_InCorner_ParJnt";
	rename -uid "FF226217-4684-9393-0F25-2B9C8E0B9802";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_EyeLid_InCorner_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_EyeLid_OutCorner_ParJnt";
	rename -uid "A46DE2DA-48DA-EB3C-959D-89A8E4018767";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "L_EyeLid_OutCorner_SkinJnt" -p "L_EyeLid_OutCorner_ParJnt";
	rename -uid "1A4DDBA7-46D7-72FC-4C89-E6AE5FC87C41";
	setAttr ".t" -type "double3" 1.0735903233289719 -1.27691650390625 0.15247344970703125 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "L_EyeLid_OutCorner_ParJnt_pointConstraint1" -p "L_EyeLid_OutCorner_ParJnt";
	rename -uid "50853965-4132-AB51-5F63-9888C96C4D23";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_EyeLid_OutCorner_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_EyeLid_OutCorner_ParJnt_orientConstraint1" -p "L_EyeLid_OutCorner_ParJnt";
	rename -uid "E8FD794B-4C82-07B5-9E43-8885CBD1D919";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_EyeLid_OutCorner_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_UpEyeLid_In_ParJnt";
	rename -uid "6FBAA78D-4B33-0C47-6C44-1A80FCE89D80";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "L_UpEyeLid_In_SkinJnt" -p "L_UpEyeLid_In_ParJnt";
	rename -uid "052B21C4-48F8-FB2D-5946-71A7E90BBF42";
	setAttr ".t" -type "double3" -0.62168420851230621 -1.555755615234375 0.33675384521484375 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "L_UpEyeLid_In_ParJnt_pointConstraint1" -p "L_UpEyeLid_In_ParJnt";
	rename -uid "D30BB6F3-4432-ACFA-5280-7CB28CF84835";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpEyeLid_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_UpEyeLid_In_ParJnt_orientConstraint1" -p "L_UpEyeLid_In_ParJnt";
	rename -uid "D812E99C-4E25-1FB2-C33D-85B36479292B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpEyeLid_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_UpEyeLid_Mid_ParJnt";
	rename -uid "5036A331-4FE8-7A4C-47C4-1C8F48A2D3A4";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "L_UpEyeLid_Mid_SkinJnt" -p "L_UpEyeLid_Mid_ParJnt";
	rename -uid "77EEE46E-4EE2-EA94-FBA9-7DAD160D1C86";
	setAttr ".t" -type "double3" -0.015577609509938695 -1.6155951964327233 0.47957625451491026 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "L_UpEyeLid_Mid_ParJnt_pointConstraint1" -p "L_UpEyeLid_Mid_ParJnt";
	rename -uid "8455F44F-4E8C-5CC7-40C2-C68FACD8A8EE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpEyeLid_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_UpEyeLid_Mid_ParJnt_orientConstraint1" -p "L_UpEyeLid_Mid_ParJnt";
	rename -uid "2D39D661-4AFE-DD2E-0961-8EA88AA30BBB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpEyeLid_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_UpEyeLid_Out_ParJnt";
	rename -uid "B3CE0B7C-499E-D457-8BF2-B7983F524057";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "L_UpEyeLid_Out_SkinJnt" -p "L_UpEyeLid_Out_ParJnt";
	rename -uid "B7CC364C-4364-C792-F639-40B9FD3DA646";
	setAttr ".t" -type "double3" 0.6633186524491792 -1.5184966896288561 0.37308743960718971 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "L_UpEyeLid_Out_ParJnt_pointConstraint1" -p "L_UpEyeLid_Out_ParJnt";
	rename -uid "8A737E98-4DFC-C19A-97E5-40A84D10DFB9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpEyeLid_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_UpEyeLid_Out_ParJnt_orientConstraint1" -p "L_UpEyeLid_Out_ParJnt";
	rename -uid "196F8135-4A59-FDAF-073D-77944A1CA4F1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_UpEyeLid_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_DownEyeLid_In_ParJnt";
	rename -uid "CCD515A6-4CD4-39A3-6290-FEA363A70A69";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "L_DownEyeLid_In_SkinJnt" -p "L_DownEyeLid_In_ParJnt";
	rename -uid "2D06A24D-44A1-3781-34E0-BB9906472331";
	setAttr ".t" -type "double3" -0.58699168264865875 -1.4017486572265625 -0.23293304443359375 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "L_DownEyeLid_In_ParJnt_pointConstraint1" -p "L_DownEyeLid_In_ParJnt";
	rename -uid "EFBB845A-4B43-79EF-41C7-CABF7AFA9D5F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownEyeLid_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_DownEyeLid_In_ParJnt_orientConstraint1" -p "L_DownEyeLid_In_ParJnt";
	rename -uid "FF2D0C93-4008-9D45-3103-31ADE13D2BFE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownEyeLid_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_DownEyeLid_Mid_ParJnt";
	rename -uid "CC8A400F-4D70-E46B-A9CC-138E6F569A41";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "L_DownEyeLid_Mid_SkinJnt" -p "L_DownEyeLid_Mid_ParJnt";
	rename -uid "1AA69238-4EA5-EC2B-EB2B-049F46ABDA34";
	setAttr ".t" -type "double3" 0.10377079741072359 -1.5057736139936857 -0.24320411565867062 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "L_DownEyeLid_Mid_ParJnt_pointConstraint1" -p "L_DownEyeLid_Mid_ParJnt";
	rename -uid "094F63CF-426C-F328-A8AB-CCBBE24C15B2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownEyeLid_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_DownEyeLid_Mid_ParJnt_orientConstraint1" -p "L_DownEyeLid_Mid_ParJnt";
	rename -uid "20AC29B0-4B50-9871-956F-2F92B9572123";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownEyeLid_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "L_DownEyeLid_Out_ParJnt";
	rename -uid "B93BCE6F-4BD5-FAEB-3651-E798C7007ECE";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.5;
createNode joint -n "L_DownEyeLid_Out_SkinJnt" -p "L_DownEyeLid_Out_ParJnt";
	rename -uid "4451824F-4E89-B2BC-827D-4DBF1AC52E4E";
	setAttr ".t" -type "double3" 0.70270376747976715 -1.3947772696799348 -0.14944640531942355 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "L_DownEyeLid_Out_ParJnt_pointConstraint1" -p "L_DownEyeLid_Out_ParJnt";
	rename -uid "95B6C07D-4FD0-1A73-7C56-729C49C7ED16";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownEyeLid_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "L_DownEyeLid_Out_ParJnt_orientConstraint1" -p "L_DownEyeLid_Out_ParJnt";
	rename -uid "704BF39F-4FF7-E494-7A0C-0BBA48F9CCC3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_DownEyeLid_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode joint -n "R_DownEyeLid_Out_ParJnt";
	rename -uid "090A6BDF-463D-BAA8-3033-159B606FACAC";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "R_DownEyeLid_Out_SkinJnt" -p "R_DownEyeLid_Out_ParJnt";
	rename -uid "938707E2-4564-5A5C-F011-8692DFB73B8E";
	setAttr ".t" -type "double3" -0.93356120586395264 1.1552581787109375 0.46807098388671875 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "R_DownEyeLid_Out_ParJnt_pointConstraint1" -p "R_DownEyeLid_Out_ParJnt";
	rename -uid "6F38A7BC-470B-6A85-B58F-1285A3CAB177";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownEyeLid_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_DownEyeLid_Out_ParJnt_orientConstraint1" -p "R_DownEyeLid_Out_ParJnt";
	rename -uid "50A0F7A3-42A2-4189-15D2-3FBD8923BE63";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownEyeLid_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_DownEyeLid_Mid_ParJnt";
	rename -uid "246B5145-4322-C56D-D9F0-C3A4783A0580";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "R_DownEyeLid_Mid_SkinJnt" -p "R_DownEyeLid_Mid_ParJnt";
	rename -uid "0199719F-498B-1C59-77A4-50A8C17041D0";
	setAttr ".t" -type "double3" -0.35742761822904789 1.3928642345889379 0.48695739257880177 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "R_DownEyeLid_Mid_ParJnt_pointConstraint1" -p "R_DownEyeLid_Mid_ParJnt";
	rename -uid "2A0F0D8E-4897-3E2F-1205-9AB57766F2D8";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownEyeLid_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_DownEyeLid_Mid_ParJnt_orientConstraint1" -p "R_DownEyeLid_Mid_ParJnt";
	rename -uid "E694B172-4E0A-8EF1-89B5-D2A7E7095F79";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownEyeLid_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_DownEyeLid_In_ParJnt";
	rename -uid "69B6AB17-4A49-EB1A-ADF4-E9B7F9A07737";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "R_DownEyeLid_In_SkinJnt" -p "R_DownEyeLid_In_ParJnt";
	rename -uid "361D81D5-4BF4-DEF2-D953-03B1ED328E68";
	setAttr ".t" -type "double3" 0.27190840244293213 1.3850250244140625 0.42035675048828125 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "R_DownEyeLid_In_ParJnt_pointConstraint1" -p "R_DownEyeLid_In_ParJnt";
	rename -uid "AA70871A-4210-366B-29AC-B39BE6257B51";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownEyeLid_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_DownEyeLid_In_ParJnt_orientConstraint1" -p "R_DownEyeLid_In_ParJnt";
	rename -uid "0402B90D-4BAF-946F-48CE-1088BD7B0FEB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_DownEyeLid_In_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_UpEyeLid_Out_ParJnt";
	rename -uid "498F88D6-4A1E-630F-0365-FAAF936EB62A";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "R_UpEyeLid_Out_SkinJnt" -p "R_UpEyeLid_Out_ParJnt";
	rename -uid "A8CAEEE4-474F-367C-766A-F884F04C6281";
	setAttr ".t" -type "double3" -1.0383765751153069 1.4693087208113038 -0.11073673929789152 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "R_UpEyeLid_Out_ParJnt_pointConstraint1" -p "R_UpEyeLid_Out_ParJnt";
	rename -uid "77BB6A5D-4004-0D9A-9918-57A1A0DEE82A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpEyeLid_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_UpEyeLid_Out_ParJnt_orientConstraint1" -p "R_UpEyeLid_Out_ParJnt";
	rename -uid "7F0468B6-41DA-1654-2AA6-F49D9FF8A07D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpEyeLid_Out_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_UpEyeLid_Mid_ParJnt";
	rename -uid "0980EC9A-4D06-ACDA-285B-10949F599FFF";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "R_UpEyeLid_Mid_SkinJnt" -p "R_UpEyeLid_Mid_ParJnt";
	rename -uid "4D5747FE-4666-39F4-7D55-20AFF1E21858";
	setAttr ".t" -type "double3" -0.42492312674934851 1.7451499241911748 -0.26288604736328125 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "R_UpEyeLid_Mid_ParJnt_pointConstraint1" -p "R_UpEyeLid_Mid_ParJnt";
	rename -uid "2BB96CFF-4944-F7B1-B67B-CBA073BE5E8D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpEyeLid_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_UpEyeLid_Mid_ParJnt_orientConstraint1" -p "R_UpEyeLid_Mid_ParJnt";
	rename -uid "7FFCA5EA-483A-BA39-C00F-F68D627E6791";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpEyeLid_Mid_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_UpEyeLid_In_ParJnt";
	rename -uid "B1FEC6E7-4FC4-2E09-E6C6-249CF0DB0290";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "R_UpEyeLid_In_SkinJnt" -p "R_UpEyeLid_In_ParJnt";
	rename -uid "55A9CABE-4361-B9F9-7023-D89704BC0282";
	setAttr ".t" -type "double3" 0.17261326313018799 1.8451080322265625 -0.21363067626953125 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "R_UpEyeLid_In_ParJnt_pointConstraint1" -p "R_UpEyeLid_In_ParJnt";
	rename -uid "214BE2D6-4905-01B1-CAA6-09A697685B15";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpEyeLid_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_UpEyeLid_In_ParJnt_orientConstraint1" -p "R_UpEyeLid_In_ParJnt";
	rename -uid "5A67F5A7-4B6E-132D-38B4-C7A20C32BF76";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_UpEyeLid_In_LocW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_EyeLid_OutCorner_ParJnt";
	rename -uid "90393F04-4993-08F1-8FC9-D399C7336B4D";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "R_EyeLid_OutCorner_SkinJnt" -p "R_EyeLid_OutCorner_ParJnt";
	rename -uid "19A81990-4464-652E-57B7-AA819FE363F7";
	setAttr ".t" -type "double3" -1.5162085294723511 0.821807861328125 0.17662811279296875 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "R_EyeLid_OutCorner_ParJnt_pointConstraint1" -p "R_EyeLid_OutCorner_ParJnt";
	rename -uid "2814E781-4657-F641-B121-239C7248EC24";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_EyeLid_OutCorner_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_EyeLid_OutCorner_ParJnt_orientConstraint1" -p "R_EyeLid_OutCorner_ParJnt";
	rename -uid "AF16432B-4EF9-21E4-6874-5C8E0A33C5DC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_EyeLid_OutCorner_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "R_EyeLid_InCorner_ParJnt";
	rename -uid "6BD1C78D-4C4F-1220-90B6-67AF7B4DE7A8";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 0 ;
	setAttr ".radi" 0.5;
createNode joint -n "R_EyeLid_InCorner_SkinJnt" -p "R_EyeLid_InCorner_ParJnt";
	rename -uid "6765BE89-4983-6E88-A68E-A195EEA75EE8";
	setAttr ".t" -type "double3" 0.90191733837127686 1.496063232421875 0.18972015380859375 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.1;
createNode pointConstraint -n "R_EyeLid_InCorner_ParJnt_pointConstraint1" -p "R_EyeLid_InCorner_ParJnt";
	rename -uid "171C7F59-4A62-3820-2A7D-80BC9C1AE743";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_EyeLid_InCorner_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "R_EyeLid_InCorner_ParJnt_orientConstraint1" -p "R_EyeLid_InCorner_ParJnt";
	rename -uid "5FBC848B-4BA3-86BB-7C0A-F7ADCBA07ED9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_EyeLid_InCorner_LocW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr ".rsrr" -type "double3" -1.4033418597069752e-14 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_EyeLid_InCorner_Grp";
	rename -uid "E4CA4826-4805-AA46-1F33-EAB438F00DA8";
	setAttr ".t" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_EyeLid_InCorner_Loc" -p "R_EyeLid_InCorner_Grp";
	rename -uid "DA570744-4F70-828E-33E9-92B2ACF41425";
createNode locator -n "R_EyeLid_InCorner_LocShape" -p "R_EyeLid_InCorner_Loc";
	rename -uid "4D7D2326-4FEA-2E7A-A6C6-F3B1E96F830B";
	setAttr -k off ".v";
createNode transform -n "R_EyeLid_OutCorner_Grp";
	rename -uid "A89CD755-4A31-84C9-80D4-BCB0DE1D4F27";
	setAttr ".t" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_EyeLid_OutCorner_Loc" -p "R_EyeLid_OutCorner_Grp";
	rename -uid "9F1C8D7B-493E-905D-7EE3-E5BAAE240FD4";
createNode locator -n "R_EyeLid_OutCorner_LocShape" -p "R_EyeLid_OutCorner_Loc";
	rename -uid "9DB1A5FC-4912-1A02-C1D4-BC86DE0E332B";
	setAttr -k off ".v";
createNode transform -n "R_UpEyeLid_In_Grp";
	rename -uid "31E84FEE-472C-BB83-C983-82A980BDFC6C";
	setAttr ".t" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_UpEyeLid_In_Loc" -p "R_UpEyeLid_In_Grp";
	rename -uid "AF9EFCBA-41BF-4C3A-877F-878021C5EA04";
createNode locator -n "R_UpEyeLid_In_LocShape" -p "R_UpEyeLid_In_Loc";
	rename -uid "36822D5B-44D7-D4F3-7C8A-40AD2C320D00";
	setAttr -k off ".v";
createNode transform -n "R_UpEyeLid_Mid_Grp";
	rename -uid "EC560F40-4DBE-B8FC-EF39-AEAF38321839";
	setAttr ".t" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_UpEyeLid_Mid_Loc" -p "R_UpEyeLid_Mid_Grp";
	rename -uid "57745B53-459A-077B-2BA1-D1AFD00F9B64";
createNode locator -n "R_UpEyeLid_Mid_LocShape" -p "R_UpEyeLid_Mid_Loc";
	rename -uid "DBB6619D-4D3F-276D-FF65-B5A987DADB68";
	setAttr -k off ".v";
createNode transform -n "R_UpEyeLid_Out_Grp";
	rename -uid "B4A8F6BA-4AC0-DEF9-3174-A69ED9EAE930";
	setAttr ".t" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_UpEyeLid_Out_Loc" -p "R_UpEyeLid_Out_Grp";
	rename -uid "449CDD15-42D0-5555-F8AF-BBB7B7E5A654";
createNode locator -n "R_UpEyeLid_Out_LocShape" -p "R_UpEyeLid_Out_Loc";
	rename -uid "D517F041-4F7F-39AF-DED8-B0A7E27E38B1";
	setAttr -k off ".v";
createNode transform -n "R_DownEyeLid_In_Grp";
	rename -uid "28C4B5B5-4DB0-99D9-92C2-1EA36D5A0949";
	setAttr ".t" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_DownEyeLid_In_Loc" -p "R_DownEyeLid_In_Grp";
	rename -uid "15520C52-47D5-8EE5-3E0B-2984753D25DA";
createNode locator -n "R_DownEyeLid_In_LocShape" -p "R_DownEyeLid_In_Loc";
	rename -uid "06CF667C-43D1-E44D-A91E-2D819D63015C";
	setAttr -k off ".v";
createNode transform -n "R_DownEyeLid_Mid_Grp";
	rename -uid "0E758A05-44F3-E02F-1C03-1A836A013710";
	setAttr ".t" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_DownEyeLid_Mid_Loc" -p "R_DownEyeLid_Mid_Grp";
	rename -uid "C5B1AFD6-4F1E-6FE4-45AB-2AAD7901609E";
createNode locator -n "R_DownEyeLid_Mid_LocShape" -p "R_DownEyeLid_Mid_Loc";
	rename -uid "2C8E2EF8-47BB-7A0A-7B80-CB8E701FFA8B";
	setAttr -k off ".v";
createNode transform -n "R_DownEyeLid_Out_Grp";
	rename -uid "3F707E1D-4CDF-DCBC-93FB-8C8642E52864";
	setAttr ".t" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_DownEyeLid_Out_Loc" -p "R_DownEyeLid_Out_Grp";
	rename -uid "976F060D-48FE-BD26-A2BD-2285117BA1FB";
createNode locator -n "R_DownEyeLid_Out_LocShape" -p "R_DownEyeLid_Out_Loc";
	rename -uid "B33E57B3-41C5-89D3-4150-18B1BEE93FAE";
	setAttr -k off ".v";
createNode transform -n "L_DownEyeLid_Out_Grp";
	rename -uid "EC2FC89C-4403-CB7A-1C80-FBBE3AE427EB";
	setAttr ".t" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
createNode transform -n "L_DownEyeLid_Out_Loc" -p "L_DownEyeLid_Out_Grp";
	rename -uid "28DD9D36-4B87-A281-C67B-7090586777C4";
createNode locator -n "L_DownEyeLid_Out_LocShape" -p "L_DownEyeLid_Out_Loc";
	rename -uid "E42CF14F-4D9A-EC6F-ACE6-C4A4FFC0D19E";
	setAttr -k off ".v";
createNode transform -n "L_DownEyeLid_Mid_Grp";
	rename -uid "E544D8E0-4013-8916-9D84-2EB8AAA901C7";
	setAttr ".t" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
createNode transform -n "L_DownEyeLid_Mid_Loc" -p "L_DownEyeLid_Mid_Grp";
	rename -uid "07D306FC-4722-28B3-292E-20A7AD357E08";
createNode locator -n "L_DownEyeLid_Mid_LocShape" -p "L_DownEyeLid_Mid_Loc";
	rename -uid "23CD78F3-45E4-50A7-4554-87832CBF488A";
	setAttr -k off ".v";
createNode transform -n "L_DownEyeLid_In_Grp";
	rename -uid "ADA4454B-406B-53F2-A230-798CDD1A455E";
	setAttr ".t" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
createNode transform -n "L_DownEyeLid_In_Loc" -p "L_DownEyeLid_In_Grp";
	rename -uid "86CA561F-400C-B176-836D-BB8088979EDA";
createNode locator -n "L_DownEyeLid_In_LocShape" -p "L_DownEyeLid_In_Loc";
	rename -uid "28F2E9E5-424E-C50C-A89A-28AA26A5AE95";
	setAttr -k off ".v";
createNode transform -n "L_UpEyeLid_Out_Grp";
	rename -uid "50594F3A-4F9C-4A40-4DC2-8DA8A00DA600";
	setAttr ".t" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
createNode transform -n "L_UpEyeLid_Out_Loc" -p "L_UpEyeLid_Out_Grp";
	rename -uid "902B5D24-4E50-7D91-D007-6E9161DE02F9";
createNode locator -n "L_UpEyeLid_Out_LocShape" -p "L_UpEyeLid_Out_Loc";
	rename -uid "940D9067-4B8F-A146-9A9E-39B84ADF0ECC";
	setAttr -k off ".v";
createNode transform -n "L_UpEyeLid_Mid_Grp";
	rename -uid "A24BEC70-4B8A-0211-2307-4B969879F493";
	setAttr ".t" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
createNode transform -n "L_UpEyeLid_Mid_Loc" -p "L_UpEyeLid_Mid_Grp";
	rename -uid "AF07C263-4D1A-8192-D528-6BB41706D173";
createNode locator -n "L_UpEyeLid_Mid_LocShape" -p "L_UpEyeLid_Mid_Loc";
	rename -uid "3F1221DC-4665-0ABF-6691-278F58A845BB";
	setAttr -k off ".v";
createNode transform -n "L_UpEyeLid_In_Grp";
	rename -uid "3D59864A-418B-641F-A79D-9A8DE3325608";
	setAttr ".t" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
createNode transform -n "L_UpEyeLid_In_Loc" -p "L_UpEyeLid_In_Grp";
	rename -uid "6865E349-4D8B-9D61-D388-88A42C1EA443";
createNode locator -n "L_UpEyeLid_In_LocShape" -p "L_UpEyeLid_In_Loc";
	rename -uid "FE2F0512-4F7B-42A0-4997-0B83DFA8589F";
	setAttr -k off ".v";
createNode transform -n "L_EyeLid_OutCorner_Grp";
	rename -uid "85CEC3BB-42EB-B878-B6F4-A6A771EBDD8B";
	setAttr ".t" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
createNode transform -n "L_EyeLid_OutCorner_Loc" -p "L_EyeLid_OutCorner_Grp";
	rename -uid "FB58E1C7-48EB-B13A-B91D-B1BF3D7DF444";
createNode locator -n "L_EyeLid_OutCorner_LocShape" -p "L_EyeLid_OutCorner_Loc";
	rename -uid "489E78FD-4ADA-EEAA-3F22-9A84AC16DC68";
	setAttr -k off ".v";
createNode transform -n "L_EyeLid_InCorner_Grp";
	rename -uid "384D1169-4DCA-7770-E168-5ABD64811F2F";
	setAttr ".t" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
createNode transform -n "L_EyeLid_InCorner_Loc" -p "L_EyeLid_InCorner_Grp";
	rename -uid "5278C56C-4453-BADF-D7C6-D7B625EF1177";
createNode locator -n "L_EyeLid_InCorner_LocShape" -p "L_EyeLid_InCorner_Loc";
	rename -uid "355ABA7E-4FC3-2D9D-F39E-4C9E93AE30EC";
	setAttr -k off ".v";
createNode transform -n "C_UpChin_Grp";
	rename -uid "06EDD784-41E2-F6DF-609D-CB95077F3671";
	setAttr ".t" -type "double3" -1.5325970649719238 -11.607284545898438 164.12983703613281 ;
createNode transform -n "C_UpChin_Loc" -p "C_UpChin_Grp";
	rename -uid "DE3BF1DA-42D7-0E04-AFC7-89975EA498E9";
createNode locator -n "C_UpChin_LocShape" -p "C_UpChin_Loc";
	rename -uid "492F11BC-4822-4AD6-DD5C-B6A84910124A";
	setAttr -k off ".v";
createNode transform -n "C_DownChin_Grp";
	rename -uid "2E75C777-4E7A-2F29-484A-1F8788598AE7";
	setAttr ".t" -type "double3" -1.2539234837321325 -8.4173077023686762 160.86437534520803 ;
createNode transform -n "C_DownChin_Loc" -p "C_DownChin_Grp";
	rename -uid "23D53ACD-40D4-6DAE-BEA1-AFBDD92E5AC5";
createNode locator -n "C_DownChin_LocShape" -p "C_DownChin_Loc";
	rename -uid "048B5C45-4CF2-270B-3C30-008EFBC937B1";
	setAttr -k off ".v";
createNode transform -n "C_Throut_Grp";
	rename -uid "20DCF141-490F-6C1D-4445-C3BCAFEACF1D";
	setAttr ".t" -type "double3" -1.1885522603988647 -6.9104156494140625 159.87300109863281 ;
createNode transform -n "C_Throut_Loc" -p "C_Throut_Grp";
	rename -uid "325DAC91-44F0-991C-32A7-4CBF2D5F1916";
createNode locator -n "C_Throut_LocShape" -p "C_Throut_Loc";
	rename -uid "8D027784-4D3D-3677-3B8B-61B878EF3285";
	setAttr -k off ".v";
createNode transform -n "R_Temple_Grp";
	rename -uid "52AF889D-4507-8907-30A8-B2982659022E";
	setAttr ".t" -type "double3" -8.3571850570887811 -5.5058700018798135 172.59735888585095 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_Temple_Loc" -p "R_Temple_Grp";
	rename -uid "509F36AA-4729-0DAC-055E-D595AAC98E1D";
createNode locator -n "R_Temple_LocShape" -p "R_Temple_Loc";
	rename -uid "76ADDBD9-4948-A1EB-3397-6BB6E5744E64";
	setAttr -k off ".v";
createNode transform -n "R_BottomCheek_In_Grp";
	rename -uid "6292E92B-4A9A-F810-A45A-E8B2A7C5015A";
	setAttr ".t" -type "double3" -5.1453890800476074 -8.2677001953125 163.25880432128906 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_BottomCheek_In_Loc" -p "R_BottomCheek_In_Grp";
	rename -uid "08BFF671-4569-0178-E1C3-F6A66FED7CF4";
createNode locator -n "R_BottomCheek_In_LocShape" -p "R_BottomCheek_In_Loc";
	rename -uid "839408D8-4936-6DF6-9EBB-D9A69664AF32";
	setAttr -k off ".v";
createNode transform -n "R_DownLip_Out_Grp";
	rename -uid "49A78E76-4098-C1D9-2813-2C9018C270CB";
	setAttr ".t" -type "double3" -4.4333925247192383 -10.037307739257813 165.90223693847656 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_DownLip_Out_Loc" -p "R_DownLip_Out_Grp";
	rename -uid "8A14B10F-49A9-F2CB-890D-D7AE6ABF1CE2";
createNode locator -n "R_DownLip_Out_LocShape" -p "R_DownLip_Out_Loc";
	rename -uid "5088AAA0-4DB4-EAC9-0D39-DAA67F6063FF";
	setAttr -k off ".v";
createNode transform -n "R_DownLip_Mid_Grp";
	rename -uid "32C78B2C-4612-86FD-8194-D08E713E5628";
	setAttr ".t" -type "double3" -3.2354159355163574 -11.589659062989504 165.16393170843543 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_DownLip_Mid_Loc" -p "R_DownLip_Mid_Grp";
	rename -uid "ED101F33-45CA-366E-163B-E4BB0619892C";
createNode locator -n "R_DownLip_Mid_LocShape" -p "R_DownLip_Mid_Loc";
	rename -uid "D2D578C3-4532-5913-921F-F687382319B7";
	setAttr -k off ".v";
createNode transform -n "R_UpLip_Out_Grp";
	rename -uid "3B6EEE6B-4574-2FCE-F3AA-2D8F9E903F1C";
	setAttr ".t" -type "double3" -4.4567766189575195 -10.137725830078125 166.00627136230469 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_UpLip_Out_Loc" -p "R_UpLip_Out_Grp";
	rename -uid "5C0AE8F0-49E1-2723-A6EC-D08905F08036";
createNode locator -n "R_UpLip_Out_LocShape" -p "R_UpLip_Out_Loc";
	rename -uid "95C4C70C-47D1-4A56-3B3E-0487898600FE";
	setAttr -k off ".v";
createNode transform -n "R_UpLip_Mid_Grp";
	rename -uid "5B55F06F-4348-3806-EC03-3C9D1D5608BF";
	setAttr ".t" -type "double3" -3.1267597675323486 -11.9334716796875 166.40066528320313 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_UpLip_Mid_Loc" -p "R_UpLip_Mid_Grp";
	rename -uid "AAE4BA5A-4B10-0C26-22D2-1CB087539871";
createNode locator -n "R_UpLip_Mid_LocShape" -p "R_UpLip_Mid_Loc";
	rename -uid "9FB186A9-4766-3FF0-7124-0BA7D9162B93";
	setAttr -k off ".v";
createNode transform -n "R_DownCheek_Out_Grp";
	rename -uid "B70BBAE9-4994-82C7-A449-1EB8B8B18BEC";
	setAttr ".t" -type "double3" -7.351894693030296 -4.6280170071202846 165.58941650390625 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_DownCheek_Out_Loc" -p "R_DownCheek_Out_Grp";
	rename -uid "DC647A15-42A8-99D1-1384-8D93E6805369";
createNode locator -n "R_DownCheek_Out_LocShape" -p "R_DownCheek_Out_Loc";
	rename -uid "E94990AE-47B5-1DE8-1577-A5B4F924B216";
	setAttr -k off ".v";
createNode transform -n "R_DownCheek_Mid_Grp";
	rename -uid "2E5D3BFA-43CE-12DC-EB35-FB8B538893DD";
	setAttr ".t" -type "double3" -6.9399024297010001 -6.9079212950890287 166.60686459547665 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_DownCheek_Mid_Loc" -p "R_DownCheek_Mid_Grp";
	rename -uid "E042EDD0-4446-E754-EB08-22A1DFCDCC0B";
createNode locator -n "R_DownCheek_Mid_LocShape" -p "R_DownCheek_Mid_Loc";
	rename -uid "0C3AD011-41B1-F6C2-78FE-6B8F6FB95C35";
	setAttr -k off ".v";
createNode transform -n "R_DownCheek_In_Grp";
	rename -uid "55DEE175-4257-30EE-22C8-5AB86A924DD8";
	setAttr ".t" -type "double3" -5.8300023078918457 -9.03533935546875 166.40879821777344 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_DownCheek_In_Loc" -p "R_DownCheek_In_Grp";
	rename -uid "F8B657E4-4274-B575-0CF4-D2B456987386";
createNode locator -n "R_DownCheek_In_LocShape" -p "R_DownCheek_In_Loc";
	rename -uid "DCA72381-4A96-D724-41E8-4BAA7233349E";
	setAttr -k off ".v";
createNode transform -n "R_MidCheek_Out_Grp";
	rename -uid "9CD3D2B7-4A87-E22F-9BE2-8E802A8FEA84";
	setAttr ".t" -type "double3" -8.1555351478500064 -6.095742468427467 169.88292186167942 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_MidCheek_Out_Loc" -p "R_MidCheek_Out_Grp";
	rename -uid "AAF540FD-4728-0C43-1B56-6D8E18127C83";
createNode locator -n "R_MidCheek_Out_LocShape" -p "R_MidCheek_Out_Loc";
	rename -uid "6971CDB9-4A6D-6C6B-813E-D39015EDD6F2";
	setAttr -k off ".v";
createNode transform -n "R_MidCheek_Mid_Grp";
	rename -uid "9A81986D-4951-677B-33C0-CDBE4ADB360C";
	setAttr ".t" -type "double3" -6.6101061991182961 -9.1417488461902074 168.97740962258493 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_MidCheek_Mid_Loc" -p "R_MidCheek_Mid_Grp";
	rename -uid "A74C6516-4F82-D1D9-3942-DF8067C5FE6A";
createNode locator -n "R_MidCheek_Mid_LocShape" -p "R_MidCheek_Mid_Loc";
	rename -uid "E08C8CCA-4893-6358-5FBB-6D831FB2A058";
	setAttr -k off ".v";
createNode transform -n "R_MidCheek_In_Grp";
	rename -uid "9F6CF257-4F25-4DDE-2752-4FB934DFB1D8";
	setAttr ".t" -type "double3" -4.4604015350341797 -10.6324462890625 169.18833923339844 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_MidCheek_In_Loc" -p "R_MidCheek_In_Grp";
	rename -uid "3FCDEB41-4604-8CCB-F4A2-119FAA455656";
createNode locator -n "R_MidCheek_In_LocShape" -p "R_MidCheek_In_Loc";
	rename -uid "A854FB58-4113-766C-7F53-ECBC4B6A8013";
	setAttr -k off ".v";
createNode transform -n "R_UpCheek_Out_Grp";
	rename -uid "59F58B69-4DD3-F29F-2418-FDBAB2274D5F";
	setAttr ".t" -type "double3" -7.3739256858825684 -8.265655517578125 171.70579528808594 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_UpCheek_Out_Loc" -p "R_UpCheek_Out_Grp";
	rename -uid "743EDD8C-4547-8472-A266-A580E678CD17";
createNode locator -n "R_UpCheek_Out_LocShape" -p "R_UpCheek_Out_Loc";
	rename -uid "765CB6D1-4145-5C46-2A15-D3874E7B3B52";
	setAttr -k off ".v";
createNode transform -n "R_UpCheek_Mid_Grp";
	rename -uid "FC6699B4-4481-67DF-B0CD-D78F7C4EEA46";
	setAttr ".t" -type "double3" -6.3875302135556735 -9.4967803955078125 170.57197316367882 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_UpCheek_Mid_Loc" -p "R_UpCheek_Mid_Grp";
	rename -uid "62AAF433-4769-B833-1481-3B830FFC9A69";
createNode locator -n "R_UpCheek_Mid_LocShape" -p "R_UpCheek_Mid_Loc";
	rename -uid "0C21CE02-449A-7FA2-A57F-B082A0898797";
	setAttr -k off ".v";
createNode transform -n "R_UpCheek_In_Grp";
	rename -uid "CE600DB2-4DE1-1BE1-90D8-2BB4D38B6DFD";
	setAttr ".t" -type "double3" -4.0206847190856934 -10.375961303710938 171.01698303222656 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_UpCheek_In_Loc" -p "R_UpCheek_In_Grp";
	rename -uid "104C09AB-4826-016E-58C4-C6AC99782129";
createNode locator -n "R_UpCheek_In_LocShape" -p "R_UpCheek_In_Loc";
	rename -uid "547BC88D-4BF3-72D7-1E48-0984FD4094DA";
	setAttr -k off ".v";
createNode transform -n "R_Nose_Hole_Grp";
	rename -uid "6D85DB56-4657-EA69-3738-4F9D53DF65F4";
	setAttr ".t" -type "double3" -2.4255050549126214 -12.482219649138528 168.6418895881533 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_Nose_Hole_Loc" -p "R_Nose_Hole_Grp";
	rename -uid "0733CA1B-49C4-2D35-73C1-30A76EEF5BB4";
createNode locator -n "R_Nose_Hole_LocShape" -p "R_Nose_Hole_Loc";
	rename -uid "74A5F595-429F-82E0-7C1D-9380103A4D2A";
	setAttr -k off ".v";
createNode transform -n "R_Nose_Mid_Grp";
	rename -uid "BEBF5660-40CC-8B22-5D09-E3B99B442F36";
	setAttr ".t" -type "double3" -2.936068283595056 -11.919106001275388 171.01740322096967 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_Nose_Mid_Loc" -p "R_Nose_Mid_Grp";
	rename -uid "822EF89B-4D48-CF69-C750-66A9D26161FF";
createNode locator -n "R_Nose_Mid_LocShape" -p "R_Nose_Mid_Loc";
	rename -uid "BD36F930-4DD7-87E9-C694-7EB2CD748B94";
	setAttr -k off ".v";
createNode transform -n "R_Nose_Coner_Grp";
	rename -uid "62288567-4E72-0111-0865-A6A0B017D0DB";
	setAttr ".t" -type "double3" -3.1658878852766286 -11.601131416602101 168.48519435534271 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_Nose_Coner_Loc" -p "R_Nose_Coner_Grp";
	rename -uid "F29C0ED0-47FF-CCEC-D1CA-68A212DB3150";
createNode locator -n "R_Nose_Coner_LocShape" -p "R_Nose_Coner_Loc";
	rename -uid "EC422806-46BB-CACB-16AC-E79D0F86A5BB";
	setAttr -k off ".v";
createNode transform -n "R_DownBrow_Out_Grp";
	rename -uid "29B47878-48BE-0368-8DFC-B4A1A93E809E";
	setAttr ".t" -type "double3" -7.0335822105407715 -9.68701171875 173.15353393554688 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_DownBrow_Out_Loc" -p "R_DownBrow_Out_Grp";
	rename -uid "BAE6E45E-4A4B-B871-6B54-4D890A5361A3";
createNode locator -n "R_DownBrow_Out_LocShape" -p "R_DownBrow_Out_Loc";
	rename -uid "656F704C-44BD-D807-29BB-29BB809E3901";
	setAttr -k off ".v";
createNode transform -n "R_DownBrow_Mid_Grp";
	rename -uid "F9F20E78-4F1B-38E0-A125-E5B924975C5D";
	setAttr ".t" -type "double3" -5.4977708836506149 -11.225475178985828 173.92613645437271 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_DownBrow_Mid_Loc" -p "R_DownBrow_Mid_Grp";
	rename -uid "C277456C-4F35-9FB9-3974-63AC0CE41A18";
createNode locator -n "R_DownBrow_Mid_LocShape" -p "R_DownBrow_Mid_Loc";
	rename -uid "14CA1C6E-4EA8-5CD1-2C33-07A96122ED19";
	setAttr -k off ".v";
createNode transform -n "R_DownBrow_In_Grp";
	rename -uid "E5B2D429-4981-92FD-6F85-029B88362416";
	setAttr ".t" -type "double3" -3.5353375953408754 -11.979391359528449 173.58525160013122 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_DownBrow_In_Loc" -p "R_DownBrow_In_Grp";
	rename -uid "A4F9ACC9-4D81-BDEB-E057-C6BA47E1AFF3";
createNode locator -n "R_DownBrow_In_LocShape" -p "R_DownBrow_In_Loc";
	rename -uid "96900B56-4582-FDA5-B03A-F98729C72CA1";
	setAttr -k off ".v";
createNode transform -n "R_UpBrow_Out_Grp";
	rename -uid "745495C9-4CE3-76CC-2476-2DAE533C9187";
	setAttr ".t" -type "double3" -7.4746522108449014 -8.874995488669601 175.66173468480028 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_UpBrow_Out_Loc" -p "R_UpBrow_Out_Grp";
	rename -uid "C0A62414-4A15-3837-D138-9D9BF146F98E";
createNode locator -n "R_UpBrow_Out_LocShape" -p "R_UpBrow_Out_Loc";
	rename -uid "EDBD7759-4F87-EDC0-28C9-19BE24EA7DCE";
	setAttr -k off ".v";
createNode transform -n "R_UpBrow_Mid_Grp";
	rename -uid "8490211F-4633-C834-13B2-9ABE327A8700";
	setAttr ".t" -type "double3" -5.8357455157973739 -10.817544637078356 176.36947391945884 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_UpBrow_Mid_Loc" -p "R_UpBrow_Mid_Grp";
	rename -uid "5683EFB4-4182-A8AF-144B-DBBB3CF0A877";
createNode locator -n "R_UpBrow_Mid_LocShape" -p "R_UpBrow_Mid_Loc";
	rename -uid "E0748A17-4246-3ECF-85D4-57A77CB95ACB";
	setAttr -k off ".v";
createNode transform -n "R_UpBrow_In_Grp";
	rename -uid "DBCE84D6-488B-5DFD-0C3A-5F99DA2C3B72";
	setAttr ".t" -type "double3" -3.7517168521881104 -11.814376831054688 176.61866760253906 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_UpBrow_In_Loc" -p "R_UpBrow_In_Grp";
	rename -uid "958AE811-4A40-0142-7F4D-91B20264458C";
createNode locator -n "R_UpBrow_In_LocShape" -p "R_UpBrow_In_Loc";
	rename -uid "931F7740-4795-E21F-3459-C69ED6F0326D";
	setAttr -k off ".v";
createNode transform -n "R_Eye_Grp";
	rename -uid "7A3CB044-489A-D91F-7C0E-70A069644186";
	setAttr ".t" -type "double3" -4.5792943239212036 -8.8371429443359375 172.44399261474609 ;
	setAttr ".r" -type "double3" 180 0 0 ;
createNode transform -n "R_Eye_Loc" -p "R_Eye_Grp";
	rename -uid "0CCA74F9-4A46-CD4F-51A9-DB854E845ADC";
createNode locator -n "R_Eye_LocShape" -p "R_Eye_Loc";
	rename -uid "9B725437-4BC0-5B83-4C4E-DC8EC4AB6676";
	setAttr -k off ".v";
createNode transform -n "L_Eye_Grp";
	rename -uid "D015FAF5-43FD-CC4A-C5B2-95815193F125";
	setAttr ".t" -type "double3" 1.2570695430040359 -9.1449127197265625 172.51850128173828 ;
createNode transform -n "L_Eye_Loc" -p "L_Eye_Grp";
	rename -uid "6E050F46-4B10-856B-48D6-F988529E0C58";
createNode locator -n "L_Eye_LocShape" -p "L_Eye_Loc";
	rename -uid "91F4E164-4AFD-8316-FF4D-A1ADB91DDF39";
	setAttr -k off ".v";
createNode transform -n "L_Nose_Hole_Grp";
	rename -uid "7485F05C-418F-F912-9A0E-FB8EBB91FC52";
	setAttr ".t" -type "double3" -1.0606168508529663 -12.809829711914063 168.6304931640625 ;
createNode transform -n "L_Nose_Hole_Loc" -p "L_Nose_Hole_Grp";
	rename -uid "355FADCF-40CE-99FB-22C2-E29ECC1326FA";
createNode locator -n "L_Nose_Hole_LocShape" -p "L_Nose_Hole_Loc";
	rename -uid "C2A6AB01-4084-C56B-F27D-63BEA8EAA590";
	setAttr -k off ".v";
createNode transform -n "L_UpBrow_Out_Grp";
	rename -uid "76C87F0B-431C-6766-1116-08A75513C738";
	setAttr ".t" -type "double3" 3.6033354843608834 -9.4098321037420334 176.2821584385344 ;
createNode transform -n "L_UpBrow_Out_Loc" -p "L_UpBrow_Out_Grp";
	rename -uid "D8F81345-41F5-F335-C4E6-B49C4C16CB30";
createNode locator -n "L_UpBrow_Out_LocShape" -p "L_UpBrow_Out_Loc";
	rename -uid "7F65566D-46B7-F2AC-F679-B9BEDA672E47";
	setAttr -k off ".v";
createNode transform -n "L_UpBrow_Mid_Grp";
	rename -uid "DC607B6D-45C0-895E-8904-CF8D23014DB3";
	setAttr ".t" -type "double3" 1.7756061796615927 -11.238620561914562 176.62745899223364 ;
createNode transform -n "L_UpBrow_Mid_Loc" -p "L_UpBrow_Mid_Grp";
	rename -uid "96C0D079-4469-E0A5-3DC0-19A6BA4DDCC1";
createNode locator -n "L_UpBrow_Mid_LocShape" -p "L_UpBrow_Mid_Loc";
	rename -uid "362E6C15-4E91-F4C0-7C6A-D98E75756E4A";
	setAttr -k off ".v";
createNode transform -n "L_UpBrow_In_Grp";
	rename -uid "4C9DA248-4FB9-3F5C-3D57-59B43AC01807";
	setAttr ".t" -type "double3" -0.38772135972976685 -11.99188232421875 176.73753356933594 ;
createNode transform -n "L_UpBrow_In_Loc" -p "L_UpBrow_In_Grp";
	rename -uid "6CED6CF8-43FC-6443-B109-44963D0C49E2";
createNode locator -n "L_UpBrow_In_LocShape" -p "L_UpBrow_In_Loc";
	rename -uid "EBF63F50-47B5-A264-879B-DB93480A3F3C";
	setAttr -k off ".v";
createNode transform -n "C_UpBrow_Grp";
	rename -uid "9F01E91B-4759-6AD7-BE80-3D87A461A7FE";
	setAttr ".t" -type "double3" -2.0726361274719238 -12.010726928710938 176.80113220214844 ;
createNode transform -n "C_UpBrow_Loc" -p "C_UpBrow_Grp";
	rename -uid "8A87C33A-4D66-E699-DC8C-1294980D8D69";
createNode locator -n "C_UpBrow_LocShape" -p "C_UpBrow_Loc";
	rename -uid "CD21D80D-4A95-AE4D-FFD8-F2A4A6D72D92";
	setAttr -k off ".v";
createNode transform -n "L_Temple_Grp";
	rename -uid "62FF329A-4365-0005-274B-93A9AE389C9E";
	setAttr ".t" -type "double3" 4.9377613067626953 -6.38330078125 173.16799926757813 ;
createNode transform -n "L_Temple_Loc" -p "L_Temple_Grp";
	rename -uid "C7A2C6C8-47A4-DA59-8368-249185D4BC07";
createNode locator -n "L_Temple_LocShape" -p "L_Temple_Loc";
	rename -uid "1FD08CEC-491E-7683-E9CD-49BAA777BD19";
	setAttr -k off ".v";
createNode transform -n "L_BottomCheek_In_Grp";
	rename -uid "45B64A11-4F75-74DA-E0AB-2BA17B0A54E6";
	setAttr ".t" -type "double3" 2.5000591278076172 -8.7213592529296875 163.59750366210938 ;
createNode transform -n "L_BottomCheek_In_Loc" -p "L_BottomCheek_In_Grp";
	rename -uid "518FA8ED-4CEE-B9E8-B3B1-46AC359960AB";
createNode locator -n "L_BottomCheek_In_LocShape" -p "L_BottomCheek_In_Loc";
	rename -uid "0E2973D3-446E-4D14-1FA8-58BD3B7AC9CA";
	setAttr -k off ".v";
createNode transform -n "L_DownLip_Out_Grp";
	rename -uid "BCC416AF-400C-A455-502B-6D856119FA5D";
	setAttr ".t" -type "double3" 1.4242883920669556 -10.406356811523438 166.14872741699219 ;
createNode transform -n "L_DownLip_Out_Loc" -p "L_DownLip_Out_Grp";
	rename -uid "0AA348A9-4454-62FF-FDAB-A4A1362F83E5";
createNode locator -n "L_DownLip_Out_LocShape" -p "L_DownLip_Out_Loc";
	rename -uid "66EA1F13-43FC-978B-8F70-66BD71E3CCC3";
	setAttr -k off ".v";
createNode transform -n "L_DownLip_Mid_Grp";
	rename -uid "0CD50E27-4752-6846-BBCF-F0BF779394BF";
	setAttr ".t" -type "double3" 0.10377626121044159 -11.805794282793727 165.26633621957143 ;
createNode transform -n "L_DownLip_Mid_Loc" -p "L_DownLip_Mid_Grp";
	rename -uid "3344870F-4325-A319-D96A-79A119AE6BB7";
createNode locator -n "L_DownLip_Mid_LocShape" -p "L_DownLip_Mid_Loc";
	rename -uid "9C41B70C-45EA-A53E-AD2A-EDA4BCEE5CE4";
	setAttr -k off ".v";
createNode transform -n "C_DownLip_Grp";
	rename -uid "3CEEFAAE-4412-D3BA-F7DA-05B7E7B63798";
	setAttr ".t" -type "double3" -1.5785253047943115 -12.357467651367188 164.86618041992188 ;
createNode transform -n "C_DownLip_Loc" -p "C_DownLip_Grp";
	rename -uid "4720DD0F-4553-64E3-9B82-3CADE88114DD";
createNode locator -n "C_DownLip_LocShape" -p "C_DownLip_Loc";
	rename -uid "E3F9B790-4388-0AFC-6DBB-A983B2F4E1B9";
	setAttr -k off ".v";
createNode transform -n "L_UpLip_Out_Grp";
	rename -uid "89E63573-40B0-1BE6-87C7-0FBC06660DB4";
	setAttr ".t" -type "double3" 1.4837455749511719 -10.527435302734375 166.32308959960938 ;
createNode transform -n "L_UpLip_Out_Loc" -p "L_UpLip_Out_Grp";
	rename -uid "98558C2A-427C-3F4F-96AA-7A97D62CEAA1";
createNode locator -n "L_UpLip_Out_LocShape" -p "L_UpLip_Out_Loc";
	rename -uid "0548A38A-4415-D785-3BB1-11B633F2D440";
	setAttr -k off ".v";
createNode transform -n "L_UpLip_Mid_Grp";
	rename -uid "7C25E372-489A-2DC6-5F5A-DBAB19C0A20B";
	setAttr ".t" -type "double3" -0.067921750247478485 -12.10040283203125 166.48872375488281 ;
createNode transform -n "L_UpLip_Mid_Loc" -p "L_UpLip_Mid_Grp";
	rename -uid "F88B7859-4BDC-5AFA-1809-5BBF615ADCC9";
createNode locator -n "L_UpLip_Mid_LocShape" -p "L_UpLip_Mid_Loc";
	rename -uid "208F993D-4ADF-0270-3FDD-21B3102625C2";
	setAttr -k off ".v";
createNode transform -n "C_UpLip_Grp";
	rename -uid "CFE96600-4CC3-EC20-E2F7-0785DBE20955";
	setAttr ".t" -type "double3" -1.6149523258209229 -12.431228637695313 166.432373046875 ;
createNode transform -n "C_UpLip_Loc" -p "C_UpLip_Grp";
	rename -uid "E2674A67-41C8-B8BE-0E30-7488A676085A";
createNode locator -n "C_UpLip_LocShape" -p "C_UpLip_Loc";
	rename -uid "846AC428-4FD3-7D95-6EC0-F7BBF9A7EA03";
	setAttr -k off ".v";
createNode transform -n "C_Chin_Grp";
	rename -uid "73952511-442B-F544-6616-2EA102E8DA87";
	setAttr ".t" -type "double3" -1.5662120580673218 -11.395660400390625 161.72740173339844 ;
createNode transform -n "C_Chin_Loc" -p "C_Chin_Grp";
	rename -uid "02298C4A-4669-A561-921D-5EB9149611AE";
createNode locator -n "C_Chin_LocShape" -p "C_Chin_Loc";
	rename -uid "0A445DF8-4496-54DE-B4A7-16A133D93C82";
	setAttr -k off ".v";
createNode transform -n "L_DownCheek_Out_Grp";
	rename -uid "C630F5F9-4DDC-D02B-DECF-EA8E1A8307F0";
	setAttr ".t" -type "double3" 4.7107224464416504 -5.2182464599609375 166.21012878417969 ;
createNode transform -n "L_DownCheek_Out_Loc" -p "L_DownCheek_Out_Grp";
	rename -uid "15EEB9C5-46FC-8FBA-A84A-4E82FBBC041C";
createNode locator -n "L_DownCheek_Out_LocShape" -p "L_DownCheek_Out_Loc";
	rename -uid "D78EAB62-40D0-3A2C-48D4-57A8FFEF04CE";
	setAttr -k off ".v";
createNode transform -n "L_DownCheek_Mid_Grp";
	rename -uid "D0081431-42F1-32E6-EC9D-E68A2D156BFB";
	setAttr ".t" -type "double3" 4.0006491952179317 -7.4992772171776831 167.06721144383675 ;
createNode transform -n "L_DownCheek_Mid_Loc" -p "L_DownCheek_Mid_Grp";
	rename -uid "3565B413-410A-9013-1B07-01A5189BAD0E";
createNode locator -n "L_DownCheek_Mid_LocShape" -p "L_DownCheek_Mid_Loc";
	rename -uid "446373ED-42C3-5903-C567-C0BB4F0FD361";
	setAttr -k off ".v";
createNode transform -n "L_DownCheek_In_Grp";
	rename -uid "99D7F131-4C10-4B4C-D1E2-AB8F99CC7693";
	setAttr ".t" -type "double3" 2.9240539073944092 -9.5840606689453125 166.81448364257813 ;
createNode transform -n "L_DownCheek_In_Loc" -p "L_DownCheek_In_Grp";
	rename -uid "1BCF7A2F-4B9B-7637-11F2-A09135D83483";
createNode locator -n "L_DownCheek_In_LocShape" -p "L_DownCheek_In_Loc";
	rename -uid "62C15A03-451C-119C-2698-098EB74ABC29";
	setAttr -k off ".v";
createNode transform -n "L_MidCheek_Out_Grp";
	rename -uid "A890D85B-42D6-3C7F-DA77-EBA6B250A831";
	setAttr ".t" -type "double3" 4.9927334785461426 -6.8156280517578125 170.50332641601563 ;
createNode transform -n "L_MidCheek_Out_Loc" -p "L_MidCheek_Out_Grp";
	rename -uid "B870E815-4990-8D91-4464-6BAC45E2D21A";
createNode locator -n "L_MidCheek_Out_LocShape" -p "L_MidCheek_Out_Loc";
	rename -uid "979B368F-4BFC-4EBE-3777-02963B0A3029";
	setAttr -k off ".v";
createNode transform -n "L_MidCheek_Mid_Grp";
	rename -uid "4F4ED027-4B39-D9CE-6518-58B96D43D6A7";
	setAttr ".t" -type "double3" 3.2847983837127686 -9.6688995361328125 169.37957763671875 ;
createNode transform -n "L_MidCheek_Mid_Loc" -p "L_MidCheek_Mid_Grp";
	rename -uid "9FD4B829-42C8-7939-5026-B3A4E73AE551";
createNode locator -n "L_MidCheek_Mid_LocShape" -p "L_MidCheek_Mid_Loc";
	rename -uid "DC2A9120-4E0B-A047-D443-079FD9146D79";
	setAttr -k off ".v";
createNode transform -n "L_MidCheek_In_Grp";
	rename -uid "D7435F5C-4C72-6012-4F43-B1AFE6C6C955";
	setAttr ".t" -type "double3" 1.0399677753448486 -10.809371948242188 169.37937927246094 ;
createNode transform -n "L_MidCheek_In_Loc" -p "L_MidCheek_In_Grp";
	rename -uid "90698604-484E-F90A-7D72-D8A358205949";
createNode locator -n "L_MidCheek_In_LocShape" -p "L_MidCheek_In_Loc";
	rename -uid "67338CDE-4004-C43A-4E18-A88017AF0664";
	setAttr -k off ".v";
createNode transform -n "L_UpCheek_Out_Grp";
	rename -uid "3DD5F9A6-4722-D541-4CF1-9188963BF2A4";
	setAttr ".t" -type "double3" 3.8177915821610728 -8.8071447176326565 172.19076538085938 ;
createNode transform -n "L_UpCheek_Out_Loc" -p "L_UpCheek_Out_Grp";
	rename -uid "269AA9ED-48D9-2D1A-5544-31AD4DDEC091";
createNode locator -n "L_UpCheek_Out_LocShape" -p "L_UpCheek_Out_Loc";
	rename -uid "39B11D33-4C3A-82BA-8D52-A6B29457BA19";
	setAttr -k off ".v";
createNode transform -n "L_UpCheek_Mid_Grp";
	rename -uid "7719AF08-49B8-64C1-7F70-38A25AAE1A14";
	setAttr ".t" -type "double3" 2.8883547782897949 -10.034027099609375 170.933837890625 ;
createNode transform -n "L_UpCheek_Mid_Loc" -p "L_UpCheek_Mid_Grp";
	rename -uid "3F1A1DF8-46F6-234E-D577-3F8364E0B112";
createNode locator -n "L_UpCheek_Mid_LocShape" -p "L_UpCheek_Mid_Loc";
	rename -uid "3CFEE2D0-49DC-06D1-E9F2-A4845EB2D383";
	setAttr -k off ".v";
createNode transform -n "L_UpCheek_In_Grp";
	rename -uid "17C52D57-4FFB-83B9-7720-838256895C91";
	setAttr ".t" -type "double3" 0.51043468713760376 -10.650772094726563 171.21058654785156 ;
createNode transform -n "L_UpCheek_In_Loc" -p "L_UpCheek_In_Grp";
	rename -uid "B45C6E91-4565-1514-DB2F-A0B350E5482D";
createNode locator -n "L_UpCheek_In_LocShape" -p "L_UpCheek_In_Loc";
	rename -uid "D68950FA-46FA-FC8A-48BB-A29605844417";
	setAttr -k off ".v";
createNode transform -n "L_Nose_Mid_Grp";
	rename -uid "25E32AC9-4CD1-4AD0-0981-01B9CA8A085A";
	setAttr ".t" -type "double3" -0.70138211856338994 -12.066857159326446 171.04993744839365 ;
createNode transform -n "L_Nose_Mid_Loc" -p "L_Nose_Mid_Grp";
	rename -uid "6DE9DD7A-4AB3-E29C-5D07-7EB86D0519AC";
createNode locator -n "L_Nose_Mid_LocShape" -p "L_Nose_Mid_Loc";
	rename -uid "CED77B5B-414F-E800-3343-02AA5DB8F6CF";
	setAttr -k off ".v";
createNode transform -n "C_Nose_Up_Grp";
	rename -uid "5FA75E92-4F61-10C9-54A2-969235021B72";
	setAttr ".t" -type "double3" -1.8973474502563477 -12.350418090820313 172.41670227050781 ;
createNode transform -n "C_Nose_Up_Loc" -p "C_Nose_Up_Grp";
	rename -uid "D46739DD-4743-2B6A-9965-A0979E8A6D60";
createNode locator -n "C_Nose_Up_LocShape" -p "C_Nose_Up_Loc";
	rename -uid "EF443D16-46EA-615B-D551-2E822EEB2058";
	setAttr -k off ".v";
createNode transform -n "C_Nose_Tip_Grp";
	rename -uid "963EA7CB-4E9B-501F-9821-3EB7678E7FAD";
	setAttr ".t" -type "double3" -1.759971022605896 -14.492462158203125 168.62040710449219 ;
createNode transform -n "C_Nose_Tip_Loc" -p "C_Nose_Tip_Grp";
	rename -uid "A5E05D67-4A55-6199-E8DB-54B98D5E9BE5";
createNode locator -n "C_Nose_Tip_LocShape" -p "C_Nose_Tip_Loc";
	rename -uid "41A7F69A-4D70-AA7C-320C-0DBEBD3EEF79";
	setAttr -k off ".v";
createNode transform -n "L_Nose_Coner_Grp";
	rename -uid "E50EEB10-4522-EE2E-9FB7-EBB86BE85B1C";
	setAttr ".t" -type "double3" 0.018381292413145678 -11.78803683329204 168.58827174574131 ;
createNode transform -n "L_Nose_Coner_Loc" -p "L_Nose_Coner_Grp";
	rename -uid "91276327-44AF-2910-CA44-939F8044BC91";
createNode locator -n "L_Nose_Coner_LocShape" -p "L_Nose_Coner_Loc";
	rename -uid "782176A4-4D76-59A7-BEDE-EBB7AA210BB2";
	setAttr -k off ".v";
createNode transform -n "L_DownBrow_Out_Grp";
	rename -uid "0C93293D-4622-BD3E-375D-2E99049B1B47";
	setAttr ".t" -type "double3" 3.3145653803957122 -10.304400282353299 173.66130506865198 ;
createNode transform -n "L_DownBrow_Out_Loc" -p "L_DownBrow_Out_Grp";
	rename -uid "05D5F7C7-4300-E964-F7C1-9FBD45D0D8B8";
createNode locator -n "L_DownBrow_Out_LocShape" -p "L_DownBrow_Out_Loc";
	rename -uid "D9726E7C-48B7-5D7E-EE3D-9D8D4F53D983";
	setAttr -k off ".v";
createNode transform -n "L_DownBrow_Mid_Grp";
	rename -uid "58F0A2E8-40FB-DFDA-17E8-A99F510E7DA7";
	setAttr ".t" -type "double3" 1.5634675836549756 -11.646388008475469 174.20208527058662 ;
createNode transform -n "L_DownBrow_Mid_Loc" -p "L_DownBrow_Mid_Grp";
	rename -uid "25960DF7-4681-75FA-A095-16937C198DEE";
createNode locator -n "L_DownBrow_Mid_LocShape" -p "L_DownBrow_Mid_Loc";
	rename -uid "AC7D3F6F-4A49-8D74-D4F7-06A3F6554752";
	setAttr -k off ".v";
createNode transform -n "L_DownBrow_In_Grp";
	rename -uid "E17552CF-4159-FE6D-25F9-E48400B57A30";
	setAttr ".t" -type "double3" -0.44514459495940273 -12.243257300276127 173.81581369777618 ;
createNode transform -n "L_DownBrow_In_Loc" -p "L_DownBrow_In_Grp";
	rename -uid "7B211859-46D8-3637-6DA2-06AFA2491C53";
createNode locator -n "L_DownBrow_In_LocShape" -p "L_DownBrow_In_Loc";
	rename -uid "7A721BB8-41C2-C545-870C-E1BA18B81894";
	setAttr -k off ".v";
createNode transform -n "C_DownBrow_Grp";
	rename -uid "7CF983B9-4682-8A19-8888-609C181E56FA";
	setAttr ".t" -type "double3" -2.0159823243885935 -12.287944868300201 173.77847290039063 ;
createNode transform -n "C_DownBrow_Loc" -p "C_DownBrow_Grp";
	rename -uid "A1283053-4DDE-4AC0-8FD7-E4BF6BF299F7";
createNode locator -n "C_DownBrow_LocShape" -p "C_DownBrow_Loc";
	rename -uid "2A675066-41D6-6B06-4E3F-949813CF0628";
	setAttr -k off ".v";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "0FF44C90-4C99-CC62-7FEB-F98FDA054B0A";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "532F5B5A-4DAD-759D-95DA-CBBCB03F6017";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "F8614423-478D-3E28-CBF7-8E804220B537";
createNode displayLayerManager -n "layerManager";
	rename -uid "FD3C4CDA-478C-A845-8F4B-0C95493B5D16";
	setAttr ".cdl" 2;
	setAttr -s 2 ".dli[1:2]"  1 2;
	setAttr -s 2 ".dli";
createNode displayLayer -n "defaultLayer";
	rename -uid "40308A71-4E36-E458-4818-AD9B45C77ECD";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "F1DC0DF5-4F90-FC87-800F-129BA2D734BE";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "04434638-451E-9180-CA3F-1290E97C032D";
	setAttr ".g" yes;
createNode phong -n "rp_eric_rigged_001_mat";
	rename -uid "B637682F-40A2-6BB5-8952-C493FB2112CC";
	setAttr ".sc" -type "float3" 0.029999999 0.029999999 0.029999999 ;
	setAttr ".rfl" 0;
	setAttr ".cp" 2;
createNode shadingEngine -n "rp_eric_rigged_001_geoSG";
	rename -uid "E91F24A0-46AD-DF6F-E414-DC9F777FFBC0";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "540A1B03-4C3C-B17C-034A-07BA73ADCCEE";
createNode file -n "rp_eric_rigged_001_dif";
	rename -uid "6536F9A5-4B3B-517E-3794-82BA7A352FEB";
	setAttr ".ftn" -type "string" "C:/Users/user/Downloads/rp_eric_rigged_001_FBX/rp_eric_rigged_001_yup_a.fbm/rp_eric_rigged_001_dif.jpg";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture1";
	rename -uid "181D91CB-4993-6E57-F9EF-54BFB1D1FE59";
createNode script -n "uiConfigurationScriptNode";
	rename -uid "A3491F1D-497D-1713-BC88-75A823B16B2A";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 565\n            -height 327\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 565\n            -height 327\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 565\n            -height 327\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 1\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"perPolygonSort\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1137\n            -height 698\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n"
		+ "            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n"
		+ "            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 0\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n"
		+ "            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n"
		+ "                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n"
		+ "                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -autoFitTime 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n"
		+ "                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 1\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n"
		+ "\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n"
		+ "                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n"
		+ "                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -editorChanged \"updateModelPanelBar\" \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererOverrideName \"stereoOverrideVP2\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n"
		+ "                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n"
		+ "                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n"
		+ "\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"perPolygonSort\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1137\\n    -height 698\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"perPolygonSort\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1137\\n    -height 698\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 10 -size 100 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "364E2BCB-4FC2-9EAF-115C-C48FDB87C1F2";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 120 -ast 0 -aet 120 ";
	setAttr ".st" 6;
createNode displayLayer -n "layer1";
	rename -uid "40B5E5B3-4D0B-081A-5152-73B34F3E558D";
	setAttr ".do" 1;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".o" 0;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
select -ne :defaultRenderingList1;
select -ne :defaultTextureList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :initialShadingGroup;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr -k on ".macc";
	setAttr -k on ".macd";
	setAttr -k on ".macq";
	setAttr -k on ".mcfr";
	setAttr -k on ".clip";
	setAttr -k on ".edm";
	setAttr ".ren" -type "string" "arnold";
	setAttr -av -k on ".esr";
	setAttr -k on ".ors";
	setAttr -k on ".gama";
	setAttr -k on ".bfs";
	setAttr -k on ".be";
	setAttr -k on ".fec";
	setAttr -k on ".ofc";
	setAttr -k on ".comp";
	setAttr -k on ".cth";
	setAttr -k on ".soll";
	setAttr -k on ".rd";
	setAttr -k on ".lp";
	setAttr -k on ".sp";
	setAttr -k on ".shs";
	setAttr -k on ".lpr";
	setAttr -k on ".mm";
	setAttr -k on ".npu";
	setAttr -k on ".itf";
	setAttr -k on ".shp";
	setAttr -k on ".uf";
	setAttr -k on ".oi";
	setAttr -k on ".rut";
	setAttr -av -k on ".mbf";
	setAttr -k on ".afp";
	setAttr -k on ".pfb";
	setAttr -av -k on ".bll";
	setAttr -k on ".bls";
	setAttr -k on ".smv";
	setAttr -k on ".ubc";
	setAttr -k on ".mbc";
	setAttr -k on ".udbx";
	setAttr -k on ".smc";
	setAttr -k on ".kmv";
	setAttr -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -k on ".tlwd";
	setAttr -k on ".tlht";
	setAttr -k on ".jfc";
	setAttr -k on ".ope";
	setAttr -k on ".oppf";
select -ne :defaultResolution;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr -av ".w";
	setAttr -av ".h";
	setAttr ".pa" 1;
	setAttr -k on ".al";
	setAttr -av ".dar";
	setAttr -k on ".ldar";
	setAttr -k on ".off";
	setAttr -k on ".fld";
	setAttr -k on ".zsl";
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr -k off ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off ".eeaa";
	setAttr -k off ".engm";
	setAttr -k off ".mes";
	setAttr -k off ".emb";
	setAttr -av -k off ".mbbf";
	setAttr -k off ".mbs";
	setAttr -k off ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off ".enpt";
	setAttr -k off ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off ".twa";
	setAttr -k off ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "C_DownBrow_SkinJnt_pointConstraint1.ctx" "C_DownBrow_SkinJnt.tx";
connectAttr "C_DownBrow_SkinJnt_pointConstraint1.cty" "C_DownBrow_SkinJnt.ty";
connectAttr "C_DownBrow_SkinJnt_pointConstraint1.ctz" "C_DownBrow_SkinJnt.tz";
connectAttr "C_DownBrow_SkinJnt_orientConstraint1.crx" "C_DownBrow_SkinJnt.rx";
connectAttr "C_DownBrow_SkinJnt_orientConstraint1.cry" "C_DownBrow_SkinJnt.ry";
connectAttr "C_DownBrow_SkinJnt_orientConstraint1.crz" "C_DownBrow_SkinJnt.rz";
connectAttr "C_DownBrow_SkinJnt.pim" "C_DownBrow_SkinJnt_pointConstraint1.cpim";
connectAttr "C_DownBrow_SkinJnt.rp" "C_DownBrow_SkinJnt_pointConstraint1.crp";
connectAttr "C_DownBrow_SkinJnt.rpt" "C_DownBrow_SkinJnt_pointConstraint1.crt";
connectAttr "C_DownBrow_Loc.t" "C_DownBrow_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "C_DownBrow_Loc.rp" "C_DownBrow_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "C_DownBrow_Loc.rpt" "C_DownBrow_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "C_DownBrow_Loc.pm" "C_DownBrow_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "C_DownBrow_SkinJnt_pointConstraint1.w0" "C_DownBrow_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "C_DownBrow_SkinJnt.ro" "C_DownBrow_SkinJnt_orientConstraint1.cro";
connectAttr "C_DownBrow_SkinJnt.pim" "C_DownBrow_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "C_DownBrow_SkinJnt.jo" "C_DownBrow_SkinJnt_orientConstraint1.cjo";
connectAttr "C_DownBrow_SkinJnt.is" "C_DownBrow_SkinJnt_orientConstraint1.is";
connectAttr "C_DownBrow_Loc.r" "C_DownBrow_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "C_DownBrow_Loc.ro" "C_DownBrow_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "C_DownBrow_Loc.pm" "C_DownBrow_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "C_DownBrow_SkinJnt_orientConstraint1.w0" "C_DownBrow_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_DownBrow_In_SkinJnt_pointConstraint1.ctx" "L_DownBrow_In_SkinJnt.tx"
		;
connectAttr "L_DownBrow_In_SkinJnt_pointConstraint1.cty" "L_DownBrow_In_SkinJnt.ty"
		;
connectAttr "L_DownBrow_In_SkinJnt_pointConstraint1.ctz" "L_DownBrow_In_SkinJnt.tz"
		;
connectAttr "L_DownBrow_In_SkinJnt_orientConstraint1.crx" "L_DownBrow_In_SkinJnt.rx"
		;
connectAttr "L_DownBrow_In_SkinJnt_orientConstraint1.cry" "L_DownBrow_In_SkinJnt.ry"
		;
connectAttr "L_DownBrow_In_SkinJnt_orientConstraint1.crz" "L_DownBrow_In_SkinJnt.rz"
		;
connectAttr "L_DownBrow_In_SkinJnt.pim" "L_DownBrow_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_DownBrow_In_SkinJnt.rp" "L_DownBrow_In_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_DownBrow_In_SkinJnt.rpt" "L_DownBrow_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_DownBrow_In_Loc.t" "L_DownBrow_In_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_DownBrow_In_Loc.rp" "L_DownBrow_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_DownBrow_In_Loc.rpt" "L_DownBrow_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_DownBrow_In_Loc.pm" "L_DownBrow_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_DownBrow_In_SkinJnt_pointConstraint1.w0" "L_DownBrow_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_DownBrow_In_SkinJnt.ro" "L_DownBrow_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_DownBrow_In_SkinJnt.pim" "L_DownBrow_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_DownBrow_In_SkinJnt.jo" "L_DownBrow_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_DownBrow_In_SkinJnt.is" "L_DownBrow_In_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_DownBrow_In_Loc.r" "L_DownBrow_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_DownBrow_In_Loc.ro" "L_DownBrow_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_DownBrow_In_Loc.pm" "L_DownBrow_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_DownBrow_In_SkinJnt_orientConstraint1.w0" "L_DownBrow_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_DownBrow_Mid_SkinJnt_pointConstraint1.ctx" "L_DownBrow_Mid_SkinJnt.tx"
		;
connectAttr "L_DownBrow_Mid_SkinJnt_pointConstraint1.cty" "L_DownBrow_Mid_SkinJnt.ty"
		;
connectAttr "L_DownBrow_Mid_SkinJnt_pointConstraint1.ctz" "L_DownBrow_Mid_SkinJnt.tz"
		;
connectAttr "L_DownBrow_Mid_SkinJnt_orientConstraint1.crx" "L_DownBrow_Mid_SkinJnt.rx"
		;
connectAttr "L_DownBrow_Mid_SkinJnt_orientConstraint1.cry" "L_DownBrow_Mid_SkinJnt.ry"
		;
connectAttr "L_DownBrow_Mid_SkinJnt_orientConstraint1.crz" "L_DownBrow_Mid_SkinJnt.rz"
		;
connectAttr "L_DownBrow_Mid_SkinJnt.pim" "L_DownBrow_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_DownBrow_Mid_SkinJnt.rp" "L_DownBrow_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_DownBrow_Mid_SkinJnt.rpt" "L_DownBrow_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_DownBrow_Mid_Loc.t" "L_DownBrow_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_DownBrow_Mid_Loc.rp" "L_DownBrow_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_DownBrow_Mid_Loc.rpt" "L_DownBrow_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_DownBrow_Mid_Loc.pm" "L_DownBrow_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_DownBrow_Mid_SkinJnt_pointConstraint1.w0" "L_DownBrow_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_DownBrow_Mid_SkinJnt.ro" "L_DownBrow_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_DownBrow_Mid_SkinJnt.pim" "L_DownBrow_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_DownBrow_Mid_SkinJnt.jo" "L_DownBrow_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_DownBrow_Mid_SkinJnt.is" "L_DownBrow_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_DownBrow_Mid_Loc.r" "L_DownBrow_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_DownBrow_Mid_Loc.ro" "L_DownBrow_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_DownBrow_Mid_Loc.pm" "L_DownBrow_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_DownBrow_Mid_SkinJnt_orientConstraint1.w0" "L_DownBrow_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_DownBrow_Out_SkinJnt_pointConstraint1.ctx" "L_DownBrow_Out_SkinJnt.tx"
		;
connectAttr "L_DownBrow_Out_SkinJnt_pointConstraint1.cty" "L_DownBrow_Out_SkinJnt.ty"
		;
connectAttr "L_DownBrow_Out_SkinJnt_pointConstraint1.ctz" "L_DownBrow_Out_SkinJnt.tz"
		;
connectAttr "L_DownBrow_Out_SkinJnt_orientConstraint1.crx" "L_DownBrow_Out_SkinJnt.rx"
		;
connectAttr "L_DownBrow_Out_SkinJnt_orientConstraint1.cry" "L_DownBrow_Out_SkinJnt.ry"
		;
connectAttr "L_DownBrow_Out_SkinJnt_orientConstraint1.crz" "L_DownBrow_Out_SkinJnt.rz"
		;
connectAttr "L_DownBrow_Out_SkinJnt.pim" "L_DownBrow_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_DownBrow_Out_SkinJnt.rp" "L_DownBrow_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_DownBrow_Out_SkinJnt.rpt" "L_DownBrow_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_DownBrow_Out_Loc.t" "L_DownBrow_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_DownBrow_Out_Loc.rp" "L_DownBrow_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_DownBrow_Out_Loc.rpt" "L_DownBrow_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_DownBrow_Out_Loc.pm" "L_DownBrow_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_DownBrow_Out_SkinJnt_pointConstraint1.w0" "L_DownBrow_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_DownBrow_Out_SkinJnt.ro" "L_DownBrow_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_DownBrow_Out_SkinJnt.pim" "L_DownBrow_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_DownBrow_Out_SkinJnt.jo" "L_DownBrow_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_DownBrow_Out_SkinJnt.is" "L_DownBrow_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_DownBrow_Out_Loc.r" "L_DownBrow_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_DownBrow_Out_Loc.ro" "L_DownBrow_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_DownBrow_Out_Loc.pm" "L_DownBrow_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_DownBrow_Out_SkinJnt_orientConstraint1.w0" "L_DownBrow_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_Nose_Coner_SkinJnt_pointConstraint1.ctx" "L_Nose_Coner_SkinJnt.tx"
		;
connectAttr "L_Nose_Coner_SkinJnt_pointConstraint1.cty" "L_Nose_Coner_SkinJnt.ty"
		;
connectAttr "L_Nose_Coner_SkinJnt_pointConstraint1.ctz" "L_Nose_Coner_SkinJnt.tz"
		;
connectAttr "L_Nose_Coner_SkinJnt_orientConstraint1.crx" "L_Nose_Coner_SkinJnt.rx"
		;
connectAttr "L_Nose_Coner_SkinJnt_orientConstraint1.cry" "L_Nose_Coner_SkinJnt.ry"
		;
connectAttr "L_Nose_Coner_SkinJnt_orientConstraint1.crz" "L_Nose_Coner_SkinJnt.rz"
		;
connectAttr "L_Nose_Coner_SkinJnt.pim" "L_Nose_Coner_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_Nose_Coner_SkinJnt.rp" "L_Nose_Coner_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_Nose_Coner_SkinJnt.rpt" "L_Nose_Coner_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_Nose_Coner_Loc.t" "L_Nose_Coner_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_Nose_Coner_Loc.rp" "L_Nose_Coner_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_Nose_Coner_Loc.rpt" "L_Nose_Coner_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_Nose_Coner_Loc.pm" "L_Nose_Coner_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_Nose_Coner_SkinJnt_pointConstraint1.w0" "L_Nose_Coner_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_Nose_Coner_SkinJnt.ro" "L_Nose_Coner_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_Nose_Coner_SkinJnt.pim" "L_Nose_Coner_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_Nose_Coner_SkinJnt.jo" "L_Nose_Coner_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_Nose_Coner_SkinJnt.is" "L_Nose_Coner_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_Nose_Coner_Loc.r" "L_Nose_Coner_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_Nose_Coner_Loc.ro" "L_Nose_Coner_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_Nose_Coner_Loc.pm" "L_Nose_Coner_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_Nose_Coner_SkinJnt_orientConstraint1.w0" "L_Nose_Coner_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "C_Nose_Tip_SkinJnt_pointConstraint1.ctx" "C_Nose_Tip_SkinJnt.tx";
connectAttr "C_Nose_Tip_SkinJnt_pointConstraint1.cty" "C_Nose_Tip_SkinJnt.ty";
connectAttr "C_Nose_Tip_SkinJnt_pointConstraint1.ctz" "C_Nose_Tip_SkinJnt.tz";
connectAttr "C_Nose_Tip_SkinJnt_orientConstraint1.crx" "C_Nose_Tip_SkinJnt.rx";
connectAttr "C_Nose_Tip_SkinJnt_orientConstraint1.cry" "C_Nose_Tip_SkinJnt.ry";
connectAttr "C_Nose_Tip_SkinJnt_orientConstraint1.crz" "C_Nose_Tip_SkinJnt.rz";
connectAttr "C_Nose_Tip_SkinJnt.pim" "C_Nose_Tip_SkinJnt_pointConstraint1.cpim";
connectAttr "C_Nose_Tip_SkinJnt.rp" "C_Nose_Tip_SkinJnt_pointConstraint1.crp";
connectAttr "C_Nose_Tip_SkinJnt.rpt" "C_Nose_Tip_SkinJnt_pointConstraint1.crt";
connectAttr "C_Nose_Tip_Loc.t" "C_Nose_Tip_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "C_Nose_Tip_Loc.rp" "C_Nose_Tip_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "C_Nose_Tip_Loc.rpt" "C_Nose_Tip_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "C_Nose_Tip_Loc.pm" "C_Nose_Tip_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "C_Nose_Tip_SkinJnt_pointConstraint1.w0" "C_Nose_Tip_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "C_Nose_Tip_SkinJnt.ro" "C_Nose_Tip_SkinJnt_orientConstraint1.cro";
connectAttr "C_Nose_Tip_SkinJnt.pim" "C_Nose_Tip_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "C_Nose_Tip_SkinJnt.jo" "C_Nose_Tip_SkinJnt_orientConstraint1.cjo";
connectAttr "C_Nose_Tip_SkinJnt.is" "C_Nose_Tip_SkinJnt_orientConstraint1.is";
connectAttr "C_Nose_Tip_Loc.r" "C_Nose_Tip_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "C_Nose_Tip_Loc.ro" "C_Nose_Tip_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "C_Nose_Tip_Loc.pm" "C_Nose_Tip_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "C_Nose_Tip_SkinJnt_orientConstraint1.w0" "C_Nose_Tip_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "C_Nose_Up_SkinJnt_pointConstraint1.ctx" "C_Nose_Up_SkinJnt.tx";
connectAttr "C_Nose_Up_SkinJnt_pointConstraint1.cty" "C_Nose_Up_SkinJnt.ty";
connectAttr "C_Nose_Up_SkinJnt_pointConstraint1.ctz" "C_Nose_Up_SkinJnt.tz";
connectAttr "C_Nose_Up_SkinJnt_orientConstraint1.crx" "C_Nose_Up_SkinJnt.rx";
connectAttr "C_Nose_Up_SkinJnt_orientConstraint1.cry" "C_Nose_Up_SkinJnt.ry";
connectAttr "C_Nose_Up_SkinJnt_orientConstraint1.crz" "C_Nose_Up_SkinJnt.rz";
connectAttr "C_Nose_Up_SkinJnt.pim" "C_Nose_Up_SkinJnt_pointConstraint1.cpim";
connectAttr "C_Nose_Up_SkinJnt.rp" "C_Nose_Up_SkinJnt_pointConstraint1.crp";
connectAttr "C_Nose_Up_SkinJnt.rpt" "C_Nose_Up_SkinJnt_pointConstraint1.crt";
connectAttr "C_Nose_Up_Loc.t" "C_Nose_Up_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "C_Nose_Up_Loc.rp" "C_Nose_Up_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "C_Nose_Up_Loc.rpt" "C_Nose_Up_SkinJnt_pointConstraint1.tg[0].trt";
connectAttr "C_Nose_Up_Loc.pm" "C_Nose_Up_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "C_Nose_Up_SkinJnt_pointConstraint1.w0" "C_Nose_Up_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "C_Nose_Up_SkinJnt.ro" "C_Nose_Up_SkinJnt_orientConstraint1.cro";
connectAttr "C_Nose_Up_SkinJnt.pim" "C_Nose_Up_SkinJnt_orientConstraint1.cpim";
connectAttr "C_Nose_Up_SkinJnt.jo" "C_Nose_Up_SkinJnt_orientConstraint1.cjo";
connectAttr "C_Nose_Up_SkinJnt.is" "C_Nose_Up_SkinJnt_orientConstraint1.is";
connectAttr "C_Nose_Up_Loc.r" "C_Nose_Up_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "C_Nose_Up_Loc.ro" "C_Nose_Up_SkinJnt_orientConstraint1.tg[0].tro";
connectAttr "C_Nose_Up_Loc.pm" "C_Nose_Up_SkinJnt_orientConstraint1.tg[0].tpm";
connectAttr "C_Nose_Up_SkinJnt_orientConstraint1.w0" "C_Nose_Up_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_Nose_Mid_SkinJnt_pointConstraint1.ctx" "L_Nose_Mid_SkinJnt.tx";
connectAttr "L_Nose_Mid_SkinJnt_pointConstraint1.cty" "L_Nose_Mid_SkinJnt.ty";
connectAttr "L_Nose_Mid_SkinJnt_pointConstraint1.ctz" "L_Nose_Mid_SkinJnt.tz";
connectAttr "L_Nose_Mid_SkinJnt_orientConstraint1.crx" "L_Nose_Mid_SkinJnt.rx";
connectAttr "L_Nose_Mid_SkinJnt_orientConstraint1.cry" "L_Nose_Mid_SkinJnt.ry";
connectAttr "L_Nose_Mid_SkinJnt_orientConstraint1.crz" "L_Nose_Mid_SkinJnt.rz";
connectAttr "L_Nose_Mid_SkinJnt.pim" "L_Nose_Mid_SkinJnt_pointConstraint1.cpim";
connectAttr "L_Nose_Mid_SkinJnt.rp" "L_Nose_Mid_SkinJnt_pointConstraint1.crp";
connectAttr "L_Nose_Mid_SkinJnt.rpt" "L_Nose_Mid_SkinJnt_pointConstraint1.crt";
connectAttr "L_Nose_Mid_Loc.t" "L_Nose_Mid_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "L_Nose_Mid_Loc.rp" "L_Nose_Mid_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "L_Nose_Mid_Loc.rpt" "L_Nose_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_Nose_Mid_Loc.pm" "L_Nose_Mid_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "L_Nose_Mid_SkinJnt_pointConstraint1.w0" "L_Nose_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_Nose_Mid_SkinJnt.ro" "L_Nose_Mid_SkinJnt_orientConstraint1.cro";
connectAttr "L_Nose_Mid_SkinJnt.pim" "L_Nose_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_Nose_Mid_SkinJnt.jo" "L_Nose_Mid_SkinJnt_orientConstraint1.cjo";
connectAttr "L_Nose_Mid_SkinJnt.is" "L_Nose_Mid_SkinJnt_orientConstraint1.is";
connectAttr "L_Nose_Mid_Loc.r" "L_Nose_Mid_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "L_Nose_Mid_Loc.ro" "L_Nose_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_Nose_Mid_Loc.pm" "L_Nose_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_Nose_Mid_SkinJnt_orientConstraint1.w0" "L_Nose_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_UpCheek_In_SkinJnt_pointConstraint1.ctx" "L_UpCheek_In_SkinJnt.tx"
		;
connectAttr "L_UpCheek_In_SkinJnt_pointConstraint1.cty" "L_UpCheek_In_SkinJnt.ty"
		;
connectAttr "L_UpCheek_In_SkinJnt_pointConstraint1.ctz" "L_UpCheek_In_SkinJnt.tz"
		;
connectAttr "L_UpCheek_In_SkinJnt_orientConstraint1.crx" "L_UpCheek_In_SkinJnt.rx"
		;
connectAttr "L_UpCheek_In_SkinJnt_orientConstraint1.cry" "L_UpCheek_In_SkinJnt.ry"
		;
connectAttr "L_UpCheek_In_SkinJnt_orientConstraint1.crz" "L_UpCheek_In_SkinJnt.rz"
		;
connectAttr "L_UpCheek_In_SkinJnt.pim" "L_UpCheek_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_UpCheek_In_SkinJnt.rp" "L_UpCheek_In_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_UpCheek_In_SkinJnt.rpt" "L_UpCheek_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_UpCheek_In_Loc.t" "L_UpCheek_In_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_UpCheek_In_Loc.rp" "L_UpCheek_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_UpCheek_In_Loc.rpt" "L_UpCheek_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_UpCheek_In_Loc.pm" "L_UpCheek_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_UpCheek_In_SkinJnt_pointConstraint1.w0" "L_UpCheek_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_UpCheek_In_SkinJnt.ro" "L_UpCheek_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_UpCheek_In_SkinJnt.pim" "L_UpCheek_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_UpCheek_In_SkinJnt.jo" "L_UpCheek_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_UpCheek_In_SkinJnt.is" "L_UpCheek_In_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_UpCheek_In_Loc.r" "L_UpCheek_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_UpCheek_In_Loc.ro" "L_UpCheek_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_UpCheek_In_Loc.pm" "L_UpCheek_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_UpCheek_In_SkinJnt_orientConstraint1.w0" "L_UpCheek_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_UpCheek_Mid_SkinJnt_pointConstraint1.ctx" "L_UpCheek_Mid_SkinJnt.tx"
		;
connectAttr "L_UpCheek_Mid_SkinJnt_pointConstraint1.cty" "L_UpCheek_Mid_SkinJnt.ty"
		;
connectAttr "L_UpCheek_Mid_SkinJnt_pointConstraint1.ctz" "L_UpCheek_Mid_SkinJnt.tz"
		;
connectAttr "L_UpCheek_Mid_SkinJnt_orientConstraint1.crx" "L_UpCheek_Mid_SkinJnt.rx"
		;
connectAttr "L_UpCheek_Mid_SkinJnt_orientConstraint1.cry" "L_UpCheek_Mid_SkinJnt.ry"
		;
connectAttr "L_UpCheek_Mid_SkinJnt_orientConstraint1.crz" "L_UpCheek_Mid_SkinJnt.rz"
		;
connectAttr "L_UpCheek_Mid_SkinJnt.pim" "L_UpCheek_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_UpCheek_Mid_SkinJnt.rp" "L_UpCheek_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_UpCheek_Mid_SkinJnt.rpt" "L_UpCheek_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_UpCheek_Mid_Loc.t" "L_UpCheek_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_UpCheek_Mid_Loc.rp" "L_UpCheek_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_UpCheek_Mid_Loc.rpt" "L_UpCheek_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_UpCheek_Mid_Loc.pm" "L_UpCheek_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_UpCheek_Mid_SkinJnt_pointConstraint1.w0" "L_UpCheek_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_UpCheek_Mid_SkinJnt.ro" "L_UpCheek_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_UpCheek_Mid_SkinJnt.pim" "L_UpCheek_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_UpCheek_Mid_SkinJnt.jo" "L_UpCheek_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_UpCheek_Mid_SkinJnt.is" "L_UpCheek_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_UpCheek_Mid_Loc.r" "L_UpCheek_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_UpCheek_Mid_Loc.ro" "L_UpCheek_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_UpCheek_Mid_Loc.pm" "L_UpCheek_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_UpCheek_Mid_SkinJnt_orientConstraint1.w0" "L_UpCheek_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_UpCheek_Out_SkinJnt_pointConstraint1.ctx" "L_UpCheek_Out_SkinJnt.tx"
		;
connectAttr "L_UpCheek_Out_SkinJnt_pointConstraint1.cty" "L_UpCheek_Out_SkinJnt.ty"
		;
connectAttr "L_UpCheek_Out_SkinJnt_pointConstraint1.ctz" "L_UpCheek_Out_SkinJnt.tz"
		;
connectAttr "L_UpCheek_Out_SkinJnt_orientConstraint1.crx" "L_UpCheek_Out_SkinJnt.rx"
		;
connectAttr "L_UpCheek_Out_SkinJnt_orientConstraint1.cry" "L_UpCheek_Out_SkinJnt.ry"
		;
connectAttr "L_UpCheek_Out_SkinJnt_orientConstraint1.crz" "L_UpCheek_Out_SkinJnt.rz"
		;
connectAttr "L_UpCheek_Out_SkinJnt.pim" "L_UpCheek_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_UpCheek_Out_SkinJnt.rp" "L_UpCheek_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_UpCheek_Out_SkinJnt.rpt" "L_UpCheek_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_UpCheek_Out_Loc.t" "L_UpCheek_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_UpCheek_Out_Loc.rp" "L_UpCheek_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_UpCheek_Out_Loc.rpt" "L_UpCheek_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_UpCheek_Out_Loc.pm" "L_UpCheek_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_UpCheek_Out_SkinJnt_pointConstraint1.w0" "L_UpCheek_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_UpCheek_Out_SkinJnt.ro" "L_UpCheek_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_UpCheek_Out_SkinJnt.pim" "L_UpCheek_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_UpCheek_Out_SkinJnt.jo" "L_UpCheek_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_UpCheek_Out_SkinJnt.is" "L_UpCheek_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_UpCheek_Out_Loc.r" "L_UpCheek_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_UpCheek_Out_Loc.ro" "L_UpCheek_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_UpCheek_Out_Loc.pm" "L_UpCheek_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_UpCheek_Out_SkinJnt_orientConstraint1.w0" "L_UpCheek_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_MidCheek_In_SkinJnt_pointConstraint1.ctx" "L_MidCheek_In_SkinJnt.tx"
		;
connectAttr "L_MidCheek_In_SkinJnt_pointConstraint1.cty" "L_MidCheek_In_SkinJnt.ty"
		;
connectAttr "L_MidCheek_In_SkinJnt_pointConstraint1.ctz" "L_MidCheek_In_SkinJnt.tz"
		;
connectAttr "L_MidCheek_In_SkinJnt_orientConstraint1.crx" "L_MidCheek_In_SkinJnt.rx"
		;
connectAttr "L_MidCheek_In_SkinJnt_orientConstraint1.cry" "L_MidCheek_In_SkinJnt.ry"
		;
connectAttr "L_MidCheek_In_SkinJnt_orientConstraint1.crz" "L_MidCheek_In_SkinJnt.rz"
		;
connectAttr "L_MidCheek_In_SkinJnt.pim" "L_MidCheek_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_MidCheek_In_SkinJnt.rp" "L_MidCheek_In_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_MidCheek_In_SkinJnt.rpt" "L_MidCheek_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_MidCheek_In_Loc.t" "L_MidCheek_In_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_MidCheek_In_Loc.rp" "L_MidCheek_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_MidCheek_In_Loc.rpt" "L_MidCheek_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_MidCheek_In_Loc.pm" "L_MidCheek_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_MidCheek_In_SkinJnt_pointConstraint1.w0" "L_MidCheek_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_MidCheek_In_SkinJnt.ro" "L_MidCheek_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_MidCheek_In_SkinJnt.pim" "L_MidCheek_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_MidCheek_In_SkinJnt.jo" "L_MidCheek_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_MidCheek_In_SkinJnt.is" "L_MidCheek_In_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_MidCheek_In_Loc.r" "L_MidCheek_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_MidCheek_In_Loc.ro" "L_MidCheek_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_MidCheek_In_Loc.pm" "L_MidCheek_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_MidCheek_In_SkinJnt_orientConstraint1.w0" "L_MidCheek_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_MidCheek_Mid_SkinJnt_pointConstraint1.ctx" "L_MidCheek_Mid_SkinJnt.tx"
		;
connectAttr "L_MidCheek_Mid_SkinJnt_pointConstraint1.cty" "L_MidCheek_Mid_SkinJnt.ty"
		;
connectAttr "L_MidCheek_Mid_SkinJnt_pointConstraint1.ctz" "L_MidCheek_Mid_SkinJnt.tz"
		;
connectAttr "L_MidCheek_Mid_SkinJnt_orientConstraint1.crx" "L_MidCheek_Mid_SkinJnt.rx"
		;
connectAttr "L_MidCheek_Mid_SkinJnt_orientConstraint1.cry" "L_MidCheek_Mid_SkinJnt.ry"
		;
connectAttr "L_MidCheek_Mid_SkinJnt_orientConstraint1.crz" "L_MidCheek_Mid_SkinJnt.rz"
		;
connectAttr "L_MidCheek_Mid_SkinJnt.pim" "L_MidCheek_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_MidCheek_Mid_SkinJnt.rp" "L_MidCheek_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_MidCheek_Mid_SkinJnt.rpt" "L_MidCheek_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_MidCheek_Mid_Loc.t" "L_MidCheek_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_MidCheek_Mid_Loc.rp" "L_MidCheek_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_MidCheek_Mid_Loc.rpt" "L_MidCheek_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_MidCheek_Mid_Loc.pm" "L_MidCheek_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_MidCheek_Mid_SkinJnt_pointConstraint1.w0" "L_MidCheek_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_MidCheek_Mid_SkinJnt.ro" "L_MidCheek_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_MidCheek_Mid_SkinJnt.pim" "L_MidCheek_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_MidCheek_Mid_SkinJnt.jo" "L_MidCheek_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_MidCheek_Mid_SkinJnt.is" "L_MidCheek_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_MidCheek_Mid_Loc.r" "L_MidCheek_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_MidCheek_Mid_Loc.ro" "L_MidCheek_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_MidCheek_Mid_Loc.pm" "L_MidCheek_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_MidCheek_Mid_SkinJnt_orientConstraint1.w0" "L_MidCheek_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_MidCheek_Out_SkinJnt_pointConstraint1.ctx" "L_MidCheek_Out_SkinJnt.tx"
		;
connectAttr "L_MidCheek_Out_SkinJnt_pointConstraint1.cty" "L_MidCheek_Out_SkinJnt.ty"
		;
connectAttr "L_MidCheek_Out_SkinJnt_pointConstraint1.ctz" "L_MidCheek_Out_SkinJnt.tz"
		;
connectAttr "L_MidCheek_Out_SkinJnt_orientConstraint1.crx" "L_MidCheek_Out_SkinJnt.rx"
		;
connectAttr "L_MidCheek_Out_SkinJnt_orientConstraint1.cry" "L_MidCheek_Out_SkinJnt.ry"
		;
connectAttr "L_MidCheek_Out_SkinJnt_orientConstraint1.crz" "L_MidCheek_Out_SkinJnt.rz"
		;
connectAttr "L_MidCheek_Out_SkinJnt.pim" "L_MidCheek_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_MidCheek_Out_SkinJnt.rp" "L_MidCheek_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_MidCheek_Out_SkinJnt.rpt" "L_MidCheek_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_MidCheek_Out_Loc.t" "L_MidCheek_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_MidCheek_Out_Loc.rp" "L_MidCheek_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_MidCheek_Out_Loc.rpt" "L_MidCheek_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_MidCheek_Out_Loc.pm" "L_MidCheek_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_MidCheek_Out_SkinJnt_pointConstraint1.w0" "L_MidCheek_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_MidCheek_Out_SkinJnt.ro" "L_MidCheek_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_MidCheek_Out_SkinJnt.pim" "L_MidCheek_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_MidCheek_Out_SkinJnt.jo" "L_MidCheek_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_MidCheek_Out_SkinJnt.is" "L_MidCheek_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_MidCheek_Out_Loc.r" "L_MidCheek_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_MidCheek_Out_Loc.ro" "L_MidCheek_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_MidCheek_Out_Loc.pm" "L_MidCheek_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_MidCheek_Out_SkinJnt_orientConstraint1.w0" "L_MidCheek_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_DownCheek_In_SkinJnt_pointConstraint1.ctx" "L_DownCheek_In_SkinJnt.tx"
		;
connectAttr "L_DownCheek_In_SkinJnt_pointConstraint1.cty" "L_DownCheek_In_SkinJnt.ty"
		;
connectAttr "L_DownCheek_In_SkinJnt_pointConstraint1.ctz" "L_DownCheek_In_SkinJnt.tz"
		;
connectAttr "L_DownCheek_In_SkinJnt_orientConstraint1.crx" "L_DownCheek_In_SkinJnt.rx"
		;
connectAttr "L_DownCheek_In_SkinJnt_orientConstraint1.cry" "L_DownCheek_In_SkinJnt.ry"
		;
connectAttr "L_DownCheek_In_SkinJnt_orientConstraint1.crz" "L_DownCheek_In_SkinJnt.rz"
		;
connectAttr "L_DownCheek_In_SkinJnt.pim" "L_DownCheek_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_DownCheek_In_SkinJnt.rp" "L_DownCheek_In_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_DownCheek_In_SkinJnt.rpt" "L_DownCheek_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_DownCheek_In_Loc.t" "L_DownCheek_In_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_DownCheek_In_Loc.rp" "L_DownCheek_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_DownCheek_In_Loc.rpt" "L_DownCheek_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_DownCheek_In_Loc.pm" "L_DownCheek_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_DownCheek_In_SkinJnt_pointConstraint1.w0" "L_DownCheek_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_DownCheek_In_SkinJnt.ro" "L_DownCheek_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_DownCheek_In_SkinJnt.pim" "L_DownCheek_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_DownCheek_In_SkinJnt.jo" "L_DownCheek_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_DownCheek_In_SkinJnt.is" "L_DownCheek_In_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_DownCheek_In_Loc.r" "L_DownCheek_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_DownCheek_In_Loc.ro" "L_DownCheek_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_DownCheek_In_Loc.pm" "L_DownCheek_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_DownCheek_In_SkinJnt_orientConstraint1.w0" "L_DownCheek_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_DownCheek_Mid_SkinJnt_pointConstraint1.ctx" "L_DownCheek_Mid_SkinJnt.tx"
		;
connectAttr "L_DownCheek_Mid_SkinJnt_pointConstraint1.cty" "L_DownCheek_Mid_SkinJnt.ty"
		;
connectAttr "L_DownCheek_Mid_SkinJnt_pointConstraint1.ctz" "L_DownCheek_Mid_SkinJnt.tz"
		;
connectAttr "L_DownCheek_Mid_SkinJnt_orientConstraint1.crx" "L_DownCheek_Mid_SkinJnt.rx"
		;
connectAttr "L_DownCheek_Mid_SkinJnt_orientConstraint1.cry" "L_DownCheek_Mid_SkinJnt.ry"
		;
connectAttr "L_DownCheek_Mid_SkinJnt_orientConstraint1.crz" "L_DownCheek_Mid_SkinJnt.rz"
		;
connectAttr "L_DownCheek_Mid_SkinJnt.pim" "L_DownCheek_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_DownCheek_Mid_SkinJnt.rp" "L_DownCheek_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_DownCheek_Mid_SkinJnt.rpt" "L_DownCheek_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_DownCheek_Mid_Loc.t" "L_DownCheek_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_DownCheek_Mid_Loc.rp" "L_DownCheek_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_DownCheek_Mid_Loc.rpt" "L_DownCheek_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_DownCheek_Mid_Loc.pm" "L_DownCheek_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_DownCheek_Mid_SkinJnt_pointConstraint1.w0" "L_DownCheek_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_DownCheek_Mid_SkinJnt.ro" "L_DownCheek_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_DownCheek_Mid_SkinJnt.pim" "L_DownCheek_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_DownCheek_Mid_SkinJnt.jo" "L_DownCheek_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_DownCheek_Mid_SkinJnt.is" "L_DownCheek_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_DownCheek_Mid_Loc.r" "L_DownCheek_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_DownCheek_Mid_Loc.ro" "L_DownCheek_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_DownCheek_Mid_Loc.pm" "L_DownCheek_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_DownCheek_Mid_SkinJnt_orientConstraint1.w0" "L_DownCheek_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_DownCheek_Out_SkinJnt_pointConstraint1.ctx" "L_DownCheek_Out_SkinJnt.tx"
		;
connectAttr "L_DownCheek_Out_SkinJnt_pointConstraint1.cty" "L_DownCheek_Out_SkinJnt.ty"
		;
connectAttr "L_DownCheek_Out_SkinJnt_pointConstraint1.ctz" "L_DownCheek_Out_SkinJnt.tz"
		;
connectAttr "L_DownCheek_Out_SkinJnt_orientConstraint1.crx" "L_DownCheek_Out_SkinJnt.rx"
		;
connectAttr "L_DownCheek_Out_SkinJnt_orientConstraint1.cry" "L_DownCheek_Out_SkinJnt.ry"
		;
connectAttr "L_DownCheek_Out_SkinJnt_orientConstraint1.crz" "L_DownCheek_Out_SkinJnt.rz"
		;
connectAttr "L_DownCheek_Out_SkinJnt.pim" "L_DownCheek_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_DownCheek_Out_SkinJnt.rp" "L_DownCheek_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_DownCheek_Out_SkinJnt.rpt" "L_DownCheek_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_DownCheek_Out_Loc.t" "L_DownCheek_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_DownCheek_Out_Loc.rp" "L_DownCheek_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_DownCheek_Out_Loc.rpt" "L_DownCheek_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_DownCheek_Out_Loc.pm" "L_DownCheek_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_DownCheek_Out_SkinJnt_pointConstraint1.w0" "L_DownCheek_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_DownCheek_Out_SkinJnt.ro" "L_DownCheek_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_DownCheek_Out_SkinJnt.pim" "L_DownCheek_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_DownCheek_Out_SkinJnt.jo" "L_DownCheek_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_DownCheek_Out_SkinJnt.is" "L_DownCheek_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_DownCheek_Out_Loc.r" "L_DownCheek_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_DownCheek_Out_Loc.ro" "L_DownCheek_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_DownCheek_Out_Loc.pm" "L_DownCheek_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_DownCheek_Out_SkinJnt_orientConstraint1.w0" "L_DownCheek_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "C_Chin_SkinJnt_pointConstraint1.ctx" "C_Chin_SkinJnt.tx";
connectAttr "C_Chin_SkinJnt_pointConstraint1.cty" "C_Chin_SkinJnt.ty";
connectAttr "C_Chin_SkinJnt_pointConstraint1.ctz" "C_Chin_SkinJnt.tz";
connectAttr "C_Chin_SkinJnt_orientConstraint1.crx" "C_Chin_SkinJnt.rx";
connectAttr "C_Chin_SkinJnt_orientConstraint1.cry" "C_Chin_SkinJnt.ry";
connectAttr "C_Chin_SkinJnt_orientConstraint1.crz" "C_Chin_SkinJnt.rz";
connectAttr "C_Chin_SkinJnt.pim" "C_Chin_SkinJnt_pointConstraint1.cpim";
connectAttr "C_Chin_SkinJnt.rp" "C_Chin_SkinJnt_pointConstraint1.crp";
connectAttr "C_Chin_SkinJnt.rpt" "C_Chin_SkinJnt_pointConstraint1.crt";
connectAttr "C_Chin_Loc.t" "C_Chin_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "C_Chin_Loc.rp" "C_Chin_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "C_Chin_Loc.rpt" "C_Chin_SkinJnt_pointConstraint1.tg[0].trt";
connectAttr "C_Chin_Loc.pm" "C_Chin_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "C_Chin_SkinJnt_pointConstraint1.w0" "C_Chin_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "C_Chin_SkinJnt.ro" "C_Chin_SkinJnt_orientConstraint1.cro";
connectAttr "C_Chin_SkinJnt.pim" "C_Chin_SkinJnt_orientConstraint1.cpim";
connectAttr "C_Chin_SkinJnt.jo" "C_Chin_SkinJnt_orientConstraint1.cjo";
connectAttr "C_Chin_SkinJnt.is" "C_Chin_SkinJnt_orientConstraint1.is";
connectAttr "C_Chin_Loc.r" "C_Chin_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "C_Chin_Loc.ro" "C_Chin_SkinJnt_orientConstraint1.tg[0].tro";
connectAttr "C_Chin_Loc.pm" "C_Chin_SkinJnt_orientConstraint1.tg[0].tpm";
connectAttr "C_Chin_SkinJnt_orientConstraint1.w0" "C_Chin_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "C_UpLip_SkinJnt_pointConstraint1.ctx" "C_UpLip_SkinJnt.tx";
connectAttr "C_UpLip_SkinJnt_pointConstraint1.cty" "C_UpLip_SkinJnt.ty";
connectAttr "C_UpLip_SkinJnt_pointConstraint1.ctz" "C_UpLip_SkinJnt.tz";
connectAttr "C_UpLip_SkinJnt_orientConstraint1.crx" "C_UpLip_SkinJnt.rx";
connectAttr "C_UpLip_SkinJnt_orientConstraint1.cry" "C_UpLip_SkinJnt.ry";
connectAttr "C_UpLip_SkinJnt_orientConstraint1.crz" "C_UpLip_SkinJnt.rz";
connectAttr "C_UpLip_SkinJnt.pim" "C_UpLip_SkinJnt_pointConstraint1.cpim";
connectAttr "C_UpLip_SkinJnt.rp" "C_UpLip_SkinJnt_pointConstraint1.crp";
connectAttr "C_UpLip_SkinJnt.rpt" "C_UpLip_SkinJnt_pointConstraint1.crt";
connectAttr "C_UpLip_Loc.t" "C_UpLip_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "C_UpLip_Loc.rp" "C_UpLip_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "C_UpLip_Loc.rpt" "C_UpLip_SkinJnt_pointConstraint1.tg[0].trt";
connectAttr "C_UpLip_Loc.pm" "C_UpLip_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "C_UpLip_SkinJnt_pointConstraint1.w0" "C_UpLip_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "C_UpLip_SkinJnt.ro" "C_UpLip_SkinJnt_orientConstraint1.cro";
connectAttr "C_UpLip_SkinJnt.pim" "C_UpLip_SkinJnt_orientConstraint1.cpim";
connectAttr "C_UpLip_SkinJnt.jo" "C_UpLip_SkinJnt_orientConstraint1.cjo";
connectAttr "C_UpLip_SkinJnt.is" "C_UpLip_SkinJnt_orientConstraint1.is";
connectAttr "C_UpLip_Loc.r" "C_UpLip_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "C_UpLip_Loc.ro" "C_UpLip_SkinJnt_orientConstraint1.tg[0].tro";
connectAttr "C_UpLip_Loc.pm" "C_UpLip_SkinJnt_orientConstraint1.tg[0].tpm";
connectAttr "C_UpLip_SkinJnt_orientConstraint1.w0" "C_UpLip_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_UpLip_Mid_SkinJnt_pointConstraint1.ctx" "L_UpLip_Mid_SkinJnt.tx";
connectAttr "L_UpLip_Mid_SkinJnt_pointConstraint1.cty" "L_UpLip_Mid_SkinJnt.ty";
connectAttr "L_UpLip_Mid_SkinJnt_pointConstraint1.ctz" "L_UpLip_Mid_SkinJnt.tz";
connectAttr "L_UpLip_Mid_SkinJnt_orientConstraint1.crx" "L_UpLip_Mid_SkinJnt.rx"
		;
connectAttr "L_UpLip_Mid_SkinJnt_orientConstraint1.cry" "L_UpLip_Mid_SkinJnt.ry"
		;
connectAttr "L_UpLip_Mid_SkinJnt_orientConstraint1.crz" "L_UpLip_Mid_SkinJnt.rz"
		;
connectAttr "L_UpLip_Mid_SkinJnt.pim" "L_UpLip_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_UpLip_Mid_SkinJnt.rp" "L_UpLip_Mid_SkinJnt_pointConstraint1.crp";
connectAttr "L_UpLip_Mid_SkinJnt.rpt" "L_UpLip_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_UpLip_Mid_Loc.t" "L_UpLip_Mid_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "L_UpLip_Mid_Loc.rp" "L_UpLip_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_UpLip_Mid_Loc.rpt" "L_UpLip_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_UpLip_Mid_Loc.pm" "L_UpLip_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_UpLip_Mid_SkinJnt_pointConstraint1.w0" "L_UpLip_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_UpLip_Mid_SkinJnt.ro" "L_UpLip_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_UpLip_Mid_SkinJnt.pim" "L_UpLip_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_UpLip_Mid_SkinJnt.jo" "L_UpLip_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_UpLip_Mid_SkinJnt.is" "L_UpLip_Mid_SkinJnt_orientConstraint1.is";
connectAttr "L_UpLip_Mid_Loc.r" "L_UpLip_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_UpLip_Mid_Loc.ro" "L_UpLip_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_UpLip_Mid_Loc.pm" "L_UpLip_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_UpLip_Mid_SkinJnt_orientConstraint1.w0" "L_UpLip_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_UpLip_Out_SkinJnt_pointConstraint1.ctx" "L_UpLip_Out_SkinJnt.tx";
connectAttr "L_UpLip_Out_SkinJnt_pointConstraint1.cty" "L_UpLip_Out_SkinJnt.ty";
connectAttr "L_UpLip_Out_SkinJnt_pointConstraint1.ctz" "L_UpLip_Out_SkinJnt.tz";
connectAttr "L_UpLip_Out_SkinJnt_orientConstraint1.crx" "L_UpLip_Out_SkinJnt.rx"
		;
connectAttr "L_UpLip_Out_SkinJnt_orientConstraint1.cry" "L_UpLip_Out_SkinJnt.ry"
		;
connectAttr "L_UpLip_Out_SkinJnt_orientConstraint1.crz" "L_UpLip_Out_SkinJnt.rz"
		;
connectAttr "L_UpLip_Out_SkinJnt.pim" "L_UpLip_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_UpLip_Out_SkinJnt.rp" "L_UpLip_Out_SkinJnt_pointConstraint1.crp";
connectAttr "L_UpLip_Out_SkinJnt.rpt" "L_UpLip_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_UpLip_Out_Loc.t" "L_UpLip_Out_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "L_UpLip_Out_Loc.rp" "L_UpLip_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_UpLip_Out_Loc.rpt" "L_UpLip_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_UpLip_Out_Loc.pm" "L_UpLip_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_UpLip_Out_SkinJnt_pointConstraint1.w0" "L_UpLip_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_UpLip_Out_SkinJnt.ro" "L_UpLip_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_UpLip_Out_SkinJnt.pim" "L_UpLip_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_UpLip_Out_SkinJnt.jo" "L_UpLip_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_UpLip_Out_SkinJnt.is" "L_UpLip_Out_SkinJnt_orientConstraint1.is";
connectAttr "L_UpLip_Out_Loc.r" "L_UpLip_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_UpLip_Out_Loc.ro" "L_UpLip_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_UpLip_Out_Loc.pm" "L_UpLip_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_UpLip_Out_SkinJnt_orientConstraint1.w0" "L_UpLip_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "C_DownLip_SkinJnt_pointConstraint1.ctx" "C_DownLip_SkinJnt.tx";
connectAttr "C_DownLip_SkinJnt_pointConstraint1.cty" "C_DownLip_SkinJnt.ty";
connectAttr "C_DownLip_SkinJnt_pointConstraint1.ctz" "C_DownLip_SkinJnt.tz";
connectAttr "C_DownLip_SkinJnt_orientConstraint1.crx" "C_DownLip_SkinJnt.rx";
connectAttr "C_DownLip_SkinJnt_orientConstraint1.cry" "C_DownLip_SkinJnt.ry";
connectAttr "C_DownLip_SkinJnt_orientConstraint1.crz" "C_DownLip_SkinJnt.rz";
connectAttr "C_DownLip_SkinJnt.pim" "C_DownLip_SkinJnt_pointConstraint1.cpim";
connectAttr "C_DownLip_SkinJnt.rp" "C_DownLip_SkinJnt_pointConstraint1.crp";
connectAttr "C_DownLip_SkinJnt.rpt" "C_DownLip_SkinJnt_pointConstraint1.crt";
connectAttr "C_DownLip_Loc.t" "C_DownLip_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "C_DownLip_Loc.rp" "C_DownLip_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "C_DownLip_Loc.rpt" "C_DownLip_SkinJnt_pointConstraint1.tg[0].trt";
connectAttr "C_DownLip_Loc.pm" "C_DownLip_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "C_DownLip_SkinJnt_pointConstraint1.w0" "C_DownLip_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "C_DownLip_SkinJnt.ro" "C_DownLip_SkinJnt_orientConstraint1.cro";
connectAttr "C_DownLip_SkinJnt.pim" "C_DownLip_SkinJnt_orientConstraint1.cpim";
connectAttr "C_DownLip_SkinJnt.jo" "C_DownLip_SkinJnt_orientConstraint1.cjo";
connectAttr "C_DownLip_SkinJnt.is" "C_DownLip_SkinJnt_orientConstraint1.is";
connectAttr "C_DownLip_Loc.r" "C_DownLip_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "C_DownLip_Loc.ro" "C_DownLip_SkinJnt_orientConstraint1.tg[0].tro";
connectAttr "C_DownLip_Loc.pm" "C_DownLip_SkinJnt_orientConstraint1.tg[0].tpm";
connectAttr "C_DownLip_SkinJnt_orientConstraint1.w0" "C_DownLip_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_DownLip_Mid_SkinJnt_pointConstraint1.ctx" "L_DownLip_Mid_SkinJnt.tx"
		;
connectAttr "L_DownLip_Mid_SkinJnt_pointConstraint1.cty" "L_DownLip_Mid_SkinJnt.ty"
		;
connectAttr "L_DownLip_Mid_SkinJnt_pointConstraint1.ctz" "L_DownLip_Mid_SkinJnt.tz"
		;
connectAttr "L_DownLip_Mid_SkinJnt_orientConstraint1.crx" "L_DownLip_Mid_SkinJnt.rx"
		;
connectAttr "L_DownLip_Mid_SkinJnt_orientConstraint1.cry" "L_DownLip_Mid_SkinJnt.ry"
		;
connectAttr "L_DownLip_Mid_SkinJnt_orientConstraint1.crz" "L_DownLip_Mid_SkinJnt.rz"
		;
connectAttr "L_DownLip_Mid_SkinJnt.pim" "L_DownLip_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_DownLip_Mid_SkinJnt.rp" "L_DownLip_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_DownLip_Mid_SkinJnt.rpt" "L_DownLip_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_DownLip_Mid_Loc.t" "L_DownLip_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_DownLip_Mid_Loc.rp" "L_DownLip_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_DownLip_Mid_Loc.rpt" "L_DownLip_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_DownLip_Mid_Loc.pm" "L_DownLip_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_DownLip_Mid_SkinJnt_pointConstraint1.w0" "L_DownLip_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_DownLip_Mid_SkinJnt.ro" "L_DownLip_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_DownLip_Mid_SkinJnt.pim" "L_DownLip_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_DownLip_Mid_SkinJnt.jo" "L_DownLip_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_DownLip_Mid_SkinJnt.is" "L_DownLip_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_DownLip_Mid_Loc.r" "L_DownLip_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_DownLip_Mid_Loc.ro" "L_DownLip_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_DownLip_Mid_Loc.pm" "L_DownLip_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_DownLip_Mid_SkinJnt_orientConstraint1.w0" "L_DownLip_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_DownLip_Out_SkinJnt_pointConstraint1.ctx" "L_DownLip_Out_SkinJnt.tx"
		;
connectAttr "L_DownLip_Out_SkinJnt_pointConstraint1.cty" "L_DownLip_Out_SkinJnt.ty"
		;
connectAttr "L_DownLip_Out_SkinJnt_pointConstraint1.ctz" "L_DownLip_Out_SkinJnt.tz"
		;
connectAttr "L_DownLip_Out_SkinJnt_orientConstraint1.crx" "L_DownLip_Out_SkinJnt.rx"
		;
connectAttr "L_DownLip_Out_SkinJnt_orientConstraint1.cry" "L_DownLip_Out_SkinJnt.ry"
		;
connectAttr "L_DownLip_Out_SkinJnt_orientConstraint1.crz" "L_DownLip_Out_SkinJnt.rz"
		;
connectAttr "L_DownLip_Out_SkinJnt.pim" "L_DownLip_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_DownLip_Out_SkinJnt.rp" "L_DownLip_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_DownLip_Out_SkinJnt.rpt" "L_DownLip_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_DownLip_Out_Loc.t" "L_DownLip_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_DownLip_Out_Loc.rp" "L_DownLip_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_DownLip_Out_Loc.rpt" "L_DownLip_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_DownLip_Out_Loc.pm" "L_DownLip_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_DownLip_Out_SkinJnt_pointConstraint1.w0" "L_DownLip_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_DownLip_Out_SkinJnt.ro" "L_DownLip_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_DownLip_Out_SkinJnt.pim" "L_DownLip_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_DownLip_Out_SkinJnt.jo" "L_DownLip_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_DownLip_Out_SkinJnt.is" "L_DownLip_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_DownLip_Out_Loc.r" "L_DownLip_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_DownLip_Out_Loc.ro" "L_DownLip_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_DownLip_Out_Loc.pm" "L_DownLip_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_DownLip_Out_SkinJnt_orientConstraint1.w0" "L_DownLip_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_BottomCheek_In_SkinJnt_pointConstraint1.ctx" "L_BottomCheek_In_SkinJnt.tx"
		;
connectAttr "L_BottomCheek_In_SkinJnt_pointConstraint1.cty" "L_BottomCheek_In_SkinJnt.ty"
		;
connectAttr "L_BottomCheek_In_SkinJnt_pointConstraint1.ctz" "L_BottomCheek_In_SkinJnt.tz"
		;
connectAttr "L_BottomCheek_In_SkinJnt_orientConstraint1.crx" "L_BottomCheek_In_SkinJnt.rx"
		;
connectAttr "L_BottomCheek_In_SkinJnt_orientConstraint1.cry" "L_BottomCheek_In_SkinJnt.ry"
		;
connectAttr "L_BottomCheek_In_SkinJnt_orientConstraint1.crz" "L_BottomCheek_In_SkinJnt.rz"
		;
connectAttr "L_BottomCheek_In_SkinJnt.pim" "L_BottomCheek_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_BottomCheek_In_SkinJnt.rp" "L_BottomCheek_In_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_BottomCheek_In_SkinJnt.rpt" "L_BottomCheek_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_BottomCheek_In_Loc.t" "L_BottomCheek_In_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_BottomCheek_In_Loc.rp" "L_BottomCheek_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_BottomCheek_In_Loc.rpt" "L_BottomCheek_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_BottomCheek_In_Loc.pm" "L_BottomCheek_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_BottomCheek_In_SkinJnt_pointConstraint1.w0" "L_BottomCheek_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_BottomCheek_In_SkinJnt.ro" "L_BottomCheek_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_BottomCheek_In_SkinJnt.pim" "L_BottomCheek_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_BottomCheek_In_SkinJnt.jo" "L_BottomCheek_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_BottomCheek_In_SkinJnt.is" "L_BottomCheek_In_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_BottomCheek_In_Loc.r" "L_BottomCheek_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_BottomCheek_In_Loc.ro" "L_BottomCheek_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_BottomCheek_In_Loc.pm" "L_BottomCheek_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_BottomCheek_In_SkinJnt_orientConstraint1.w0" "L_BottomCheek_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_Temple_SkinJnt_pointConstraint1.ctx" "L_Temple_SkinJnt.tx";
connectAttr "L_Temple_SkinJnt_pointConstraint1.cty" "L_Temple_SkinJnt.ty";
connectAttr "L_Temple_SkinJnt_pointConstraint1.ctz" "L_Temple_SkinJnt.tz";
connectAttr "L_Temple_SkinJnt_orientConstraint1.crx" "L_Temple_SkinJnt.rx";
connectAttr "L_Temple_SkinJnt_orientConstraint1.cry" "L_Temple_SkinJnt.ry";
connectAttr "L_Temple_SkinJnt_orientConstraint1.crz" "L_Temple_SkinJnt.rz";
connectAttr "L_Temple_SkinJnt.pim" "L_Temple_SkinJnt_pointConstraint1.cpim";
connectAttr "L_Temple_SkinJnt.rp" "L_Temple_SkinJnt_pointConstraint1.crp";
connectAttr "L_Temple_SkinJnt.rpt" "L_Temple_SkinJnt_pointConstraint1.crt";
connectAttr "L_Temple_Loc.t" "L_Temple_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "L_Temple_Loc.rp" "L_Temple_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "L_Temple_Loc.rpt" "L_Temple_SkinJnt_pointConstraint1.tg[0].trt";
connectAttr "L_Temple_Loc.pm" "L_Temple_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "L_Temple_SkinJnt_pointConstraint1.w0" "L_Temple_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_Temple_SkinJnt.ro" "L_Temple_SkinJnt_orientConstraint1.cro";
connectAttr "L_Temple_SkinJnt.pim" "L_Temple_SkinJnt_orientConstraint1.cpim";
connectAttr "L_Temple_SkinJnt.jo" "L_Temple_SkinJnt_orientConstraint1.cjo";
connectAttr "L_Temple_SkinJnt.is" "L_Temple_SkinJnt_orientConstraint1.is";
connectAttr "L_Temple_Loc.r" "L_Temple_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "L_Temple_Loc.ro" "L_Temple_SkinJnt_orientConstraint1.tg[0].tro";
connectAttr "L_Temple_Loc.pm" "L_Temple_SkinJnt_orientConstraint1.tg[0].tpm";
connectAttr "L_Temple_SkinJnt_orientConstraint1.w0" "L_Temple_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "C_UpBrow_SkinJnt_pointConstraint1.ctx" "C_UpBrow_SkinJnt.tx";
connectAttr "C_UpBrow_SkinJnt_pointConstraint1.cty" "C_UpBrow_SkinJnt.ty";
connectAttr "C_UpBrow_SkinJnt_pointConstraint1.ctz" "C_UpBrow_SkinJnt.tz";
connectAttr "C_UpBrow_SkinJnt_orientConstraint1.crx" "C_UpBrow_SkinJnt.rx";
connectAttr "C_UpBrow_SkinJnt_orientConstraint1.cry" "C_UpBrow_SkinJnt.ry";
connectAttr "C_UpBrow_SkinJnt_orientConstraint1.crz" "C_UpBrow_SkinJnt.rz";
connectAttr "C_UpBrow_SkinJnt.pim" "C_UpBrow_SkinJnt_pointConstraint1.cpim";
connectAttr "C_UpBrow_SkinJnt.rp" "C_UpBrow_SkinJnt_pointConstraint1.crp";
connectAttr "C_UpBrow_SkinJnt.rpt" "C_UpBrow_SkinJnt_pointConstraint1.crt";
connectAttr "C_UpBrow_Loc.t" "C_UpBrow_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "C_UpBrow_Loc.rp" "C_UpBrow_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "C_UpBrow_Loc.rpt" "C_UpBrow_SkinJnt_pointConstraint1.tg[0].trt";
connectAttr "C_UpBrow_Loc.pm" "C_UpBrow_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "C_UpBrow_SkinJnt_pointConstraint1.w0" "C_UpBrow_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "C_UpBrow_SkinJnt.ro" "C_UpBrow_SkinJnt_orientConstraint1.cro";
connectAttr "C_UpBrow_SkinJnt.pim" "C_UpBrow_SkinJnt_orientConstraint1.cpim";
connectAttr "C_UpBrow_SkinJnt.jo" "C_UpBrow_SkinJnt_orientConstraint1.cjo";
connectAttr "C_UpBrow_SkinJnt.is" "C_UpBrow_SkinJnt_orientConstraint1.is";
connectAttr "C_UpBrow_Loc.r" "C_UpBrow_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "C_UpBrow_Loc.ro" "C_UpBrow_SkinJnt_orientConstraint1.tg[0].tro";
connectAttr "C_UpBrow_Loc.pm" "C_UpBrow_SkinJnt_orientConstraint1.tg[0].tpm";
connectAttr "C_UpBrow_SkinJnt_orientConstraint1.w0" "C_UpBrow_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_UpBrow_In_SkinJnt_pointConstraint1.ctx" "L_UpBrow_In_SkinJnt.tx";
connectAttr "L_UpBrow_In_SkinJnt_pointConstraint1.cty" "L_UpBrow_In_SkinJnt.ty";
connectAttr "L_UpBrow_In_SkinJnt_pointConstraint1.ctz" "L_UpBrow_In_SkinJnt.tz";
connectAttr "L_UpBrow_In_SkinJnt_orientConstraint1.crx" "L_UpBrow_In_SkinJnt.rx"
		;
connectAttr "L_UpBrow_In_SkinJnt_orientConstraint1.cry" "L_UpBrow_In_SkinJnt.ry"
		;
connectAttr "L_UpBrow_In_SkinJnt_orientConstraint1.crz" "L_UpBrow_In_SkinJnt.rz"
		;
connectAttr "L_UpBrow_In_SkinJnt.pim" "L_UpBrow_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_UpBrow_In_SkinJnt.rp" "L_UpBrow_In_SkinJnt_pointConstraint1.crp";
connectAttr "L_UpBrow_In_SkinJnt.rpt" "L_UpBrow_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_UpBrow_In_Loc.t" "L_UpBrow_In_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "L_UpBrow_In_Loc.rp" "L_UpBrow_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_UpBrow_In_Loc.rpt" "L_UpBrow_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_UpBrow_In_Loc.pm" "L_UpBrow_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_UpBrow_In_SkinJnt_pointConstraint1.w0" "L_UpBrow_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_UpBrow_In_SkinJnt.ro" "L_UpBrow_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_UpBrow_In_SkinJnt.pim" "L_UpBrow_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_UpBrow_In_SkinJnt.jo" "L_UpBrow_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_UpBrow_In_SkinJnt.is" "L_UpBrow_In_SkinJnt_orientConstraint1.is";
connectAttr "L_UpBrow_In_Loc.r" "L_UpBrow_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_UpBrow_In_Loc.ro" "L_UpBrow_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_UpBrow_In_Loc.pm" "L_UpBrow_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_UpBrow_In_SkinJnt_orientConstraint1.w0" "L_UpBrow_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_UpBrow_Mid_SkinJnt_pointConstraint1.ctx" "L_UpBrow_Mid_SkinJnt.tx"
		;
connectAttr "L_UpBrow_Mid_SkinJnt_pointConstraint1.cty" "L_UpBrow_Mid_SkinJnt.ty"
		;
connectAttr "L_UpBrow_Mid_SkinJnt_pointConstraint1.ctz" "L_UpBrow_Mid_SkinJnt.tz"
		;
connectAttr "L_UpBrow_Mid_SkinJnt_orientConstraint1.crx" "L_UpBrow_Mid_SkinJnt.rx"
		;
connectAttr "L_UpBrow_Mid_SkinJnt_orientConstraint1.cry" "L_UpBrow_Mid_SkinJnt.ry"
		;
connectAttr "L_UpBrow_Mid_SkinJnt_orientConstraint1.crz" "L_UpBrow_Mid_SkinJnt.rz"
		;
connectAttr "L_UpBrow_Mid_SkinJnt.pim" "L_UpBrow_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_UpBrow_Mid_SkinJnt.rp" "L_UpBrow_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_UpBrow_Mid_SkinJnt.rpt" "L_UpBrow_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_UpBrow_Mid_Loc.t" "L_UpBrow_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_UpBrow_Mid_Loc.rp" "L_UpBrow_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_UpBrow_Mid_Loc.rpt" "L_UpBrow_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_UpBrow_Mid_Loc.pm" "L_UpBrow_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_UpBrow_Mid_SkinJnt_pointConstraint1.w0" "L_UpBrow_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_UpBrow_Mid_SkinJnt.ro" "L_UpBrow_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_UpBrow_Mid_SkinJnt.pim" "L_UpBrow_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_UpBrow_Mid_SkinJnt.jo" "L_UpBrow_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_UpBrow_Mid_SkinJnt.is" "L_UpBrow_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_UpBrow_Mid_Loc.r" "L_UpBrow_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_UpBrow_Mid_Loc.ro" "L_UpBrow_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_UpBrow_Mid_Loc.pm" "L_UpBrow_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_UpBrow_Mid_SkinJnt_orientConstraint1.w0" "L_UpBrow_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_UpBrow_Out_SkinJnt_pointConstraint1.ctx" "L_UpBrow_Out_SkinJnt.tx"
		;
connectAttr "L_UpBrow_Out_SkinJnt_pointConstraint1.cty" "L_UpBrow_Out_SkinJnt.ty"
		;
connectAttr "L_UpBrow_Out_SkinJnt_pointConstraint1.ctz" "L_UpBrow_Out_SkinJnt.tz"
		;
connectAttr "L_UpBrow_Out_SkinJnt_orientConstraint1.crx" "L_UpBrow_Out_SkinJnt.rx"
		;
connectAttr "L_UpBrow_Out_SkinJnt_orientConstraint1.cry" "L_UpBrow_Out_SkinJnt.ry"
		;
connectAttr "L_UpBrow_Out_SkinJnt_orientConstraint1.crz" "L_UpBrow_Out_SkinJnt.rz"
		;
connectAttr "L_UpBrow_Out_SkinJnt.pim" "L_UpBrow_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_UpBrow_Out_SkinJnt.rp" "L_UpBrow_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "L_UpBrow_Out_SkinJnt.rpt" "L_UpBrow_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_UpBrow_Out_Loc.t" "L_UpBrow_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_UpBrow_Out_Loc.rp" "L_UpBrow_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_UpBrow_Out_Loc.rpt" "L_UpBrow_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_UpBrow_Out_Loc.pm" "L_UpBrow_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_UpBrow_Out_SkinJnt_pointConstraint1.w0" "L_UpBrow_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_UpBrow_Out_SkinJnt.ro" "L_UpBrow_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_UpBrow_Out_SkinJnt.pim" "L_UpBrow_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_UpBrow_Out_SkinJnt.jo" "L_UpBrow_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_UpBrow_Out_SkinJnt.is" "L_UpBrow_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "L_UpBrow_Out_Loc.r" "L_UpBrow_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_UpBrow_Out_Loc.ro" "L_UpBrow_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_UpBrow_Out_Loc.pm" "L_UpBrow_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_UpBrow_Out_SkinJnt_orientConstraint1.w0" "L_UpBrow_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_Nose_Hole_SkinJnt_pointConstraint1.ctx" "L_Nose_Hole_SkinJnt.tx";
connectAttr "L_Nose_Hole_SkinJnt_pointConstraint1.cty" "L_Nose_Hole_SkinJnt.ty";
connectAttr "L_Nose_Hole_SkinJnt_pointConstraint1.ctz" "L_Nose_Hole_SkinJnt.tz";
connectAttr "L_Nose_Hole_SkinJnt_orientConstraint1.crx" "L_Nose_Hole_SkinJnt.rx"
		;
connectAttr "L_Nose_Hole_SkinJnt_orientConstraint1.cry" "L_Nose_Hole_SkinJnt.ry"
		;
connectAttr "L_Nose_Hole_SkinJnt_orientConstraint1.crz" "L_Nose_Hole_SkinJnt.rz"
		;
connectAttr "L_Nose_Hole_SkinJnt.pim" "L_Nose_Hole_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "L_Nose_Hole_SkinJnt.rp" "L_Nose_Hole_SkinJnt_pointConstraint1.crp";
connectAttr "L_Nose_Hole_SkinJnt.rpt" "L_Nose_Hole_SkinJnt_pointConstraint1.crt"
		;
connectAttr "L_Nose_Hole_Loc.t" "L_Nose_Hole_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "L_Nose_Hole_Loc.rp" "L_Nose_Hole_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_Nose_Hole_Loc.rpt" "L_Nose_Hole_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_Nose_Hole_Loc.pm" "L_Nose_Hole_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_Nose_Hole_SkinJnt_pointConstraint1.w0" "L_Nose_Hole_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_Nose_Hole_SkinJnt.ro" "L_Nose_Hole_SkinJnt_orientConstraint1.cro"
		;
connectAttr "L_Nose_Hole_SkinJnt.pim" "L_Nose_Hole_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "L_Nose_Hole_SkinJnt.jo" "L_Nose_Hole_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "L_Nose_Hole_SkinJnt.is" "L_Nose_Hole_SkinJnt_orientConstraint1.is";
connectAttr "L_Nose_Hole_Loc.r" "L_Nose_Hole_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_Nose_Hole_Loc.ro" "L_Nose_Hole_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_Nose_Hole_Loc.pm" "L_Nose_Hole_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_Nose_Hole_SkinJnt_orientConstraint1.w0" "L_Nose_Hole_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_Eye_SkinJnt_pointConstraint1.ctx" "L_Eye_SkinJnt.tx";
connectAttr "L_Eye_SkinJnt_pointConstraint1.cty" "L_Eye_SkinJnt.ty";
connectAttr "L_Eye_SkinJnt_pointConstraint1.ctz" "L_Eye_SkinJnt.tz";
connectAttr "L_Eye_SkinJnt_orientConstraint1.crx" "L_Eye_SkinJnt.rx";
connectAttr "L_Eye_SkinJnt_orientConstraint1.cry" "L_Eye_SkinJnt.ry";
connectAttr "L_Eye_SkinJnt_orientConstraint1.crz" "L_Eye_SkinJnt.rz";
connectAttr "L_Eye_SkinJnt.pim" "L_Eye_SkinJnt_pointConstraint1.cpim";
connectAttr "L_Eye_SkinJnt.rp" "L_Eye_SkinJnt_pointConstraint1.crp";
connectAttr "L_Eye_SkinJnt.rpt" "L_Eye_SkinJnt_pointConstraint1.crt";
connectAttr "L_Eye_Loc.t" "L_Eye_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "L_Eye_Loc.rp" "L_Eye_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "L_Eye_Loc.rpt" "L_Eye_SkinJnt_pointConstraint1.tg[0].trt";
connectAttr "L_Eye_Loc.pm" "L_Eye_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "L_Eye_SkinJnt_pointConstraint1.w0" "L_Eye_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_Eye_SkinJnt.ro" "L_Eye_SkinJnt_orientConstraint1.cro";
connectAttr "L_Eye_SkinJnt.pim" "L_Eye_SkinJnt_orientConstraint1.cpim";
connectAttr "L_Eye_SkinJnt.jo" "L_Eye_SkinJnt_orientConstraint1.cjo";
connectAttr "L_Eye_SkinJnt.is" "L_Eye_SkinJnt_orientConstraint1.is";
connectAttr "L_Eye_Loc.r" "L_Eye_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "L_Eye_Loc.ro" "L_Eye_SkinJnt_orientConstraint1.tg[0].tro";
connectAttr "L_Eye_Loc.pm" "L_Eye_SkinJnt_orientConstraint1.tg[0].tpm";
connectAttr "L_Eye_SkinJnt_orientConstraint1.w0" "L_Eye_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "rp_eric_rigged_001_geoSG.mwc" "polySurfaceShape2.iog.og[0].gco";
connectAttr "rp_eric_rigged_001_geoSG.mwc" "polySurfaceShape1.iog.og[0].gco";
connectAttr "layer1.di" "polySurface3.do";
connectAttr "R_Eye_SkinJnt_pointConstraint1.ctx" "R_Eye_SkinJnt.tx";
connectAttr "R_Eye_SkinJnt_pointConstraint1.cty" "R_Eye_SkinJnt.ty";
connectAttr "R_Eye_SkinJnt_pointConstraint1.ctz" "R_Eye_SkinJnt.tz";
connectAttr "R_Eye_SkinJnt_orientConstraint1.crx" "R_Eye_SkinJnt.rx";
connectAttr "R_Eye_SkinJnt_orientConstraint1.cry" "R_Eye_SkinJnt.ry";
connectAttr "R_Eye_SkinJnt_orientConstraint1.crz" "R_Eye_SkinJnt.rz";
connectAttr "R_Eye_SkinJnt.pim" "R_Eye_SkinJnt_pointConstraint1.cpim";
connectAttr "R_Eye_SkinJnt.rp" "R_Eye_SkinJnt_pointConstraint1.crp";
connectAttr "R_Eye_SkinJnt.rpt" "R_Eye_SkinJnt_pointConstraint1.crt";
connectAttr "R_Eye_Loc.t" "R_Eye_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "R_Eye_Loc.rp" "R_Eye_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "R_Eye_Loc.rpt" "R_Eye_SkinJnt_pointConstraint1.tg[0].trt";
connectAttr "R_Eye_Loc.pm" "R_Eye_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "R_Eye_SkinJnt_pointConstraint1.w0" "R_Eye_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_Eye_SkinJnt.ro" "R_Eye_SkinJnt_orientConstraint1.cro";
connectAttr "R_Eye_SkinJnt.pim" "R_Eye_SkinJnt_orientConstraint1.cpim";
connectAttr "R_Eye_SkinJnt.jo" "R_Eye_SkinJnt_orientConstraint1.cjo";
connectAttr "R_Eye_SkinJnt.is" "R_Eye_SkinJnt_orientConstraint1.is";
connectAttr "R_Eye_Loc.r" "R_Eye_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "R_Eye_Loc.ro" "R_Eye_SkinJnt_orientConstraint1.tg[0].tro";
connectAttr "R_Eye_Loc.pm" "R_Eye_SkinJnt_orientConstraint1.tg[0].tpm";
connectAttr "R_Eye_SkinJnt_orientConstraint1.w0" "R_Eye_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_UpBrow_In_SkinJnt_pointConstraint1.ctx" "R_UpBrow_In_SkinJnt.tx";
connectAttr "R_UpBrow_In_SkinJnt_pointConstraint1.cty" "R_UpBrow_In_SkinJnt.ty";
connectAttr "R_UpBrow_In_SkinJnt_pointConstraint1.ctz" "R_UpBrow_In_SkinJnt.tz";
connectAttr "R_UpBrow_In_SkinJnt_orientConstraint1.crx" "R_UpBrow_In_SkinJnt.rx"
		;
connectAttr "R_UpBrow_In_SkinJnt_orientConstraint1.cry" "R_UpBrow_In_SkinJnt.ry"
		;
connectAttr "R_UpBrow_In_SkinJnt_orientConstraint1.crz" "R_UpBrow_In_SkinJnt.rz"
		;
connectAttr "R_UpBrow_In_SkinJnt.pim" "R_UpBrow_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_UpBrow_In_SkinJnt.rp" "R_UpBrow_In_SkinJnt_pointConstraint1.crp";
connectAttr "R_UpBrow_In_SkinJnt.rpt" "R_UpBrow_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_UpBrow_In_Loc.t" "R_UpBrow_In_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "R_UpBrow_In_Loc.rp" "R_UpBrow_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_UpBrow_In_Loc.rpt" "R_UpBrow_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_UpBrow_In_Loc.pm" "R_UpBrow_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_UpBrow_In_SkinJnt_pointConstraint1.w0" "R_UpBrow_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_UpBrow_In_SkinJnt.ro" "R_UpBrow_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_UpBrow_In_SkinJnt.pim" "R_UpBrow_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_UpBrow_In_SkinJnt.jo" "R_UpBrow_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_UpBrow_In_SkinJnt.is" "R_UpBrow_In_SkinJnt_orientConstraint1.is";
connectAttr "R_UpBrow_In_Loc.r" "R_UpBrow_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_UpBrow_In_Loc.ro" "R_UpBrow_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_UpBrow_In_Loc.pm" "R_UpBrow_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_UpBrow_In_SkinJnt_orientConstraint1.w0" "R_UpBrow_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_UpBrow_Mid_SkinJnt_pointConstraint1.ctx" "R_UpBrow_Mid_SkinJnt.tx"
		;
connectAttr "R_UpBrow_Mid_SkinJnt_pointConstraint1.cty" "R_UpBrow_Mid_SkinJnt.ty"
		;
connectAttr "R_UpBrow_Mid_SkinJnt_pointConstraint1.ctz" "R_UpBrow_Mid_SkinJnt.tz"
		;
connectAttr "R_UpBrow_Mid_SkinJnt_orientConstraint1.crx" "R_UpBrow_Mid_SkinJnt.rx"
		;
connectAttr "R_UpBrow_Mid_SkinJnt_orientConstraint1.cry" "R_UpBrow_Mid_SkinJnt.ry"
		;
connectAttr "R_UpBrow_Mid_SkinJnt_orientConstraint1.crz" "R_UpBrow_Mid_SkinJnt.rz"
		;
connectAttr "R_UpBrow_Mid_SkinJnt.pim" "R_UpBrow_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_UpBrow_Mid_SkinJnt.rp" "R_UpBrow_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_UpBrow_Mid_SkinJnt.rpt" "R_UpBrow_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_UpBrow_Mid_Loc.t" "R_UpBrow_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_UpBrow_Mid_Loc.rp" "R_UpBrow_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_UpBrow_Mid_Loc.rpt" "R_UpBrow_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_UpBrow_Mid_Loc.pm" "R_UpBrow_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_UpBrow_Mid_SkinJnt_pointConstraint1.w0" "R_UpBrow_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_UpBrow_Mid_SkinJnt.ro" "R_UpBrow_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_UpBrow_Mid_SkinJnt.pim" "R_UpBrow_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_UpBrow_Mid_SkinJnt.jo" "R_UpBrow_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_UpBrow_Mid_SkinJnt.is" "R_UpBrow_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_UpBrow_Mid_Loc.r" "R_UpBrow_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_UpBrow_Mid_Loc.ro" "R_UpBrow_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_UpBrow_Mid_Loc.pm" "R_UpBrow_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_UpBrow_Mid_SkinJnt_orientConstraint1.w0" "R_UpBrow_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_UpBrow_Out_SkinJnt_pointConstraint1.ctx" "R_UpBrow_Out_SkinJnt.tx"
		;
connectAttr "R_UpBrow_Out_SkinJnt_pointConstraint1.cty" "R_UpBrow_Out_SkinJnt.ty"
		;
connectAttr "R_UpBrow_Out_SkinJnt_pointConstraint1.ctz" "R_UpBrow_Out_SkinJnt.tz"
		;
connectAttr "R_UpBrow_Out_SkinJnt_orientConstraint1.crx" "R_UpBrow_Out_SkinJnt.rx"
		;
connectAttr "R_UpBrow_Out_SkinJnt_orientConstraint1.cry" "R_UpBrow_Out_SkinJnt.ry"
		;
connectAttr "R_UpBrow_Out_SkinJnt_orientConstraint1.crz" "R_UpBrow_Out_SkinJnt.rz"
		;
connectAttr "R_UpBrow_Out_SkinJnt.pim" "R_UpBrow_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_UpBrow_Out_SkinJnt.rp" "R_UpBrow_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_UpBrow_Out_SkinJnt.rpt" "R_UpBrow_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_UpBrow_Out_Loc.t" "R_UpBrow_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_UpBrow_Out_Loc.rp" "R_UpBrow_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_UpBrow_Out_Loc.rpt" "R_UpBrow_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_UpBrow_Out_Loc.pm" "R_UpBrow_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_UpBrow_Out_SkinJnt_pointConstraint1.w0" "R_UpBrow_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_UpBrow_Out_SkinJnt.ro" "R_UpBrow_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_UpBrow_Out_SkinJnt.pim" "R_UpBrow_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_UpBrow_Out_SkinJnt.jo" "R_UpBrow_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_UpBrow_Out_SkinJnt.is" "R_UpBrow_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_UpBrow_Out_Loc.r" "R_UpBrow_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_UpBrow_Out_Loc.ro" "R_UpBrow_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_UpBrow_Out_Loc.pm" "R_UpBrow_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_UpBrow_Out_SkinJnt_orientConstraint1.w0" "R_UpBrow_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_DownBrow_In_SkinJnt_pointConstraint1.ctx" "R_DownBrow_In_SkinJnt.tx"
		;
connectAttr "R_DownBrow_In_SkinJnt_pointConstraint1.cty" "R_DownBrow_In_SkinJnt.ty"
		;
connectAttr "R_DownBrow_In_SkinJnt_pointConstraint1.ctz" "R_DownBrow_In_SkinJnt.tz"
		;
connectAttr "R_DownBrow_In_SkinJnt_orientConstraint1.crx" "R_DownBrow_In_SkinJnt.rx"
		;
connectAttr "R_DownBrow_In_SkinJnt_orientConstraint1.cry" "R_DownBrow_In_SkinJnt.ry"
		;
connectAttr "R_DownBrow_In_SkinJnt_orientConstraint1.crz" "R_DownBrow_In_SkinJnt.rz"
		;
connectAttr "R_DownBrow_In_SkinJnt.pim" "R_DownBrow_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_DownBrow_In_SkinJnt.rp" "R_DownBrow_In_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_DownBrow_In_SkinJnt.rpt" "R_DownBrow_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_DownBrow_In_Loc.t" "R_DownBrow_In_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_DownBrow_In_Loc.rp" "R_DownBrow_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_DownBrow_In_Loc.rpt" "R_DownBrow_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_DownBrow_In_Loc.pm" "R_DownBrow_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_DownBrow_In_SkinJnt_pointConstraint1.w0" "R_DownBrow_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_DownBrow_In_SkinJnt.ro" "R_DownBrow_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_DownBrow_In_SkinJnt.pim" "R_DownBrow_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_DownBrow_In_SkinJnt.jo" "R_DownBrow_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_DownBrow_In_SkinJnt.is" "R_DownBrow_In_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_DownBrow_In_Loc.r" "R_DownBrow_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_DownBrow_In_Loc.ro" "R_DownBrow_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_DownBrow_In_Loc.pm" "R_DownBrow_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_DownBrow_In_SkinJnt_orientConstraint1.w0" "R_DownBrow_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_DownBrow_Mid_SkinJnt_pointConstraint1.ctx" "R_DownBrow_Mid_SkinJnt.tx"
		;
connectAttr "R_DownBrow_Mid_SkinJnt_pointConstraint1.cty" "R_DownBrow_Mid_SkinJnt.ty"
		;
connectAttr "R_DownBrow_Mid_SkinJnt_pointConstraint1.ctz" "R_DownBrow_Mid_SkinJnt.tz"
		;
connectAttr "R_DownBrow_Mid_SkinJnt_orientConstraint1.crx" "R_DownBrow_Mid_SkinJnt.rx"
		;
connectAttr "R_DownBrow_Mid_SkinJnt_orientConstraint1.cry" "R_DownBrow_Mid_SkinJnt.ry"
		;
connectAttr "R_DownBrow_Mid_SkinJnt_orientConstraint1.crz" "R_DownBrow_Mid_SkinJnt.rz"
		;
connectAttr "R_DownBrow_Mid_SkinJnt.pim" "R_DownBrow_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_DownBrow_Mid_SkinJnt.rp" "R_DownBrow_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_DownBrow_Mid_SkinJnt.rpt" "R_DownBrow_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_DownBrow_Mid_Loc.t" "R_DownBrow_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_DownBrow_Mid_Loc.rp" "R_DownBrow_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_DownBrow_Mid_Loc.rpt" "R_DownBrow_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_DownBrow_Mid_Loc.pm" "R_DownBrow_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_DownBrow_Mid_SkinJnt_pointConstraint1.w0" "R_DownBrow_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_DownBrow_Mid_SkinJnt.ro" "R_DownBrow_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_DownBrow_Mid_SkinJnt.pim" "R_DownBrow_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_DownBrow_Mid_SkinJnt.jo" "R_DownBrow_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_DownBrow_Mid_SkinJnt.is" "R_DownBrow_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_DownBrow_Mid_Loc.r" "R_DownBrow_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_DownBrow_Mid_Loc.ro" "R_DownBrow_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_DownBrow_Mid_Loc.pm" "R_DownBrow_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_DownBrow_Mid_SkinJnt_orientConstraint1.w0" "R_DownBrow_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_DownBrow_Out_SkinJnt_pointConstraint1.ctx" "R_DownBrow_Out_SkinJnt.tx"
		;
connectAttr "R_DownBrow_Out_SkinJnt_pointConstraint1.cty" "R_DownBrow_Out_SkinJnt.ty"
		;
connectAttr "R_DownBrow_Out_SkinJnt_pointConstraint1.ctz" "R_DownBrow_Out_SkinJnt.tz"
		;
connectAttr "R_DownBrow_Out_SkinJnt_orientConstraint1.crx" "R_DownBrow_Out_SkinJnt.rx"
		;
connectAttr "R_DownBrow_Out_SkinJnt_orientConstraint1.cry" "R_DownBrow_Out_SkinJnt.ry"
		;
connectAttr "R_DownBrow_Out_SkinJnt_orientConstraint1.crz" "R_DownBrow_Out_SkinJnt.rz"
		;
connectAttr "R_DownBrow_Out_SkinJnt.pim" "R_DownBrow_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_DownBrow_Out_SkinJnt.rp" "R_DownBrow_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_DownBrow_Out_SkinJnt.rpt" "R_DownBrow_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_DownBrow_Out_Loc.t" "R_DownBrow_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_DownBrow_Out_Loc.rp" "R_DownBrow_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_DownBrow_Out_Loc.rpt" "R_DownBrow_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_DownBrow_Out_Loc.pm" "R_DownBrow_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_DownBrow_Out_SkinJnt_pointConstraint1.w0" "R_DownBrow_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_DownBrow_Out_SkinJnt.ro" "R_DownBrow_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_DownBrow_Out_SkinJnt.pim" "R_DownBrow_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_DownBrow_Out_SkinJnt.jo" "R_DownBrow_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_DownBrow_Out_SkinJnt.is" "R_DownBrow_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_DownBrow_Out_Loc.r" "R_DownBrow_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_DownBrow_Out_Loc.ro" "R_DownBrow_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_DownBrow_Out_Loc.pm" "R_DownBrow_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_DownBrow_Out_SkinJnt_orientConstraint1.w0" "R_DownBrow_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_Nose_Coner_SkinJnt_pointConstraint1.ctx" "R_Nose_Coner_SkinJnt.tx"
		;
connectAttr "R_Nose_Coner_SkinJnt_pointConstraint1.cty" "R_Nose_Coner_SkinJnt.ty"
		;
connectAttr "R_Nose_Coner_SkinJnt_pointConstraint1.ctz" "R_Nose_Coner_SkinJnt.tz"
		;
connectAttr "R_Nose_Coner_SkinJnt_orientConstraint1.crx" "R_Nose_Coner_SkinJnt.rx"
		;
connectAttr "R_Nose_Coner_SkinJnt_orientConstraint1.cry" "R_Nose_Coner_SkinJnt.ry"
		;
connectAttr "R_Nose_Coner_SkinJnt_orientConstraint1.crz" "R_Nose_Coner_SkinJnt.rz"
		;
connectAttr "R_Nose_Coner_SkinJnt.pim" "R_Nose_Coner_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_Nose_Coner_SkinJnt.rp" "R_Nose_Coner_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_Nose_Coner_SkinJnt.rpt" "R_Nose_Coner_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_Nose_Coner_Loc.t" "R_Nose_Coner_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_Nose_Coner_Loc.rp" "R_Nose_Coner_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_Nose_Coner_Loc.rpt" "R_Nose_Coner_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_Nose_Coner_Loc.pm" "R_Nose_Coner_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_Nose_Coner_SkinJnt_pointConstraint1.w0" "R_Nose_Coner_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_Nose_Coner_SkinJnt.ro" "R_Nose_Coner_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_Nose_Coner_SkinJnt.pim" "R_Nose_Coner_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_Nose_Coner_SkinJnt.jo" "R_Nose_Coner_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_Nose_Coner_SkinJnt.is" "R_Nose_Coner_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_Nose_Coner_Loc.r" "R_Nose_Coner_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_Nose_Coner_Loc.ro" "R_Nose_Coner_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_Nose_Coner_Loc.pm" "R_Nose_Coner_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_Nose_Coner_SkinJnt_orientConstraint1.w0" "R_Nose_Coner_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_Nose_Mid_SkinJnt_pointConstraint1.ctx" "R_Nose_Mid_SkinJnt.tx";
connectAttr "R_Nose_Mid_SkinJnt_pointConstraint1.cty" "R_Nose_Mid_SkinJnt.ty";
connectAttr "R_Nose_Mid_SkinJnt_pointConstraint1.ctz" "R_Nose_Mid_SkinJnt.tz";
connectAttr "R_Nose_Mid_SkinJnt_orientConstraint1.crx" "R_Nose_Mid_SkinJnt.rx";
connectAttr "R_Nose_Mid_SkinJnt_orientConstraint1.cry" "R_Nose_Mid_SkinJnt.ry";
connectAttr "R_Nose_Mid_SkinJnt_orientConstraint1.crz" "R_Nose_Mid_SkinJnt.rz";
connectAttr "R_Nose_Mid_SkinJnt.pim" "R_Nose_Mid_SkinJnt_pointConstraint1.cpim";
connectAttr "R_Nose_Mid_SkinJnt.rp" "R_Nose_Mid_SkinJnt_pointConstraint1.crp";
connectAttr "R_Nose_Mid_SkinJnt.rpt" "R_Nose_Mid_SkinJnt_pointConstraint1.crt";
connectAttr "R_Nose_Mid_Loc.t" "R_Nose_Mid_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "R_Nose_Mid_Loc.rp" "R_Nose_Mid_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "R_Nose_Mid_Loc.rpt" "R_Nose_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_Nose_Mid_Loc.pm" "R_Nose_Mid_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "R_Nose_Mid_SkinJnt_pointConstraint1.w0" "R_Nose_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_Nose_Mid_SkinJnt.ro" "R_Nose_Mid_SkinJnt_orientConstraint1.cro";
connectAttr "R_Nose_Mid_SkinJnt.pim" "R_Nose_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_Nose_Mid_SkinJnt.jo" "R_Nose_Mid_SkinJnt_orientConstraint1.cjo";
connectAttr "R_Nose_Mid_SkinJnt.is" "R_Nose_Mid_SkinJnt_orientConstraint1.is";
connectAttr "R_Nose_Mid_Loc.r" "R_Nose_Mid_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "R_Nose_Mid_Loc.ro" "R_Nose_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_Nose_Mid_Loc.pm" "R_Nose_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_Nose_Mid_SkinJnt_orientConstraint1.w0" "R_Nose_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_Nose_Hole_SkinJnt_pointConstraint1.ctx" "R_Nose_Hole_SkinJnt.tx";
connectAttr "R_Nose_Hole_SkinJnt_pointConstraint1.cty" "R_Nose_Hole_SkinJnt.ty";
connectAttr "R_Nose_Hole_SkinJnt_pointConstraint1.ctz" "R_Nose_Hole_SkinJnt.tz";
connectAttr "R_Nose_Hole_SkinJnt_orientConstraint1.crx" "R_Nose_Hole_SkinJnt.rx"
		;
connectAttr "R_Nose_Hole_SkinJnt_orientConstraint1.cry" "R_Nose_Hole_SkinJnt.ry"
		;
connectAttr "R_Nose_Hole_SkinJnt_orientConstraint1.crz" "R_Nose_Hole_SkinJnt.rz"
		;
connectAttr "R_Nose_Hole_SkinJnt.pim" "R_Nose_Hole_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_Nose_Hole_SkinJnt.rp" "R_Nose_Hole_SkinJnt_pointConstraint1.crp";
connectAttr "R_Nose_Hole_SkinJnt.rpt" "R_Nose_Hole_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_Nose_Hole_Loc.t" "R_Nose_Hole_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "R_Nose_Hole_Loc.rp" "R_Nose_Hole_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_Nose_Hole_Loc.rpt" "R_Nose_Hole_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_Nose_Hole_Loc.pm" "R_Nose_Hole_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_Nose_Hole_SkinJnt_pointConstraint1.w0" "R_Nose_Hole_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_Nose_Hole_SkinJnt.ro" "R_Nose_Hole_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_Nose_Hole_SkinJnt.pim" "R_Nose_Hole_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_Nose_Hole_SkinJnt.jo" "R_Nose_Hole_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_Nose_Hole_SkinJnt.is" "R_Nose_Hole_SkinJnt_orientConstraint1.is";
connectAttr "R_Nose_Hole_Loc.r" "R_Nose_Hole_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_Nose_Hole_Loc.ro" "R_Nose_Hole_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_Nose_Hole_Loc.pm" "R_Nose_Hole_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_Nose_Hole_SkinJnt_orientConstraint1.w0" "R_Nose_Hole_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_UpCheek_In_SkinJnt_pointConstraint1.ctx" "R_UpCheek_In_SkinJnt.tx"
		;
connectAttr "R_UpCheek_In_SkinJnt_pointConstraint1.cty" "R_UpCheek_In_SkinJnt.ty"
		;
connectAttr "R_UpCheek_In_SkinJnt_pointConstraint1.ctz" "R_UpCheek_In_SkinJnt.tz"
		;
connectAttr "R_UpCheek_In_SkinJnt_orientConstraint1.crx" "R_UpCheek_In_SkinJnt.rx"
		;
connectAttr "R_UpCheek_In_SkinJnt_orientConstraint1.cry" "R_UpCheek_In_SkinJnt.ry"
		;
connectAttr "R_UpCheek_In_SkinJnt_orientConstraint1.crz" "R_UpCheek_In_SkinJnt.rz"
		;
connectAttr "R_UpCheek_In_SkinJnt.pim" "R_UpCheek_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_UpCheek_In_SkinJnt.rp" "R_UpCheek_In_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_UpCheek_In_SkinJnt.rpt" "R_UpCheek_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_UpCheek_In_Loc.t" "R_UpCheek_In_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_UpCheek_In_Loc.rp" "R_UpCheek_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_UpCheek_In_Loc.rpt" "R_UpCheek_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_UpCheek_In_Loc.pm" "R_UpCheek_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_UpCheek_In_SkinJnt_pointConstraint1.w0" "R_UpCheek_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_UpCheek_In_SkinJnt.ro" "R_UpCheek_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_UpCheek_In_SkinJnt.pim" "R_UpCheek_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_UpCheek_In_SkinJnt.jo" "R_UpCheek_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_UpCheek_In_SkinJnt.is" "R_UpCheek_In_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_UpCheek_In_Loc.r" "R_UpCheek_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_UpCheek_In_Loc.ro" "R_UpCheek_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_UpCheek_In_Loc.pm" "R_UpCheek_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_UpCheek_In_SkinJnt_orientConstraint1.w0" "R_UpCheek_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_UpCheek_Mid_SkinJnt_pointConstraint1.ctx" "R_UpCheek_Mid_SkinJnt.tx"
		;
connectAttr "R_UpCheek_Mid_SkinJnt_pointConstraint1.cty" "R_UpCheek_Mid_SkinJnt.ty"
		;
connectAttr "R_UpCheek_Mid_SkinJnt_pointConstraint1.ctz" "R_UpCheek_Mid_SkinJnt.tz"
		;
connectAttr "R_UpCheek_Mid_SkinJnt_orientConstraint1.crx" "R_UpCheek_Mid_SkinJnt.rx"
		;
connectAttr "R_UpCheek_Mid_SkinJnt_orientConstraint1.cry" "R_UpCheek_Mid_SkinJnt.ry"
		;
connectAttr "R_UpCheek_Mid_SkinJnt_orientConstraint1.crz" "R_UpCheek_Mid_SkinJnt.rz"
		;
connectAttr "R_UpCheek_Mid_SkinJnt.pim" "R_UpCheek_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_UpCheek_Mid_SkinJnt.rp" "R_UpCheek_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_UpCheek_Mid_SkinJnt.rpt" "R_UpCheek_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_UpCheek_Mid_Loc.t" "R_UpCheek_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_UpCheek_Mid_Loc.rp" "R_UpCheek_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_UpCheek_Mid_Loc.rpt" "R_UpCheek_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_UpCheek_Mid_Loc.pm" "R_UpCheek_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_UpCheek_Mid_SkinJnt_pointConstraint1.w0" "R_UpCheek_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_UpCheek_Mid_SkinJnt.ro" "R_UpCheek_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_UpCheek_Mid_SkinJnt.pim" "R_UpCheek_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_UpCheek_Mid_SkinJnt.jo" "R_UpCheek_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_UpCheek_Mid_SkinJnt.is" "R_UpCheek_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_UpCheek_Mid_Loc.r" "R_UpCheek_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_UpCheek_Mid_Loc.ro" "R_UpCheek_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_UpCheek_Mid_Loc.pm" "R_UpCheek_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_UpCheek_Mid_SkinJnt_orientConstraint1.w0" "R_UpCheek_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_UpCheek_Out_SkinJnt_pointConstraint1.ctx" "R_UpCheek_Out_SkinJnt.tx"
		;
connectAttr "R_UpCheek_Out_SkinJnt_pointConstraint1.cty" "R_UpCheek_Out_SkinJnt.ty"
		;
connectAttr "R_UpCheek_Out_SkinJnt_pointConstraint1.ctz" "R_UpCheek_Out_SkinJnt.tz"
		;
connectAttr "R_UpCheek_Out_SkinJnt_orientConstraint1.crx" "R_UpCheek_Out_SkinJnt.rx"
		;
connectAttr "R_UpCheek_Out_SkinJnt_orientConstraint1.cry" "R_UpCheek_Out_SkinJnt.ry"
		;
connectAttr "R_UpCheek_Out_SkinJnt_orientConstraint1.crz" "R_UpCheek_Out_SkinJnt.rz"
		;
connectAttr "R_UpCheek_Out_SkinJnt.pim" "R_UpCheek_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_UpCheek_Out_SkinJnt.rp" "R_UpCheek_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_UpCheek_Out_SkinJnt.rpt" "R_UpCheek_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_UpCheek_Out_Loc.t" "R_UpCheek_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_UpCheek_Out_Loc.rp" "R_UpCheek_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_UpCheek_Out_Loc.rpt" "R_UpCheek_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_UpCheek_Out_Loc.pm" "R_UpCheek_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_UpCheek_Out_SkinJnt_pointConstraint1.w0" "R_UpCheek_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_UpCheek_Out_SkinJnt.ro" "R_UpCheek_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_UpCheek_Out_SkinJnt.pim" "R_UpCheek_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_UpCheek_Out_SkinJnt.jo" "R_UpCheek_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_UpCheek_Out_SkinJnt.is" "R_UpCheek_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_UpCheek_Out_Loc.r" "R_UpCheek_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_UpCheek_Out_Loc.ro" "R_UpCheek_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_UpCheek_Out_Loc.pm" "R_UpCheek_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_UpCheek_Out_SkinJnt_orientConstraint1.w0" "R_UpCheek_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_MidCheek_In_SkinJnt_pointConstraint1.ctx" "R_MidCheek_In_SkinJnt.tx"
		;
connectAttr "R_MidCheek_In_SkinJnt_pointConstraint1.cty" "R_MidCheek_In_SkinJnt.ty"
		;
connectAttr "R_MidCheek_In_SkinJnt_pointConstraint1.ctz" "R_MidCheek_In_SkinJnt.tz"
		;
connectAttr "R_MidCheek_In_SkinJnt_orientConstraint1.crx" "R_MidCheek_In_SkinJnt.rx"
		;
connectAttr "R_MidCheek_In_SkinJnt_orientConstraint1.cry" "R_MidCheek_In_SkinJnt.ry"
		;
connectAttr "R_MidCheek_In_SkinJnt_orientConstraint1.crz" "R_MidCheek_In_SkinJnt.rz"
		;
connectAttr "R_MidCheek_In_SkinJnt.pim" "R_MidCheek_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_MidCheek_In_SkinJnt.rp" "R_MidCheek_In_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_MidCheek_In_SkinJnt.rpt" "R_MidCheek_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_MidCheek_In_Loc.t" "R_MidCheek_In_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_MidCheek_In_Loc.rp" "R_MidCheek_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_MidCheek_In_Loc.rpt" "R_MidCheek_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_MidCheek_In_Loc.pm" "R_MidCheek_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_MidCheek_In_SkinJnt_pointConstraint1.w0" "R_MidCheek_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_MidCheek_In_SkinJnt.ro" "R_MidCheek_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_MidCheek_In_SkinJnt.pim" "R_MidCheek_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_MidCheek_In_SkinJnt.jo" "R_MidCheek_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_MidCheek_In_SkinJnt.is" "R_MidCheek_In_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_MidCheek_In_Loc.r" "R_MidCheek_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_MidCheek_In_Loc.ro" "R_MidCheek_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_MidCheek_In_Loc.pm" "R_MidCheek_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_MidCheek_In_SkinJnt_orientConstraint1.w0" "R_MidCheek_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_MidCheek_Mid_SkinJnt_pointConstraint1.ctx" "R_MidCheek_Mid_SkinJnt.tx"
		;
connectAttr "R_MidCheek_Mid_SkinJnt_pointConstraint1.cty" "R_MidCheek_Mid_SkinJnt.ty"
		;
connectAttr "R_MidCheek_Mid_SkinJnt_pointConstraint1.ctz" "R_MidCheek_Mid_SkinJnt.tz"
		;
connectAttr "R_MidCheek_Mid_SkinJnt_orientConstraint1.crx" "R_MidCheek_Mid_SkinJnt.rx"
		;
connectAttr "R_MidCheek_Mid_SkinJnt_orientConstraint1.cry" "R_MidCheek_Mid_SkinJnt.ry"
		;
connectAttr "R_MidCheek_Mid_SkinJnt_orientConstraint1.crz" "R_MidCheek_Mid_SkinJnt.rz"
		;
connectAttr "R_MidCheek_Mid_SkinJnt.pim" "R_MidCheek_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_MidCheek_Mid_SkinJnt.rp" "R_MidCheek_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_MidCheek_Mid_SkinJnt.rpt" "R_MidCheek_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_MidCheek_Mid_Loc.t" "R_MidCheek_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_MidCheek_Mid_Loc.rp" "R_MidCheek_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_MidCheek_Mid_Loc.rpt" "R_MidCheek_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_MidCheek_Mid_Loc.pm" "R_MidCheek_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_MidCheek_Mid_SkinJnt_pointConstraint1.w0" "R_MidCheek_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_MidCheek_Mid_SkinJnt.ro" "R_MidCheek_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_MidCheek_Mid_SkinJnt.pim" "R_MidCheek_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_MidCheek_Mid_SkinJnt.jo" "R_MidCheek_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_MidCheek_Mid_SkinJnt.is" "R_MidCheek_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_MidCheek_Mid_Loc.r" "R_MidCheek_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_MidCheek_Mid_Loc.ro" "R_MidCheek_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_MidCheek_Mid_Loc.pm" "R_MidCheek_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_MidCheek_Mid_SkinJnt_orientConstraint1.w0" "R_MidCheek_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_MidCheek_Out_SkinJnt_pointConstraint1.ctx" "R_MidCheek_Out_SkinJnt.tx"
		;
connectAttr "R_MidCheek_Out_SkinJnt_pointConstraint1.cty" "R_MidCheek_Out_SkinJnt.ty"
		;
connectAttr "R_MidCheek_Out_SkinJnt_pointConstraint1.ctz" "R_MidCheek_Out_SkinJnt.tz"
		;
connectAttr "R_MidCheek_Out_SkinJnt_orientConstraint1.crx" "R_MidCheek_Out_SkinJnt.rx"
		;
connectAttr "R_MidCheek_Out_SkinJnt_orientConstraint1.cry" "R_MidCheek_Out_SkinJnt.ry"
		;
connectAttr "R_MidCheek_Out_SkinJnt_orientConstraint1.crz" "R_MidCheek_Out_SkinJnt.rz"
		;
connectAttr "R_MidCheek_Out_SkinJnt.pim" "R_MidCheek_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_MidCheek_Out_SkinJnt.rp" "R_MidCheek_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_MidCheek_Out_SkinJnt.rpt" "R_MidCheek_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_MidCheek_Out_Loc.t" "R_MidCheek_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_MidCheek_Out_Loc.rp" "R_MidCheek_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_MidCheek_Out_Loc.rpt" "R_MidCheek_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_MidCheek_Out_Loc.pm" "R_MidCheek_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_MidCheek_Out_SkinJnt_pointConstraint1.w0" "R_MidCheek_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_MidCheek_Out_SkinJnt.ro" "R_MidCheek_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_MidCheek_Out_SkinJnt.pim" "R_MidCheek_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_MidCheek_Out_SkinJnt.jo" "R_MidCheek_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_MidCheek_Out_SkinJnt.is" "R_MidCheek_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_MidCheek_Out_Loc.r" "R_MidCheek_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_MidCheek_Out_Loc.ro" "R_MidCheek_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_MidCheek_Out_Loc.pm" "R_MidCheek_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_MidCheek_Out_SkinJnt_orientConstraint1.w0" "R_MidCheek_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_DownCheek_In_SkinJnt_pointConstraint1.ctx" "R_DownCheek_In_SkinJnt.tx"
		;
connectAttr "R_DownCheek_In_SkinJnt_pointConstraint1.cty" "R_DownCheek_In_SkinJnt.ty"
		;
connectAttr "R_DownCheek_In_SkinJnt_pointConstraint1.ctz" "R_DownCheek_In_SkinJnt.tz"
		;
connectAttr "R_DownCheek_In_SkinJnt_orientConstraint1.crx" "R_DownCheek_In_SkinJnt.rx"
		;
connectAttr "R_DownCheek_In_SkinJnt_orientConstraint1.cry" "R_DownCheek_In_SkinJnt.ry"
		;
connectAttr "R_DownCheek_In_SkinJnt_orientConstraint1.crz" "R_DownCheek_In_SkinJnt.rz"
		;
connectAttr "R_DownCheek_In_SkinJnt.pim" "R_DownCheek_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_DownCheek_In_SkinJnt.rp" "R_DownCheek_In_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_DownCheek_In_SkinJnt.rpt" "R_DownCheek_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_DownCheek_In_Loc.t" "R_DownCheek_In_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_DownCheek_In_Loc.rp" "R_DownCheek_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_DownCheek_In_Loc.rpt" "R_DownCheek_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_DownCheek_In_Loc.pm" "R_DownCheek_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_DownCheek_In_SkinJnt_pointConstraint1.w0" "R_DownCheek_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_DownCheek_In_SkinJnt.ro" "R_DownCheek_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_DownCheek_In_SkinJnt.pim" "R_DownCheek_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_DownCheek_In_SkinJnt.jo" "R_DownCheek_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_DownCheek_In_SkinJnt.is" "R_DownCheek_In_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_DownCheek_In_Loc.r" "R_DownCheek_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_DownCheek_In_Loc.ro" "R_DownCheek_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_DownCheek_In_Loc.pm" "R_DownCheek_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_DownCheek_In_SkinJnt_orientConstraint1.w0" "R_DownCheek_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_DownCheek_Mid_SkinJnt_pointConstraint1.ctx" "R_DownCheek_Mid_SkinJnt.tx"
		;
connectAttr "R_DownCheek_Mid_SkinJnt_pointConstraint1.cty" "R_DownCheek_Mid_SkinJnt.ty"
		;
connectAttr "R_DownCheek_Mid_SkinJnt_pointConstraint1.ctz" "R_DownCheek_Mid_SkinJnt.tz"
		;
connectAttr "R_DownCheek_Mid_SkinJnt_orientConstraint1.crx" "R_DownCheek_Mid_SkinJnt.rx"
		;
connectAttr "R_DownCheek_Mid_SkinJnt_orientConstraint1.cry" "R_DownCheek_Mid_SkinJnt.ry"
		;
connectAttr "R_DownCheek_Mid_SkinJnt_orientConstraint1.crz" "R_DownCheek_Mid_SkinJnt.rz"
		;
connectAttr "R_DownCheek_Mid_SkinJnt.pim" "R_DownCheek_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_DownCheek_Mid_SkinJnt.rp" "R_DownCheek_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_DownCheek_Mid_SkinJnt.rpt" "R_DownCheek_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_DownCheek_Mid_Loc.t" "R_DownCheek_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_DownCheek_Mid_Loc.rp" "R_DownCheek_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_DownCheek_Mid_Loc.rpt" "R_DownCheek_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_DownCheek_Mid_Loc.pm" "R_DownCheek_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_DownCheek_Mid_SkinJnt_pointConstraint1.w0" "R_DownCheek_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_DownCheek_Mid_SkinJnt.ro" "R_DownCheek_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_DownCheek_Mid_SkinJnt.pim" "R_DownCheek_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_DownCheek_Mid_SkinJnt.jo" "R_DownCheek_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_DownCheek_Mid_SkinJnt.is" "R_DownCheek_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_DownCheek_Mid_Loc.r" "R_DownCheek_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_DownCheek_Mid_Loc.ro" "R_DownCheek_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_DownCheek_Mid_Loc.pm" "R_DownCheek_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_DownCheek_Mid_SkinJnt_orientConstraint1.w0" "R_DownCheek_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_DownCheek_Out_SkinJnt_pointConstraint1.ctx" "R_DownCheek_Out_SkinJnt.tx"
		;
connectAttr "R_DownCheek_Out_SkinJnt_pointConstraint1.cty" "R_DownCheek_Out_SkinJnt.ty"
		;
connectAttr "R_DownCheek_Out_SkinJnt_pointConstraint1.ctz" "R_DownCheek_Out_SkinJnt.tz"
		;
connectAttr "R_DownCheek_Out_SkinJnt_orientConstraint1.crx" "R_DownCheek_Out_SkinJnt.rx"
		;
connectAttr "R_DownCheek_Out_SkinJnt_orientConstraint1.cry" "R_DownCheek_Out_SkinJnt.ry"
		;
connectAttr "R_DownCheek_Out_SkinJnt_orientConstraint1.crz" "R_DownCheek_Out_SkinJnt.rz"
		;
connectAttr "R_DownCheek_Out_SkinJnt.pim" "R_DownCheek_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_DownCheek_Out_SkinJnt.rp" "R_DownCheek_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_DownCheek_Out_SkinJnt.rpt" "R_DownCheek_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_DownCheek_Out_Loc.t" "R_DownCheek_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_DownCheek_Out_Loc.rp" "R_DownCheek_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_DownCheek_Out_Loc.rpt" "R_DownCheek_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_DownCheek_Out_Loc.pm" "R_DownCheek_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_DownCheek_Out_SkinJnt_pointConstraint1.w0" "R_DownCheek_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_DownCheek_Out_SkinJnt.ro" "R_DownCheek_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_DownCheek_Out_SkinJnt.pim" "R_DownCheek_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_DownCheek_Out_SkinJnt.jo" "R_DownCheek_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_DownCheek_Out_SkinJnt.is" "R_DownCheek_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_DownCheek_Out_Loc.r" "R_DownCheek_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_DownCheek_Out_Loc.ro" "R_DownCheek_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_DownCheek_Out_Loc.pm" "R_DownCheek_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_DownCheek_Out_SkinJnt_orientConstraint1.w0" "R_DownCheek_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_UpLip_Mid_SkinJnt_pointConstraint1.ctx" "R_UpLip_Mid_SkinJnt.tx";
connectAttr "R_UpLip_Mid_SkinJnt_pointConstraint1.cty" "R_UpLip_Mid_SkinJnt.ty";
connectAttr "R_UpLip_Mid_SkinJnt_pointConstraint1.ctz" "R_UpLip_Mid_SkinJnt.tz";
connectAttr "R_UpLip_Mid_SkinJnt_orientConstraint1.crx" "R_UpLip_Mid_SkinJnt.rx"
		;
connectAttr "R_UpLip_Mid_SkinJnt_orientConstraint1.cry" "R_UpLip_Mid_SkinJnt.ry"
		;
connectAttr "R_UpLip_Mid_SkinJnt_orientConstraint1.crz" "R_UpLip_Mid_SkinJnt.rz"
		;
connectAttr "R_UpLip_Mid_SkinJnt.pim" "R_UpLip_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_UpLip_Mid_SkinJnt.rp" "R_UpLip_Mid_SkinJnt_pointConstraint1.crp";
connectAttr "R_UpLip_Mid_SkinJnt.rpt" "R_UpLip_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_UpLip_Mid_Loc.t" "R_UpLip_Mid_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "R_UpLip_Mid_Loc.rp" "R_UpLip_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_UpLip_Mid_Loc.rpt" "R_UpLip_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_UpLip_Mid_Loc.pm" "R_UpLip_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_UpLip_Mid_SkinJnt_pointConstraint1.w0" "R_UpLip_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_UpLip_Mid_SkinJnt.ro" "R_UpLip_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_UpLip_Mid_SkinJnt.pim" "R_UpLip_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_UpLip_Mid_SkinJnt.jo" "R_UpLip_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_UpLip_Mid_SkinJnt.is" "R_UpLip_Mid_SkinJnt_orientConstraint1.is";
connectAttr "R_UpLip_Mid_Loc.r" "R_UpLip_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_UpLip_Mid_Loc.ro" "R_UpLip_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_UpLip_Mid_Loc.pm" "R_UpLip_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_UpLip_Mid_SkinJnt_orientConstraint1.w0" "R_UpLip_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_UpLip_Out_SkinJnt_pointConstraint1.ctx" "R_UpLip_Out_SkinJnt.tx";
connectAttr "R_UpLip_Out_SkinJnt_pointConstraint1.cty" "R_UpLip_Out_SkinJnt.ty";
connectAttr "R_UpLip_Out_SkinJnt_pointConstraint1.ctz" "R_UpLip_Out_SkinJnt.tz";
connectAttr "R_UpLip_Out_SkinJnt_orientConstraint1.crx" "R_UpLip_Out_SkinJnt.rx"
		;
connectAttr "R_UpLip_Out_SkinJnt_orientConstraint1.cry" "R_UpLip_Out_SkinJnt.ry"
		;
connectAttr "R_UpLip_Out_SkinJnt_orientConstraint1.crz" "R_UpLip_Out_SkinJnt.rz"
		;
connectAttr "R_UpLip_Out_SkinJnt.pim" "R_UpLip_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_UpLip_Out_SkinJnt.rp" "R_UpLip_Out_SkinJnt_pointConstraint1.crp";
connectAttr "R_UpLip_Out_SkinJnt.rpt" "R_UpLip_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_UpLip_Out_Loc.t" "R_UpLip_Out_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "R_UpLip_Out_Loc.rp" "R_UpLip_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_UpLip_Out_Loc.rpt" "R_UpLip_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_UpLip_Out_Loc.pm" "R_UpLip_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_UpLip_Out_SkinJnt_pointConstraint1.w0" "R_UpLip_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_UpLip_Out_SkinJnt.ro" "R_UpLip_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_UpLip_Out_SkinJnt.pim" "R_UpLip_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_UpLip_Out_SkinJnt.jo" "R_UpLip_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_UpLip_Out_SkinJnt.is" "R_UpLip_Out_SkinJnt_orientConstraint1.is";
connectAttr "R_UpLip_Out_Loc.r" "R_UpLip_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_UpLip_Out_Loc.ro" "R_UpLip_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_UpLip_Out_Loc.pm" "R_UpLip_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_UpLip_Out_SkinJnt_orientConstraint1.w0" "R_UpLip_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_DownLip_Mid_SkinJnt_pointConstraint1.ctx" "R_DownLip_Mid_SkinJnt.tx"
		;
connectAttr "R_DownLip_Mid_SkinJnt_pointConstraint1.cty" "R_DownLip_Mid_SkinJnt.ty"
		;
connectAttr "R_DownLip_Mid_SkinJnt_pointConstraint1.ctz" "R_DownLip_Mid_SkinJnt.tz"
		;
connectAttr "R_DownLip_Mid_SkinJnt_orientConstraint1.crx" "R_DownLip_Mid_SkinJnt.rx"
		;
connectAttr "R_DownLip_Mid_SkinJnt_orientConstraint1.cry" "R_DownLip_Mid_SkinJnt.ry"
		;
connectAttr "R_DownLip_Mid_SkinJnt_orientConstraint1.crz" "R_DownLip_Mid_SkinJnt.rz"
		;
connectAttr "R_DownLip_Mid_SkinJnt.pim" "R_DownLip_Mid_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_DownLip_Mid_SkinJnt.rp" "R_DownLip_Mid_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_DownLip_Mid_SkinJnt.rpt" "R_DownLip_Mid_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_DownLip_Mid_Loc.t" "R_DownLip_Mid_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_DownLip_Mid_Loc.rp" "R_DownLip_Mid_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_DownLip_Mid_Loc.rpt" "R_DownLip_Mid_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_DownLip_Mid_Loc.pm" "R_DownLip_Mid_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_DownLip_Mid_SkinJnt_pointConstraint1.w0" "R_DownLip_Mid_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_DownLip_Mid_SkinJnt.ro" "R_DownLip_Mid_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_DownLip_Mid_SkinJnt.pim" "R_DownLip_Mid_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_DownLip_Mid_SkinJnt.jo" "R_DownLip_Mid_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_DownLip_Mid_SkinJnt.is" "R_DownLip_Mid_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_DownLip_Mid_Loc.r" "R_DownLip_Mid_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_DownLip_Mid_Loc.ro" "R_DownLip_Mid_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_DownLip_Mid_Loc.pm" "R_DownLip_Mid_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_DownLip_Mid_SkinJnt_orientConstraint1.w0" "R_DownLip_Mid_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_DownLip_Out_SkinJnt_pointConstraint1.ctx" "R_DownLip_Out_SkinJnt.tx"
		;
connectAttr "R_DownLip_Out_SkinJnt_pointConstraint1.cty" "R_DownLip_Out_SkinJnt.ty"
		;
connectAttr "R_DownLip_Out_SkinJnt_pointConstraint1.ctz" "R_DownLip_Out_SkinJnt.tz"
		;
connectAttr "R_DownLip_Out_SkinJnt_orientConstraint1.crx" "R_DownLip_Out_SkinJnt.rx"
		;
connectAttr "R_DownLip_Out_SkinJnt_orientConstraint1.cry" "R_DownLip_Out_SkinJnt.ry"
		;
connectAttr "R_DownLip_Out_SkinJnt_orientConstraint1.crz" "R_DownLip_Out_SkinJnt.rz"
		;
connectAttr "R_DownLip_Out_SkinJnt.pim" "R_DownLip_Out_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_DownLip_Out_SkinJnt.rp" "R_DownLip_Out_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_DownLip_Out_SkinJnt.rpt" "R_DownLip_Out_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_DownLip_Out_Loc.t" "R_DownLip_Out_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_DownLip_Out_Loc.rp" "R_DownLip_Out_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_DownLip_Out_Loc.rpt" "R_DownLip_Out_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_DownLip_Out_Loc.pm" "R_DownLip_Out_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_DownLip_Out_SkinJnt_pointConstraint1.w0" "R_DownLip_Out_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_DownLip_Out_SkinJnt.ro" "R_DownLip_Out_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_DownLip_Out_SkinJnt.pim" "R_DownLip_Out_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_DownLip_Out_SkinJnt.jo" "R_DownLip_Out_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_DownLip_Out_SkinJnt.is" "R_DownLip_Out_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_DownLip_Out_Loc.r" "R_DownLip_Out_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_DownLip_Out_Loc.ro" "R_DownLip_Out_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_DownLip_Out_Loc.pm" "R_DownLip_Out_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_DownLip_Out_SkinJnt_orientConstraint1.w0" "R_DownLip_Out_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_BottomCheek_In_SkinJnt_pointConstraint1.ctx" "R_BottomCheek_In_SkinJnt.tx"
		;
connectAttr "R_BottomCheek_In_SkinJnt_pointConstraint1.cty" "R_BottomCheek_In_SkinJnt.ty"
		;
connectAttr "R_BottomCheek_In_SkinJnt_pointConstraint1.ctz" "R_BottomCheek_In_SkinJnt.tz"
		;
connectAttr "R_BottomCheek_In_SkinJnt_orientConstraint1.crx" "R_BottomCheek_In_SkinJnt.rx"
		;
connectAttr "R_BottomCheek_In_SkinJnt_orientConstraint1.cry" "R_BottomCheek_In_SkinJnt.ry"
		;
connectAttr "R_BottomCheek_In_SkinJnt_orientConstraint1.crz" "R_BottomCheek_In_SkinJnt.rz"
		;
connectAttr "R_BottomCheek_In_SkinJnt.pim" "R_BottomCheek_In_SkinJnt_pointConstraint1.cpim"
		;
connectAttr "R_BottomCheek_In_SkinJnt.rp" "R_BottomCheek_In_SkinJnt_pointConstraint1.crp"
		;
connectAttr "R_BottomCheek_In_SkinJnt.rpt" "R_BottomCheek_In_SkinJnt_pointConstraint1.crt"
		;
connectAttr "R_BottomCheek_In_Loc.t" "R_BottomCheek_In_SkinJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_BottomCheek_In_Loc.rp" "R_BottomCheek_In_SkinJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_BottomCheek_In_Loc.rpt" "R_BottomCheek_In_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_BottomCheek_In_Loc.pm" "R_BottomCheek_In_SkinJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_BottomCheek_In_SkinJnt_pointConstraint1.w0" "R_BottomCheek_In_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_BottomCheek_In_SkinJnt.ro" "R_BottomCheek_In_SkinJnt_orientConstraint1.cro"
		;
connectAttr "R_BottomCheek_In_SkinJnt.pim" "R_BottomCheek_In_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "R_BottomCheek_In_SkinJnt.jo" "R_BottomCheek_In_SkinJnt_orientConstraint1.cjo"
		;
connectAttr "R_BottomCheek_In_SkinJnt.is" "R_BottomCheek_In_SkinJnt_orientConstraint1.is"
		;
connectAttr "R_BottomCheek_In_Loc.r" "R_BottomCheek_In_SkinJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_BottomCheek_In_Loc.ro" "R_BottomCheek_In_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_BottomCheek_In_Loc.pm" "R_BottomCheek_In_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_BottomCheek_In_SkinJnt_orientConstraint1.w0" "R_BottomCheek_In_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_Temple_SkinJnt_pointConstraint1.ctx" "R_Temple_SkinJnt.tx";
connectAttr "R_Temple_SkinJnt_pointConstraint1.cty" "R_Temple_SkinJnt.ty";
connectAttr "R_Temple_SkinJnt_pointConstraint1.ctz" "R_Temple_SkinJnt.tz";
connectAttr "R_Temple_SkinJnt_orientConstraint1.crx" "R_Temple_SkinJnt.rx";
connectAttr "R_Temple_SkinJnt_orientConstraint1.cry" "R_Temple_SkinJnt.ry";
connectAttr "R_Temple_SkinJnt_orientConstraint1.crz" "R_Temple_SkinJnt.rz";
connectAttr "R_Temple_SkinJnt.pim" "R_Temple_SkinJnt_pointConstraint1.cpim";
connectAttr "R_Temple_SkinJnt.rp" "R_Temple_SkinJnt_pointConstraint1.crp";
connectAttr "R_Temple_SkinJnt.rpt" "R_Temple_SkinJnt_pointConstraint1.crt";
connectAttr "R_Temple_Loc.t" "R_Temple_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "R_Temple_Loc.rp" "R_Temple_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "R_Temple_Loc.rpt" "R_Temple_SkinJnt_pointConstraint1.tg[0].trt";
connectAttr "R_Temple_Loc.pm" "R_Temple_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "R_Temple_SkinJnt_pointConstraint1.w0" "R_Temple_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_Temple_SkinJnt.ro" "R_Temple_SkinJnt_orientConstraint1.cro";
connectAttr "R_Temple_SkinJnt.pim" "R_Temple_SkinJnt_orientConstraint1.cpim";
connectAttr "R_Temple_SkinJnt.jo" "R_Temple_SkinJnt_orientConstraint1.cjo";
connectAttr "R_Temple_SkinJnt.is" "R_Temple_SkinJnt_orientConstraint1.is";
connectAttr "R_Temple_Loc.r" "R_Temple_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "R_Temple_Loc.ro" "R_Temple_SkinJnt_orientConstraint1.tg[0].tro";
connectAttr "R_Temple_Loc.pm" "R_Temple_SkinJnt_orientConstraint1.tg[0].tpm";
connectAttr "R_Temple_SkinJnt_orientConstraint1.w0" "R_Temple_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "C_Throut_SkinJnt_pointConstraint1.ctx" "C_Throut_SkinJnt.tx";
connectAttr "C_Throut_SkinJnt_pointConstraint1.cty" "C_Throut_SkinJnt.ty";
connectAttr "C_Throut_SkinJnt_pointConstraint1.ctz" "C_Throut_SkinJnt.tz";
connectAttr "C_Throut_SkinJnt_orientConstraint1.crx" "C_Throut_SkinJnt.rx";
connectAttr "C_Throut_SkinJnt_orientConstraint1.cry" "C_Throut_SkinJnt.ry";
connectAttr "C_Throut_SkinJnt_orientConstraint1.crz" "C_Throut_SkinJnt.rz";
connectAttr "C_Throut_SkinJnt.pim" "C_Throut_SkinJnt_pointConstraint1.cpim";
connectAttr "C_Throut_SkinJnt.rp" "C_Throut_SkinJnt_pointConstraint1.crp";
connectAttr "C_Throut_SkinJnt.rpt" "C_Throut_SkinJnt_pointConstraint1.crt";
connectAttr "C_Throut_Loc.t" "C_Throut_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "C_Throut_Loc.rp" "C_Throut_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "C_Throut_Loc.rpt" "C_Throut_SkinJnt_pointConstraint1.tg[0].trt";
connectAttr "C_Throut_Loc.pm" "C_Throut_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "C_Throut_SkinJnt_pointConstraint1.w0" "C_Throut_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "C_Throut_SkinJnt.ro" "C_Throut_SkinJnt_orientConstraint1.cro";
connectAttr "C_Throut_SkinJnt.pim" "C_Throut_SkinJnt_orientConstraint1.cpim";
connectAttr "C_Throut_SkinJnt.jo" "C_Throut_SkinJnt_orientConstraint1.cjo";
connectAttr "C_Throut_SkinJnt.is" "C_Throut_SkinJnt_orientConstraint1.is";
connectAttr "C_Throut_Loc.r" "C_Throut_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "C_Throut_Loc.ro" "C_Throut_SkinJnt_orientConstraint1.tg[0].tro";
connectAttr "C_Throut_Loc.pm" "C_Throut_SkinJnt_orientConstraint1.tg[0].tpm";
connectAttr "C_Throut_SkinJnt_orientConstraint1.w0" "C_Throut_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "C_DownChin_SkinJnt_pointConstraint1.ctx" "C_DownChin_SkinJnt.tx";
connectAttr "C_DownChin_SkinJnt_pointConstraint1.cty" "C_DownChin_SkinJnt.ty";
connectAttr "C_DownChin_SkinJnt_pointConstraint1.ctz" "C_DownChin_SkinJnt.tz";
connectAttr "C_DownChin_SkinJnt_orientConstraint1.crx" "C_DownChin_SkinJnt.rx";
connectAttr "C_DownChin_SkinJnt_orientConstraint1.cry" "C_DownChin_SkinJnt.ry";
connectAttr "C_DownChin_SkinJnt_orientConstraint1.crz" "C_DownChin_SkinJnt.rz";
connectAttr "C_DownChin_SkinJnt.pim" "C_DownChin_SkinJnt_pointConstraint1.cpim";
connectAttr "C_DownChin_SkinJnt.rp" "C_DownChin_SkinJnt_pointConstraint1.crp";
connectAttr "C_DownChin_SkinJnt.rpt" "C_DownChin_SkinJnt_pointConstraint1.crt";
connectAttr "C_DownChin_Loc.t" "C_DownChin_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "C_DownChin_Loc.rp" "C_DownChin_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "C_DownChin_Loc.rpt" "C_DownChin_SkinJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "C_DownChin_Loc.pm" "C_DownChin_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "C_DownChin_SkinJnt_pointConstraint1.w0" "C_DownChin_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "C_DownChin_SkinJnt.ro" "C_DownChin_SkinJnt_orientConstraint1.cro";
connectAttr "C_DownChin_SkinJnt.pim" "C_DownChin_SkinJnt_orientConstraint1.cpim"
		;
connectAttr "C_DownChin_SkinJnt.jo" "C_DownChin_SkinJnt_orientConstraint1.cjo";
connectAttr "C_DownChin_SkinJnt.is" "C_DownChin_SkinJnt_orientConstraint1.is";
connectAttr "C_DownChin_Loc.r" "C_DownChin_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "C_DownChin_Loc.ro" "C_DownChin_SkinJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "C_DownChin_Loc.pm" "C_DownChin_SkinJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "C_DownChin_SkinJnt_orientConstraint1.w0" "C_DownChin_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "C_UpChin_SkinJnt_pointConstraint1.ctx" "C_UpChin_SkinJnt.tx";
connectAttr "C_UpChin_SkinJnt_pointConstraint1.cty" "C_UpChin_SkinJnt.ty";
connectAttr "C_UpChin_SkinJnt_pointConstraint1.ctz" "C_UpChin_SkinJnt.tz";
connectAttr "C_UpChin_SkinJnt_orientConstraint1.crx" "C_UpChin_SkinJnt.rx";
connectAttr "C_UpChin_SkinJnt_orientConstraint1.cry" "C_UpChin_SkinJnt.ry";
connectAttr "C_UpChin_SkinJnt_orientConstraint1.crz" "C_UpChin_SkinJnt.rz";
connectAttr "C_UpChin_SkinJnt.pim" "C_UpChin_SkinJnt_pointConstraint1.cpim";
connectAttr "C_UpChin_SkinJnt.rp" "C_UpChin_SkinJnt_pointConstraint1.crp";
connectAttr "C_UpChin_SkinJnt.rpt" "C_UpChin_SkinJnt_pointConstraint1.crt";
connectAttr "C_UpChin_Loc.t" "C_UpChin_SkinJnt_pointConstraint1.tg[0].tt";
connectAttr "C_UpChin_Loc.rp" "C_UpChin_SkinJnt_pointConstraint1.tg[0].trp";
connectAttr "C_UpChin_Loc.rpt" "C_UpChin_SkinJnt_pointConstraint1.tg[0].trt";
connectAttr "C_UpChin_Loc.pm" "C_UpChin_SkinJnt_pointConstraint1.tg[0].tpm";
connectAttr "C_UpChin_SkinJnt_pointConstraint1.w0" "C_UpChin_SkinJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "C_UpChin_SkinJnt.ro" "C_UpChin_SkinJnt_orientConstraint1.cro";
connectAttr "C_UpChin_SkinJnt.pim" "C_UpChin_SkinJnt_orientConstraint1.cpim";
connectAttr "C_UpChin_SkinJnt.jo" "C_UpChin_SkinJnt_orientConstraint1.cjo";
connectAttr "C_UpChin_SkinJnt.is" "C_UpChin_SkinJnt_orientConstraint1.is";
connectAttr "C_UpChin_Loc.r" "C_UpChin_SkinJnt_orientConstraint1.tg[0].tr";
connectAttr "C_UpChin_Loc.ro" "C_UpChin_SkinJnt_orientConstraint1.tg[0].tro";
connectAttr "C_UpChin_Loc.pm" "C_UpChin_SkinJnt_orientConstraint1.tg[0].tpm";
connectAttr "C_UpChin_SkinJnt_orientConstraint1.w0" "C_UpChin_SkinJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_EyeLid_InCorner_ParJnt_pointConstraint1.ctx" "L_EyeLid_InCorner_ParJnt.tx"
		;
connectAttr "L_EyeLid_InCorner_ParJnt_pointConstraint1.cty" "L_EyeLid_InCorner_ParJnt.ty"
		;
connectAttr "L_EyeLid_InCorner_ParJnt_pointConstraint1.ctz" "L_EyeLid_InCorner_ParJnt.tz"
		;
connectAttr "L_EyeLid_InCorner_ParJnt_orientConstraint1.crx" "L_EyeLid_InCorner_ParJnt.rx"
		;
connectAttr "L_EyeLid_InCorner_ParJnt_orientConstraint1.cry" "L_EyeLid_InCorner_ParJnt.ry"
		;
connectAttr "L_EyeLid_InCorner_ParJnt_orientConstraint1.crz" "L_EyeLid_InCorner_ParJnt.rz"
		;
connectAttr "L_EyeLid_InCorner_ParJnt.s" "L_EyeLid_InCorner_SkinJnt.is";
connectAttr "L_EyeLid_InCorner_ParJnt.pim" "L_EyeLid_InCorner_ParJnt_pointConstraint1.cpim"
		;
connectAttr "L_EyeLid_InCorner_ParJnt.rp" "L_EyeLid_InCorner_ParJnt_pointConstraint1.crp"
		;
connectAttr "L_EyeLid_InCorner_ParJnt.rpt" "L_EyeLid_InCorner_ParJnt_pointConstraint1.crt"
		;
connectAttr "L_EyeLid_InCorner_Loc.t" "L_EyeLid_InCorner_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_EyeLid_InCorner_Loc.rp" "L_EyeLid_InCorner_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_EyeLid_InCorner_Loc.rpt" "L_EyeLid_InCorner_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_EyeLid_InCorner_Loc.pm" "L_EyeLid_InCorner_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_EyeLid_InCorner_ParJnt_pointConstraint1.w0" "L_EyeLid_InCorner_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_EyeLid_InCorner_ParJnt.ro" "L_EyeLid_InCorner_ParJnt_orientConstraint1.cro"
		;
connectAttr "L_EyeLid_InCorner_ParJnt.pim" "L_EyeLid_InCorner_ParJnt_orientConstraint1.cpim"
		;
connectAttr "L_EyeLid_InCorner_ParJnt.jo" "L_EyeLid_InCorner_ParJnt_orientConstraint1.cjo"
		;
connectAttr "L_EyeLid_InCorner_ParJnt.is" "L_EyeLid_InCorner_ParJnt_orientConstraint1.is"
		;
connectAttr "L_EyeLid_InCorner_Loc.r" "L_EyeLid_InCorner_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_EyeLid_InCorner_Loc.ro" "L_EyeLid_InCorner_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_EyeLid_InCorner_Loc.pm" "L_EyeLid_InCorner_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_EyeLid_InCorner_ParJnt_orientConstraint1.w0" "L_EyeLid_InCorner_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt_pointConstraint1.ctx" "L_EyeLid_OutCorner_ParJnt.tx"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt_pointConstraint1.cty" "L_EyeLid_OutCorner_ParJnt.ty"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt_pointConstraint1.ctz" "L_EyeLid_OutCorner_ParJnt.tz"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt_orientConstraint1.crx" "L_EyeLid_OutCorner_ParJnt.rx"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt_orientConstraint1.cry" "L_EyeLid_OutCorner_ParJnt.ry"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt_orientConstraint1.crz" "L_EyeLid_OutCorner_ParJnt.rz"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt.s" "L_EyeLid_OutCorner_SkinJnt.is";
connectAttr "L_EyeLid_OutCorner_ParJnt.pim" "L_EyeLid_OutCorner_ParJnt_pointConstraint1.cpim"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt.rp" "L_EyeLid_OutCorner_ParJnt_pointConstraint1.crp"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt.rpt" "L_EyeLid_OutCorner_ParJnt_pointConstraint1.crt"
		;
connectAttr "L_EyeLid_OutCorner_Loc.t" "L_EyeLid_OutCorner_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_EyeLid_OutCorner_Loc.rp" "L_EyeLid_OutCorner_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_EyeLid_OutCorner_Loc.rpt" "L_EyeLid_OutCorner_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_EyeLid_OutCorner_Loc.pm" "L_EyeLid_OutCorner_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt_pointConstraint1.w0" "L_EyeLid_OutCorner_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt.ro" "L_EyeLid_OutCorner_ParJnt_orientConstraint1.cro"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt.pim" "L_EyeLid_OutCorner_ParJnt_orientConstraint1.cpim"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt.jo" "L_EyeLid_OutCorner_ParJnt_orientConstraint1.cjo"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt.is" "L_EyeLid_OutCorner_ParJnt_orientConstraint1.is"
		;
connectAttr "L_EyeLid_OutCorner_Loc.r" "L_EyeLid_OutCorner_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_EyeLid_OutCorner_Loc.ro" "L_EyeLid_OutCorner_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_EyeLid_OutCorner_Loc.pm" "L_EyeLid_OutCorner_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_EyeLid_OutCorner_ParJnt_orientConstraint1.w0" "L_EyeLid_OutCorner_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_UpEyeLid_In_ParJnt_pointConstraint1.ctx" "L_UpEyeLid_In_ParJnt.tx"
		;
connectAttr "L_UpEyeLid_In_ParJnt_pointConstraint1.cty" "L_UpEyeLid_In_ParJnt.ty"
		;
connectAttr "L_UpEyeLid_In_ParJnt_pointConstraint1.ctz" "L_UpEyeLid_In_ParJnt.tz"
		;
connectAttr "L_UpEyeLid_In_ParJnt_orientConstraint1.crx" "L_UpEyeLid_In_ParJnt.rx"
		;
connectAttr "L_UpEyeLid_In_ParJnt_orientConstraint1.cry" "L_UpEyeLid_In_ParJnt.ry"
		;
connectAttr "L_UpEyeLid_In_ParJnt_orientConstraint1.crz" "L_UpEyeLid_In_ParJnt.rz"
		;
connectAttr "L_UpEyeLid_In_ParJnt.s" "L_UpEyeLid_In_SkinJnt.is";
connectAttr "L_UpEyeLid_In_ParJnt.pim" "L_UpEyeLid_In_ParJnt_pointConstraint1.cpim"
		;
connectAttr "L_UpEyeLid_In_ParJnt.rp" "L_UpEyeLid_In_ParJnt_pointConstraint1.crp"
		;
connectAttr "L_UpEyeLid_In_ParJnt.rpt" "L_UpEyeLid_In_ParJnt_pointConstraint1.crt"
		;
connectAttr "L_UpEyeLid_In_Loc.t" "L_UpEyeLid_In_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_UpEyeLid_In_Loc.rp" "L_UpEyeLid_In_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_UpEyeLid_In_Loc.rpt" "L_UpEyeLid_In_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_UpEyeLid_In_Loc.pm" "L_UpEyeLid_In_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_UpEyeLid_In_ParJnt_pointConstraint1.w0" "L_UpEyeLid_In_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_UpEyeLid_In_ParJnt.ro" "L_UpEyeLid_In_ParJnt_orientConstraint1.cro"
		;
connectAttr "L_UpEyeLid_In_ParJnt.pim" "L_UpEyeLid_In_ParJnt_orientConstraint1.cpim"
		;
connectAttr "L_UpEyeLid_In_ParJnt.jo" "L_UpEyeLid_In_ParJnt_orientConstraint1.cjo"
		;
connectAttr "L_UpEyeLid_In_ParJnt.is" "L_UpEyeLid_In_ParJnt_orientConstraint1.is"
		;
connectAttr "L_UpEyeLid_In_Loc.r" "L_UpEyeLid_In_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_UpEyeLid_In_Loc.ro" "L_UpEyeLid_In_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_UpEyeLid_In_Loc.pm" "L_UpEyeLid_In_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_UpEyeLid_In_ParJnt_orientConstraint1.w0" "L_UpEyeLid_In_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt_pointConstraint1.ctx" "L_UpEyeLid_Mid_ParJnt.tx"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt_pointConstraint1.cty" "L_UpEyeLid_Mid_ParJnt.ty"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt_pointConstraint1.ctz" "L_UpEyeLid_Mid_ParJnt.tz"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt_orientConstraint1.crx" "L_UpEyeLid_Mid_ParJnt.rx"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt_orientConstraint1.cry" "L_UpEyeLid_Mid_ParJnt.ry"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt_orientConstraint1.crz" "L_UpEyeLid_Mid_ParJnt.rz"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt.s" "L_UpEyeLid_Mid_SkinJnt.is";
connectAttr "L_UpEyeLid_Mid_ParJnt.pim" "L_UpEyeLid_Mid_ParJnt_pointConstraint1.cpim"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt.rp" "L_UpEyeLid_Mid_ParJnt_pointConstraint1.crp"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt.rpt" "L_UpEyeLid_Mid_ParJnt_pointConstraint1.crt"
		;
connectAttr "L_UpEyeLid_Mid_Loc.t" "L_UpEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_UpEyeLid_Mid_Loc.rp" "L_UpEyeLid_Mid_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_UpEyeLid_Mid_Loc.rpt" "L_UpEyeLid_Mid_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_UpEyeLid_Mid_Loc.pm" "L_UpEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt_pointConstraint1.w0" "L_UpEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt.ro" "L_UpEyeLid_Mid_ParJnt_orientConstraint1.cro"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt.pim" "L_UpEyeLid_Mid_ParJnt_orientConstraint1.cpim"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt.jo" "L_UpEyeLid_Mid_ParJnt_orientConstraint1.cjo"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt.is" "L_UpEyeLid_Mid_ParJnt_orientConstraint1.is"
		;
connectAttr "L_UpEyeLid_Mid_Loc.r" "L_UpEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_UpEyeLid_Mid_Loc.ro" "L_UpEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_UpEyeLid_Mid_Loc.pm" "L_UpEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_UpEyeLid_Mid_ParJnt_orientConstraint1.w0" "L_UpEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_UpEyeLid_Out_ParJnt_pointConstraint1.ctx" "L_UpEyeLid_Out_ParJnt.tx"
		;
connectAttr "L_UpEyeLid_Out_ParJnt_pointConstraint1.cty" "L_UpEyeLid_Out_ParJnt.ty"
		;
connectAttr "L_UpEyeLid_Out_ParJnt_pointConstraint1.ctz" "L_UpEyeLid_Out_ParJnt.tz"
		;
connectAttr "L_UpEyeLid_Out_ParJnt_orientConstraint1.crx" "L_UpEyeLid_Out_ParJnt.rx"
		;
connectAttr "L_UpEyeLid_Out_ParJnt_orientConstraint1.cry" "L_UpEyeLid_Out_ParJnt.ry"
		;
connectAttr "L_UpEyeLid_Out_ParJnt_orientConstraint1.crz" "L_UpEyeLid_Out_ParJnt.rz"
		;
connectAttr "L_UpEyeLid_Out_ParJnt.s" "L_UpEyeLid_Out_SkinJnt.is";
connectAttr "L_UpEyeLid_Out_ParJnt.pim" "L_UpEyeLid_Out_ParJnt_pointConstraint1.cpim"
		;
connectAttr "L_UpEyeLid_Out_ParJnt.rp" "L_UpEyeLid_Out_ParJnt_pointConstraint1.crp"
		;
connectAttr "L_UpEyeLid_Out_ParJnt.rpt" "L_UpEyeLid_Out_ParJnt_pointConstraint1.crt"
		;
connectAttr "L_UpEyeLid_Out_Loc.t" "L_UpEyeLid_Out_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_UpEyeLid_Out_Loc.rp" "L_UpEyeLid_Out_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_UpEyeLid_Out_Loc.rpt" "L_UpEyeLid_Out_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_UpEyeLid_Out_Loc.pm" "L_UpEyeLid_Out_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_UpEyeLid_Out_ParJnt_pointConstraint1.w0" "L_UpEyeLid_Out_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_UpEyeLid_Out_ParJnt.ro" "L_UpEyeLid_Out_ParJnt_orientConstraint1.cro"
		;
connectAttr "L_UpEyeLid_Out_ParJnt.pim" "L_UpEyeLid_Out_ParJnt_orientConstraint1.cpim"
		;
connectAttr "L_UpEyeLid_Out_ParJnt.jo" "L_UpEyeLid_Out_ParJnt_orientConstraint1.cjo"
		;
connectAttr "L_UpEyeLid_Out_ParJnt.is" "L_UpEyeLid_Out_ParJnt_orientConstraint1.is"
		;
connectAttr "L_UpEyeLid_Out_Loc.r" "L_UpEyeLid_Out_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_UpEyeLid_Out_Loc.ro" "L_UpEyeLid_Out_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_UpEyeLid_Out_Loc.pm" "L_UpEyeLid_Out_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_UpEyeLid_Out_ParJnt_orientConstraint1.w0" "L_UpEyeLid_Out_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_DownEyeLid_In_ParJnt_pointConstraint1.ctx" "L_DownEyeLid_In_ParJnt.tx"
		;
connectAttr "L_DownEyeLid_In_ParJnt_pointConstraint1.cty" "L_DownEyeLid_In_ParJnt.ty"
		;
connectAttr "L_DownEyeLid_In_ParJnt_pointConstraint1.ctz" "L_DownEyeLid_In_ParJnt.tz"
		;
connectAttr "L_DownEyeLid_In_ParJnt_orientConstraint1.crx" "L_DownEyeLid_In_ParJnt.rx"
		;
connectAttr "L_DownEyeLid_In_ParJnt_orientConstraint1.cry" "L_DownEyeLid_In_ParJnt.ry"
		;
connectAttr "L_DownEyeLid_In_ParJnt_orientConstraint1.crz" "L_DownEyeLid_In_ParJnt.rz"
		;
connectAttr "L_DownEyeLid_In_ParJnt.s" "L_DownEyeLid_In_SkinJnt.is";
connectAttr "L_DownEyeLid_In_ParJnt.pim" "L_DownEyeLid_In_ParJnt_pointConstraint1.cpim"
		;
connectAttr "L_DownEyeLid_In_ParJnt.rp" "L_DownEyeLid_In_ParJnt_pointConstraint1.crp"
		;
connectAttr "L_DownEyeLid_In_ParJnt.rpt" "L_DownEyeLid_In_ParJnt_pointConstraint1.crt"
		;
connectAttr "L_DownEyeLid_In_Loc.t" "L_DownEyeLid_In_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_DownEyeLid_In_Loc.rp" "L_DownEyeLid_In_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_DownEyeLid_In_Loc.rpt" "L_DownEyeLid_In_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_DownEyeLid_In_Loc.pm" "L_DownEyeLid_In_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_DownEyeLid_In_ParJnt_pointConstraint1.w0" "L_DownEyeLid_In_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_DownEyeLid_In_ParJnt.ro" "L_DownEyeLid_In_ParJnt_orientConstraint1.cro"
		;
connectAttr "L_DownEyeLid_In_ParJnt.pim" "L_DownEyeLid_In_ParJnt_orientConstraint1.cpim"
		;
connectAttr "L_DownEyeLid_In_ParJnt.jo" "L_DownEyeLid_In_ParJnt_orientConstraint1.cjo"
		;
connectAttr "L_DownEyeLid_In_ParJnt.is" "L_DownEyeLid_In_ParJnt_orientConstraint1.is"
		;
connectAttr "L_DownEyeLid_In_Loc.r" "L_DownEyeLid_In_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_DownEyeLid_In_Loc.ro" "L_DownEyeLid_In_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_DownEyeLid_In_Loc.pm" "L_DownEyeLid_In_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_DownEyeLid_In_ParJnt_orientConstraint1.w0" "L_DownEyeLid_In_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt_pointConstraint1.ctx" "L_DownEyeLid_Mid_ParJnt.tx"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt_pointConstraint1.cty" "L_DownEyeLid_Mid_ParJnt.ty"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt_pointConstraint1.ctz" "L_DownEyeLid_Mid_ParJnt.tz"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt_orientConstraint1.crx" "L_DownEyeLid_Mid_ParJnt.rx"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt_orientConstraint1.cry" "L_DownEyeLid_Mid_ParJnt.ry"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt_orientConstraint1.crz" "L_DownEyeLid_Mid_ParJnt.rz"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt.s" "L_DownEyeLid_Mid_SkinJnt.is";
connectAttr "L_DownEyeLid_Mid_ParJnt.pim" "L_DownEyeLid_Mid_ParJnt_pointConstraint1.cpim"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt.rp" "L_DownEyeLid_Mid_ParJnt_pointConstraint1.crp"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt.rpt" "L_DownEyeLid_Mid_ParJnt_pointConstraint1.crt"
		;
connectAttr "L_DownEyeLid_Mid_Loc.t" "L_DownEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_DownEyeLid_Mid_Loc.rp" "L_DownEyeLid_Mid_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_DownEyeLid_Mid_Loc.rpt" "L_DownEyeLid_Mid_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_DownEyeLid_Mid_Loc.pm" "L_DownEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt_pointConstraint1.w0" "L_DownEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt.ro" "L_DownEyeLid_Mid_ParJnt_orientConstraint1.cro"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt.pim" "L_DownEyeLid_Mid_ParJnt_orientConstraint1.cpim"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt.jo" "L_DownEyeLid_Mid_ParJnt_orientConstraint1.cjo"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt.is" "L_DownEyeLid_Mid_ParJnt_orientConstraint1.is"
		;
connectAttr "L_DownEyeLid_Mid_Loc.r" "L_DownEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_DownEyeLid_Mid_Loc.ro" "L_DownEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_DownEyeLid_Mid_Loc.pm" "L_DownEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_DownEyeLid_Mid_ParJnt_orientConstraint1.w0" "L_DownEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "L_DownEyeLid_Out_ParJnt_pointConstraint1.ctx" "L_DownEyeLid_Out_ParJnt.tx"
		;
connectAttr "L_DownEyeLid_Out_ParJnt_pointConstraint1.cty" "L_DownEyeLid_Out_ParJnt.ty"
		;
connectAttr "L_DownEyeLid_Out_ParJnt_pointConstraint1.ctz" "L_DownEyeLid_Out_ParJnt.tz"
		;
connectAttr "L_DownEyeLid_Out_ParJnt_orientConstraint1.crx" "L_DownEyeLid_Out_ParJnt.rx"
		;
connectAttr "L_DownEyeLid_Out_ParJnt_orientConstraint1.cry" "L_DownEyeLid_Out_ParJnt.ry"
		;
connectAttr "L_DownEyeLid_Out_ParJnt_orientConstraint1.crz" "L_DownEyeLid_Out_ParJnt.rz"
		;
connectAttr "L_DownEyeLid_Out_ParJnt.s" "L_DownEyeLid_Out_SkinJnt.is";
connectAttr "L_DownEyeLid_Out_ParJnt.pim" "L_DownEyeLid_Out_ParJnt_pointConstraint1.cpim"
		;
connectAttr "L_DownEyeLid_Out_ParJnt.rp" "L_DownEyeLid_Out_ParJnt_pointConstraint1.crp"
		;
connectAttr "L_DownEyeLid_Out_ParJnt.rpt" "L_DownEyeLid_Out_ParJnt_pointConstraint1.crt"
		;
connectAttr "L_DownEyeLid_Out_Loc.t" "L_DownEyeLid_Out_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "L_DownEyeLid_Out_Loc.rp" "L_DownEyeLid_Out_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "L_DownEyeLid_Out_Loc.rpt" "L_DownEyeLid_Out_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "L_DownEyeLid_Out_Loc.pm" "L_DownEyeLid_Out_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "L_DownEyeLid_Out_ParJnt_pointConstraint1.w0" "L_DownEyeLid_Out_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "L_DownEyeLid_Out_ParJnt.ro" "L_DownEyeLid_Out_ParJnt_orientConstraint1.cro"
		;
connectAttr "L_DownEyeLid_Out_ParJnt.pim" "L_DownEyeLid_Out_ParJnt_orientConstraint1.cpim"
		;
connectAttr "L_DownEyeLid_Out_ParJnt.jo" "L_DownEyeLid_Out_ParJnt_orientConstraint1.cjo"
		;
connectAttr "L_DownEyeLid_Out_ParJnt.is" "L_DownEyeLid_Out_ParJnt_orientConstraint1.is"
		;
connectAttr "L_DownEyeLid_Out_Loc.r" "L_DownEyeLid_Out_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "L_DownEyeLid_Out_Loc.ro" "L_DownEyeLid_Out_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "L_DownEyeLid_Out_Loc.pm" "L_DownEyeLid_Out_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "L_DownEyeLid_Out_ParJnt_orientConstraint1.w0" "L_DownEyeLid_Out_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_DownEyeLid_Out_ParJnt_pointConstraint1.ctx" "R_DownEyeLid_Out_ParJnt.tx"
		;
connectAttr "R_DownEyeLid_Out_ParJnt_pointConstraint1.cty" "R_DownEyeLid_Out_ParJnt.ty"
		;
connectAttr "R_DownEyeLid_Out_ParJnt_pointConstraint1.ctz" "R_DownEyeLid_Out_ParJnt.tz"
		;
connectAttr "R_DownEyeLid_Out_ParJnt_orientConstraint1.crx" "R_DownEyeLid_Out_ParJnt.rx"
		;
connectAttr "R_DownEyeLid_Out_ParJnt_orientConstraint1.cry" "R_DownEyeLid_Out_ParJnt.ry"
		;
connectAttr "R_DownEyeLid_Out_ParJnt_orientConstraint1.crz" "R_DownEyeLid_Out_ParJnt.rz"
		;
connectAttr "R_DownEyeLid_Out_ParJnt.s" "R_DownEyeLid_Out_SkinJnt.is";
connectAttr "R_DownEyeLid_Out_ParJnt.pim" "R_DownEyeLid_Out_ParJnt_pointConstraint1.cpim"
		;
connectAttr "R_DownEyeLid_Out_ParJnt.rp" "R_DownEyeLid_Out_ParJnt_pointConstraint1.crp"
		;
connectAttr "R_DownEyeLid_Out_ParJnt.rpt" "R_DownEyeLid_Out_ParJnt_pointConstraint1.crt"
		;
connectAttr "R_DownEyeLid_Out_Loc.t" "R_DownEyeLid_Out_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_DownEyeLid_Out_Loc.rp" "R_DownEyeLid_Out_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_DownEyeLid_Out_Loc.rpt" "R_DownEyeLid_Out_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_DownEyeLid_Out_Loc.pm" "R_DownEyeLid_Out_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_DownEyeLid_Out_ParJnt_pointConstraint1.w0" "R_DownEyeLid_Out_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_DownEyeLid_Out_ParJnt.ro" "R_DownEyeLid_Out_ParJnt_orientConstraint1.cro"
		;
connectAttr "R_DownEyeLid_Out_ParJnt.pim" "R_DownEyeLid_Out_ParJnt_orientConstraint1.cpim"
		;
connectAttr "R_DownEyeLid_Out_ParJnt.jo" "R_DownEyeLid_Out_ParJnt_orientConstraint1.cjo"
		;
connectAttr "R_DownEyeLid_Out_ParJnt.is" "R_DownEyeLid_Out_ParJnt_orientConstraint1.is"
		;
connectAttr "R_DownEyeLid_Out_Loc.r" "R_DownEyeLid_Out_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_DownEyeLid_Out_Loc.ro" "R_DownEyeLid_Out_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_DownEyeLid_Out_Loc.pm" "R_DownEyeLid_Out_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_DownEyeLid_Out_ParJnt_orientConstraint1.w0" "R_DownEyeLid_Out_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt_pointConstraint1.ctx" "R_DownEyeLid_Mid_ParJnt.tx"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt_pointConstraint1.cty" "R_DownEyeLid_Mid_ParJnt.ty"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt_pointConstraint1.ctz" "R_DownEyeLid_Mid_ParJnt.tz"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt_orientConstraint1.crx" "R_DownEyeLid_Mid_ParJnt.rx"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt_orientConstraint1.cry" "R_DownEyeLid_Mid_ParJnt.ry"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt_orientConstraint1.crz" "R_DownEyeLid_Mid_ParJnt.rz"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt.s" "R_DownEyeLid_Mid_SkinJnt.is";
connectAttr "R_DownEyeLid_Mid_ParJnt.pim" "R_DownEyeLid_Mid_ParJnt_pointConstraint1.cpim"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt.rp" "R_DownEyeLid_Mid_ParJnt_pointConstraint1.crp"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt.rpt" "R_DownEyeLid_Mid_ParJnt_pointConstraint1.crt"
		;
connectAttr "R_DownEyeLid_Mid_Loc.t" "R_DownEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_DownEyeLid_Mid_Loc.rp" "R_DownEyeLid_Mid_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_DownEyeLid_Mid_Loc.rpt" "R_DownEyeLid_Mid_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_DownEyeLid_Mid_Loc.pm" "R_DownEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt_pointConstraint1.w0" "R_DownEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt.ro" "R_DownEyeLid_Mid_ParJnt_orientConstraint1.cro"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt.pim" "R_DownEyeLid_Mid_ParJnt_orientConstraint1.cpim"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt.jo" "R_DownEyeLid_Mid_ParJnt_orientConstraint1.cjo"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt.is" "R_DownEyeLid_Mid_ParJnt_orientConstraint1.is"
		;
connectAttr "R_DownEyeLid_Mid_Loc.r" "R_DownEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_DownEyeLid_Mid_Loc.ro" "R_DownEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_DownEyeLid_Mid_Loc.pm" "R_DownEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_DownEyeLid_Mid_ParJnt_orientConstraint1.w0" "R_DownEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_DownEyeLid_In_ParJnt_pointConstraint1.ctx" "R_DownEyeLid_In_ParJnt.tx"
		;
connectAttr "R_DownEyeLid_In_ParJnt_pointConstraint1.cty" "R_DownEyeLid_In_ParJnt.ty"
		;
connectAttr "R_DownEyeLid_In_ParJnt_pointConstraint1.ctz" "R_DownEyeLid_In_ParJnt.tz"
		;
connectAttr "R_DownEyeLid_In_ParJnt_orientConstraint1.crx" "R_DownEyeLid_In_ParJnt.rx"
		;
connectAttr "R_DownEyeLid_In_ParJnt_orientConstraint1.cry" "R_DownEyeLid_In_ParJnt.ry"
		;
connectAttr "R_DownEyeLid_In_ParJnt_orientConstraint1.crz" "R_DownEyeLid_In_ParJnt.rz"
		;
connectAttr "R_DownEyeLid_In_ParJnt.s" "R_DownEyeLid_In_SkinJnt.is";
connectAttr "R_DownEyeLid_In_ParJnt.pim" "R_DownEyeLid_In_ParJnt_pointConstraint1.cpim"
		;
connectAttr "R_DownEyeLid_In_ParJnt.rp" "R_DownEyeLid_In_ParJnt_pointConstraint1.crp"
		;
connectAttr "R_DownEyeLid_In_ParJnt.rpt" "R_DownEyeLid_In_ParJnt_pointConstraint1.crt"
		;
connectAttr "R_DownEyeLid_In_Loc.t" "R_DownEyeLid_In_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_DownEyeLid_In_Loc.rp" "R_DownEyeLid_In_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_DownEyeLid_In_Loc.rpt" "R_DownEyeLid_In_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_DownEyeLid_In_Loc.pm" "R_DownEyeLid_In_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_DownEyeLid_In_ParJnt_pointConstraint1.w0" "R_DownEyeLid_In_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_DownEyeLid_In_ParJnt.ro" "R_DownEyeLid_In_ParJnt_orientConstraint1.cro"
		;
connectAttr "R_DownEyeLid_In_ParJnt.pim" "R_DownEyeLid_In_ParJnt_orientConstraint1.cpim"
		;
connectAttr "R_DownEyeLid_In_ParJnt.jo" "R_DownEyeLid_In_ParJnt_orientConstraint1.cjo"
		;
connectAttr "R_DownEyeLid_In_ParJnt.is" "R_DownEyeLid_In_ParJnt_orientConstraint1.is"
		;
connectAttr "R_DownEyeLid_In_Loc.r" "R_DownEyeLid_In_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_DownEyeLid_In_Loc.ro" "R_DownEyeLid_In_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_DownEyeLid_In_Loc.pm" "R_DownEyeLid_In_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_DownEyeLid_In_ParJnt_orientConstraint1.w0" "R_DownEyeLid_In_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_UpEyeLid_Out_ParJnt_pointConstraint1.ctx" "R_UpEyeLid_Out_ParJnt.tx"
		;
connectAttr "R_UpEyeLid_Out_ParJnt_pointConstraint1.cty" "R_UpEyeLid_Out_ParJnt.ty"
		;
connectAttr "R_UpEyeLid_Out_ParJnt_pointConstraint1.ctz" "R_UpEyeLid_Out_ParJnt.tz"
		;
connectAttr "R_UpEyeLid_Out_ParJnt_orientConstraint1.crx" "R_UpEyeLid_Out_ParJnt.rx"
		;
connectAttr "R_UpEyeLid_Out_ParJnt_orientConstraint1.cry" "R_UpEyeLid_Out_ParJnt.ry"
		;
connectAttr "R_UpEyeLid_Out_ParJnt_orientConstraint1.crz" "R_UpEyeLid_Out_ParJnt.rz"
		;
connectAttr "R_UpEyeLid_Out_ParJnt.s" "R_UpEyeLid_Out_SkinJnt.is";
connectAttr "R_UpEyeLid_Out_ParJnt.pim" "R_UpEyeLid_Out_ParJnt_pointConstraint1.cpim"
		;
connectAttr "R_UpEyeLid_Out_ParJnt.rp" "R_UpEyeLid_Out_ParJnt_pointConstraint1.crp"
		;
connectAttr "R_UpEyeLid_Out_ParJnt.rpt" "R_UpEyeLid_Out_ParJnt_pointConstraint1.crt"
		;
connectAttr "R_UpEyeLid_Out_Loc.t" "R_UpEyeLid_Out_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_UpEyeLid_Out_Loc.rp" "R_UpEyeLid_Out_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_UpEyeLid_Out_Loc.rpt" "R_UpEyeLid_Out_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_UpEyeLid_Out_Loc.pm" "R_UpEyeLid_Out_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_UpEyeLid_Out_ParJnt_pointConstraint1.w0" "R_UpEyeLid_Out_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_UpEyeLid_Out_ParJnt.ro" "R_UpEyeLid_Out_ParJnt_orientConstraint1.cro"
		;
connectAttr "R_UpEyeLid_Out_ParJnt.pim" "R_UpEyeLid_Out_ParJnt_orientConstraint1.cpim"
		;
connectAttr "R_UpEyeLid_Out_ParJnt.jo" "R_UpEyeLid_Out_ParJnt_orientConstraint1.cjo"
		;
connectAttr "R_UpEyeLid_Out_ParJnt.is" "R_UpEyeLid_Out_ParJnt_orientConstraint1.is"
		;
connectAttr "R_UpEyeLid_Out_Loc.r" "R_UpEyeLid_Out_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_UpEyeLid_Out_Loc.ro" "R_UpEyeLid_Out_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_UpEyeLid_Out_Loc.pm" "R_UpEyeLid_Out_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_UpEyeLid_Out_ParJnt_orientConstraint1.w0" "R_UpEyeLid_Out_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt_pointConstraint1.ctx" "R_UpEyeLid_Mid_ParJnt.tx"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt_pointConstraint1.cty" "R_UpEyeLid_Mid_ParJnt.ty"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt_pointConstraint1.ctz" "R_UpEyeLid_Mid_ParJnt.tz"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt_orientConstraint1.crx" "R_UpEyeLid_Mid_ParJnt.rx"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt_orientConstraint1.cry" "R_UpEyeLid_Mid_ParJnt.ry"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt_orientConstraint1.crz" "R_UpEyeLid_Mid_ParJnt.rz"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt.s" "R_UpEyeLid_Mid_SkinJnt.is";
connectAttr "R_UpEyeLid_Mid_ParJnt.pim" "R_UpEyeLid_Mid_ParJnt_pointConstraint1.cpim"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt.rp" "R_UpEyeLid_Mid_ParJnt_pointConstraint1.crp"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt.rpt" "R_UpEyeLid_Mid_ParJnt_pointConstraint1.crt"
		;
connectAttr "R_UpEyeLid_Mid_Loc.t" "R_UpEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_UpEyeLid_Mid_Loc.rp" "R_UpEyeLid_Mid_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_UpEyeLid_Mid_Loc.rpt" "R_UpEyeLid_Mid_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_UpEyeLid_Mid_Loc.pm" "R_UpEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt_pointConstraint1.w0" "R_UpEyeLid_Mid_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt.ro" "R_UpEyeLid_Mid_ParJnt_orientConstraint1.cro"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt.pim" "R_UpEyeLid_Mid_ParJnt_orientConstraint1.cpim"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt.jo" "R_UpEyeLid_Mid_ParJnt_orientConstraint1.cjo"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt.is" "R_UpEyeLid_Mid_ParJnt_orientConstraint1.is"
		;
connectAttr "R_UpEyeLid_Mid_Loc.r" "R_UpEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_UpEyeLid_Mid_Loc.ro" "R_UpEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_UpEyeLid_Mid_Loc.pm" "R_UpEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_UpEyeLid_Mid_ParJnt_orientConstraint1.w0" "R_UpEyeLid_Mid_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_UpEyeLid_In_ParJnt_pointConstraint1.ctx" "R_UpEyeLid_In_ParJnt.tx"
		;
connectAttr "R_UpEyeLid_In_ParJnt_pointConstraint1.cty" "R_UpEyeLid_In_ParJnt.ty"
		;
connectAttr "R_UpEyeLid_In_ParJnt_pointConstraint1.ctz" "R_UpEyeLid_In_ParJnt.tz"
		;
connectAttr "R_UpEyeLid_In_ParJnt_orientConstraint1.crx" "R_UpEyeLid_In_ParJnt.rx"
		;
connectAttr "R_UpEyeLid_In_ParJnt_orientConstraint1.cry" "R_UpEyeLid_In_ParJnt.ry"
		;
connectAttr "R_UpEyeLid_In_ParJnt_orientConstraint1.crz" "R_UpEyeLid_In_ParJnt.rz"
		;
connectAttr "R_UpEyeLid_In_ParJnt.s" "R_UpEyeLid_In_SkinJnt.is";
connectAttr "R_UpEyeLid_In_ParJnt.pim" "R_UpEyeLid_In_ParJnt_pointConstraint1.cpim"
		;
connectAttr "R_UpEyeLid_In_ParJnt.rp" "R_UpEyeLid_In_ParJnt_pointConstraint1.crp"
		;
connectAttr "R_UpEyeLid_In_ParJnt.rpt" "R_UpEyeLid_In_ParJnt_pointConstraint1.crt"
		;
connectAttr "R_UpEyeLid_In_Loc.t" "R_UpEyeLid_In_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_UpEyeLid_In_Loc.rp" "R_UpEyeLid_In_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_UpEyeLid_In_Loc.rpt" "R_UpEyeLid_In_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_UpEyeLid_In_Loc.pm" "R_UpEyeLid_In_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_UpEyeLid_In_ParJnt_pointConstraint1.w0" "R_UpEyeLid_In_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_UpEyeLid_In_ParJnt.ro" "R_UpEyeLid_In_ParJnt_orientConstraint1.cro"
		;
connectAttr "R_UpEyeLid_In_ParJnt.pim" "R_UpEyeLid_In_ParJnt_orientConstraint1.cpim"
		;
connectAttr "R_UpEyeLid_In_ParJnt.jo" "R_UpEyeLid_In_ParJnt_orientConstraint1.cjo"
		;
connectAttr "R_UpEyeLid_In_ParJnt.is" "R_UpEyeLid_In_ParJnt_orientConstraint1.is"
		;
connectAttr "R_UpEyeLid_In_Loc.r" "R_UpEyeLid_In_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_UpEyeLid_In_Loc.ro" "R_UpEyeLid_In_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_UpEyeLid_In_Loc.pm" "R_UpEyeLid_In_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_UpEyeLid_In_ParJnt_orientConstraint1.w0" "R_UpEyeLid_In_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt_pointConstraint1.ctx" "R_EyeLid_OutCorner_ParJnt.tx"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt_pointConstraint1.cty" "R_EyeLid_OutCorner_ParJnt.ty"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt_pointConstraint1.ctz" "R_EyeLid_OutCorner_ParJnt.tz"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt_orientConstraint1.crx" "R_EyeLid_OutCorner_ParJnt.rx"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt_orientConstraint1.cry" "R_EyeLid_OutCorner_ParJnt.ry"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt_orientConstraint1.crz" "R_EyeLid_OutCorner_ParJnt.rz"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt.s" "R_EyeLid_OutCorner_SkinJnt.is";
connectAttr "R_EyeLid_OutCorner_ParJnt.pim" "R_EyeLid_OutCorner_ParJnt_pointConstraint1.cpim"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt.rp" "R_EyeLid_OutCorner_ParJnt_pointConstraint1.crp"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt.rpt" "R_EyeLid_OutCorner_ParJnt_pointConstraint1.crt"
		;
connectAttr "R_EyeLid_OutCorner_Loc.t" "R_EyeLid_OutCorner_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_EyeLid_OutCorner_Loc.rp" "R_EyeLid_OutCorner_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_EyeLid_OutCorner_Loc.rpt" "R_EyeLid_OutCorner_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_EyeLid_OutCorner_Loc.pm" "R_EyeLid_OutCorner_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt_pointConstraint1.w0" "R_EyeLid_OutCorner_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt.ro" "R_EyeLid_OutCorner_ParJnt_orientConstraint1.cro"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt.pim" "R_EyeLid_OutCorner_ParJnt_orientConstraint1.cpim"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt.jo" "R_EyeLid_OutCorner_ParJnt_orientConstraint1.cjo"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt.is" "R_EyeLid_OutCorner_ParJnt_orientConstraint1.is"
		;
connectAttr "R_EyeLid_OutCorner_Loc.r" "R_EyeLid_OutCorner_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_EyeLid_OutCorner_Loc.ro" "R_EyeLid_OutCorner_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_EyeLid_OutCorner_Loc.pm" "R_EyeLid_OutCorner_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_EyeLid_OutCorner_ParJnt_orientConstraint1.w0" "R_EyeLid_OutCorner_ParJnt_orientConstraint1.tg[0].tw"
		;
connectAttr "R_EyeLid_InCorner_ParJnt_pointConstraint1.ctx" "R_EyeLid_InCorner_ParJnt.tx"
		;
connectAttr "R_EyeLid_InCorner_ParJnt_pointConstraint1.cty" "R_EyeLid_InCorner_ParJnt.ty"
		;
connectAttr "R_EyeLid_InCorner_ParJnt_pointConstraint1.ctz" "R_EyeLid_InCorner_ParJnt.tz"
		;
connectAttr "R_EyeLid_InCorner_ParJnt_orientConstraint1.crx" "R_EyeLid_InCorner_ParJnt.rx"
		;
connectAttr "R_EyeLid_InCorner_ParJnt_orientConstraint1.cry" "R_EyeLid_InCorner_ParJnt.ry"
		;
connectAttr "R_EyeLid_InCorner_ParJnt_orientConstraint1.crz" "R_EyeLid_InCorner_ParJnt.rz"
		;
connectAttr "R_EyeLid_InCorner_ParJnt.s" "R_EyeLid_InCorner_SkinJnt.is";
connectAttr "R_EyeLid_InCorner_ParJnt.pim" "R_EyeLid_InCorner_ParJnt_pointConstraint1.cpim"
		;
connectAttr "R_EyeLid_InCorner_ParJnt.rp" "R_EyeLid_InCorner_ParJnt_pointConstraint1.crp"
		;
connectAttr "R_EyeLid_InCorner_ParJnt.rpt" "R_EyeLid_InCorner_ParJnt_pointConstraint1.crt"
		;
connectAttr "R_EyeLid_InCorner_Loc.t" "R_EyeLid_InCorner_ParJnt_pointConstraint1.tg[0].tt"
		;
connectAttr "R_EyeLid_InCorner_Loc.rp" "R_EyeLid_InCorner_ParJnt_pointConstraint1.tg[0].trp"
		;
connectAttr "R_EyeLid_InCorner_Loc.rpt" "R_EyeLid_InCorner_ParJnt_pointConstraint1.tg[0].trt"
		;
connectAttr "R_EyeLid_InCorner_Loc.pm" "R_EyeLid_InCorner_ParJnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "R_EyeLid_InCorner_ParJnt_pointConstraint1.w0" "R_EyeLid_InCorner_ParJnt_pointConstraint1.tg[0].tw"
		;
connectAttr "R_EyeLid_InCorner_ParJnt.ro" "R_EyeLid_InCorner_ParJnt_orientConstraint1.cro"
		;
connectAttr "R_EyeLid_InCorner_ParJnt.pim" "R_EyeLid_InCorner_ParJnt_orientConstraint1.cpim"
		;
connectAttr "R_EyeLid_InCorner_ParJnt.jo" "R_EyeLid_InCorner_ParJnt_orientConstraint1.cjo"
		;
connectAttr "R_EyeLid_InCorner_ParJnt.is" "R_EyeLid_InCorner_ParJnt_orientConstraint1.is"
		;
connectAttr "R_EyeLid_InCorner_Loc.r" "R_EyeLid_InCorner_ParJnt_orientConstraint1.tg[0].tr"
		;
connectAttr "R_EyeLid_InCorner_Loc.ro" "R_EyeLid_InCorner_ParJnt_orientConstraint1.tg[0].tro"
		;
connectAttr "R_EyeLid_InCorner_Loc.pm" "R_EyeLid_InCorner_ParJnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "R_EyeLid_InCorner_ParJnt_orientConstraint1.w0" "R_EyeLid_InCorner_ParJnt_orientConstraint1.tg[0].tw"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "rp_eric_rigged_001_geoSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "rp_eric_rigged_001_geoSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "rp_eric_rigged_001_dif.oc" "rp_eric_rigged_001_mat.c";
connectAttr "rp_eric_rigged_001_mat.oc" "rp_eric_rigged_001_geoSG.ss";
connectAttr "polySurfaceShape1.iog.og[0]" "rp_eric_rigged_001_geoSG.dsm" -na;
connectAttr "polySurfaceShape2.iog.og[0]" "rp_eric_rigged_001_geoSG.dsm" -na;
connectAttr "polySurfaceShape3.iog" "rp_eric_rigged_001_geoSG.dsm" -na;
connectAttr "polySurfaceShape2.iog" "rp_eric_rigged_001_geoSG.dsm" -na;
connectAttr "polySurfaceShape1.iog" "rp_eric_rigged_001_geoSG.dsm" -na;
connectAttr "rp_eric_rigged_001_geoSG.msg" "materialInfo1.sg";
connectAttr "rp_eric_rigged_001_mat.msg" "materialInfo1.m";
connectAttr "rp_eric_rigged_001_dif.msg" "materialInfo1.t" -na;
connectAttr "place2dTexture1.o" "rp_eric_rigged_001_dif.uv";
connectAttr "place2dTexture1.ofu" "rp_eric_rigged_001_dif.ofu";
connectAttr "place2dTexture1.ofv" "rp_eric_rigged_001_dif.ofv";
connectAttr "place2dTexture1.rf" "rp_eric_rigged_001_dif.rf";
connectAttr "place2dTexture1.reu" "rp_eric_rigged_001_dif.reu";
connectAttr "place2dTexture1.rev" "rp_eric_rigged_001_dif.rev";
connectAttr "place2dTexture1.vt1" "rp_eric_rigged_001_dif.vt1";
connectAttr "place2dTexture1.vt2" "rp_eric_rigged_001_dif.vt2";
connectAttr "place2dTexture1.vt3" "rp_eric_rigged_001_dif.vt3";
connectAttr "place2dTexture1.vc1" "rp_eric_rigged_001_dif.vc1";
connectAttr "place2dTexture1.ofs" "rp_eric_rigged_001_dif.fs";
connectAttr ":defaultColorMgtGlobals.cme" "rp_eric_rigged_001_dif.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "rp_eric_rigged_001_dif.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "rp_eric_rigged_001_dif.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "rp_eric_rigged_001_dif.ws";
connectAttr "layerManager.dli[2]" "layer1.id";
connectAttr "rp_eric_rigged_001_geoSG.pa" ":renderPartition.st" -na;
connectAttr "rp_eric_rigged_001_mat.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "rp_eric_rigged_001_dif.msg" ":defaultTextureList1.tx" -na;
// End of Man_Rig_WIP_2.ma

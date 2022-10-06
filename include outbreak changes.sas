

/*=======================================================================================================================
*last updated 7/21/2022;

NOTES
*6/13/2020 - no longer manually renaming dup names as (1) and (2), instead autonmatically rename if not closed as False;


   *29340 The Old Rd , Castaic, CA, 91384;
   if outbreak_number = "OB2020161" then do;
      Longitude = "-118.610350";
      Latitude = "34.451777";
   end;
   *Gower St & 101 Frewway, Los Angeles;
   if outbreak_number = "OB2020466" then do;
      Longitude = "-118.322506";
      Latitude = "34.104321";
   end;

   *10/16/20: Andreas email: OB that isn not a real outbreak is OB20201653 - Beyond the Bell, Euclid Elementary School. 
              Please suppress this on the admin list and public outbreak list. ;

   *12/06/20: Rita email - PEH team investigation since they may not be part of this outbreak;
   if outbreak_number = "OB20202550" then delete;

*12/23/20  DO NOT post ODR sites online - confidential sites similar to PRK and DV sites;

  *2/3/21: delete as false < 10;
   if outbreak_number in ( "OB2021585") then delete;

*04/06/212: added OB2021778 Union Rescue Mission, Hope Gardens Family Center DV shelter per PEH request as possible DV site;
*04/07/21: PEH received confirmation that OB2021778 Union Rescue Mission, Hope Gardens Family Center is NOT a DV site and can remove from exclusion again;

*01/29/22 comment out all Long Term Psychiatric Hospital;
==========================================================================================================================*/





* HARD CODE FACILITY DELETION;

*hard code false or dup deletion per request-> need to double check to make sure they are not separate parts (snf/assisted) within the same facility;

%macro delch();
   *if location_type= "PEH Contact Tracing Location" then delete;
   *if outbreak_number = "OB20201653" then delete;
   *if outbreak_number = "OB20202550" then delete;
   *if outbreak_number in ( "OB2021585") then delete;
%mend delch;


*12/23/20 do not post ODR sites online - confidential sites similar to PRK and DV sites
Copy from suppress_ODR;
%macro odr();
   if outbreak_number in (
"OB2020936"
"OB2021115"
"OB2021458"
       ) 
or location_type = "Group Home (ODR)"

then odr_flag=1;
%mend odr;


*DV sites - include for internal use only!!!!
Copy from suppress_DV;
%macro internal();
   if outbreak_number in (
"OB20202101"
"OB20211226"
"OB20211314"
"OB20211453"
"OB20212563"
"OB2021529"
"OB2021703"
"OB20221598"
"OB20221891"
"OB2022514"
   ) 
or location_type = "Homeless Shelter (Domestic Violence)"

then dv_flag=1;

/*Project Roomkey - include for internal use only*/
if index(location, 'Hotel/Motel')>0 then rommkey_flag=1;

%mend internal;



* HARD CODE FACILITY NAME;

%macro namech();

 length location location_orig location_orig_UP $150.;
 location_orig = Location;
 location_orig_UP = strip(upcase(compbl(location_orig)));
* 1. LOCATION NAME;
 if outbreak_number = "HF2020103" then location = "Virgil Rehabilitation and Skilled Nursing Center";
 if outbreak_number = "HF20201103" then location = "Emanate Health Queen of the Valley Hospital - Pediatric Outpatient Clinic";
 if outbreak_number = "HF20201231" then location = "Little Sisters of the Poor (SNF)";
 if outbreak_number = "HF2020652" then location = "HealthRIGHT 360 - Prototypes Outpatient Behavioral Health Services Center";*05/23/22 updated to add space between;
 if outbreak_number = "HF2020726" then location = "Harbor Health Care, Inc. - La Fonda Division";
 if outbreak_number = "HF2020824" then location = "Mount San Antonio Gardens - Villas in Claremont";
 if outbreak_number = "HF2021136" then location = "Royal Oaks Manor - Bradbury Oaks (SNF)";
 if outbreak_number = "HF2021397" then location = "Windsor Gardens Convalescent Hospital";
 if outbreak_number = "HF2021418" then location = "Children's Hospital Los Angeles - Outpatient Rehabilitation Unit";
 if outbreak_number = "HF2021471" then location = "Verdugo Hills Hospital D/P APH";
 if outbreak_number = "HF2021552" then location = "Cedars-Sinai Medical Group of Encino";
 if outbreak_number = "HF202158" then location = "Royal Oaks Manor - Bradbury Oaks (SNF)";
 if outbreak_number = "HF2021583" then location = "Joyce Eisenberg-Keefer Medical Center D/P SNF";
 if outbreak_number = "HF202159" then location = "Joyce Eisenberg Keefer Medical Center-Auerbach Geriatric Psychiatric Unit";
 if outbreak_number = "HF2022112" then location = "DaVita Carson Pavilion Dialysis";
 if outbreak_number = "HF2022215" then location = "Windsor Gardens Convalescent Hospital";
 if outbreak_number = "HF2022245" then location = "Windsor Gardens Convalescent Center (Camino Healthcare)";
 if outbreak_number = "HF2022252" then location = "Royal Oaks Manor - Bradbury Oaks (SNF)";
 if outbreak_number = "HF2022286" then location = "Flower Villa, Inc.";
 if outbreak_number = "HF2022333" then location = "Joyce Eisenberg-Keefer Medical Center D/P SNF";
 if outbreak_number = "HF2022339" then location = "The Canterbury (SNF)";
 if outbreak_number = "HF202235" then location = "DaVita Century City Dialysis";
 if outbreak_number = "OB20201014" then location = "Rudolph and Sletten Project, Cal State LA";
 if outbreak_number = "OB2020112" then location = "Salvation Army - Winter Shelter";
 if outbreak_number = "OB20201123" then location = "Lakeshore Learning Materials - Warehouse";
 if outbreak_number = "OB2020116" then location = "Ambitions - Verdugo House 2";
 if outbreak_number = "OB20201168" then location = "Ms. Hazel's House - E 109th Place";*for sort order with #2;
 if outbreak_number = "OB20201170" then location = "Serenity Seniors Home III";
 if outbreak_number = "OB20201212" then location = "Ambitions - Van Ruiten Street";
 if outbreak_number = "OB20201241" then location = "Weingart / Gardner Library Bridge Housing";
 if outbreak_number = "OB20201253" then location = "Claremont Manor - Independent Living Unit";
 if outbreak_number = "OB20201331" then location = "Forma Brands LLC, Morphe";
 if outbreak_number = "OB20201416" then location = "LAX Terminal 6 - Alaska Airlines";
 if outbreak_number = "OB2020149" then location = "Ambitions - 183rd Street";
 if outbreak_number = "OB20201526" then location = "Ms. Hazel's House - Wall Street";
 if outbreak_number = "OB2020153" then location = "Narra Tree, Inc. - Jeffrey Home ";
 if outbreak_number = "OB20201541" then location = "Penny Lane - Satellite I";
 if outbreak_number = "OB2020159" then location = "Narra Tree, Inc. - Ibex Home";
 if outbreak_number = "OB20201599" then location = "New Harvest Christian School (Preschool and Church)";
 if outbreak_number = "OB2020164" then location = "Mariposa Home";
 if outbreak_number = "OB20201747" then location = "HACLA, Valley Office";
 if outbreak_number = "OB20201761" then location = "Weingart Center Cafe";
 if outbreak_number = "OB20201868" then location = "Lone Star Board & Care Tujunga";
 if outbreak_number = "OB20201883" then location = "Salvation Army Bell Shelter, JWCH Recuperative Care Program";
 if outbreak_number = "OB20201935" then location = "Green Meadows Recreation Center - School Aged Program";
 if outbreak_number = "OB20201950" then location = "TLC-Kronenthal House";
 if outbreak_number = "OB20201951" then location = "Webcor - Project Four Seasons Private Residences at Los Angeles";
 if outbreak_number = "OB20202005" then location = "Brightwater Guest Home 3";
 if outbreak_number = "OB20202011" then location = "The Kensington Sierra Madre";
 if outbreak_number = "OB20202014" then location = "Victory Homes International";
 if outbreak_number = "OB20202045" then location = "Royal Oaks (Assisted Living)";
 if outbreak_number = "OB20202048" then location = "House of Hope - Open Arms";
 if outbreak_number = "OB20202106" then location = "Blue Eagle Villas 2";
 if outbreak_number = "OB20202166" then location = "HACLA, Nickerson Gardens Apartments";
 if outbreak_number = "OB20202202" then location = "Arcadia Gardens Retirement Hotel (Memory Care Unit)";
 if outbreak_number = "OB20202208" then location = 'Lazy Dog Restaurant & Bar, Plaza West Covina';
 if outbreak_number = "OB2020221" then location = "Salvation Army - Hope Harbor, Tenant-Based";
 if outbreak_number = "OB20202276" then location = "Broadview Residential Care Center";
 if outbreak_number = "OB20202278" then location = "VB Care Homes";
 if outbreak_number = "OB20202306" then location = "House of Hope - San Pedro";
 if outbreak_number = "OB20202324" then location = "The Canterbury (RCFE)";
 if outbreak_number = "OB20202347" then location = "JCPenney, Northridge Fashion Center";
 if outbreak_number = "OB20202353" then location = "Evolution Media - Real Housewives of Beverly Hills";
 if outbreak_number = "OB20202375" then location = "Henkel Corporation - Chatsworth";
 if outbreak_number = "OB20202380" then location = "Menzies Aviation, Air China Cargo";
 if outbreak_number = "OB20202446" then location = "WCAY, Inc. SLS"; *with SLS;
 if outbreak_number = "OB20202449" then location = "Hope House For The Multiple-Handicapped - Hope House";
 if outbreak_number = "OB20202479" then location = "Hope House For The Multiple-Handicapped - Halifax House";
 if outbreak_number = "OB20202513" then location = "MDR Fertility Pharmacy - Encino";
 if outbreak_number = "OB20202554" then location = "LADWP - John Ferraro Bldg Ste A17";
 if outbreak_number = "OB2020256" then location = "Penny Lane Centers OP";
 if outbreak_number = "OB20202569" then location = "CLIMB, Inc. ARF";
 if outbreak_number = "OB20202571" then location = "LAX Terminal 5 - JetBlue Airways";
 if outbreak_number = "OB2020258" then location = "People's Care Specialized Residential Hargis";
 if outbreak_number = "OB20202606" then location = "CBS Studio Center Bungalow 3, Lyons Gate Production";
 if outbreak_number = "OB20202640" then location = "Rudolph and Sletten Project, The Rise Koreatown";
 if outbreak_number = "OB2020266" then location = "City View LA";
 if outbreak_number = "OB2020267" then location = "Fountainview at Eisenberg Village";
 if outbreak_number = "OB20202677" then location = "LA City General Services - Parking Services, El Pueblo Parking Lot 2 & 3";
 if outbreak_number = "OB20202686" then location = "United Cerebral Palsy Dronfield South";
 if outbreak_number = "OB20202741" then location = "R & R Masonry, Inc. - United Airlines East Maintenance Project";
 if outbreak_number = "OB20202754" then location = "Windsor Manor (Assisted Living)";
 if outbreak_number = "OB20202771" then location = "Masonry Concepts, Inc. (MCI), Venice High School Construction Site";
 if outbreak_number = "OB20202777" then location = "Golden Life SLS"; *SLS in own home;
 if outbreak_number = "OB20202882" then location = "Vallarta Supermarket #25";
 if outbreak_number = "OB20202884" then location = "LADWP - John Ferraro Bldg Ste A4";
 if outbreak_number = "OB20202888" then location = "BAPKO Metal, Inc. - United Airlines East Maintenance Project";
 if outbreak_number = "OB20202890" then location = "Tomaneng Guest Home I";
 if outbreak_number = "OB20202925" then location = "Ambitions - Rose House";
 if outbreak_number = "OB20202938" then location = "Star House III";
 if outbreak_number = "OB20202945" then location = "Ambitions - Verdugo House 1";
 if outbreak_number = "OB20203015" then location = "United Cerebral Palsy Westlake House";
 if outbreak_number = "OB20203019" then location = "Hope House For The Multiple-Handicapped - MaryJo House";
 if outbreak_number = "OB20203022" then location = "Robilyn Guest Home, Inc. #3";
 if outbreak_number = "OB20203043" then location = "Bixby Knoll Place II";
 if outbreak_number = "OB20203048" then location = "Pacifica Senior Living Hollywood Hills";
 if outbreak_number = "OB20203078" then location = "Webcor - Project 945 W 8th Street";
 if outbreak_number = "OB20203213" then location = "Summer Wind Manor VII";
 if outbreak_number = "OB20203232" then location = "Golden Haven Guest Home";
 if outbreak_number = "OB20203271" then location = "Salvation Army - Hope Harbor, Residential Treatment Facility";
 if outbreak_number = "OB20203290" then location = "Matharu Home #1";
 if outbreak_number = "OB20203292" then location = "Penny Lane Centers GH";
 if outbreak_number = "OB20203306" then location = "Ambitions - Devlin Facility";
 if outbreak_number = "OB20203376" then location = "United Cerebral Palsy White Oak House";
 if outbreak_number = "OB20203417" then location = "People's Care Kaiser Specialized Residential Alhambra";
 if outbreak_number = "OB20203496" then location = "Hope House For The Multiple-Handicapped - Holiday House";
 if outbreak_number = "OB20203499" then location = "TFC Manufacturing, Inc. - Watson Plaza";
 if outbreak_number = "OB2020423" then location = "Goodlife Residential Home 2";
 if outbreak_number = "OB2020441" then location = "Sunshine Heights II";
 if outbreak_number = "OB2020460" then location = "St. John of God Retirement and Assisted Living Care Center (Grand Building)";
 if outbreak_number = "OB2020474" then location = "Easter Seals Debra Home";
 if outbreak_number = "OB2020486" then location = "Royal Oaks (Independent Living)";
 if outbreak_number = "OB2020573" then location = "LA City Building and Safety - Metro (Downtown)";
 if outbreak_number = "OB2020695" then location = "LA County DPSS - Gain Region 5";
 if outbreak_number = "OB2020728" then location = "LA County DPSS - El Monte 1st Floor";
 if outbreak_number = "OB2020777" then location = "Anning-Johnson Company - Vermont Corridor Construction Project";
 if outbreak_number = "OB2020787" then location = "APM Terminals Pacific LLC";
 if outbreak_number = "OB2020818" then location = "Kedren Community Mental Health Center";
 if outbreak_number = "OB2020832" then location = "Claremont Manor - Memory Care Unit";
 if outbreak_number = "OB2020853" then location = "Bridge II Adult Residential Facility";
 if outbreak_number = "OB2020865" then location = "Wayfinder Family Services - STRTP";
 if outbreak_number = "OB2020944" then location = "Antojitos Cocina Mexicana, Universal CityWalk";
 if outbreak_number = "OB2020956" then location = "Mission Foods, Los Angeles";
 if outbreak_number = "OB2020969" then location = "J. Paul Getty Trust, Getty Villa";
 if outbreak_number = "OB2020988" then location = 'Grifols - Headquarters';
 if outbreak_number = "OB20211035" and location = "Dimondale Adolescent Care Facility Carson" then location = "Dimondale Adolescent Care Facility";
 if outbreak_number = "OB20211098" then location = "Rush Truck Center - Los Angeles";
 if outbreak_number = "OB20211109" then location = 'Motion Picture Industry Pension & Health Plans';
 if outbreak_number = "OB20211132" then location = "Henkel Corporation - Culver City";
 if outbreak_number = "OB20211135" then location = "LA City Public Works - Bureau of Street Services";
 if outbreak_number = "OB20211156" then location = "Red Studios Hollywood - The Masked Singer";
 if outbreak_number = "OB20211200" then location = "Northrop Grumman - Redondo Beach";
 if outbreak_number = "OB20211254" then location = "Hilton Universal City";
 if outbreak_number = "OB20211257" then location = "Peloton - Field Operations Valencia";
 if outbreak_number = "OB20211259" then location = "LASC Stanley Mosk Courthouse";
 if outbreak_number = "OB20211328" then location = "Land Air Express, Inc. DBA Isaac Holdings";
 if outbreak_number = "OB20211372" then location = "Notre Dame High School";
 if outbreak_number = "OB20211473" then location = "Parsec, Inc. - Commerce";
 if outbreak_number = "OB20211488" then location = "Webcor - Project 960 W 7th Street";
 if outbreak_number = "OB20211618" then location = "Largo Concrete, Inc. - Project Blue Sky";
 if outbreak_number = "OB2021163" then location = "Wachter Family Home";
 if outbreak_number = "OB20211648" then location = "U.S. Pole Lighting Company, Inc.";
 if outbreak_number = "OB20211650" then location = "Ms. Hazel's House - 64th Street";
 if outbreak_number = "OB20211674" then location = "St. Bernardine of Siena Children's Center";
 if outbreak_number = "OB20211793" then location = "Holland Partner Group, Construction Site Office";
 if outbreak_number = "OB20211842" then location = "KCS West, Silicon Beach Construction Site Office";
 if outbreak_number = "OB20211849" then location = "Sisters of Social Service, Holy Spirit Retreat Center";
 if outbreak_number = "OB20211862" then location = "Culver City Elks Lodge #1917";
 if outbreak_number = "OB20211939" then location = "Queen Nails, Burbank Town Center";
 if outbreak_number = "OB2021196" then location = "USC Department of Public Safety";
 if outbreak_number = "OB20212078" then location = "O'Reilly Auto Parts #4605";
 if outbreak_number = "OB20212094" then location = "Spectrum Store - Santa Clarita";
 if outbreak_number = "OB20212162" then location = "Ambitions - 219th Facility";
 if outbreak_number = "OB20212237" then location = "TOM TOM Restaurant & Bar";
 if outbreak_number = "OB20212324" then location = "BNBuilders, Inc. - Kite Pharma Project";
 if outbreak_number = "OB20212396" then location = "Wayfinder Family Services - TSCF";
 if outbreak_number = "OB20212400" then location = "Lee Adult Home";
 if outbreak_number = "OB2021241" then location = "Ambitions - Hedda Street";
 if outbreak_number = "OB20212430" then location = "Yard House, Northridge Fashion Center";
 if outbreak_number = "OB20212450" then location = "Shin-Sen-Gumi Hakata Ramen - Gardena";
 if outbreak_number = "OB20212466" then location = "Center for Discovery - Whittier";
 if outbreak_number = "OB2021251" then location = "Candlelight Home, Angela";
 if outbreak_number = "OB20212534" then location = "FRIDA Mexican Cuisine - Cerritos";
 if outbreak_number = "OB20212535" then location = 'Lazy Dog Restaurant & Bar, Del Amo Fashion Center';
 if outbreak_number = "OB20212545" then location = "Visions Adolescent Treatment Center";
 if outbreak_number = "OB2021256" then location = "Glenair Head Office";
 if outbreak_number = "OB20212589" then location = "Loyola High School of Los Angeles";
 if outbreak_number = "OB20212597" then location = "Hope House For The Multiple-Handicapped - Hope House";
 if outbreak_number = "OB20212601" then location = "The Canterbury (RCFE)";
 if outbreak_number = "OB20212603" then location = "Wood Ranch BBQ & Grill, Burbank Town Center";
 if outbreak_number = "OB20212605" then location = "Wood Ranch BBQ & Grill, The Grove";
 if outbreak_number = "OB20212621" then location = "Old Republic Title, Glendale Galleria";
 if outbreak_number = "OB20212633" then location = "J. Paul Getty Trust, Getty Center ";
 if outbreak_number = "OB20212637" then location = "The Kitchen By Wolfgang Puck - LAX"; *"LAX Terminal 6 - The Kitchen By Wolfgang Puck";
 if outbreak_number = "OB2021296" then location = "LA County DPSS - Inglewood, Customer Service Center II Floor 11";
 if outbreak_number = "OB2021300" then location = "Royal Oaks (Assisted Living)";
 if outbreak_number = "OB2021320" then location = "Penny Lane - Satellite II";
 if outbreak_number = "OB2021354" then location = "Visions Adolescent Treatment Center";
 if outbreak_number = "OB2021367" then location = "Wood Ranch BBQ & Grill, Northridge Fashion Center";
 if outbreak_number = "OB2021403" then location = "TLC Community House";
 if outbreak_number = "OB2021430" then location = "Tarzana Treatment Centers Antelope Valley RTP";
 if outbreak_number = "OB2021466" then location = "Touching Lives Homes 2";
 if outbreak_number = "OB2021537" then location = "Crissair, Inc.";
 if outbreak_number = "OB2021539" then location = "TLC Parthenia Home (ARF)";
 if outbreak_number = "OB2021545" then location = "People's Care Kaiser Specialized Residential Monterey Park";
 if outbreak_number = "OB2021664" then location = "St. John Eudes Parish";
 if outbreak_number = "OB202172" then location = "Hilltop Haven #1";
 if outbreak_number = "OB2021932" and location = "New Century Plaza (Project)" then location = "New Century Plaza - Construction Site";
 if outbreak_number = "OB2021960" then location = "GardaWorld Cash Services";
 if outbreak_number = "OB2021981" then location = "Penny Lane - Satellite VI"; *recode once closed;
 if outbreak_number = "OB2022112" then location = "LA CADA Allen House";
 if outbreak_number = "OB2022119" then location = "Neurorestorative California (Oso South)";
 if outbreak_number = "OB20221191" then location = "Bentley Suites by Serenity Care Health";
 if outbreak_number = "OB2022130" then location = "Weingart Center Cafe";
 if outbreak_number = "OB2022138" then location = "LA County DPSS - Hawthorne Medi-Cal";
 if outbreak_number = "OB2022143" then location = "The Grove at Cerritos (RCFE)";
 if outbreak_number = "OB2022145" then location = "Krismar Construction Co, Inc. - Project";
 if outbreak_number = "OB20221485" then location = "TechStyle Fashion Group - Fabletics";
 if outbreak_number = "OB2022149" then location = "Unifi - Cabin Service Warehouse";
 if outbreak_number = "OB202215" then location = "Pacifica Senior Living Hollywood Hills";
 if outbreak_number = "OB20221515" then location = "LA City Department of Recreation and Parks - Hansen Dam Aquatic Center, Pool";
 if outbreak_number = "OB20221526" then location = "Penske Truck Leasing Co. La Mirada";
 if outbreak_number = "OB2022155" then location = "Ambitions - Van Ruiten Street";
 if outbreak_number = "OB20221555" then location = "Holy Family Catholic School";
 if outbreak_number = "OB20221559" then location = "The Gardens Casino - Hawaiian Gardens";
 if outbreak_number = "OB20221601" then location = "Sony Pictures Studios - Barrymore & Thalberg Bldgs";
 if outbreak_number = "OB20221730" then location = "TechStyle Fashion Group";
 if outbreak_number = "OB20221857" then location = "Grifols - Los Angeles";
 if outbreak_number = "OB20221893" then location = "CoCo ICHIBANYA Curry Restaurant - Torrance";
 if outbreak_number = "OB2022192" then location = "Stranger Things Store, The Americana at Brand";
 if outbreak_number = "OB20221930" then location = "Estrella Media, Inc. - Empire Ave";
 if outbreak_number = "OB2022259" then location = "Ms. Hazel's House - E 109th Place #2";
 if outbreak_number = "OB2022276" then location = "Royal Oaks (Independent Living)";
 if outbreak_number = "OB2022297" then location = "Louis Vuitton, Westfield Topanga & The Village";
 if outbreak_number = "OB2022327" then location = "The Gardens Casino - Hawaiian Gardens";
 if outbreak_number = "OB2022336" then location = "Republic Services - Sun Valley";
 if outbreak_number = "OB2022339" then location = "Jacoby & Meyers";
 if outbreak_number = "OB202239" then location = "Wokcano - Valencia Town Center";
 if outbreak_number = "OB2022429" then location = "Arktura LLC - Global HQ";
 if outbreak_number = "OB2022435" then location = "Skechers USA Corporate Headquarters";
 if outbreak_number = "OB202254" then location = "Super Mex - Lakewood";
 if outbreak_number = "OB2022569" then location = "Salvation Army - Hope Harbor, Residential Treatment Facility";
 if outbreak_number = "OB2022610" then location = "MonteCedro Retirement Community";
 if outbreak_number = "OB202265" then location = "REM California - Bellflower";
 if outbreak_number = "OB2022659" then location = "Menzies Aviation, LAX";
 if outbreak_number = "OB202266" then location = "Paradigm Malibu - Point Dume";
 if outbreak_number = "OB2022660" then location = "NeuroRestorative California (Northridge)";
 if outbreak_number = "OB202274" then location = "People's Care Monterey Park Home";
 if outbreak_number = "OB2022744" then location = "Holy Infant Home for Children";
 if outbreak_number = "OB2022764" then location = "San Gabriel Valley Training Center";
 if outbreak_number = "OB2022770" then location = "Peloton - Field Operations Santa Fe Springs";
 if outbreak_number = "OB2022946" then location = "Positive Steps Men's Residential Treatment";
 if outbreak_number = "OB202298" then location = "Progressive Gaming - The Commerce Casino & Hotel";
 if outbreak_number in ("HF2020126" "HF2020685" "HF20201262") then location = "Flower Villa, Inc.";
 if outbreak_number in ("HF2020411" "HF2020889" "HF20201310") then location = "Seacrest Postacute Care Center - San Pedro";
 if outbreak_number in ("HF2020432" "HF2020925") then location = "Royal Oaks Manor - Bradbury Oaks (SNF)";
 if outbreak_number in ("HF202091" "HF2020926") then location = "Joyce Eisenberg-Keefer Medical Center D/P SNF";
 if outbreak_number in ("OB20201342" "OB20211214") then location = "LA Metro ExpressLanes - Customer Service Center";
 if outbreak_number in ("OB2020157" "OB20203032") then location = "Ararat Home of Los Angeles";
 if outbreak_number in ("OB2020191" "OB20201876") then location = "MonteCedro Retirement Community";
 if outbreak_number in ("OB20201947" "OB202170") then location = "Sparr Heights Estates, Memory Care Unit";
 if outbreak_number in ("OB20202098" "OB2020126") then location = "Little Sisters of The Poor (RCFE)";
 if outbreak_number in ("OB20202260" "OB20211240" "OB20211756") then location = "U.S. Borax, Inc.";
 if outbreak_number in ("OB20202582" "OB20201038" "OB20201260") then location = "Atherton Baptist Homes (RCFE)";
 if outbreak_number in ("OB2020278" "OB20203103") then location = "Leisure Vale Retirement Hotel";
 if outbreak_number in ("OB2020279" "HF20201141") then location = "The Canterbury (SNF)";
 if outbreak_number in ("OB20203008" "OB20211268") then location = "Paradigm Malibu - Point Dume";
 if outbreak_number in ("OB2020334" "OB20201105" "OB20202963") then location = "Wayfinder Family Services - TSCF";
 if outbreak_number in ("OB2020371" "OB2020910" "OB20202241") then location = "San Dimas Retirement Center"; *ccld name;
 if outbreak_number in ("OB2020471" "OB20203180") then location = "St. John of God Retirement and Assisted Living Care Center";
 if outbreak_number in ("OB2020619" "OB20202323") then location = "GFF Manufacturing Plant";
 if outbreak_number in ("OB2020676" "OB20203424" "OB20211744") then location = "The Grove At Cerritos (RCFE)";*10/02/21: add OB20211744;
 if outbreak_number in ("OB2020890" "OB20202813" "OB20211559" "OB2022563") then location = "Posada at Whittier";
 if outbreak_number in ("OB2020977" "OB20211719") then location = "J. Paul Getty Trust, Getty Center";
 if outbreak_number in ("OB20211288" "OB20212463") then location = "Cantina FRIDA Mexican Cuisine & Bar - Beverly Hills"; *different address from frida rest;
 if outbreak_number in ("OB20211357" "OB20211827") then location = "United Rock Products - Avenida Barbosa";
 if outbreak_number in ("OB20211711" "OB2022723") then location = "Leisure Vale Retirement Hotel";
 if outbreak_number in ("OB2021273" "OB2020254") then location = "Broadview Christian Science Nursing";
 if outbreak_number in ("OB2021330" "OB20201165") then location = "LA County DCFS - Van Nuys";
 if outbreak_number in ("OB2021616" "OB2020572") then location = "LA CADA Allen House";
 if outbreak_number in ("OB20221019" "OB20201751") then location = "Eisenberg Village of the LA Jewish Home for the Aging";
 if upcase(compress(strip(location), ", ")) = "THEARCHERSCHOOLFORGIRLSLOSANGELES" then location = "The Archer School For Girls";
 if upcase(location = "WILLOW ELEMENTARY") then location = "Willow Elementary School";
 if upcase(location) = "DIXIE CANYON ELEMENTARY" then location = "Dixie Canyon Elementary School";
 if upcase(location) = "GRANADA HILLS CHARTER HIGHSCHOOL" or upcase(location) = "GRANADA HILLS CHARTER HIGH SCHOOL" then location = "Granada Hills Charter School, High School";
 if upcase(location) = "KINDRED HOSPITAL - PARAMOUNT" then location = "Kindred Hospital Paramount";
 if upcase(location) = "LOMITA ELEMENTARY MATH/SCIENCE/TECHNOLOGY MAGNET" then location = "Lomita Math/Science/Technology Magnet Elementary School";
 if upcase(location) = "PALM ELEMENTARY" then location = "Palm Elementary School";
 if upcase(location) = "THE HOSPICE HOUSE OF PRESBYTERIAN INTERCOMMUNITY" then location = "THE HOSPICE HOUSE PRESBYTERIAN INTERCOMMUNITY";
 if upcase(location) = "UPS BALDWIN PARK" then location = "UPS - Baldwin Park";
 if upcase(location) = "WILLIAMS ELEMENTARY" then location = "Williams Elementary School";
 location = tranwrd(location, "# ", "#");
 location = tranwrd(location, "Angeles Vista Wayfinder Family Services", "Wayfinder Family Services");
 location = tranwrd(location, "Antelope Valley College Nursing", "Antelope Valley College, Nursing");
 location = tranwrd(location, "Apple Store -", "Apple Store,");
 location = tranwrd(location, "Apple Store Beverly Center", "Apple Store, Beverly Center");
 location = tranwrd(location, "Apple Store Glendale Galleria", "Apple Store, Glendale Galleria");
 location = tranwrd(location, "Bed, Bath and Beyond", 'Bed Bath & Beyond');
 location = tranwrd(location, "Best Buy-Downey", "Best Buy Downey");
 location = tranwrd(location, "Brookdale Assisted Living North Tarzana RCFE", "Brookdale North Tarzana");
 location = tranwrd(location, "Brookdale Central Senior Living-Whittier", "Brookdale Central Whittier");
 location = tranwrd(location, "Brookdale Chatsworth Assisted Living", "Brookdale Chatsworth");
 location = tranwrd(location, "Brookdale Ocean House Assisted Living", "Brookdale Ocean House");
 location = tranwrd(location, "California Highway Patrol - ", "California Highway Patrol ");
 location = tranwrd(location, "California Highway Patrol ", "California Highway Patrol - ");
 location = tranwrd(location, "California Mission Inn - Residential Care", "California Mission Inn");
 location = tranwrd(location, "Campus Residential Dining UCLA", "Campus Residential Dining, UCLA");
 location = tranwrd(location, "Cedar Sinai Medical Center", "Cedars-Sinai Medical Center");
 location = tranwrd(location, "Cedars Sinai", "Cedars-Sinai");
 location = tranwrd(location, "Choice R Us- Ward House", "Choice R Us - Ward House");
 location = tranwrd(location, "Choices R Us - Cleveland Home", "Choices R Us - Cleveland");
 location = tranwrd(location, "Choices R Us - Ward House", "Choices R Us - Ward");
 location = tranwrd(location, "Choices R Us-Faust", "Choices R Us - Faust");
 location = tranwrd(location, "Clara Shortridge Foltz Criminal Justice Center", "Clara Shortridge-Foltz CJC");
 location = tranwrd(location, "CLIMB SLS", "CLIMB, Inc. SLS");
 location = tranwrd(location, "CN Residential Home #", "CN Home #");
 location = tranwrd(location, "CN Residential Home #7", "CN Home #7");
 location = tranwrd(location, "Coca Cola", "Coca-Cola");
 location = tranwrd(location, "Davita - ", "Davita ");
 location = tranwrd(location, "Delano Recreation Center, LA City Rec & Parks", "LA City Department of Recreation and Parks - Delano Recreation Center, Day Camp");
 location = tranwrd(location, "Downey Fire Department - Station 3", "Downey Fire Department - Fire Station 3");
 location = tranwrd(location, "Dunkin Donuts - Terminal 4 LAX", "LAX Terminal 4 - Dunkin Donuts");
 location = tranwrd(location, "Elementry", "Elementary");
 location = tranwrd(location, "Fire Department, Fire Station", "Fire Department - Fire Station");
 location = tranwrd(location, "Food 4 Less 360", "Food 4 Less #360");
 location = tranwrd(location, "Frito Lay", "Frito-Lay");
 location = tranwrd(location, "Glen Park at Glendale - Boynton St.", "Glen Park at Glendale - Boynton St");
 location = tranwrd(location, "GZ building", "GZ Bldg");
 location = tranwrd(location, "Hi Hopes, Inc.", "Hi-Hopes, Inc.");
 location = tranwrd(location, "Hope Gardens Family Center - Union Rescue Mission", "Union Rescue Mission, Hope Gardens Family Center");
 location = tranwrd(location, "Hope Gardens Family Center- Union Rescue Mission", "Union Rescue Mission, Hope Gardens Family Center");
 location = tranwrd(location, "Hospital Forensic Unit", "Hospital Unit");
 location = tranwrd(location, "Humble Haven RCFE LLC", "Humble Haven RCFE");
 location = tranwrd(location, "In-N-Out #", "In-N-Out Burger #");
 location = tranwrd(location, "Islands - #26", "Islands #26");
 location = tranwrd(location, "James A Garfield", "James A. Garfield");
 location = tranwrd(location, "JCPenney - ", "JCPenney, ");
 location = tranwrd(location, "Joyce Eisenberg Keefer Medical Center-Auerbach Geriatric Psychiatric Unit", "Joyce Eisenberg Keefer Medical Center - Auerbach Geriatric Psychiatric Unit");
 location = tranwrd(location, "Kaiser Permanante", "Kaiser Permanente");
 location = tranwrd(location, "Kei Ai ", "Kei-Ai ");
 location = tranwrd(location, "La casa Home-David & Margaret", "David and Margaret Home, La Casa Group Home");
 location = tranwrd(location, "LA City Department of Recreation and Parks", "LA City Recreation and Parks");
 location = tranwrd(location, "LA City Recreation & Parks", "LA City Recreation and Parks");
 location = tranwrd(location, "LA County Department of Public Works", "LA County DPW");
 location = tranwrd(location, "LA County Metro", "LA Metro");
 location = tranwrd(location, "Le Bleu Chateau - Bleu Bldg.", "Le Bleu Chateau");
 location = tranwrd(location, "Los Angeles County Department of Public Health", "LA County DPH");
 location = tranwrd(location, "Los Angelse", "Los Angeles");
 location = tranwrd(location, "Louise House #4", "Louise House 4");
 location = tranwrd(location, "Luskin Conference Center 3", "Luskin Conference Center");
 location = tranwrd(location, "Martin Luther King Junior ", "Martin Luther King, Jr. ");
 location = tranwrd(location, "Motion Picture and TV Fund", "Motion Picture & Television Fund");
 location = tranwrd(location, "Mount San Antonio", "Mt. San Antonio");
 location = tranwrd(location, "Ms Hazel's", "Ms. Hazel's");
 location = tranwrd(location, "Mt San", "Mt. San");
 location = tranwrd(location, "Netflix - Epic Building", "Netflix Epic Building");
 location = tranwrd(location, "New Century Plaza-South Tower", "New Century Plaza - South Tower");
 location = tranwrd(location, "Northrop Grumman (Carpentry Department)", "Northrop Grumman - Redondo Beach (Carpentry Department)");
 location = tranwrd(location, "Northrup Grumman", "Northrop Grumman");
 location = tranwrd(location, "Pepperdine Athletics", "Pepperdine University Athletics");
 location = tranwrd(location, "Pepperdine University, Athletics", "Pepperdine University Athletics");
 location = tranwrd(location, "Portos Bakery", "Porto's Bakery");
 location = tranwrd(location, "Pre -School", "Pre-School");
 location = tranwrd(location, "Providence St. Joseph Medical Center", "Providence Saint Joseph Medical Center");
 location = tranwrd(location, "Raytheon Intelligence and Space Building", "Raytheon Intelligence & Space - Building");
 location = tranwrd(location, "Reebok Store (Citadel Outlets)", "Reebok Store, Citadel Outlets");
 location = tranwrd(location, "Regency Grand @ West Covina", "Regency Grand of West Covina");
 location = tranwrd(location, "RIGHT 360 Walden House", "RIGHT 360 - Walden House");
 location = tranwrd(location, "Rose Valley Garsias", "Rose Valley Garfias");
 location = tranwrd(location, "Saint Richard Pampuri Residential (Care) Facility", "St. Richard Pampuri Residential Care Facility");
 location = tranwrd(location, "Santa Fe Dam, LA County Department of Parks and Recs", "LA County Department of Parks and Recreation - Santa Fe Dam");
 location = tranwrd(location, "Serenity - Recuperative Care", "Serenity Recuperative Care");
 location = tranwrd(location, "Sierra Madre Fire Station", "Sierra Madre Fire Department - Fire Station");
 location = tranwrd(location, "Sit n Sleep", "Sit 'n Sleep");
 location = tranwrd(location, "Smart and Final", "Smart & Final");
 location = tranwrd(location, "Southern California Hospital Culver City", "Southern California Hospital at Culver City");*for sort order with other cities;
 location = tranwrd(location, "Southern California Orthopedics Institute", "Southern California Orthopedic Institute");
 location = tranwrd(location, "St Joseph Center", "St. Joseph Center");
 location = tranwrd(location, "Staples #0", "Staples #0");
 location = tranwrd(location, "Starview Adolescent Center", "Star View Adolescent Center");
 location = tranwrd(location, "SUNRISE ASSISTED LIVING OF WEST HILLS", "SUNRISE OF WEST HILLS");
 location = tranwrd(location, "Sunrise at San Moreno", "Sunrise at San Marino");
 location = tranwrd(location, "Sunrise-Beverly Hills", "Sunrise of Beverly Hills");
 location = tranwrd(location, "SVS-Wilmington", "SVS - Wilmington");
 location = tranwrd(location, "The Rehabilitation Center of Beverly Hills", "The Rehabilitation Centre of Beverly Hills");
 location = tranwrd(location, "TLC - ", "TLC ");
 location = tranwrd(location, "TLC-", "TLC ");
 location = tranwrd(location, "Torrance Fire Department - Station", "Torrance Fire Department - Fire Station");
 location = tranwrd(location, "TORRANCE MEMORIAL MEDICAL CENTER SNF/DP", "TORRANCE MEMORIAL MEDICAL CENTER D/P SNF");
 location = tranwrd(location, "UCLA Midvale Ave.", "UCLA Midvale Ave");
 location = tranwrd(location, "United Cerebral Palsy - Harbor Home", "United Cerebral Palsy Harbor Home");
 location = tranwrd(location, "United Cerebral Palsy", "Momentum (Previously UCPLA)");
 location = tranwrd(location, "Vallarta Supermarket #", "Vallarta Supermarkets #");
 location = tranwrd(location, "Vista Del Mar Child and Family Services - ", "Vista Del Mar Child and Family Services, ");
 location = tranwrd(location, "Vista del Mar Child and Family Services: ", "Vista Del Mar Child and Family Services, ");
 location = tranwrd(location, "Winterhaven Home-David & Margaret Family Services", "David and Margaret Home, Winterhaven Group Home");
 location = tranwrd(location, "Wood Ranch BBQ & Grill ", "Wood Ranch BBQ & Grill, ");
 location = tranwrd(location, "Wood Ranch BBQ and Grill", "Wood Ranch BBQ & Grill");

 /*Previous Names for LTCs*/
 if location_address =: "1 E Commonwealth Ave" and location_type =: "Residential" then location = "Brookdale Alhambra (Previously Alhambra Assisted Living)";
 if location_address =: "10158 Sunland Blvd" and location_type =: "Skilled" then location = "The Hills Healthcare Center (Previously Shadow Hills Convalescent Hospital)";
 if location_address =: "1020 S Fairfax Ave" and location_type =: "Skilled" then location = "Miracle Mile Healthcare Center (Previously Beverly West Healthcare)";
 if location_address =: "10454 Amestoy Ave" and location_type =: "Intermediate" then location = "Momentum (Previously UCPLA) Amestoy South";
 if location_address =: "10458 Amestoy Ave" and location_type =: "Intermediate" then location = "Momentum (Previously UCPLA) Amestoy North";
 if location_address =: "10830 Oxnard St" and location_type =: "Skilled" then location = "Vineland Post-Acute (Previously Golden State Colonial Healthcare Center)";
 if location_address =: "1154 S Alvarado St" and location_type =: "Skilled" then location = "Alvarado Care Center (Previously Emerald Terrace Convalescent Hospital)";
 if location_address =: "12260 Foothill Blvd" and location_type =: "Skilled" then location = "Golden Legacy Care Center (Previously San Fernando Post Acute Hospital)";
 if location_address =: "13000 Victory Blvd" and location_type =: "Skilled" then location = "Valley Village Care Center (Previously Windsor Gardens Healthcare Center of the Valley)";
 if location_address =: "13272 Dronfield Ave" and location_type =: "Intermediate" then location = "Momentum (Previously UCPLA) Dronfield North";
 if location_address =: "13274 Dronfield Ave" and location_type =: "Intermediate" then location = "Momentum (Previously UCPLA) Dronfield South";
 if location_address =: "13449 Biola Ave" and location_type =: "Residential" then location = "Supercare Guest Home (Previously ARC Care for the Elderly)";
 if location_address =: "13922 Cerise Ave" and location_type =: "Skilled" then location = "Windsor Gardens Convalescent Center of Hawthorne (Previously Camino Healthcare)";
 if location_address =: "14109 Hubbard St" and location =: "Intermediate"  then location = "Momentum (Previously UCPLA) Hubbard";
 if location_address =: "1416 W 6th St" and location_type =: "Skilled" then location = "Seacrest Post-Acute Care Center (Previously Seacrest Convalescent Hospital)";
 if location_address =: "1601 S Baldwin Ave" and location_type =: "Skilled" then location = "Arcadia Care Center (Previously Arcadia Health Care Center)";
 if location_address =: "1623 Arizona Ave" and location_type =: "Skilled" then location = "Berkley West Healthcare Center (Previously Berkley West Convalescent Hospital)";
 if location_address =: "16530 S Broadway" and location_type =: "Skilled" then location = "West Gardena Post Acute (Previously Greenfield Care Center of Gardena)";
 if location_address =: "1729 252nd St" and location =: "Intermediate" then location = "Momentum (Previously UCPLA) Harbor Home";
 if location_address =: "1740 S San Dimas Ave" and location_type =: "Residential" then location = "Serento Casa (Previously Brookdale San Dimas)";
 if location_address =: "1740 S San Dimas Ave" and location_type =: "Skilled" then location = "Serento Casa SNF (Previously Brookdale San Dimas)";
 if location_address =: "17650 Devonshire St" and location_type =: "Skilled" then location = "Brookdale Northridge (Previously The Gardens Health Care Center)";
 if location_address =: "17836 Woodruff Ave" and location_type =: "Skilled" then location = "Cerritos Vista Healthcare Center (Previously Woodruff Convalescent Center)";
 if location_address =: "1900 Grismer Ave" and location_type =: "Residential" then location = "Burbank Senior Villa East (Previously Le Bleu Chateau - Bleu)";
 if location_address =: "1911 Grismer Ave" and location_type =: "Residential" then location = "Burbank Senior Villa West (Previously Le Bleu Chateau - Gold)";
 if location_address =: "2021 Arizona Ave" and location_type =: "Skilled" then location = "Berkley East Healthcare Center (Previously Berkley East Convalescent Hospital)";
 if location_address =: "2193 Saticoy St" and location_type =: "Homeless Shelter" then location = "Protoypes - Saticoy (Previously Protoypes - Bridge Housing)";
 if location_address =: "2250 29th St" and location_type =: "Skilled" then location = "Sunset Park Healthcare (Previously Santa Monica Convalescent Center II)";
 if location_address =: "22520 Maple Ave" and location_type =: "Skilled" then location = "Beachside Post Acute (Previously Royalwood Care Center)";
 if location_address =: "2828 Pico Blvd" and location_type =: "Skilled" then location = "Ocean Park Healthcare (Previously Santa Monica Convalescent Center I)";
 if location_address =: "3111 Santa Anita Ave" and location_type =: "Skilled" then location = "Valley View Post Acute (Previously Elmcrest Care Center)";
 if location_address =: "3611 E Imperial Hwy" and location_type =: "Skilled" then location = "Lynwood Post Acute Care Center (Previously Lynwood Healthcare Center)";
 if location_address =: "4061 Grand View Blvd" and location_type =: "Residential" then location = "Ivy Park at Culver City (Previously Sunrise Villa Culver City)";
 if location_address =: "501 S College Ave" and location_type =: "Residential" then location = "Claremont Hacienda (Previously Oak Park Manor)";
 if location_address =: "5044 Buffington Rd" and location_type =: "Skilled" then location = "The Gardens of El Monte (Previously Idle Acre Sanitarium & Convalescent Hospital)";
 if location_address =: "519 W Badillo St" and location_type =: "Skilled" then location = "Harvard Creek Post-Acute (Previously Royal Crest Health Care)";
 if location_address =: "5925 Alcoa Ave" and location_type =: "Food" then location = "Palisades Ranch, Inc. (Previously Goldberg & Solovy Foods)";
 if location_address =: "6520 West Blvd" and location_type =: "Skilled" then location = "Hyde Park Healthcare Center (Previously Hyde Park Convalescent Hospital)";
 if location_address =: "6600 Sepulveda Blvd" and location_type =: "Skilled" then location = "Berkley Valley Post-Acute (Previously Berkley Valley Convalescent Hospital)";
 if location_address =: "6740 Wilbur Ave" and location_type =: "Skilled" then location = "Parkwest Healthcare Center (Previously West Valley Sub-Acute and Rehab)";
 if location_address =: "6835 Hazeltine Ave" and location_type =: "Skilled" then location = "The Care Center on Hazeltine (Previously Van Nuys Health Care Center)";
 if location_address =: "7055 Shoup Ave" and location_type =: "Residential" then location = "West Hills Assisted Living (Previously West Valley Assisted Living)";
 if location_address =: "7332 Claire Ave" and location_type =: "Congregate" then location = "All Care - S.F. Valley (Previously S.F. Valley Congregate Living, Inc.)";
 if location_address =: "801 Cypress Way" and location_type =: "Residential" then location = "West Park Senior Living (Previously Atria Rancho Park)";
 if location_address =: "901 W Santa Anita Ave" and location_type =: "Residential" then location = "Vista Cove at San Gabriel (Previously Royal Vista San Gabriel)";
 if location_address =: "975 N Virgil Ave" and location_type =: "Skilled" then location = "Virgil Rehabilitation & Skilled Nursing Center (Previously Virgil Convalescent Hospital)";

 location = strip(prxchange('s/\(\d\)/ /', 1, location));
 location_UP = strip(upcase(compbl(location)));

 if outbreak_number = 'OB555555' then location = 'Example'; /*Left as example syntax*/

%mend namech;




* HARD CODE SETTING TYPE;

%macro typech();

   location_type_orig = Location_Type;
  if outbreak_number = "OB55555" then location_type = "New Location Type"; *left as example syntax;

   *--------------------------------------------------------------------------------------------------------------------------------------------------;
*--------------------------------------------------------------------------------------------------------------------------------------------------;
* ===>> LEAVE FLAGS FOLLOWING BELOW THE HARD CODED LIST  <<<=== ;
*--------------------------------------------------------------------------------------------------------------------------------------------------;
*--------------------------------------------------------------------------------------------------------------------------------------------------;
*--------------------------------------------------------------------------------------------------------------------------------------------------;
* keep flags here or else overwrites original location type;
*--------------------------------------------------------------------------------------------------------------------------------------------------;
  /*DO NOT UPDATE CODE BELOW*/
 if odr_flag=1 then location_type = "Group Home (ODR)";
 if location_type = "Food Source" then location_type = "Food Facility";
 if location_type = "Office" then location_type = "Workplace";

*--------------------------------------;

%mend typech;
 



* HARD CODE ADDRESS;

%macro addrch();
* 3. LOCATION ADDRESS;
* off-campus housing -> hard code location_address to city and state;
* off-campus housing -> hard code location_city_st to city and state;
*--------------------------------------;
 *hard code address change;
 location_address_orig = tranwrd(location_address, ", CA 9", ", CA, 9");
 location_address = strip(compbl(compress(location_address, "=.")));
 location_address = tranwrd(location_address, ", CA 9", ", CA, 9");
 location_address = tranwrd(location_address, ", Ca 9", ", CA, 9");
 location_address = compbl(location_address);
 location_address = tranwrd(location_address, " ,", ",");
 location_address = tranwrd(location_address, " And ", " and ");
 location_address = tranwrd(location_address, " Avenue ", " Ave ");
 location_address = tranwrd(location_address, " Boulevard ", " Blvd ");
 location_address = tranwrd(location_address, " Street ", " St ");
 location_address = tranwrd(location_address, ", Apt ", ", ");
 location_address = tranwrd(location_address, ", Berth ", ", ");
 location_address = tranwrd(location_address, ", bldg ", ", Bldg ");
 location_address = tranwrd(location_address, ", Bldg for Dementia Residents, ", ", ");
 location_address = tranwrd(location_address, ", building ", ", Bldg ");
 location_address = tranwrd(location_address, ", Building ", ", Bldg ");
 location_address = tranwrd(location_address, ", Dept ", ", ");
 location_address = tranwrd(location_address, ", Floor ", ", Fl ");
 location_address = tranwrd(location_address, ", level ", ", Level ");
 location_address = tranwrd(location_address, ", Medical Offices ", ", ");
 location_address = tranwrd(location_address, ", Memory Care Locked Unit, ", ", ");
 location_address = tranwrd(location_address, ", Ms#", ", ");
 location_address = tranwrd(location_address, ", Pier ", ", ");
 location_address = tranwrd(location_address, ", Room ", ", Rm ");
 location_address = tranwrd(location_address, ", Shop ", ", ");
 location_address = tranwrd(location_address, ", Space ", ", Spc ");
 location_address = tranwrd(location_address, ", ste ", ", Ste ");
 location_address = tranwrd(location_address, ", STE ", ", Ste ");
 location_address = tranwrd(location_address, ", store ", ", ");
 location_address = tranwrd(location_address, ", Store ", ", ");
 location_address = tranwrd(location_address, ", suite ", ", Ste ");
 location_address = tranwrd(location_address, ", Suite ", ", Ste ");
 location_address = tranwrd(location_address, ", Suites ", ", Stes ");
 location_address = tranwrd(location_address, ", Trailer ", ", Trlr ");
 location_address = tranwrd(location_address, ", unit ", ", Unit ");
 location_address = tranwrd(location_address, ",, ", ", ");
 location_address = tranwrd(location_address, "#", "");
 location_address = tranwrd(location_address, "City Of Industry", "City of Industry");
 location_address = tranwrd(location_address, "E Rncho Dmngz", "East Rancho Dominguez");
 location_address = tranwrd(location_address, "Hacienda Hts", "Hacienda Heights");

*-------------------------------------------------------------------------------------------;
*EXTRACT LOCATION_CITY_ST FROM ADDRESS;
*-------------------------------------------------------------------------------------------;
 location_city_st = catx(", ", strip(scan(location_address,-3,",")), strip(scan(location_address,-2,",")));

*-------------------------------------------------------------------------------------------;
* ->> RECODE OFF_CAMPUS HOUSING AND ADDRESS SUPPRESSION OUTBREAK -> CITY, SATE;
*-------------------------------------------------------------------------------------------;

 *FAMILY CARE IN CCLD FILE -> add outbreak number above to the flag;
 if family_childcare_flag = 1 or location_type =: 'Child Care Center/Home' then location_address = location_city_st;

 *03/24/21: off Campus Housing in School settings;
 if location =: "Off Campus Neighborhood, Cal Poly Pomona" then do;
 location_address = "Pomona, CA"; location_city_st = "Pomona, CA"; end; else
 if location =: "Off Campus Neighborhood" or location =: "USC Greek " or location =: "Off Campus Residence" then do;
 location_address = "Los Angeles, CA"; location_city_st = "Los Angeles, CA"; end;
 if location_address = ", Los Angeles, CA," then location_city_st = "Los Angeles, CA";
 if location_city_st = "Los Angeles" then location_city_st = "Los Angeles, CA";
 if location_city_st = "Los Angeles," then location_city_st = "Los Angeles, CA";
 if location_city_st = "Los Angeles, " then location_city_st = "Los Angeles, CA";
 if location_city_st = "Los Angeles, Ca" then location_city_st = "Los Angeles, CA";

*11/13/2020 - Home care facility. Marita said to list as this;
 if outbreak_number = "OB20201923" then location_city_st = "Inglewood, CA";

*Private residence used as filming location;
 if outbreak_number = "OB20211906" then location_city_st = "Encino, CA";

%mend addrch;


* FLAG COVID-19 DESIGNATED CENTERS FOR REMOVAL OR FOOTNOTE;

*Search %let Covid19_fac;
%macro centerch();

   if outbreak_number in (
"HF2020100"
"HF2020123"
"HF2020153"
"HF2020170"
"HF2020173"
"HF2020176"
"HF2020180"
"HF2020189"
"HF2020190"
"HF2020192"
"HF2020208"
"HF2020227"
"HF2020234"
"HF2020248"
"HF2020268"
"HF2020274"
"HF2020311"
"HF2020327"
"HF2020334"
"HF2020481"
"HF2020489"
"HF202057"
"HF202060"
"HF202066"
"HF2020667"
"HF2020697"
"HF2020763"
"HF202082"
"HF202085"
"HF202087"
"HF202088"
"HF202089"
"HF202094"

   ) then do;
       Covid19_facility=1;
       location = CATX(" ", LOCATION, " **");
   end;

%mend centerch;


/*Search macro prop*/
%macro loc();

location_address = strip(compbl(location_address));
 location_address = tranwrd(location_address, " A ", " a ");
 location_address = tranwrd(location_address, " An ", " an ");
 location_address = tranwrd(location_address, " And ", " and ");
 location_address = tranwrd(location_address, " As ", " as ");
 location_address = tranwrd(location_address, " At ", " at ");
 location_address = tranwrd(location_address, " But ", " but ");
 location_address = tranwrd(location_address, " By ", " by ");
 location_address = tranwrd(location_address, " For ", " for ");
 location_address = tranwrd(location_address, " From ", " from ");
 location_address = tranwrd(location_address, " If ", " if ");
 location_address = tranwrd(location_address, " In ", " in ");
 location_address = tranwrd(location_address, " Inr ", " INR ");
 location_address = tranwrd(location_address, " Into ", " into ");
 location_address = tranwrd(location_address, " Lmu ", " LMU ");
 location_address = tranwrd(location_address, " Mcnab ", " McNab ");
 location_address = tranwrd(location_address, " Of ", " of ");
 location_address = tranwrd(location_address, " Off ", " off ");
 location_address = tranwrd(location_address, " On ", " on ");
 location_address = tranwrd(location_address, " Onto ", " onto ");
 location_address = tranwrd(location_address, " Or ", " or ");
 location_address = tranwrd(location_address, " Pch,", " PCH,");
 location_address = tranwrd(location_address, " So ", " so ");
 location_address = tranwrd(location_address, " Than ", " than ");
 location_address = tranwrd(location_address, " That ", " that ");
 location_address = tranwrd(location_address, " The ", " the ");
 location_address = tranwrd(location_address, " To ", " to ");
 location_address = tranwrd(location_address, " Up ", " up ");
 location_address = tranwrd(location_address, " Upon ", " upon ");
 location_address = tranwrd(location_address, " With ", " with ");
 location_address = tranwrd(location_address, ", Suite f,", ", Suite F,");
 location_address = tranwrd(location_address, "#2052a,", "#2052A,");
 location_address = tranwrd(location_address, "#e", "#E");
 location_address = tranwrd(location_address, "Lmu Drive", "LMU Drive");
 location_address = tranwrd(location_address, "Mcbean ", "McBean ");
 location_address = tranwrd(location_address, "Mccadden ", "McCadden ");
 location_address = tranwrd(location_address, "Mcclintock ", "McClintock ");
 location_address = tranwrd(location_address, "Mcdonnell ", "McDonnell ");
 location_address = tranwrd(location_address, "Mclaughlin ", "McLaughlin ");
 location_address = tranwrd(location_address, "Mcnulty ", "McNulty ");
 location_address = tranwrd(location_address, "Omelveny Ave", "O'Melveny Ave");
 location_address = tranwrd(location_address, "Van Nuys Bl,", "Van Nuys Blvd,");
 location_address = tranwrd(location_address, "WHITTIER BLVD, WHITTIER", "Whittier Blvd, Whittier");
 location_address = tranwrd(location_address, ", Valid, Not Geocoded", "");
 location_address = tranwrd(location_address, " , , ", " , ");
 location_address = tranwrd(location_address, " ,", ",");
 location_address = strip(compbl(location_address));
 location_prop = strip(compbl(location));
 location_prop = tranwrd(location_prop, 'A&a', 'A & A');
 location_prop = tranwrd(location_prop, "—", "-");
 location_prop = tranwrd(location_prop, "’", "'");
 location_prop = tranwrd(location_prop, " Co ", " Co. ");
 location_prop = tranwrd(location_prop, " For ", " for ");
 location_prop = tranwrd(location_prop, " Inc ", " Inc. ");
 location_prop = tranwrd(location_prop, " Mens ", " Men's ");
 location_prop = tranwrd(location_prop, " To ", " to ");
 location_prop = tranwrd(location_prop, ", Inc. ", " Inc. ");
 location_prop = tranwrd(location_prop, ", Llp", ", LLP");
 location_prop = tranwrd(location_prop, ", Pbc", ", PBC");
 location_prop = tranwrd(location_prop, ": ", ", ");
 location_prop = tranwrd(location_prop, ".Com", ".com");
 location_prop = tranwrd(location_prop, "Cedars Sinai", "Cedars-Sinai");
 location_prop = tranwrd(location_prop, "Childrens", "Children's");
 location_prop = tranwrd(location_prop, "Coca Cola", "Coca-Cola");
 location_prop = tranwrd(location_prop, "Community - Bridge - Housing, Sylmar", "Community Bridge Housing, Sylmar");
 location_prop = tranwrd(location_prop, "Contruction", "Construction");
 location_prop = tranwrd(location_prop, "Crescent Hotel Apartments/ Property", "Crescent Hotel Apartments");
 location_prop = tranwrd(location_prop, "Crossroads School For The Arts and Sciences", 'Crossroads School for Arts & Sciences');
 location_prop = tranwrd(location_prop, "Dba, Completes", "DBA: Completes");
 location_prop = tranwrd(location_prop, "Endemolshine ", "Endemol Shine ");
 location_prop = tranwrd(location_prop, "Etta- Summer", "ETTA - Summer");
 location_prop = tranwrd(location_prop, "Gloabl", "Global");
 location_prop = tranwrd(location_prop, "Huntington Drive Health and Rehabilitation", 'Huntington Drive Health & Rehabilitation');
 location_prop = tranwrd(location_prop, "In N Out ", "In-N-Out ");
 location_prop = tranwrd(location_prop, "Javiers ", "Javier's ");
 location_prop = tranwrd(location_prop, "Kai Car Dealership", "Kia Car Dealership");
 location_prop = tranwrd(location_prop, "Kei Ai", "Kei-Ai");
 location_prop = tranwrd(location_prop, "LA City College", "Los Angeles City College");
 location_prop = tranwrd(location_prop, "LA County Department of Medical Examiner-Coroner", "LA County Department of Medical Examiner - Coroner");
 location_prop = tranwrd(location_prop, "LA County Dept.", "LA County Department");
 location_prop = tranwrd(location_prop, "Los Angeles City Planning Department", "LA City Planning Department");
 location_prop = tranwrd(location_prop, "Los Angeles City", "LA City");
 location_prop = tranwrd(location_prop, "Los Angeles County", "LA County");
 location_prop = tranwrd(location_prop, "Magan Medical Clinic,", "Magan Medical Clinic");
 location_prop = tranwrd(location_prop, "Mcarthur", "MacArthur");
 location_prop = tranwrd(location_prop, "Mercedes Benz", "Mercedes-Benz");
 location_prop = tranwrd(location_prop, "Moa, Moa, Inc.", "Moa Moa, Inc.");
 location_prop = tranwrd(location_prop, "Ms Hazel", "Ms. Hazel");
 location_prop = tranwrd(location_prop, "New Indy Tri-Paq", "New-Indy TriPAQ");
 location_prop = tranwrd(location_prop, "Outback Steakhouse -Norwalk", "Outback Steakhouse - Norwalk");
 location_prop = tranwrd(location_prop, "Pavillions", "Pavilions");
 location_prop = tranwrd(location_prop, "Pepsi Co Foods Na", "PepsiCo Foods NA");
 location_prop = tranwrd(location_prop, "Project 6 Dd Homes", "Project Six DD Homes");
 location_prop = tranwrd(location_prop, "Purejoy Homes 2-Icf-Ddh", "Purejoy Homes 2 ICF-DDH");
 location_prop = tranwrd(location_prop, "Recuperative Care Alhambra", "Recuperative Care - Alhambra");
 location_prop = tranwrd(location_prop, "Recuperative Care LA", "Recuperative Care - LA");
 location_prop = tranwrd(location_prop, "Rehababilitation", "Rehabilitation");
 location_prop = tranwrd(location_prop, "Scb Division of Dcx - Chol Enterprises, Inc.", "SCB Division of DCX - CHOL Enterprises, Inc.");
 location_prop = tranwrd(location_prop, "Services-Thurin", "Services - Thurin");
 location_prop = tranwrd(location_prop, "St Joseph Center Bread", "St. Joseph Center Bread");
 location_prop = tranwrd(location_prop, "Sunrise Assisted Living of Woodland Hills", "Sunrise of Woodland Hills");
 location_prop = tranwrd(location_prop, "Sunrise Assisted Living Studio City", "Sunrise of Studio City");
 location_prop = tranwrd(location_prop, "Sunrise-Beverly Hills", "Sunrise of Beverly Hills");
 location_prop = tranwrd(location_prop, "Tlc-", "TLC ");
 location_prop = tranwrd(location_prop, "U.S.", "US");
 location_prop = tranwrd(location_prop, "Walgreens 12529", "Walgreens #12529");
 location_prop = tranwrd(location_prop, "Worthams", "Wortham's");
 location_prop = tranwrd(location_prop, " – ", " - ");
 location_prop = tranwrd(location_prop, "High, LAUSD", "High School, LAUSD");
 location_prop = tranwrd(location_prop, "Elementary, LAUSD", "Elementary School, LAUSD");
 location_prop = tranwrd(location_prop, "Middle, LAUSD", "Middle School, LAUSD");
 location_prop = tranwrd(location_prop, "Los Angeles Unified School District", "LAUSD");
 location_prop = tranwrd(location_prop, " (LAUSD)", ", LAUSD");
 location_prop = tranwrd(location_prop, "Corp ", "Corp. ");
 if find(location_prop, "The Home Depot") = 0 then location_prop = tranwrd(location_prop, "The Home Depot", "Home Depot");
 location_prop = tranwrd(location_prop, " DP SNF", " D/P SNF");
 location_prop = strip(compbl(location_prop));
%mend loc;



%let revClosed =
"OB20222133" /*Added 8/29 as site visit was made due to EH violation but OB itself is no longer active; check for when fieldwork status is updated*/
;


%let manFLag = 
;


%put &revClosed;

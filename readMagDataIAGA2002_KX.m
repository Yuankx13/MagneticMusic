function matFile=readMagDataIAGA2002_KX(rawDataName)
% For read raw magnetic data of IAGA2002 standard, the output variation is
% the name (string) and path of the .mat file.
%% reading data
    rawDataFile=fopen(rawDataName);
    matName=strrep(rawDataName,'.dat','.mat');
    rawData=textscan(rawDataFile,'%s %s %d %f %f %f %f','HeaderLines',15);
    dataDate=string(rawData{1,1});
    dataTime=string(rawData{1,2});
    dataDay=rawData{1,3};
    dataDecl=rawData{1,4};
    dataHori=rawData{1,5};
    dataVert=rawData{1,6};
    dataScal=rawData{1,7};
    
    %% processing time and date as normal
    normDate=datenum(dataDate+' '+dataTime,'yyyy-mm-dd HH:MM:SS.FFF');
    
    %% return
%     save(matName, 'normDate','dataDate','dataTime','dataDay','dataDecl','dataHori','dataVert','dataScal');
    save(matName, 'normDate','dataDecl','dataHori','dataVert','dataScal');
    matFile=matName;
end
    
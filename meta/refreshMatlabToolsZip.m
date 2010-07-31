function refreshMatlabToolsZip()
%% Refresh the Matlab tools zip file
% Requires an svn installation, (not just e.g. tortoise svn)
% All files must be checked into svn
%%

tmpRoot = tempname();
mkdir(tmpRoot); 
tmpPath = fullfile(tmpRoot, 'matlabTools');
fprintf('Exporting code..........'); 
system(sprintf('svn export %s %s', matlabToolsRoot(), tmpPath));
%%
fprintf('removing old zip file...'); 
oldZip = fullfile(tmpPath, 'matlabTools.zip'); 
if exist(oldZip, 'file')
    delete(oldZip); 
end
fprintf('done\n');
%%
fprintf('zipping.................');
destZip = fullfile(matlabToolsRoot(), 'matlabTools.zip'); 
zip(destZip, fullfile(tmpRoot, 'matlabTools', '*.*')); 
fprintf('done\ncleaning up.............'); 
system(sprintf('rmdir /Q /S %s', tmpPath));
fprintf('done\nrefresh complete\n'); 
end
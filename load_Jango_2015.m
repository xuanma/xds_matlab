clc
clear
Jango_WF_params = struct( ...
    'monkey_name','Jango', ...
    'array_name','M1', ...
    'task_name','WF', ...
    'ran_by','SN', ...
    'lab',1, ...
    'bin_width',0.001,...
    'sorted',0);

base_dir = 'Z:\limblab\lab_folder\Projects\darpa\DS18(Jango_2015)\nev\';
map_dir = 'Z:\limblab\lab_folder\Projects\darpa\array_map_files\Jango_right_M1\';
map_name = 'SN6250-000945.cmp';
save_dir = '../Jango_2015/'; 
open_file = strcat(base_dir, '*.nev');
file = dir(open_file);
for i = 1:length(file)
    file_name_in_list = file(i).name(1:end-4);
    disp(file_name_in_list);
    xds = raw_to_xds(base_dir, file_name_in_list, map_dir, map_name, Jango_WF_params);
    save_file = strcat(get_system_file_name(xds), '.mat');
    save(strcat(save_dir, save_file), 'xds');
    clear xds
end

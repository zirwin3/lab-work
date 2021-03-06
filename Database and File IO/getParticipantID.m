function [id, surgdate] = getParticipantID(subjID, database)

if (nargin < 2 ||isempty(database))
    
    if (~isempty(getenv('REMOTEDATADIR')) && exist(fullfile(getenv('REMOTEDATADIR'), 'DBSdatabase.xlsx'), 'file'))
        database = fullfile(getenv('REMOTEDATADIR'), 'DBSdatabase.xlsx');
    else
        [dbfile, dbpath] = uigetfile('*.csv;*.xls;*.xlsx', 'Select DBS database' );
        if (dbfile == 0)
            error('Couldn''t find DBS database file');
        end
        database = fullfile(dbpath, dbfile);
    end
end

db = readtable(database, 'Range', 'A:L');

idx = find(contains(db.study_ID, subjID, 'IgnoreCase', true), 1);

id = num2str(db.participant_ID(idx), 15);

if (nargout == 2)
    surgdate = datestr(db.stage1surgery_dates_demographics(idx), 'mm/dd/yyyy');
end
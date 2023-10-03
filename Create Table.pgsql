DROP Table IF EXISTS Seasons;
DROP table IF EXISTS Players;
DROP table IF EXISTS champions;
DROP table IF EXISTS franchises;

CREATE TABLE Seasons(
    Year FLOAT,
    Player VARCHAR(50),
    Position VARCHAR(50),
    Age FLOAT,
    Team VARCHAR(50),
    Games  FLOAT,
    Games_started  FLOAT,
    Minutes_Played  FLOAT,
    player_efficiency_rating  FLOAT,
    True_shooting_Per  FLOAT,
    Three_Point_attempt_rate  FLOAT,
    Free_Throw_rate  FLOAT,
    Offensive_Rebound_Per  FLOAT,
    Defensive_rebound_Per  FLOAT,
    Total_rebound_Per  FLOAT,
    Assist_Per  FLOAT,
    Steal_Per  FLOAT,
    Block_Per  FLOAT,
    Turn_over_Per  FLOAT,
    Usage_rate_Per FLOAT,
    Offensive_win_share FLOAT,
    Defensive_win_share FLOAT,
    Win_share FLOAT,
    Win_share_min FLOAT,
    Offensive_Box FLOAT,
    Defensive_Box FLOAT,
    Box FLOAT,
    Value_Over_Replacement_Player FLOAT,
    Field_Goal FLOAT,
    Field_goal_attempted FLOAT,
    Field_Goal_Per FLOAT,
    Three_Point FLOAT,
    Three_Point_attempted FLOAT,
    Three_Point_Per FLOAT,
    Two_Points FLOAT,
    Two_Points_attempted FLOAT,
    Two_Point_Per FLOAT,
    effective_Field_goal_Per FLOAT,
    Free_Throws FLOAT,
    Free_Throws_attempted FLOAT,
    Free_throw_Per FLOAT,
    Offensive_rebound FLOAT,
    Defensive_rebound FLOAT,
    Total_rebound FLOAT,
    Assist FLOAT,
    Steal FLOAT,
    Block FLOAT,
    Turn_Over FLOAT,
    Personnal_fouls FLOAT,
    Points FLOAT,
    Franchise_code VARCHAR(20)
);

CREATE Table Players(
    name VARCHAR(50),
    year_start FLOAT,
    year_end FLOAT,
    position VARCHAR(50),
    height_meter FLOAT,
    weight_kilo FLOAT,
    birth_date DATE,
    college VARCHAR(100)
);

CREATE Table champions(
    Year INTEGER,
    Winner VARCHAR(100),
    Code VARCHAR(30),
    City VARCHAR(100)
);


CREATE Table franchises(
    actual_name VARCHAR(200),
    all_names VARCHAR(300)
);

INSERT INTO franchises (actual_name,all_names) VALUES
('Atlanta Hawks','Atlanta Hawks, St. Louis Hawks, Milwaukee Hawks,Tri-Cities Blackhawks'),
('Boston Celtics','Boston Celtics'),
('Brooklyn Nets','Brooklyn, Nets, New Jersey Nets, New York Nets'),
('Charlotte Hornets','Charlotte Hornets, Charlotte Bobcats'),
('Chicago Bulls','Chicago Bulls'),
('Cleveland Cavaliers','Cleveland Cavaliers'),
('Dallas Mavericks','Dallas Mavericks'),
('Denver Nuggets' , 'Denver Nuggets'),
('Detroit Pistons','Detroit Pistons, Ft. Wayne Zollner Pistons'),
('Golden State Warriors','Golden State Warriors, San Francisco Warriors	, Philadelphia Warriors'),
('Houston Rockets','Houston Rockets, San Diego Rockets'),
('Indiana Pacers' , 'Indiana Pacers'),
('LA Clippers','LA Clippers, Los Angeles Clippers, San Diego Clippers, Buffalo Braves'),
('Los Angeles Lakers','Los Angeles Lakers, Minneapolis Lakers'),
('Memphis Grizzlies','Memphis Grizzlies, Vancouver Grizzlies'),
('Miami Heat', 'Miami Heat'),
('Milwaukee Bucks','Milwaukee Bucks'),
('Minnesota Timberwolves','Minnesota Timberwolves'),
('New Orleans Pelicans','New Orleans Pelicans, New Orleans Hornets, New Orleans/Oklahoma City Hornets'),
('New York Knicks','New York Knicks'),
('Oklahoma City Thunder','Oklahoma City Thunder, Seattle SuperSonics'),
('Orlando Magic','Orlando Magic'),
('Philadelphia 76ers','Philadelphia 76ers, Syracuse Nationals'),
('Phoenix Suns','Phoenix Suns'),
('Portland Trail Blazers','Portland Trail Blazers'),
('Sacramento Kings','Sacramento Kings, Kansas City Kings,Kansas City-Omaha Kings, Cincinnati Royals, Rochester Royals'),
('San Antonio Spurs','San Antonio Spurs'),
('Toronto Raptors','Toronto Raptors'),
('Utah Jazz','Utah Jazz, New Orleans Jazz'),
('Washington Wizards','Washington Wizards, Washington Bullets, Capital Bullets, Baltimore Bullets, Chicago Zephyrs, Chicago Packers');

--Adding franchises currents cities
ALTER TABLE franchises
ADD COLUMN Current_city VARCHAR(100);

UPDATE franchises
SET Current_city= 'Atlanta'
WHERE  actual_name='Atlanta Hawks';
UPDATE franchises
SET Current_city= 'Boston'
WHERE  actual_name='Boston Celtics';
UPDATE franchises
SET Current_city= 'Brooklyn'
WHERE  actual_name='Brooklyn Nets';
UPDATE franchises
SET Current_city= 'Charlotte'
WHERE  actual_name='Charlotte Hornets';
UPDATE franchises
SET Current_city= 'Chicago'
WHERE  actual_name='Chicago Bulls';
UPDATE franchises
SET Current_city= 'Cleveland'
WHERE  actual_name='Cleveland Cavaliers';
UPDATE franchises
SET Current_city= 'Dallas'
WHERE  actual_name='Dallas Mavericks';
UPDATE franchises
SET Current_city= 'Denver'
WHERE  actual_name='Denver Nuggets';
UPDATE franchises
SET Current_city= 'Detroit'
WHERE  actual_name='Detroit Pistons';
UPDATE franchises
SET Current_city= 'Oakland'
WHERE  actual_name='Golden State Warriors';
UPDATE franchises
SET Current_city= 'Houston'
WHERE  actual_name='Houston Rockets';
UPDATE franchises
SET Current_city= 'Indiana'
WHERE  actual_name='Indiana Pacers';
UPDATE franchises
SET Current_city= 'Los Angeles'
WHERE  actual_name='LA Clippers';
UPDATE franchises
SET Current_city= 'Los Angeles'
WHERE  actual_name='Los Angeles Lakers';
UPDATE franchises
SET Current_city= 'Memphis'
WHERE  actual_name='Memphis Grizzlies';
UPDATE franchises
SET Current_city= 'Miami'
WHERE  actual_name='Miami Heat';
UPDATE franchises
SET Current_city= 'Milwaukee'
WHERE  actual_name='Milwaukee Bucks';
UPDATE franchises
SET Current_city= 'Minnesota'
WHERE  actual_name='Minnesota Timberwolves';
UPDATE franchises
SET Current_city= 'New Orleans'
WHERE  actual_name='New Orleans Pelicans';
UPDATE franchises
SET Current_city= 'New York'
WHERE  actual_name='New York Knicks';
UPDATE franchises
SET Current_city= 'Oklahoma City'
WHERE  actual_name='Oklahoma City Thunder';
UPDATE franchises
SET Current_city= 'New Orleans'
WHERE  actual_name='New Orleans Pelicans';
UPDATE franchises
SET Current_city= 'Orlando'
WHERE  actual_name='Orlando Magic';
UPDATE franchises
SET Current_city= 'Philadelphia'
WHERE  actual_name='Philadelphia 76ers';
UPDATE franchises
SET Current_city= 'Phoenix'
WHERE  actual_name='Phoenix Suns';
UPDATE franchises
SET Current_city= 'Portland'
WHERE  actual_name='Portland Trail Blazers';
UPDATE franchises
SET Current_city= 'Sacramento'
WHERE  actual_name='Sacramento Kings';
UPDATE franchises
SET Current_city= 'San Antonio'
WHERE  actual_name='San Antonio Spurs';
UPDATE franchises
SET Current_city= 'Toronto'
WHERE  actual_name='Toronto Raptors';
UPDATE franchises
SET Current_city= 'Utah'
WHERE  actual_name='Utah Jazz';
UPDATE franchises
SET Current_city= 'Washington'
WHERE  actual_name='Washington Wizards';

--Adding franchise code
ALTER TABLE franchises
ADD COLUMN Code VARCHAR(10);

UPDATE franchises
SET code= 'ATL'
WHERE  actual_name='Atlanta Hawks';
UPDATE franchises
SET code= 'BOS'
WHERE  actual_name='Boston Celtics';
UPDATE franchises
SET code= 'BRK'
WHERE  actual_name='Brooklyn Nets';
UPDATE franchises
SET code= 'CHA'
WHERE  actual_name='Charlotte Hornets';
UPDATE franchises
SET code= 'CHI'
WHERE  actual_name='Chicago Bulls';
UPDATE franchises
SET code= 'CLE'
WHERE  actual_name='Cleveland Cavaliers';
UPDATE franchises
SET code= 'DAL'
WHERE  actual_name='Dallas Mavericks';
UPDATE franchises
SET code= 'DEN'
WHERE  actual_name='Denver Nuggets';
UPDATE franchises
SET code= 'DET'
WHERE  actual_name='Detroit Pistons';
UPDATE franchises
SET code= 'GSW'
WHERE  actual_name='Golden State Warriors';
UPDATE franchises
SET code= 'HOU'
WHERE  actual_name='Houston Rockets';
UPDATE franchises
SET code= 'IND'
WHERE  actual_name='Indiana Pacers';
UPDATE franchises
SET code= 'LAC'
WHERE  actual_name='LA Clippers';
UPDATE franchises
SET code= 'LAL'
WHERE  actual_name='Los Angeles Lakers';
UPDATE franchises
SET code= 'MEM'
WHERE  actual_name='Memphis Grizzlies';
UPDATE franchises
SET code= 'MIA'
WHERE  actual_name='Miami Heat';
UPDATE franchises
SET code= 'MIL'
WHERE  actual_name='Milwaukee Bucks';
UPDATE franchises
SET code= 'MIN'
WHERE  actual_name='Minnesota Timberwolves';
UPDATE franchises
SET code= 'NOP'
WHERE  actual_name='New Orleans Pelicans';
UPDATE franchises
SET code= 'NYK'
WHERE  actual_name='New York Knicks';
UPDATE franchises
SET code= 'OKC'
WHERE  actual_name='Oklahoma City Thunder';
UPDATE franchises
SET code= 'NOP'
WHERE  actual_name='New Orleans Pelicans';
UPDATE franchises
SET code= 'ORL'
WHERE  actual_name='Orlando Magic';
UPDATE franchises
SET code= 'PHI'
WHERE  actual_name='Philadelphia 76ers';
UPDATE franchises
SET code= 'PHO'
WHERE  actual_name='Phoenix Suns';
UPDATE franchises
SET code= 'POR'
WHERE  actual_name='Portland Trail Blazers';
UPDATE franchises
SET code= 'SAC'
WHERE  actual_name='Sacramento Kings';
UPDATE franchises
SET code= 'SAS'
WHERE  actual_name='San Antonio Spurs';
UPDATE franchises
SET code= 'TOR'
WHERE  actual_name='Toronto Raptors';
UPDATE franchises
SET code= 'UTA'
WHERE  actual_name='Utah Jazz';
UPDATE franchises
SET code= 'WAS'
WHERE  actual_name='Washington Wizards';
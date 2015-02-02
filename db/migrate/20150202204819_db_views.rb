class DbViews < ActiveRecord::Migration
  def change
  	execute "
		CREATE VIEW `cities_buildings` AS
		       SELECT cb.*,b.rpmA,b.rpmB,b.rpmC,b.rpmD,b.rpmE,b.modifier
		       FROM buildings cb, options b 
		       WHERE cb.building_type = b.id
		       AND b.optiontype_id = 1;
	"

	execute "
		create view `cities_buildings_calc` as
		SELECT  
		  c.id as city_id,cb.building_type,cb.lvl,c.player_id,
		  c.calculated_at, cb.finished_at,
		  IF(c.calculated_at > finished_at OR finished_at > NOW(),
		     0,
		     TIMESTAMPDIFF(second,c.calculated_at,cb.finished_at)  
		  ) as prediff,
		  IF(c.calculated_at > finished_at OR finished_at > NOW(),
		     TIMESTAMPDIFF(second,c.calculated_at,NOW()),
		     TIMESTAMPDIFF(second,cb.finished_at, NOW())    
		  ) as postdiff,
		  c.resA as oldA,
		  c.resB as oldB,
		  c.resC as oldC,
		  c.resD as oldD,
		  c.resE as oldE,
		  round( ((1+cb.lvl*cb.modifier) * cb.rpmA) , 3) as  preArpm,
		  round( ((2+cb.lvl*cb.modifier) * cb.rpmA) , 3) as postArpm,
		  round( ((1+cb.lvl*cb.modifier) * cb.rpmB) , 3) as  preBrpm,
		  round( ((2+cb.lvl*cb.modifier) * cb.rpmB) , 3) as postBrpm,
		  round( ((1+cb.lvl*cb.modifier) * cb.rpmC) , 3) as  preCrpm,
		  round( ((2+cb.lvl*cb.modifier) * cb.rpmC) , 3) as postCrpm,
		  round( ((1+cb.lvl*cb.modifier) * cb.rpmD) , 3) as  preDrpm,
		  round( ((2+cb.lvl*cb.modifier) * cb.rpmD) , 3) as postDrpm,
		  round( ((1+cb.lvl*cb.modifier) * cb.rpmE) , 3) as  preErpm,
		  round( ((2+cb.lvl*cb.modifier) * cb.rpmE) , 3) as postErpm         
		  FROM cities c, cities_buildings as cb
		  WHERE cb.city_id = c.id;       
		"

		execute "
		-- create the current resources views
		create view `cities_buildings_res` as
		SELECT city_id,building_type,player_id,
		  round( oldA + (  preArpm *  prediff ) + (postArpm * postdiff) ) as currentA,
		  round( oldB + (  preBrpm *  prediff ) + (postBrpm * postdiff) ) as currentB,
		  round( oldC + (  preCrpm *  prediff ) + (postCrpm * postdiff) ) as currentC,
		  round( oldD + (  preDrpm *  prediff ) + (postDrpm * postdiff) ) as currentD,
		  round( oldE + (  preErpm *  prediff ) + (postErpm * postdiff) ) as currentE
		FROM cities_buildings_calc;
		"

		execute "
		create view `cities_res` as
		SELECT city_id,player_id,
		  sum( round( oldA + (  preArpm *  prediff ) + (postArpm * postdiff) )) as currentA,
		  sum( round( oldB + (  preBrpm *  prediff ) + (postBrpm * postdiff) )) as currentB,
		  sum( round( oldC + (  preCrpm *  prediff ) + (postCrpm * postdiff) )) as currentC,
		  sum( round( oldD + (  preDrpm *  prediff ) + (postDrpm * postdiff) )) as currentD,
		  sum( round( oldE + (  preErpm *  prediff ) + (postErpm * postdiff) )) as currentE  
		FROM cities_buildings_calc
		GROUP BY city_id;
  	"
  end
end

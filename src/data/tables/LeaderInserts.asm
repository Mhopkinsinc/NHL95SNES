LeaderInserts:						; per League Leaders category (d1 * 2): the routine that links a new entry
									; into the list in its order: goals, assists, points
	dw InsertByGoals,InsertByAssists,InsertByPoints

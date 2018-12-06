# create personnel with their categories

load csv with headers from "file:///PROV_NEW_CAT_X_181119_1430.csv" as csv
with distinct csv.`action_personnel_id_x` as prov_ID, csv.`new_cat1` as cat1, csv.`new_cat2` as cat2
create (p:provider {ID: prov_ID, c1: cat1, c2:cat2})

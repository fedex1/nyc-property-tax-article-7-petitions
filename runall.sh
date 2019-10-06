#!
curl https://data.cityofnewyork.us/api/views/aht6-vxai/rows.csv?accessType=DOWNLOAD > Open_Article_7_Petitions.csv
cat Open_Article_7_Petitions.csv| csvcut -c 1,2,3   |awk -F, '{print $1*1000000000+$2*10000+$3}' >article7_bbl.csv
# https://data.cityofnewyork.us/City-Government/Property-Valuation-and-Assessment-Data-Tax-Class-1/m8p6-tp4b/data
curl https://data.cityofnewyork.us/api/views/m8p6-tp4b/rows.csv?accessType=DOWNLOAD >taxclass1.csv
curl https://data.cityofnewyork.us/api/views/kevu-8hby/rows.csv?accessType=DOWNLOAD >taxclass234.csv
csvcut -c BBLE taxclass1.csv  |sort -u >taxclass1_unique.csv
comm -12 taxclass1_unique.csv article7_bbl.csv  >taxclass1_article7.csv

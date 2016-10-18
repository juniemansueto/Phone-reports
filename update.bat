wget --user=callacct@thorgroup.com --password=Th0r!acct --output-document=raw201609.txt --no-check-certificate "https://portal.shoretelsky.com/DataExport/TDRData?startDate=2016-09-01&endDate=2016-10-01"
sed -i s/\",\"/^~/g raw201609.txt
sed -i s/\"//g raw201609.txt
sqlcmd -W -s, -S localhost\SQLExpress -Q "truncate table Azgard.dbo.cdr;" -Usa -PTh0rgr0Up!nC2015
bcp dbo.cdr in raw201609.txt -F2 -S localhost\SQLExpress -dAzgard -t~ -Usa -PTh0rgr0Up!nC2015 -c -q
sqlcmd -W -s, -S localhost\SQLExpress -iupdate201609.sql -Usa -PTh0rgr0Up!nC2015
del sed*

# README

Code I used to fetch the directory of DBT clinicians from behavioraltech.org.

They're using WordPress so presumably there's an easier way to fetch them, but their wp2json URL is returning a 403, so this script:

1. Fetches all the pages into their HTML files (saves as `page_${index}.html`). 

```
> bash fetch_btlist.sh`
```

Be sure to Ctrl+C when the size of the files all start to be the same. When I downloaded this around May 2023 there were 60 pages. It has a top limit of 200.

2. Processes the pages to clean some data and outputs it as a `compiled.json` JSON file. (Uses Python + BeautifulSoup)

```
> python process_pages.py > compiled.json
```

I also made a small script to clean it so I could process it in R and saved a ready-to-use RData file `dbt_DB.Rds`.
